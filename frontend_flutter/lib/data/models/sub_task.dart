import 'Task.dart';
import 'package:flutter/material.dart';

class SubTask extends Task {
  String parentTaskId;

  SubTask({
    required String name,
    required String description,
    required DateTime time,
    required TaskPriority priority,
    required bool isCompleted,
    required this.parentTaskId,
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
