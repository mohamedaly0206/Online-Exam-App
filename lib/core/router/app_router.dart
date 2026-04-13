import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';

import '../../features/auth/login/presentation/views/home_test.dart';
import '../../features/auth/login/presentation/views/login_view.dart';

abstract class AppRouter {
  static GoRouter getRouter(bool isLoggedIn) => GoRouter(
    initialLocation: isLoggedIn
        ? AppRouterPaths.kHomeView
        : AppRouterPaths.kLoginView,

    routes: [
      GoRoute(
        path: AppRouterPaths.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRouterPaths.kHomeView,
        builder: (context, state) => const HomeTest(),
      ),
    ],
  );
}
