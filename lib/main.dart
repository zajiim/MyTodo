import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/constants/colors.dart';
import 'package:getx_todo_app/app/data/services/storage/storage_services.dart';
import 'package:getx_todo_app/app/modules/home/binding.dart';
import 'package:getx_todo_app/app/modules/home/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyTodo());
}

class MyTodo extends StatelessWidget {
  const MyTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        // scaffoldBackgroundColor: kWhite,
        useMaterial3: true,
      ),
      title: 'MyTodo',
      home: const HomeScreen(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
