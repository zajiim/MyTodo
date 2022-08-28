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
}
