// import "package:flutter/material.dart";
// import 'package:get/get.dart';
// import 'package:getx_todo_app/app/core/constants/colors.dart';
// import 'package:getx_todo_app/app/core/utils/extensions.dart';
// import 'package:getx_todo_app/app/modules/home/home_controller.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// import '../../../data/models/task.dart';

// class TaskCard extends StatelessWidget {
//   final homeController = Get.find<HomeController>();
//   final Task task;
//   TaskCard({Key? key, required this.task}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = task.color;
//     var squareWidth = Get.width - 12.0.wp;
//     return Container(
//       // color: Colors.red,
//       width: squareWidth / 2,
//       height: squareWidth / 2,
//       margin: EdgeInsets.all(3.0.wp),

//       //margin: const EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           StepProgressIndicator(
//             totalSteps: 100,
//             currentStep: 60,
//             size: 5,
//             // selectedGradientColor: LinearGradient(
//             //   begin: Alignment.topLeft,
//             //   end: Alignment.bottomRight,
//             //   colors: [
//             //     Colors.indigoAccent.withOpacity(0.5),
//             //     Colors.indigo,
//             //   ],
//             // ),
//             // unselectedGradientColor: const LinearGradient(
//             //   begin: Alignment.topLeft,
//             //   end: Alignment.bottomRight,
//             //   colors: [
//             //     kWhite,
//             //     kWhite,
//             // ],
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/constants/colors.dart';
import 'package:getx_todo_app/app/core/utils/extensions.dart';
import 'package:getx_todo_app/app/modules/home/home_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../data/models/task.dart';

class TaskCardWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final Task task;
  TaskCardWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = task.color;
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(
        3.0.wp,
      ),
      decoration: BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 5,
            offset: const Offset(
              0,
              5,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
          ),
          Padding(
            padding: EdgeInsets.all(5.0.wp),
            child: Icon(
              IconData(
                task.icon,
                fontFamily: 'MaterialIcons',
              ),
              color: Colors.deepPurpleAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Column(
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.0.wp,
                ),
                Text(
                  '${task.todos?.length ?? 0} Task',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
