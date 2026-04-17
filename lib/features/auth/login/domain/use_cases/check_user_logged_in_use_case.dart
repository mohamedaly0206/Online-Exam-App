import 'package:injectable/injectable.dart';

import '../repo/login_repo_contract.dart';

@injectable
class CheckUserLoggedInUseCase {
  CheckUserLoggedInUseCase(this.loginRepo);

  final LoginRepoContract loginRepo;

  Future<bool> call() async {
    return await loginRepo.isUserLoggedIn();
  }
}
