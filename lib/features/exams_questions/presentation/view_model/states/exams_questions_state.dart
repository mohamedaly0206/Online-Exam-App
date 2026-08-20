part of '../cubit/exams_questions_cubit.dart';

class ExamsQuestionsState extends Equatable {
  final BaseState<ExamQuestionsEntity> examsQuestionsState;
  final String examId;
  final bool isExamFinished;
  final int initialExamTime;
  final int remainingTime;
  final int currentQuestionIndex;
  final int totalQuestions;
  final int totalCorrectAnswers;
  final int totalWrongAnswers;
  final bool answerValidation;
  final Map<int, dynamic> selectedAnswers;
  double get progress =>
      totalQuestions == 0 ? 0 : (currentQuestionIndex + 1) / totalQuestions;
  final bool isSubmitted;
  final dynamic submitResult;

  ExamsQuestionsState({
    this.examId = '',
    this.remainingTime = 0,
    this.examsQuestionsState = const BaseState(),
    this.isExamFinished = false,
    this.answerValidation = true,
    this.initialExamTime = 1,
    this.currentQuestionIndex = 0,
    this.totalQuestions = 0,
    this.totalWrongAnswers = 0,
    this.totalCorrectAnswers = 0,
    this.isSubmitted = false,
    this.submitResult,

    Map<int, dynamic>? selectedAnswers,
  }) : selectedAnswers = selectedAnswers ?? {};

  ExamsQuestionsState copyWith({
    String? examId,
    bool? isExamFinished,
    BaseState<ExamQuestionsEntity>? examsQuestionsState,
    bool? answerValidation,
    int? examTime,
    int? currentQuestionIndex,
    int? initialExamTime,
    int? remainingTime,
    int? totalQuestions,
    int? totalCorrectAnswers,
    int? totalWrongAnswers,
    Map<int, dynamic>? selectedAnswers,
    dynamic submitResult,
    bool? isSubmitted,
  }) {
    return ExamsQuestionsState(
      examId: examId ?? this.examId,
      totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      initialExamTime: initialExamTime ?? this.initialExamTime,
      remainingTime: remainingTime ?? this.remainingTime,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      examsQuestionsState: examsQuestionsState ?? this.examsQuestionsState,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      answerValidation: answerValidation ?? this.answerValidation,
      isExamFinished: isExamFinished ?? this.isExamFinished,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      submitResult: submitResult ?? this.submitResult,
    );
  }

  @override
  List<Object?> get props => [
    examId,
    examsQuestionsState,
    isExamFinished,
    currentQuestionIndex,
    totalCorrectAnswers,
    totalWrongAnswers,
    selectedAnswers,
    answerValidation,
    remainingTime,
    initialExamTime,
    totalQuestions,
    progress,
    isSubmitted,
    submitResult,
  ];
}
