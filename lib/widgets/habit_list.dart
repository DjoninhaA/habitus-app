import 'package:flutter/material.dart';
import '../models/habit.dart';
import 'habit_tile.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function(String, int)? onDayToggle;

  const HabitList({super.key, required this.habits, this.onDayToggle});

  @override
  Widget build(BuildContext context) {
    return habits.isEmpty
        ? const Center(child: Text('No habits added yet. Start by adding one!'))
        : ListView.builder(
          itemCount: habits.length,
          itemBuilder:
              (ctx, index) => HabitTile(
                habit: habits[index],
                onDayToggle:
                    onDayToggle != null
                        ? (dayIndex) => onDayToggle!(habits[index].id, dayIndex)
                        : null,
              ),
        );
  }
}
