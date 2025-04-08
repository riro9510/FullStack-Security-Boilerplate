import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    try {
      final bool canCheck = await auth.canCheckBiometrics;
      if (!canCheck) {
        Get.snackbar("Error", "Device Doesn't support Biometric");
        return false;
      }

      final bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticated to continue',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );

      return authenticated;
    } catch (e) {
      Get.snackbar("Error", "Auth failed: $e");
      return false;
    }
  }
}
