import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/app_router.dart';
import 'package:online_exam_app/core/theme/theme.dart';

import 'features/auth/login/domain/use_cases/check_user_loggedin_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final checkAuth = getIt<CheckUserLoggedInUseCase>();
  final bool isLoggedIn = await checkAuth.call();
  runApp(OnlineExamApp(isLoggedIn: isLoggedIn));
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(isLoggedIn),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
