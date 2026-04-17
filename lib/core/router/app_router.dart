import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kHomeView,
        builder: (context, state) => const HomeTest(),
      ),
      GoRoute(
        path: AppRouterPaths.kExamQuestionsView,
        builder: (context, state) {
          final examId = '69d980167c82914570305e19';
          return BlocProvider<ExamsQuestionsCubit>(
            create: (context) =>
                getIt<ExamsQuestionsCubit>()
                  ..handleExamsQuestionsIntent(StartExam(examId: examId)),
            child: ExamsQuestionsView(),
          );
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamScoreView,
        builder: (context, state) {
          final extra = state.extra as Map<String, int>;

          return ExamScoreView(
            correctAnswers: extra[AppStrings.correctAnswers]!,
            wrongAnswers: extra[AppStrings.wrongAnswers]!,
            totalQuestions: extra[AppStrings.totalAnswers]!,
          );
        },
      ),
    ],
  );
}
