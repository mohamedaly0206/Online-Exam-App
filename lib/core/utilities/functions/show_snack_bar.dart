import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
}
