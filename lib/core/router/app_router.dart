import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:online_exam_app/features/auth/login/presentation/views/login_view.dart';
import 'package:online_exam_app/features/auth/login/presentation/widgets/home_test.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRouterPaths.kLoginView,
    routes: [
      GoRoute(path: AppRouterPaths.kLoginView, builder: (context, state) => const LoginView()),

      GoRoute(path: AppRouterPaths.kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(
        path: AppRouterPaths.kForgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(path: AppRouterPaths.kHomeView, builder: (context, state) => const HomeTest()),
    ],
  );
}
