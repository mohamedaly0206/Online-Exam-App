part of '../cubit/exams_questions_cubit.dart';

class ExamsQuestionsState {
  const ExamsQuestionsState({
    this.remainingSeconds = 120,
    this.currentQuestionIndex = 0,
    this.initialSeconds = 120,
    this.totalQuestions = 30,
  });
  final int remainingSeconds;
  final int initialSeconds;
  final int currentQuestionIndex;
  final int totalQuestions;
  bool get isHalfTime => remainingSeconds <= (initialSeconds / 2);
  double get remainingSecondsInMinutes => remainingSeconds / 60;
  double get progress => (currentQuestionIndex + 1);
  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final secs = remainingSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  ExamsQuestionsState copyWith({
    int? remainingSeconds,
    int? currentQuestionIndex,
    int? initialSeconds,
  }) {
    return ExamsQuestionsState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      initialSeconds: initialSeconds ?? this.initialSeconds,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}
