part of '../cubit/exams_questions_cubit.dart';

class ExamsQuestionsState {
  BaseState<ExamQuestionsEntity> examsQuestionsState =
      BaseState<ExamQuestionsEntity>(isLoading: true);
  final bool isExamFinished;
  final int initialExamTime;
  final int currentQuestionIndex;
  final int totalQuestions;
  final int totalCorrectAnswers;
  final int totalWrongAnswers;
  final bool answerValidation;
  final Map<int, dynamic> selectedAnswers;
  double get progress =>
      totalQuestions == 0 ? 0 : (currentQuestionIndex + 1) / totalQuestions;

  ExamsQuestionsState({
    this.isExamFinished = false,
    this.answerValidation = true,
    this.initialExamTime = 0,
    this.currentQuestionIndex = 0,
    this.totalQuestions = 0,
    this.totalWrongAnswers = 0,
    this.totalCorrectAnswers = 0,
    Map<int, dynamic>? selectedAnswers,

    BaseState<ExamQuestionsEntity>? examsQuestionsState,
  }) : selectedAnswers = selectedAnswers ?? {} {
    this.examsQuestionsState =
        examsQuestionsState ?? BaseState<ExamQuestionsEntity>(isLoading: true);
  }

  ExamsQuestionsState copyWith({
    bool? isExamFinished,
    BaseState<ExamQuestionsEntity>? examsQuestionsState,
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
      initialExamTime: initialExamTime ?? this.initialExamTime,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      examsQuestionsState: examsQuestionsState ?? this.examsQuestionsState,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      answerValidation: answerValidation ?? this.answerValidation,
      isExamFinished: isExamFinished ?? this.isExamFinished,
    );
  }
}
