import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_local_data_source_contract.dart';

@LazySingleton(as: ForgetPasswordLocalDataSourceContract)
class ForgetPasswordLocalDataSourceImpl
    implements ForgetPasswordLocalDataSourceContract {}
