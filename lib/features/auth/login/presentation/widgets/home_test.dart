import 'package:flutter/material.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('<<<<<<<<<you r now in home>>>>>>>>>>')),
    );
  }
}
