class ExamsEntity {
  final String? id;
  final String? title;
  final String? subject;
  final int duration;
  final int numberOfQuestions;

  ExamsEntity({
    this.id,
    this.title,
    this.subject,
    required this.duration,
    required this.numberOfQuestions,
  });
}
