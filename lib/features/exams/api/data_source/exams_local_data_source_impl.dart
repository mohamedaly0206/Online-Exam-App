import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_local_data_source_contract.dart';

import '../../../../config/security_storage/security_storage_module.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/values/app_strings.dart';

@Injectable(as: ExamsLocalDataSourceContract)
class ExamsLocalDataSourceImpl implements ExamsLocalDataSourceContract {
  @override
  Future<String?> getToken() async {
    try {
      return await SecurityStorageModule.getSecuredString(AppStrings.token);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }
}
