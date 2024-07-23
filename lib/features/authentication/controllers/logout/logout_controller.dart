import 'package:ecommt/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommt/utils/popups/dialog.dart';
import 'package:ecommt/utils/popups/loaders.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  final authRepository = Get.put(AuthenticationRepository());

  void logout() async {
    try {
      final result = await TDialog.confirm(
          title: "Confirm Logout", content: "Are you sure want to logout?");

      if (result) await authRepository.logout();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
