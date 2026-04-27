import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:online_exam_app/features/edit_profile/presentation/widgets/edit_profile_view_body.dart';
import '../view_model/intent/edit_profile_intent.dart';
import '../view_model/state/edit_profile_state.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<EditProfileCubit>()..processIntent(GetUserInfoIntent()),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listenWhen: (previous, current) =>
            previous.logoutState != current.logoutState,
        listener: (context, state) {
          if (state.logoutState.data != null) {
            GoRouter.of(context).go(AppRouterPaths.kLoginView);
          }
          if (state.logoutState.errorMessage != null) {
            showSnackBar(
              context: context,
              message: state.logoutState.errorMessage!,
              color: Theme.of(context).colorScheme.error,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              actions: [
                state.logoutState.isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          context.read<EditProfileCubit>().processIntent(
                            LogoutIntent(),
                          );
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
              ],
              hasBackButton: false,
              title: AppStrings.profile,
            ),
            body: const EditProfileViewBody(),
          );
        },
      ),
    );
  }
}
