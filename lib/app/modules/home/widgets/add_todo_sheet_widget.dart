import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/utils/extensions.dart';
import 'package:getx_todo_app/app/modules/home/home_controller.dart';

class AddTodoSheetScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  AddTodoSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeController.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeController.textController.clear();
                      homeController.changeTask(null);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (homeController.formKey.currentState!.validate()) {
                        if (homeController.task.value == null) {
                          EasyLoading.showError("Select a task type");
                        } else {
                          var success = homeController.updateTask(
                            homeController.task.value!,
                            homeController.textController.text,
                          );
                          if (success) {
                            EasyLoading.showSuccess("Added Todo");
                            Get.back();
                            homeController.changeTask(null);
                          } else {
                            EasyLoading.showError("Todo already exists");
                          }
                          homeController.textController.clear();
                        }
                      }
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Text(
                "New Task",
                style:
                    TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
              child: TextFormField(
                controller: homeController.textController,
                decoration: const InputDecoration(hintText: "Enter task"),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your todo item";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Text(
                "Select a Todo category",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14.0.sp,
                ),
              ),
            ),
            ...homeController.tasks
                .map((items) => Obx(
                      () => InkWell(
                        onTap: () => homeController.changeTask(items),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0.wp,
                            horizontal: 8.0.wp,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(items.icon,
                                        fontFamily: 'MaterialIcons'),
                                    color: Colors.purple,
                                  ),
                                  SizedBox(width: 5.0.wp),
                                  Text(
                                    items.title,
                                    style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              if (homeController.task.value == items)
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
