import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sigin_up_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final SignUpCubit signUpCubit = getIt.get<SignUpCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => signUpCubit,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                child: SvgPicture.asset(Assets.icons.arrowBackIcon),
              ),
            ),
            title: const Text(AppStrings.signUp),
          ),
          body: const SignUpViewBody(),
        ),
      ),
    );
  }
}
