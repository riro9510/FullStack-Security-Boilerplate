import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'sub_task.dart';
abstract class Task {
  String id;
  String name;
  String description;
  DateTime time;
  bool isCompleted;
  TaskPriority priority;
  List<SubTask> subTasks;

  Task({
    required this.name,
    required this.description,
    required this.time,
    required this.priority,
    this.isCompleted = false,
  }): id = Uuid().v4(),subTasks = [];

  void editTask(int id,String newName, String newDescription, DateTime newTime, TaskPriority newPriority) {
    id = id;
    name = newName;
    description = newDescription;
    time = newTime;
    priority = newPriority;
  }
  void addSubTask(SubTask subTask) {
    subTasks.add(subTask);
  }

  void markAsCompleted() {
    isCompleted = true;
  }

  Task showDetails();

  Future<void> safeToMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String taskJson = jsonEncode(this.toJson());
    prefs.setString('task_${this.name}', taskJson);
    print("Task $name saved to memory");
  }

  static Future<Task?> recoverFromMemory(String taskName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? taskJson = prefs.getString('task_$taskName');

    if (taskJson != null) {
      Map<String, dynamic> taskMap = jsonDecode(taskJson);
      return fromJson(taskMap);
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'time': time.toIso8601String(),
      'isCompleted': isCompleted,
      'priority': priority.toString(),
      'subTasks': subTasks.map((subTask) => subTask.toJson()).toList(),
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}


enum TaskPriority { low, medium, high }
