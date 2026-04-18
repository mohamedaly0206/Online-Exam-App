
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';

import '../../config/di/di.dart';
import '../../features/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/view_model/cubit/home_cubit.dart';
import '../../features/home/presentation/view_model/intent/home_intent.dart';
import '../../features/splash/presentation/view_model/cubit/splash_cubit.dart';
import '../../features/splash/presentation/view_model/intent/splash_intent.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static GoRouter getRouter() => GoRouter(
    initialLocation: AppRouterPaths.kSplashView,

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          'No route defined',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: AppRouterPaths.kSplashView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<SplashCubit>()..doIntent(CheckSessionIntent()),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRouterPaths.kSignUpView,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: AppRouterPaths.kForgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRouterPaths.kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<HomeCubit>()..doIntent(GetAllSubjectsIntent()),
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}
