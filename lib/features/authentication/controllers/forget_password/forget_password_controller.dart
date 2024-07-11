// ignore_for_file: prefer_const_constructors

import 'package:ecommt/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommt/features/authentication/screens/password_config/reset_password.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/helpers/network_manager.dart';
import 'package:ecommt/utils/popups/full_screen_loader.dart';
import 'package:ecommt/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request...", TImages.docerAnimation);

      // check internet connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetlVerification(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      //show succes screen
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password".tr);

      //redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request...", TImages.docerAnimation);

      // check internet connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetlVerification(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      //show succes screen
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password".tr);
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
