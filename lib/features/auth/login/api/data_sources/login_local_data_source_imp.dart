import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';

@Injectable(as: LoginLocalDataSourceContract)
class LoginLocalDataSourceImp implements LoginLocalDataSourceContract {
  @override
  Future<void> saveToken(String token) async {
    await SecurityStorageModule.setSecuredString('token', token);
  }
}
