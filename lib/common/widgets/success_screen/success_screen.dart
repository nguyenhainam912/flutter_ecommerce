// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/styles/spacing_styles.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            //image
            Image(
                width: THelperFunctions.screenWidth() * 0.6,
                image: AssetImage(image)),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //title
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(TTexts.tContinue),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
