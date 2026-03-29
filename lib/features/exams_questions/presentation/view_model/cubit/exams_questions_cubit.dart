import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exam_questions_model.dart';
import 'package:online_exam_app/features/exams_questions/domain/use_cases/get_exam_questions_usecase.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
part '../states/exams_questions_state.dart';

@injectable
class ExamsQuestionsCubit extends Cubit<ExamsQuestionsState> {
  ExamsQuestionsCubit(this._examQuestionsRepoContract)
    : super(ExamsQuestionsState());
  final GetExamQuestionsUseCase _examQuestionsRepoContract;
  Timer? timer;

  void handleExamsQuestionsIntent(ExamsQuestionsIntent intent) {
    switch (intent) {
      case GetExamsQuestionsIntent():
        _getExamsQuestions();
        break;
      case StartTimerIntent():
        _startTimer();
        break;
      case NextQuestionIntent():
        _nextQuestion();
        break;
      case PreviousQuestionIntent():
        _previousQuestion();
        break;
      case SubmitQuestionIntent():
        break;
      case StopTimerIntent():
        _closeTimer();
        break;
    }
  }

  Future<void> _getExamsQuestions() async {
    // emit(state.copyWith(examsQuestionsState: state.examsQuestionsState.copyWith(isLoadingParam: true)));
    final token = await SecurityStorageModule.getSecuredString(
      AppStrings.token,
    );
    log('getting questions...');
    final response = await _examQuestionsRepoContract.call(
      examId: '670070a830a3c3c1944a9c63',
      token: token,
    );
    switch (response) {
      case SuccessBaseResponse<ExamQuestionsModel>():
        emit(
          state.copyWith(
            examsQuestionsState: state.examsQuestionsState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
            totalQuestions: response.data.questions.length,
            examTimeInSeconds:
                response.data.questions.first.exam!.duration * 60,
            initialTimeInSeconds:
                response.data.questions.first.exam!.duration * 60,
          ),
        );
        _startTimer();

        log('Sucess getting question...');

        break;
      case ErrorBaseResponse<ExamQuestionsModel>():
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

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if ((state.examTimeInSeconds) == 0) {
        timer.cancel();
      } else {
        emit(state.copyWith(examTimeInSeconds: state.examTimeInSeconds - 1));
      }
    });
  }

  void _closeTimer() {
    timer?.cancel();
  }

  void _nextQuestion() {
    if (state.currentQuestionIndex < state.totalQuestions - 1) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1),
      );
    }
  }

  void _previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1),
      );
    }
  }
}
