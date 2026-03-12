import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/theme/theme.dart';
import 'package:online_exam_app/core/utilities/app_router.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp());
}

class OnlineExamApp
    extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
