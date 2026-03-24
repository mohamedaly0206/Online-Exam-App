import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:online_exam_app/features/auth/login/presentation/widgets/login_view_body.dart';

import '../../../../../config/di/di.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}
