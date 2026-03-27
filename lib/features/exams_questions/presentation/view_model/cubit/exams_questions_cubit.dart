import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/exams_questions_state.dart';

class ExamsQuestionsCubit extends Cubit<ExamsQuestionsState> {
  ExamsQuestionsCubit() : super(ExamsQuestionsInitial());
}
