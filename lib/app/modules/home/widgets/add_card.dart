import 'package:dotted_border/dotted_border.dart';
import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/constants/colors.dart';
import 'package:getx_todo_app/app/core/utils/extensions.dart';
import 'package:getx_todo_app/app/modules/home/widgets/icons.dart';

import '../../../data/models/task.dart';
import '../home_controller.dart';

class AddCardWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  AddCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      height: squareWidth / 2,
      width: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(
              vertical: 5.0.wp,
            ),
            radius: 5,
            title: "Task Type",
            content: Form(
              key: homeController.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                    child: TextFormField(
                      controller: homeController.textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Title",
                      ),
                      validator: ((value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter a title";
                        }
                        return null;
                      }),
                    ),
                  ),
                  Wrap(
                    spacing: 2.0.wp,
                    children: icons
                        .map((items) => Obx(() {
                              final index = icons.indexOf(items);
                              return ChoiceChip(
                                selectedColor: kBlue,
                                backgroundColor: kWhite,
                                pressElevation: 0,
                                label: items,
                                selected:
                                    homeController.iconChipIndex.value == index,
                                onSelected: (bool selected) {
                                  homeController.iconChipIndex.value =
                                      selected ? index : 0;
                                },
                              );
                            }))
                        .toList(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kButtonBlueShade,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(100, 40),
                    ),
                    onPressed: () {
                      if (homeController.formKey.currentState!.validate()) {
                        final icon = icons[homeController.iconChipIndex.value].icon!.codePoint;
                        String color = icons[homeController.iconChipIndex.value]
                            .toString();
                        var task = Task(
                          title: homeController.textController.text,
                          color: color,
                          icon: icon,
                        );

                        Get.back();
                        homeController.addTask(task)
                            ? EasyLoading.showSuccess(
                                "Created Todo",
                              )
                            : EasyLoading.showError(
                                "Already exists",
                              );
                      }
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          homeController.textController.clear();
          homeController.changeIconChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [10, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
