// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/styles/spacing_styles.dart';
import 'package:ecommt/common/widgets/login_signup/form_divider.dart';
import 'package:ecommt/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommt/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommt/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title
              LoginHeader(),

              // form
              LoginForm(),

              // divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              SizedBox(
                width: TSizes.spaceBtwSections,
              ),

              // footer
              SocialButtons()
            ],
          )),
    ));
  }
}
