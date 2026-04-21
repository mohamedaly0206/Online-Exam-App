import 'dart:async';
import 'package:flutter/material.dart';

class ExamTimerController {
  final ValueNotifier<int> time = ValueNotifier(0);
  Timer? _timer;

  void start({required int duration, required VoidCallback onFinish}) {
    time.value = duration;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value <= 0) {
        timer.cancel();
        onFinish();
      } else {
        time.value--;
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
    time.dispose();
  }
}
