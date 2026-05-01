import 'package:hive_ce/hive_ce.dart';
import 'package:online_exam_app/hive_registrar.g.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/app_router.dart';
import 'package:online_exam_app/core/theme/theme.dart';

import 'features/auth/login/domain/use_cases/check_user_logged_in_use_case.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDir.path)
    ..registerAdapters();

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
      routerConfig: AppRouter.getRouter(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
