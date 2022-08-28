import 'package:get/get.dart';
import 'package:getx_todo_app/app/data/providers/task/task_provider.dart';
import 'package:getx_todo_app/app/data/services/storage/storage_repo.dart';
import 'package:getx_todo_app/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepo: TaskRepo(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
