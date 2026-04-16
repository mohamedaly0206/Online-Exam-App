import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/widgets/forget_password_body.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.password),
          leading: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Center(child: SvgPicture.asset(Assets.icons.arrowBackIcon)),
          ),
        ),

        body: const ForgetPasswordBody(),
      ),
    );
  }
}
