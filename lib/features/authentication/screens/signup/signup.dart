// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/login_signup/form_divider.dart';
import 'package:ecommt/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommt/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    Text(TTexts.signupTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    // Form
                    SignupForm(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    //divider
                    FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //social button
                    SocialButtons(),
                  ],
                ))));
  }
}
