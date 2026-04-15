import 'package:flutter/material.dart';
import 'package:online_exam_app/features/auth/login/presentation/widgets/login_view_body.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const LoginViewBody(),
      ),
    );
  }
}
