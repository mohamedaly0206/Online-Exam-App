import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_local_data_source_contract.dart';

import '../../../../config/security_storage/security_storage.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/values/app_strings.dart';

@Injectable(as: ExamsLocalDataSourceContract)
class ExamsLocalDataSourceImpl implements ExamsLocalDataSourceContract {
  final SecurityStorage _securityStorage;
  ExamsLocalDataSourceImpl(this._securityStorage);
  @override
  Future<String?> getToken() async {
    try {
      return await _securityStorage.getSecuredString(AppStrings.token);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }
}
