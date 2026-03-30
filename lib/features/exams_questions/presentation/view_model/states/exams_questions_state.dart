part of '../cubit/exams_questions_cubit.dart';

class ExamsQuestionsState {
  BaseState<ExamQuestionsModel> examsQuestionsState =
      BaseState<ExamQuestionsModel>(isLoading: true);
  final int examTimeInSeconds;
  final int initialTimeInSeconds;
  final int currentQuestionIndex;
  final int totalQuestions;
  final int totalCorrectAnswers;
  final int totalWrongAnswers;
  final Map<int, dynamic> selectedAnswers;
  bool get isHalfTime => examTimeInSeconds <= (initialTimeInSeconds / 2);
  double get progress =>
      totalQuestions == 0 ? 0 : (currentQuestionIndex + 1) / totalQuestions;
  String get formattedTime {
    final minutes = examTimeInSeconds ~/ 60;
    final seconds = examTimeInSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  ExamsQuestionsState({
    this.examTimeInSeconds = 0,
    this.initialTimeInSeconds = 0,
    this.currentQuestionIndex = 0,
    this.totalQuestions = 0,
    this.totalWrongAnswers = 0,
    this.totalCorrectAnswers = 0,
    Map<int, dynamic>? selectedAnswers,

    BaseState<ExamQuestionsModel>? examsQuestionsState,
  }) : selectedAnswers = selectedAnswers ?? {} {
    this.examsQuestionsState =
        examsQuestionsState ?? BaseState<ExamQuestionsModel>(isLoading: true);
  }

  ExamsQuestionsState copyWith({
    BaseState<ExamQuestionsModel>? examsQuestionsState,
    int? examTimeInSeconds,
    int? currentQuestionIndex,
    int? initialTimeInSeconds,
    int? totalQuestions,
    int? totalCorrectAnswers,
    int? totalWrongAnswers,
    Map<int, dynamic>? selectedAnswers,
  }) {
    return ExamsQuestionsState(
      totalCorrectAnswers:totalCorrectAnswers ?? this.totalCorrectAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      examTimeInSeconds: examTimeInSeconds ?? this.examTimeInSeconds,
      initialTimeInSeconds: initialTimeInSeconds ?? this.initialTimeInSeconds,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      examsQuestionsState: examsQuestionsState ?? this.examsQuestionsState,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}
