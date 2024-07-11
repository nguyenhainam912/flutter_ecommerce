// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/personalization/controllers/user_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:ecommt/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Re-Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.email),
                  ),
                  SizedBox(height: TSizes.spaceBtwInputFields),
                  Obx(
                    () => TextFormField(
                      controller: controller.verifyPassword,
                      obscureText: controller.hidePassword.value,
                      validator: (value) =>
                          TValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          suffix: IconButton(
                            icon: Icon(Iconsax.eye_slash),
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                          ),
                          labelText: TTexts.password),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              controller.reAuthenticateEmailAndPasswordUser(),
                          child: Text("Verify")))
                ],
              ),
            )),
      ),
    );
  }
}
