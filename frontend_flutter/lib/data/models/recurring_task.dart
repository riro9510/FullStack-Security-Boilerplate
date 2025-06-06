import 'Task.dart';

class RecurringTask extends Task {
  String recurrencePattern;
  DateTime? deadline;

  RecurringTask({
    required super.name,
    required super.description,
    required super.time,
    required super.priority,
    required super.isCompleted,
    required this.recurrencePattern,
    required this.deadline,
  });

  @override
  void markAsCompleted() {
    print('Recurring task $name completed for today');
  }

  @override
  RecurringTask showDetails() {
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'recurrencePattern': recurrencePattern,
      'deadline': deadline?.toIso8601String(),
    };
  }

  static RecurringTask fromJson(Map<String, dynamic> json) {
    return RecurringTask(
      name: json['name'],
      description: json['description'],
      time: DateTime.parse(json['time']),
      priority: TaskPriority.values.firstWhere((e) => e.toString() == json['priority']),
      isCompleted: json['isCompleted'],
      recurrencePattern: json['recurrencePattern'],
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
    );
  }

}