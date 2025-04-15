import 'package:flutter/material.dart';
import '../models/habit.dart';
import 'habit_details_dialog.dart';

class HabitTile extends StatefulWidget {
  final Habit habit;
  final Function(int)? onDayToggle;

  const HabitTile({super.key, required this.habit, this.onDayToggle});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  void _showDetailsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => HabitDetailsDialog(habit: widget.habit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          InkWell(
            onTap: _showDetailsDialog,
            child: ListTile(
              title: Text(widget.habit.name),
              subtitle: Text(widget.habit.description),
              trailing: Text('${(widget.habit.weeklyProgress * 100).toInt()}%'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.onDayToggle != null) {
                      widget.onDayToggle!(index);
                    }
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color:
                          widget.habit.weekProgress[index]
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'][index],
                        style: TextStyle(
                          color:
                              widget.habit.weekProgress[index]
                                  ? Colors.white
                                  : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
