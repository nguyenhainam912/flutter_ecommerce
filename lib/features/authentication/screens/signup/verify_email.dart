// ignore_for_file: prefer_const_constructors

import 'package:ecommt/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommt/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //image
                Image(
                    width: THelperFunctions.screenWidth() * 0.6,
                    image: AssetImage(TImages.deliveredEmailIllustration)),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //title
                Text(
                  TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: Text(TTexts.tContinue),
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text(TTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
