// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: Text("Skip")));
  }
}
