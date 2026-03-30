import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';

abstract class ExamsQuestionsIntent {}

class StartExam extends ExamsQuestionsIntent {}

class NextQuestionIntent extends ExamsQuestionsIntent {}

class PreviousQuestionIntent extends ExamsQuestionsIntent {}

class SubmitQuestionIntent extends ExamsQuestionsIntent {}

class StopTimerIntent extends ExamsQuestionsIntent {}

class SelectSingleAnswerIntent extends ExamsQuestionsIntent {
  final int questionIndex;
  final AnswerKey answerKey;

  SelectSingleAnswerIntent(this.questionIndex, this.answerKey);
}

class SelectMultipleAnswerIntent extends ExamsQuestionsIntent {
  final int questionIndex;
  final AnswerKey answerKey;

  SelectMultipleAnswerIntent(this.questionIndex, this.answerKey);
}
