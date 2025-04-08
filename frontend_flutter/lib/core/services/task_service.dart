import 'package:get/get.dart';
import 'package:frontend_flutter/data/data.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  Future<void> loadTasksFromJson() async {
    final String jsonString = await rootBundle.loadString('assets/data/tasks.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    tasks.value = jsonList.map((json) => Task.fromJson(json)).toList();
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }

  void markTaskAsCompleted(String taskId) {
    var task = tasks.firstWhere((task) => task.id == taskId);
    task.markAsCompleted();
    update();
  }

  Task showTaskDetails(String taskId) {
    return tasks.firstWhere((task) => task.id == taskId);
  }

  void addSubTaskToTask(String parentTaskId, SubTask subTask) {
    var parentTask = tasks.firstWhere((task) => task.id == parentTaskId);
    if (parentTask is RecurringTask) {
      parentTask.addSubTask(subTask);
    }
    update();
  }
}
