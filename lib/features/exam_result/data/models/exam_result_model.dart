import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

class ExamResultModel extends ExamResultEntity {
  ExamResultModel({
    required super.id,
    required super.examId,
    required super.examTitle,
    required super.subjectName,
    required super.numberOfQuestions,
    required super.duration,
    required super.correctCount,
    required super.wrongCount,
    required super.totalQuestions,
    super.completedInMinutes,
    required super.submittedAt,
    required super.questions,
    required super.subjectIcon,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      id: json['id'] ?? '',
      examId: json['examId'] ?? '',
      examTitle: json['examTitle'] ?? '',
      subjectName: json['subjectName'] ?? '',
      numberOfQuestions: json['numberOfQuestions'] ?? 0,
      duration: json['duration'] ?? 0,
      correctCount: json['correctCount'] ?? 0,
      wrongCount: json['wrongCount'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      completedInMinutes: json['completedInMinutes'] ?? json['duration'] ?? 0,
      submittedAt: json['submittedAt'] ?? '',
      questions:
          (json['questions'] as List?)
              ?.map((e) => QuestionResultModel.fromJson(e))
              .toList() ??
          [],
      subjectIcon: json['subjectIcon'] ?? '',
    );
  }

  factory ExamResultModel.fromEntity(ExamResultEntity entity) {
    return ExamResultModel(
      id: entity.id,
      examId: entity.examId,
      examTitle: entity.examTitle,
      subjectName: entity.subjectName,
      numberOfQuestions: entity.numberOfQuestions,
      duration: entity.duration,
      correctCount: entity.correctCount,
      wrongCount: entity.wrongCount,
      totalQuestions: entity.totalQuestions,
      completedInMinutes: entity.completedInMinutes,
      submittedAt: entity.submittedAt,
      questions: entity.questions.map(QuestionResultModel.fromEntity).toList(),
      subjectIcon: entity.subjectIcon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'examId': examId,
      'examTitle': examTitle,
      'subjectName': subjectName,
      'numberOfQuestions': numberOfQuestions,
      'duration': duration,
      'correctCount': correctCount,
      'wrongCount': wrongCount,
      'totalQuestions': totalQuestions,
      'completedInMinutes': completedInMinutes,
      'submittedAt': submittedAt,
      'questions': questions
          .map(QuestionResultModel.fromEntity)
          .map((e) => e.toJson())
          .toList(),
      'subjectIcon': subjectIcon,
    };
  }
}

class QuestionResultModel extends QuestionResultEntity {
  QuestionResultModel({
    required super.question,
    required super.type,
    required super.answers,
    super.userAnswerKeys,
    super.correctAnswerKeys,
    super.userAnswerKey,
    super.correctAnswerKey,
  });

  factory QuestionResultModel.fromJson(Map<String, dynamic> json) {
    return QuestionResultModel(
      question: json['question'] ?? '',
      type: json['type'] ?? '',
      answers:
          (json['answers'] as List?)
              ?.map((e) => AnswerResultModel.fromJson(e))
              .toList() ??
          [],
      userAnswerKeys: _readAnswerKeys(
        json['userAnswerKeys'],
        json['userAnswerKey'],
      ),
      correctAnswerKeys: _readAnswerKeys(
        json['correctAnswerKeys'],
        json['correctAnswerKey'],
      ),
    );
  }

  factory QuestionResultModel.fromEntity(QuestionResultEntity entity) {
    return QuestionResultModel(
      question: entity.question,
      type: entity.type,
      answers: entity.answers.map(AnswerResultModel.fromEntity).toList(),
      userAnswerKeys: entity.userAnswerKeys,
      correctAnswerKeys: entity.correctAnswerKeys,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'type': type,
      'answers': answers
          .map(AnswerResultModel.fromEntity)
          .map((e) => e.toJson())
          .toList(),
      'userAnswerKeys': userAnswerKeys,
      'correctAnswerKeys': correctAnswerKeys,
    };
  }

  static List<String> _readAnswerKeys(dynamic keys, dynamic fallbackKey) {
    if (keys is List) {
      return keys.whereType<String>().toList();
    }
    if (fallbackKey is String && fallbackKey.isNotEmpty) {
      return [fallbackKey];
    }
    return [];
  }
}

class AnswerResultModel extends AnswerResultEntity {
  AnswerResultModel({required super.key, required super.answer});

  factory AnswerResultModel.fromJson(Map<String, dynamic> json) {
    return AnswerResultModel(
      key: json['key'] ?? '',
      answer: json['answer'] ?? '',
    );
  }

  factory AnswerResultModel.fromEntity(AnswerResultEntity entity) {
    return AnswerResultModel(key: entity.key, answer: entity.answer);
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'answer': answer};
  }
}
