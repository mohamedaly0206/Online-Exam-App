import 'package:go_router/go_router.dart';
import 'router_paths.dart';
import '../../features/exams/presentation/view/exam_details_view.dart';
import '../../features/exams/presentation/view/exams_view.dart';
import '../../features/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/login/presentation/widgets/home_test.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static GoRouter getRouter(bool isLoggedIn) => GoRouter(
    initialLocation: AppRouterPaths.kExamView,

    // isLoggedIn
    //     ? AppRouterPaths.kHomeView
    //     : AppRouterPaths.kLoginView,
    routes: [
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
        builder: (context, state) => const HomeTest(),
      ),
      GoRoute(
        path: AppRouterPaths.kExamView,
        builder: (context, state) => const ExamsView(),
      ),
      GoRoute(
        path: AppRouterPaths.kExamDetailsView,
        builder: (context, state) => const ExamDetailsView(),
      ),
    ],
  );
}
