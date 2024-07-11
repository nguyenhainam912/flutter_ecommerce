// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/images/t_circular_image.dart';
import 'package:ecommt/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/personalization/controllers/user_controller.dart';
import 'package:ecommt/features/personalization/screens/profile/change_name.dart';
import 'package:ecommt/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
        appBar: TAppBar(showBackArrow: true, title: Text("Profile")),

        ///body
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(
                        () {
                          final networkImage =
                              controller.user.value.profilePicture;
                          final image = networkImage.isNotEmpty
                              ? networkImage
                              : TImages.user;

                          return controller.imageUpLoading.value
                              ? TShimmerEffect(
                                  width: 80, height: 80, radius: 80)
                              : TCircularImage(
                                  image: image,
                                  width: 80,
                                  height: 80,
                                  isNetworkImage: networkImage.isNotEmpty,
                                );
                        },
                      ),
                      TextButton(
                          onPressed: () =>
                              controller.uploadUserProfilePicture(),
                          child: Text("Change Profile Picture"))
                    ],
                  )),

              /// details
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// heading profile info
              TSectionHeading(
                title: "Profile Infomation",
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () => Get.to(() => ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// heading personal info
              TSectionHeading(
                title: "Personal Infomation",
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '09 Dec 2003',
              ),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                  child: TextButton(
                child:
                    Text("Close Account", style: TextStyle(color: Colors.red)),
                onPressed: () => controller.deleteAccountWarningPopup(),
              ))
            ],
          ),
        )));
  }
}
