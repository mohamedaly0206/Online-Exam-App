import 'package:flutter/material.dart';

class QuizOptionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isMultipleChoice;

  const QuizOptionCard({
    super.key,
    required this.text,
    this.isSelected = false,
    this.isCorrect = false,
    this.isMultipleChoice = false,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors based on status
    Color backgroundColor = Colors.grey.shade100;
    Color borderColor = Colors.transparent;
    IconData icon = isSelected
        ? Icons.check_box
        : Icons.check_box_outline_blank;
    Color iconColor = Colors.blue.shade900;

    if (isSelected) {
      backgroundColor = isCorrect ? Colors.green.shade100 : Colors.red.shade100;
      borderColor = isCorrect ? Colors.green : Colors.red;
      if (isMultipleChoice) {
        icon = isCorrect ? Icons.check_box : Icons.indeterminate_check_box;
      } else {
        icon = Icons.radio_button_checked_outlined;
      }
      iconColor = isCorrect ? Colors.green : Colors.red;
    } else if (isCorrect) {
      backgroundColor = Colors.green.shade100;
      borderColor = Colors.green;
      if (isMultipleChoice) {
        icon = Icons.check_box;
      } else {
        icon = Icons.radio_button_off;
      }
      iconColor = Colors.green;
    } else {
      if (isMultipleChoice) {
        icon = Icons.check_box_outline_blank;
      } else {
        icon = Icons.radio_button_off_outlined;
      }
      iconColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
