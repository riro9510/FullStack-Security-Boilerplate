import 'Task.dart';

class SubTask extends Task {
  String parentTaskId;

  SubTask({
    required super.name,
    required super.description,
    required super.time,
    required super.priority,
    required super.isCompleted,
    required this.parentTaskId,
  });

  @override
  void markAsCompleted() {
    isCompleted = true;
  }

  @override
  SubTask showDetails() {
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'parentTaskId': parentTaskId,
    };
  }

  static SubTask fromJson(Map<String, dynamic> json) {

    return SubTask(
      name: json['name'],
      description: json['description'],
      time: DateTime.parse(json['time']),
      priority: TaskPriority.values.firstWhere((e) => e.toString() == json['priority']),
      isCompleted: json['isCompleted'],
      parentTaskId: json['parentTaskId'],
    );
  }
}
