import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import '../../features/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/login/presentation/widgets/home_test.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static GoRouter getRouter(bool isLoggedIn) => GoRouter(
    initialLocation: isLoggedIn
        ? AppRouterPaths.kHomeView
        : AppRouterPaths.kLoginView,

    routes: [
      GoRoute(
        path: AppRouterPaths.kLoginView,
        builder: (context, state) => BlocProvider<LoginCubit>(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kSignUpView,
        builder: (context, state) => BlocProvider<SignUpCubit>(
          create: (context) => getIt<SignUpCubit>(),
          child: SignUpView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kForgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRouterPaths.kHomeView,
        builder: (context, state) => const HomeTest(),
      ),
    ],
  );
}
