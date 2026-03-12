import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/auth/login/presentation/views/login_view.dart';


abstract class AppRouter {
  static const kLoginView = '/loginView';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),

    ],
  );
}
