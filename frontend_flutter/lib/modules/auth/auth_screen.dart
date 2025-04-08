import 'package:flutter/material.dart';
import 'package:frontend_flutter/widgets/widgets.dart';
import 'package:frontend_flutter/data/data.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  List<ActionsFloatingButton> loginAction = [
    ActionsFloatingButton(icon:Icon(Icons.nightlight_round),
      label:Get.isDarkMode?"Light":"Dark",
      action: () {
        Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
      },)
  ];
  void _startAuth() async {
    bool success = await authController.authenticateWithBiometrics();
    if (success) {
      Get.snackbar("Succesfull", "Authentification completed");
    } else {
      Get.snackbar("Failed", "Couldn't validate");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFAB(actions: loginAction),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.fingerprint, size: 28),
          label: Text("Valid with biometric"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _startAuth,
        ),
      ),
    );
  }
}
