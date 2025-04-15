class Habit {
  final String id;
  final String name;
  final String description;
  final List<bool> weekProgress;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    List<bool>? weekProgress,
  }) : weekProgress = weekProgress ?? List.filled(7, false);

  double get weeklyProgress {
    int completed = weekProgress.where((day) => day).length;
    return completed / 7;
  }

  Habit toggleDay(int dayIndex) {
    if (dayIndex < 0 || dayIndex >= 7) return this;

    final newProgress = List<bool>.from(weekProgress);
    newProgress[dayIndex] = !newProgress[dayIndex];

    return Habit(
      id: id,
      name: name,
      description: description,
      weekProgress: newProgress,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'weekProgress': weekProgress,
  };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    weekProgress: (json['weekProgress'] as List).cast<bool>(),
  );
}
