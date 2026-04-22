import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:online_exam_app/features/splash/presentation/view_model/state/splash_state.dart';

import '../../../../core/values/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (!state.splashState.isLoading) {
          FlutterNativeSplash.remove();
          if (state.splashState.data != null) {
            context.go(AppRouterPaths.kHomeView);
          } else {
            context.go(AppRouterPaths.kLoginView);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Opacity(
            opacity: 0.95,
            child: Assets.icons.splash.image(
              width: 165,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
