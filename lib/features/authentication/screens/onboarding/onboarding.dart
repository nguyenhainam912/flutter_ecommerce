// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommt/features/authentication/screens/onboarding/widgets/onboarding_dotnavigator.dart';
import 'package:ecommt/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:ecommt/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommt/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        // horizontal scrollable pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: [
            OnBoardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subtitle: TTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subtitle: TTexts.onBoardingSubTitle3,
            )
          ],
        ),

        // Skip button
        OnBoardingSkip(),

        //Dot navigation SmoothPageIndicator
        OnBoadingDotNavigator(),

        // Circilar button
        OnBoardingNextButton()
      ],
    ));
  }
}
