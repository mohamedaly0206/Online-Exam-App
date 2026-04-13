import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_questions_view.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_score_view.dart';
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
        path: AppRouterPaths.kExamQuestionsView,
        builder: (context, state) {
          final examId = '69d980167c82914570305e19';
          return ExamsQuestionsView(examId: examId);
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamScoreView,
        builder: (context, state) {
          final extra = state.extra as Map<String, int>;

          return ExamScoreView(
            correctAnswers: extra["correct"]!,
            wrongAnswers: extra["wrong"]!,
            totalQuestions: extra["total"]!,
          );
        },
      ),
    ],
  );
}
