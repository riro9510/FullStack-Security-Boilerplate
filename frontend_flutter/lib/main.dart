import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/core/core.dart';
import 'routes/routes.dart';

void main() {
  Get.lazyPut<TaskController>(() => TaskController(), fenix: true);
  runApp(
    GetMaterialApp(
      title: 'ToDo App',
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    ),
  );
}

