import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:online_exam_app/features/edit_profile/presentation/widgets/edit_profile_view_body.dart';

import '../view_model/intent/edit_profile_intent.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<EditProfileCubit>()..processIntent(GetUserInfoIntent()),
      child: Scaffold(
        appBar: CustomAppBar(hasBackButton: false, title: AppStrings.profile),
        body: const EditProfileViewBody(),
      ),
    );
  }
}
