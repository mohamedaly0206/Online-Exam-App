import 'package:flutter/material.dart';

class ExamsView extends StatelessWidget {
  const ExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language')
      ),
      body: Center(
        child: Text('Exams View'),
      ),
    );
  }
}