import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/app_router.dart';
import 'package:online_exam_app/core/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
