import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:online_exam_app/features/change_password/presentation/view/change_password_view.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_questions_view.dart';
import 'package:online_exam_app/features/exams_questions/presentation/views/exam_score_view.dart';
import 'package:online_exam_app/features/exams/domain/entity/subject_request.dart';
import 'package:online_exam_app/features/exams/domain/entity/exams_entity.dart';
import 'package:online_exam_app/features/exams/presentation/view/exam_details_view.dart';
import 'package:online_exam_app/features/exams/presentation/view/exams_view.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/cubit/exams_cubit.dart';
import '../../features/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/view/home_view.dart';
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
          AppStrings.errorMessage,
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
        builder: (context, state) => BlocProvider(
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
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<HomeCubit>()..doIntent(GetAllSubjectsIntent()),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kExamQuestionsView,
        builder: (context, state) {
          final String examId = state.extra as String;
          return BlocProvider<ExamsQuestionsCubit>(
            create: (context) =>
                getIt<ExamsQuestionsCubit>()
                  ..handleExamsQuestionsIntent(StartExam(examId: examId)),
            child: ExamsQuestionsView(examId: examId),
          );
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamView,
        builder: (context, state) {
          final subject = state.extra as SubjectRequest;

          return BlocProvider(
            create: (context) => getIt<ExamsCubit>(),
            child: ExamsView(
              subjectId: subject.subjectId,
              subjectName: subject.subjectName,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamScoreView,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return ExamScoreView(
            examId: extra[AppStrings.examId] as String,
            correctAnswers: extra[AppStrings.correctAnswers] as int,
            wrongAnswers: extra[AppStrings.wrongAnswers] as int,
            totalQuestions: extra[AppStrings.totalAnswers] as int,
          );
        },
      ),
      GoRoute(
        path: AppRouterPaths.kExamDetailsView,
        builder: (context, state) {
          final examModel = state.extra as ExamEntity;
          return ExamDetailsView(exam: examModel);
        },
      ),
      GoRoute(
        path: AppRouterPaths.kChangePasswordView,
        builder: (context, state) => BlocProvider<ChangePasswordCubit>(
          create: (context) => getIt<ChangePasswordCubit>(),
          child: ChangePasswordView(),
        ),
      ),
    ],
  );
}
