import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/exam_result_repo.dart';
import 'package:online_exam_app/features/exams_questions/domain/use_cases/get_exam_questions_use_case.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
part '../states/exams_questions_state.dart';

@injectable
class ExamsQuestionsCubit extends Cubit<ExamsQuestionsState> {
  ExamsQuestionsCubit(this._examQuestionsUseCase, this._examResultRepo)
    : super(ExamsQuestionsState());
  final GetExamQuestionsUseCase _examQuestionsUseCase;
  final ExamResultRepo _examResultRepo;

  Timer? timer;
  bool _isSubmittingExam = false;

  void handleExamsQuestionsIntent(ExamsQuestionsIntent intent) {
    switch (intent) {
      case StartExam():
        _getExamsQuestions(intent.examId);
        break;
      case StopTimerIntent():
        _closeTimer();
        break;
      case NextQuestionIntent():
        _nextQuestion();
        break;
      case PreviousQuestionIntent():
        _previousQuestion();
        break;
      case SubmitQuestionIntent():
        _submitExam();
        break;
      case SelectSingleAnswerIntent():
        _selectSingleAnswer(intent);
        break;
      case SelectMultipleAnswerIntent():
        _selectMultipleAnswer(intent);
        break;
    }
  }

  void _submitExam() async {
    if (_isSubmittingExam ||
        state.isSubmitted ||
        state.examsQuestionsState.data == null) {
      return;
    }

    _isSubmittingExam = true;

    _closeTimer();

    final data = state.examsQuestionsState.data;
    if (data == null || data.questions.isEmpty) {
      _isSubmittingExam = false;
      return;
    }

    final correctAnswers = _calculateCorrectAnswers();
    final wrongAnswers = state.totalQuestions - correctAnswers;
    final exam = data.questions.first.exam;

    final List<QuestionResultEntity> questionResults = [];
    for (int i = 0; i < state.totalQuestions; i++) {
      final q = data.questions[i];
      final userAnswerKeys = _selectedAnswerKeys(state.selectedAnswers[i]);

      questionResults.add(
        QuestionResultEntity(
          question: q.question,
          type: q.type?.name == 'multipleChoice'
              ? 'multiple_choice'
              : 'single_choice',
          answers: q.answers
              .map(
                (a) => AnswerResultEntity(
                  key: a.answerKey.name,
                  answer: a.answerText,
                ),
              )
              .toList(),
          userAnswerKeys: userAnswerKeys,
          correctAnswerKeys: [q.correctAnswer.name],
        ),
      );
    }

    final result = ExamResultEntity(
      id: DateTime.now().toIso8601String(),
      examId: exam?.id ?? state.examId,
      examTitle: exam?.title?.isNotEmpty == true ? exam!.title! : 'Exam',
      subjectName: exam?.subject?.isNotEmpty == true
          ? exam!.subject!
          : 'Subject',
      numberOfQuestions: exam?.numberOfQuestions ?? state.totalQuestions,
      duration: exam?.duration ?? 0,
      correctCount: correctAnswers,
      wrongCount: wrongAnswers,
      totalQuestions: state.totalQuestions,
      completedInMinutes: _completedInMinutes(exam?.duration ?? 0),
      submittedAt: DateTime.now().toIso8601String(),
      questions: questionResults,
      subjectIcon: data.questions.first.subject?.icon ?? '',
    );

    final saveResult = await _examResultRepo.saveResult(result);

    switch (saveResult) {
      case ErrorBaseResponse<void>():
        _isSubmittingExam = false;
        emit(
          state.copyWith(
            examsQuestionsState: state.examsQuestionsState.copyWith(
              errorMessageParam: saveResult.errorMessage,
            ),
          ),
        );
      case SuccessBaseResponse<void>():
        _isSubmittingExam = false;
        emit(
          state.copyWith(
            totalCorrectAnswers: correctAnswers,
            totalWrongAnswers: wrongAnswers,
            isSubmitted: true,
            submitResult: result,
          ),
        );
    }
  }

  Future<void> _getExamsQuestions(String examId) async {
    emit(
      state.copyWith(
        examId: examId,
        examsQuestionsState: state.examsQuestionsState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );

    log('getting questions...');
    final request = GetExamQuestionsRequest(examId: examId);
    final response = await _examQuestionsUseCase.call(request);
    switch (response) {
      case SuccessBaseResponse<ExamQuestionsEntity>():
        if (response.data.questions.isEmpty) {
          emit(
            state.copyWith(
              examsQuestionsState: state.examsQuestionsState.copyWith(
                isLoadingParam: false,
                dataParam: response.data,
              ),
              totalQuestions: 0,
            ),
          );
          return;
        }

        final duration =
            (response.data.questions.first.exam?.duration ?? 0) * 60;
        emit(
          state.copyWith(
            examsQuestionsState: state.examsQuestionsState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
            totalQuestions: response.data.questions.length,
            initialExamTime: duration,
            remainingTime: duration,
          ),
        );

        if (response.data.questions.isNotEmpty) {
          _startTimer();
        }

        log('Success getting question...');

        break;
      case ErrorBaseResponse<ExamQuestionsEntity>():
        emit(
          state.copyWith(
            examsQuestionsState: state.examsQuestionsState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );

        break;
    }
  }

  void _selectSingleAnswer(SelectSingleAnswerIntent intent) {
    final updatedAnswer = Map<int, dynamic>.from(state.selectedAnswers);
    updatedAnswer[intent.questionIndex] = intent.answerKey;
    emit(
      state.copyWith(selectedAnswers: updatedAnswer, answerValidation: true),
    );
    log('${state.selectedAnswers[state.currentQuestionIndex]}');
  }

  void _selectMultipleAnswer(SelectMultipleAnswerIntent intent) {
    final updatedAnswers = Map<int, dynamic>.from(state.selectedAnswers);

    final currentList = List<AnswerKey>.from(
      updatedAnswers[intent.questionIndex] ?? [],
    );

    if (currentList.contains(intent.answerKey)) {
      currentList.remove(intent.answerKey);
    } else {
      currentList.add(intent.answerKey);
    }

    updatedAnswers[intent.questionIndex] = currentList;

    emit(
      state.copyWith(
        selectedAnswers: updatedAnswers,
        answerValidation: currentList.isNotEmpty,
      ),
    );
  }

  void _startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime <= 1) {
        timer.cancel();

        emit(state.copyWith(remainingTime: 0, isExamFinished: true));

        return;
      }

      emit(state.copyWith(remainingTime: state.remainingTime - 1));
    });
  }

  void _closeTimer() {
    timer?.cancel();
  }

  void _nextQuestion() {
    final hasAnswer = state.selectedAnswers[state.currentQuestionIndex] != null;

    if (!hasAnswer) {
      emit(state.copyWith(answerValidation: false));
      return;
    }

    if (state.currentQuestionIndex < state.totalQuestions - 1) {
      emit(
        state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex + 1,
          answerValidation: true,
        ),
      );
    }
  }

  void _previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(
        state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex - 1,
          answerValidation: true,
        ),
      );
    }
  }

  void calculateExamScore() {
    final correctAnswers = _calculateCorrectAnswers();
    final wrongAnswers = state.totalQuestions - correctAnswers;
    emit(
      state.copyWith(
        totalCorrectAnswers: correctAnswers,
        totalWrongAnswers: wrongAnswers,
      ),
    );
    log(
      'correct answers:${state.totalCorrectAnswers} wrong answers:${state.totalWrongAnswers}',
    );
  }

  int _calculateCorrectAnswers() {
    int correctAnswers = 0;
    final questions = state.examsQuestionsState.data?.questions ?? [];

    for (int i = 0; i < questions.length; i++) {
      if (_isCorrectAnswer(
        state.selectedAnswers[i],
        questions[i].correctAnswer,
      )) {
        correctAnswers++;
      }
    }

    return correctAnswers;
  }

  bool _isCorrectAnswer(dynamic selectedAnswer, AnswerKey correctAnswer) {
    if (selectedAnswer is AnswerKey) {
      return selectedAnswer == correctAnswer;
    }
    if (selectedAnswer is List<AnswerKey>) {
      return selectedAnswer.length == 1 &&
          selectedAnswer.contains(correctAnswer);
    }
    return false;
  }

  List<String> _selectedAnswerKeys(dynamic selectedAnswer) {
    if (selectedAnswer is AnswerKey) {
      return [selectedAnswer.name];
    }
    if (selectedAnswer is List<AnswerKey>) {
      return selectedAnswer.map((answer) => answer.name).toList();
    }
    return [];
  }

  int _completedInMinutes(int examDuration) {
    final elapsedSeconds = state.initialExamTime - state.remainingTime;
    if (elapsedSeconds <= 0) return 0;

    final elapsedMinutes = (elapsedSeconds / 60).ceil();
    if (examDuration <= 0) return elapsedMinutes;

    return elapsedMinutes.clamp(0, examDuration).toInt();
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
