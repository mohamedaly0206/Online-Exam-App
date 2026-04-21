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
import 'package:online_exam_app/features/exams_questions/domain/use_cases/get_exam_questions_use_case.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
part '../states/exams_questions_state.dart';

@injectable
class ExamsQuestionsCubit extends Cubit<ExamsQuestionsState> {
  ExamsQuestionsCubit(this._examQuestionsUseCase)
    : super(ExamsQuestionsState());
  final GetExamQuestionsUseCase _examQuestionsUseCase;

  Timer? timer;

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

  void _submitExam() {
    _closeTimer();
    calculateExamScore();
  }

  Future<void> _getExamsQuestions(String examId) async {
    emit(
      state.copyWith(
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
        final duration = response.data.questions.first.exam!.duration * 60;
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
      if (state.remainingTime <= 0) {
        timer.cancel();
        emit(state.copyWith(isExamFinished: true));
      } else {
        emit(state.copyWith(remainingTime: state.remainingTime - 1));
      }
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
    int correctAnswers = 0;
    int wrongAnswers = state.totalQuestions;
    for (int i = 0; i < state.totalQuestions; i++) {
      if (state.selectedAnswers[i] ==
          state.examsQuestionsState.data!.questions[i].correctAnswer) {
        correctAnswers++;
        wrongAnswers--;
      }
    }
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

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
