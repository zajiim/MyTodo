import 'package:getx_todo_app/app/data/providers/task/task_provider.dart';

import '../../models/task.dart';

class TaskRepo {
  late TaskProvider taskProvider;
  TaskRepo({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
