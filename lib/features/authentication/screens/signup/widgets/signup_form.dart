// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommt/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.firstName),
                ),
              ),
              SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName),
                ),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: TTexts.username),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //phone no
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: TTexts.password),
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // terms& condition checkbox
          TermAndConditionCheckbox(),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => VerifyEmailScreen()),
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
