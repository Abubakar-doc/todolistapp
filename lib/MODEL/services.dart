import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistapp/MODEL/todoModel.dart';

class TodoService {
  Future<void> deleteTask(TodoTask task) async {
    await task.delete();
  }

  Future<void> addTask({
    required String taskName,
    required String startTime,
    required String endTime,
    required bool isCompleted,
  }) async {
    if (taskName.trim().isEmpty) {
      throw Exception('Task name cannot be empty');
    }

    final box = Hive.box<TodoTask>('tasks');

    final task = TodoTask(
      taskName,
      startTime,
      endTime,
      isCompleted,
    );

    await box.add(task);
  }
}
