import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_questions_view.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_score_view.dart';

import '../../config/di/di.dart';
import '../../features/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';
import '../../features/exams/domain/model/exams_model.dart';
import '../../features/exams/presentation/view/exam_details_view.dart';
import '../../features/exams/presentation/view/exams_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/home/presentation/view_model/cubit/home_cubit.dart';
import '../../features/home/presentation/view_model/intent/home_intent.dart';
import '../../features/splash/presentation/view_model/cubit/splash_cubit.dart';
import '../../features/splash/presentation/view_model/intent/splash_intent.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'router_paths.dart';

abstract class AppRouter {
  static GoRouter getRouter() => GoRouter(
    initialLocation: AppRouterPaths.kSplashView,

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
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kExamQuestionsView,

        builder: (context, state) {
          final examId = state.extra as String;
          return ExamsQuestionsView(examId: examId);
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamScoreView,
        builder: (context, state) {
          final cubit = state.extra as ExamsQuestionsCubit;
          return ExamScoreView(cubit: cubit);
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamView,
        builder: (context, state) {
          final subjectId = state.extra as String;
          return ExamsView(subjectId: subjectId);
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamDetailsView,
        builder: (context, state) {
          final examModel = state.extra as ExamModel;
          return ExamDetailsView(exam: examModel);
        },
      ),
    ],
  );
}
