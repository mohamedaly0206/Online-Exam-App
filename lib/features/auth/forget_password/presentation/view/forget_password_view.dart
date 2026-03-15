import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import '../../presentation/view_model/cubit/forget_password_cubit.dart';
import '../../presentation/view_model/state/forget_password_state.dart';
import '../widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
   ForgetPasswordCubit forgetPasswordCubit = getIt.get<ForgetPasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => forgetPasswordCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.password),
          leading: Center(
            child: GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: SvgPicture.asset(Assets.icons.arrowBackIcon),
            ),
          ),
        ),

        body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (BuildContext context, ForgetPasswordState state) {
            final isAnyLoading =
                state.enterEmailState.isLoading ||
                state.verifyResetCodeState.isLoading ||
                state.resendOTPState.isLoading ||
                state.resetPasswordState.isLoading;
            return ForgetPasswordBody(
              isAnyLoading: isAnyLoading,
              verifyResetCodeErrorMessage:
                  state.verifyResetCodeState.errorMessage,
            );
          },
        ),
      ),
    );
  }
}


