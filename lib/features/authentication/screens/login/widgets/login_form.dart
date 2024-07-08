// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/authentication/screens/password_config/forgot_password.dart';
import 'package:ecommt/features/authentication/screens/signup/signup.dart';
import 'package:ecommt/navigation_menu.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // password
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            // remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember me
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(TTexts.rememberMe)
                ]),

                // forget password
                TextButton(
                    onPressed: () => Get.to(() => ForgotPassword()),
                    child: Text(TTexts.forgetPassword))
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => NavigationMenu()),
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //  sign up button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text(TTexts.createAccount),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
