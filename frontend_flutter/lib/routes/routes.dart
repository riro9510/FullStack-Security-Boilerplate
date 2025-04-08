import 'package:frontend_flutter/modules/auth/auth_screen.dart';
import 'package:frontend_flutter/modules/modules.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String home = '/';
  static const String taskDetail = '/taskToDo';

  static final routes = [
    GetPage(
      name: home,
      page: () => AuthScreen(),
    ),
    GetPage(
      name: taskDetail,
      page: () => TaskScreen(),
    ),
  ];
}

