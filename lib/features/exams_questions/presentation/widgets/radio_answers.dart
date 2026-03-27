import 'package:flutter/material.dart';

class RadioAnswers extends StatelessWidget {
  const RadioAnswers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            'answer 1',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
          ),
          leading: Radio(value: 1, groupValue: 0, onChanged: (value) {}),
        ),
      ),
    );
  }
}
