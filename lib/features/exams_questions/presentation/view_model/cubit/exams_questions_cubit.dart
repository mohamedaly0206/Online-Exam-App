import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
part '../states/exams_questions_state.dart';

@injectable
class ExamsQuestionsCubit extends Cubit<ExamsQuestionsState> {
  ExamsQuestionsCubit() : super(ExamsQuestionsState());
  Timer? timer;

  void handleExamsQuestionsIntent(ExamsQuestionsIntent intent) {
    switch (intent) {
      case GetExamsQuestionsIntent():
        break;
      case StartTimerIntent():
        _countDownTimer();
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

  void _countDownTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (state.remainingSeconds == 0) {
        timer.cancel();
      } else {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
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
