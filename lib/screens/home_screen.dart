import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/habit.dart';
import '../widgets/habit_list.dart';
import '../widgets/add_habit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Habit> _habits = [];
  static const String _habitsKey = 'habits';

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getStringList(_habitsKey);

    if (habitsJson != null) {
      setState(() {
        _habits.clear();
        _habits.addAll(
          habitsJson.map((json) => Habit.fromJson(jsonDecode(json))).toList(),
        );
      });
    }
  }

  Future<void> _saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson =
        _habits.map((habit) => jsonEncode(habit.toJson())).toList();
    await prefs.setStringList(_habitsKey, habitsJson);
  }

  void _addHabit(String name, String description) {
    setState(() {
      _habits.add(
        Habit(
          id: DateTime.now().toString(),
          name: name,
          description: description,
        ),
      );
    });
    _saveHabits();
  }

  void _toggleHabitDay(String habitId, int dayIndex) {
    setState(() {
      final habitIndex = _habits.indexWhere((h) => h.id == habitId);
      if (habitIndex != -1) {
        _habits[habitIndex] = _habits[habitIndex].toggleDay(dayIndex);
      }
    });
    _saveHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitus'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
          _habits.isEmpty
              ? const Center(
                child: Text(
                  'Cadastre suas atividades',
                  style: TextStyle(fontSize: 18),
                ),
              )
              : HabitList(habits: _habits, onDayToggle: _toggleHabitDay),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AddHabitDialog(onAddHabit: _addHabit),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
