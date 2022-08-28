import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/utils/extensions.dart';
import 'package:getx_todo_app/app/data/models/task.dart';
import 'package:getx_todo_app/app/modules/home/home_controller.dart';
import 'package:getx_todo_app/app/modules/home/widgets/add_card.dart';
import 'package:getx_todo_app/app/modules/home/widgets/task_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My Todos',
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map((items) => TaskCardWidget(task: items))
                      .toList(),
                  AddCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
