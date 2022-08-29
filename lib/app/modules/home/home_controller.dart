import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:getx_todo_app/app/data/services/storage/storage_repo.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController {
  TaskRepo taskRepo;
  HomeController({required this.taskRepo});
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final iconChipIndex = 0.obs;
  final tasks = <Task>[].obs;
  final deleting = false.obs;
  final task = Rx<Task?>(null);

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepo.readTasks());
    ever(tasks, (callback) => taskRepo.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeTask(Task? select) {
    task.value = select;
  }

  void changeIconChipIndex(int val) {
    iconChipIndex.value = val;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    } else {
      tasks.add(task);
      return true;
    }
  }

  updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    if (containesTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    int oldIndex = tasks.indexOf(task);
    tasks[oldIndex] = newTask;
    tasks.refresh();
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  bool containesTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }
}
