import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/widgets/widgets.dart';
import 'package:frontend_flutter/data/data.dart';
import 'package:frontend_flutter/core/core.dart';

class TaskScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  TaskScreen({super.key}) {
    controller.loadTasksFromJson();
  }

  @override
  Widget build(BuildContext context) {
    List<ActionsFloatingButton> taskAction = [
      ActionsFloatingButton(
        icon: Icon(Icons.add_task),
        label: 'Add Task',
        action: () {
          controller.addTask(SimpleTask(
            time: DateTime.now(),
            name: 'Tarea nueva',
            description: 'Descripción generada', priority: TaskPriority.medium,
          ));

        },
      ),
      ActionsFloatingButton(
        icon: Icon(Icons.subdirectory_arrow_right),
        label: 'Add Subtask',
        action: () {
          if (controller.tasks.isNotEmpty) {
            final parent = controller.tasks.first;
            controller.addSubTaskToTask(
              parent.id,
              SubTask(
                time: DateTime.now(),
                name: 'Subtarea',
                description: 'Descripción',
                priority:TaskPriority.low,
                isCompleted: false,
                parentTaskId: "1",
              ),
            );
          }
        },
      ),
      ActionsFloatingButton(
        icon: Icon(Icons.repeat),
        label: 'Add Recurring Task',
        action: () {
          controller.addTask(RecurringTask(
            time: DateTime.now(),
            name: 'Tarea Recurrente',
            description: 'Se repite cada semana',
            recurrencePattern: 'weekly', priority: TaskPriority.medium, isCompleted: false, deadline: DateTime.now().add(Duration(days: 20)),
          ));
        },
      ),
      ActionsFloatingButton(
        icon: Icon(Icons.check_circle),
        label: 'Mark as Completed',
        action: () {
          if (controller.tasks.isNotEmpty) {
            final firstTask = controller.tasks.first;
            controller.markTaskAsCompleted(firstTask.id);
          }
        },
      ),
      ActionsFloatingButton(
        icon: Icon(Icons.delete),
        label: 'Delete Task',
        action: () {
          if (controller.tasks.isNotEmpty) {
            controller.removeTask(controller.tasks.first.id);
          }
        },
      ),
      ActionsFloatingButton(
        icon: Icon(Icons.info),
        label: 'Show Task',
        action: () {
          if (controller.tasks.isNotEmpty) {
            final task = controller.showTaskDetails(controller.tasks.first.id);
            Get.defaultDialog(
              title: task.name,
              middleText: task.description,
            );
          }
        },
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
      floatingActionButton: CustomFAB(actions: taskAction),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return Center(child: Text("No hay tareas aún"));
        }

        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            return ListTile(
              leading: Icon(
                task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: task.isCompleted ? Colors.green : Colors.grey,
              ),
              title: Text(task.name),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.removeTask(task.id);
                },
              ),
              onTap: () {
                controller.markTaskAsCompleted(task.id);
              },
              onLongPress: () {
                final details = controller.showTaskDetails(task.id);
                Get.snackbar("Detalles", details.description);
              },
            );
          },
        );
      }),
    );
  }
}
