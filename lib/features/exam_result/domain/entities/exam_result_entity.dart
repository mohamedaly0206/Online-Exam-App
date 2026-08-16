class ExamResultEntity {
  final String id;
  final String examId;
  final String examTitle;
  final String subjectName;
  final int numberOfQuestions;
  final int duration; // in minutes
  final int correctCount;
  final int wrongCount;
  final int totalQuestions;
  final int completedInMinutes;
  final String submittedAt;
  final List<QuestionResultEntity> questions;
  final String subjectIcon;

  ExamResultEntity({
    required this.id,
    required this.examId,
    required this.examTitle,
    required this.subjectName,
    required this.numberOfQuestions,
    required this.duration,
    required this.correctCount,
    required this.wrongCount,
    required this.totalQuestions,
    int? completedInMinutes,
    required this.submittedAt,
    required this.questions, required this.subjectIcon,
  }) : completedInMinutes = completedInMinutes ?? duration;
}

class QuestionResultEntity {
  final String question;
  final String type;
  final List<AnswerResultEntity> answers;
  final List<String> userAnswerKeys;
  final List<String> correctAnswerKeys;

  String? get userAnswerKey =>
      userAnswerKeys.isEmpty ? null : userAnswerKeys.first;

  String? get correctAnswerKey =>
      correctAnswerKeys.isEmpty ? null : correctAnswerKeys.first;

  QuestionResultEntity({
    required this.question,
    required this.type,
    required this.answers,
    List<String>? userAnswerKeys,
    List<String>? correctAnswerKeys,
    String? userAnswerKey,
    String? correctAnswerKey,
  }) : userAnswerKeys =
           userAnswerKeys ?? (userAnswerKey == null ? [] : [userAnswerKey]),
       correctAnswerKeys =
           correctAnswerKeys ??
           (correctAnswerKey == null ? [] : [correctAnswerKey]);
}

class AnswerResultEntity {
  final String key;
  final String answer;

  AnswerResultEntity({required this.key, required this.answer});
}
