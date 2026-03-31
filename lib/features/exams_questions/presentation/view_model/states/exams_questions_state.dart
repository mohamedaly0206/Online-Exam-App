part of '../cubit/exams_questions_cubit.dart';

class ExamsQuestionsState {
  BaseState<ExamQuestionsModel> examsQuestionsState =
      BaseState<ExamQuestionsModel>(isLoading: true);
  final int examTime;
  final int initialExamTime;
  final int currentQuestionIndex;
  final int totalQuestions;
  final int totalCorrectAnswers;
  final int totalWrongAnswers;
  final bool answerValidation;
  final Map<int, dynamic> selectedAnswers;
  bool get isHalfTime => examTime <= (initialExamTime / 2);
  double get progress =>
      totalQuestions == 0 ? 0 : (currentQuestionIndex + 1) / totalQuestions;
  String get formattedTime {
    final minutes = examTime ~/ 60;
    final seconds = examTime % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  ExamsQuestionsState({
    this.answerValidation = true,
    this.examTime = 0,
    this.initialExamTime = 0,
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
    bool? answerValidation,
    int? examTime,
    int? currentQuestionIndex,
    int? initialExamTime,
    int? totalQuestions,
    int? totalCorrectAnswers,
    int? totalWrongAnswers,
    Map<int, dynamic>? selectedAnswers,
  }) {
    return ExamsQuestionsState(
      totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      examTime: examTime ?? this.examTime,
      initialExamTime: initialExamTime ?? this.initialExamTime,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      examsQuestionsState: examsQuestionsState ?? this.examsQuestionsState,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      answerValidation: answerValidation ?? this.answerValidation,
    );
  }
}
