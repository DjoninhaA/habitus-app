import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitDetailsDialog extends StatelessWidget {
  final Habit habit;

  const HabitDetailsDialog({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(habit.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(habit.description),
          const SizedBox(height: 16),
          Text(
            'Progresso semanal:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('${(habit.weeklyProgress * 100).toInt()}%'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
