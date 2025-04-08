import 'Task.dart';

class SimpleTask extends Task {
  SimpleTask({
    required String name,
    required String description,
    required DateTime time,
    required TaskPriority priority,
    bool isCompleted = false,
  }) : super(
    name: name,
    description: description,
    time: time,
    priority: priority,
    isCompleted: isCompleted,
  );

  @override
  void markAsCompleted() {
    isCompleted = true;
  }

  @override
  SimpleTask showDetails() {
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'SimpleTask',
      'id': id,
      'name': name,
      'description': description,
      'time': time.toIso8601String(),
      'priority': priority.toString(),
      'isCompleted': isCompleted,
    };
  }

  static SimpleTask fromJson(Map<String, dynamic> json) {
    return SimpleTask(
      name: json['name'],
      description: json['description'],
      time: DateTime.parse(json['time']),
      priority: TaskPriority.values.firstWhere((e) => e.toString() == json['priority']),
      isCompleted: json['isCompleted'],
    );
  }
}
