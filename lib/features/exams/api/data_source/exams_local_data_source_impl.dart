import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_local_data_source_contract.dart';

@Injectable(as: ExamsLocalDataSourceContract)
class ExamsLocalDataSourceImpl extends ExamsLocalDataSourceContract {}