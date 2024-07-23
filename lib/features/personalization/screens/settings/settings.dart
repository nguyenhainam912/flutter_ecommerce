// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommt/common/widgets/list_title.dart/settings_menu_title.dart';
import 'package:ecommt/common/widgets/list_title.dart/user_profile_title.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/authentication/controllers/logout/logout_controller.dart';
import 'package:ecommt/features/personalization/screens/address/address.dart';
import 'package:ecommt/features/personalization/screens/profile/profile.dart';
import 'package:ecommt/features/personalization/screens/upload_data/upload_data.dart';
import 'package:ecommt/features/shop/screens/order/order.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // header
          PrimaryHeaderContainer(
              child: Column(
            children: [
              // appbar
              TAppBar(
                  title: Text(
                "Account",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColors.white),
              )),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // user profile card
              TUserProfileTitle(
                onPressed: () => Get.to(() => ProfileScreen()),
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          )),

          // body
          Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              //account setting
              TSectionHeading(
                title: "Account Settings",
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TSettingsMenuTitle(
                icon: Iconsax.safe_home,
                title: "My Address",
                subTitle: 'Set shopping delivery address',
                onTap: () => Get.to(() => UserAddressScreen()),
              ),
              TSettingsMenuTitle(
                icon: Iconsax.shopping_cart,
                title: "My Cart",
                subTitle: 'Add, remove products and move to checkout',
                onTap: () {},
              ),
              TSettingsMenuTitle(
                icon: Iconsax.bag_tick,
                title: "My Orders",
                subTitle: 'In-progress and Completed Orders',
                onTap: () => Get.to(() => OrderScreen()),
              ),
              TSettingsMenuTitle(
                icon: Iconsax.bank,
                title: "Bank Account",
                subTitle: 'Withdraw balance to registered bank account',
                onTap: () {},
              ),
              TSettingsMenuTitle(
                icon: Iconsax.discount_shape,
                title: "My Coupons",
                subTitle: 'List of all the discounted coupons',
                onTap: () {},
              ),

              TSettingsMenuTitle(
                icon: Iconsax.notification,
                title: "Notifications",
                subTitle: 'Set any kind of notification message',
                onTap: () {},
              ),
              TSettingsMenuTitle(
                icon: Iconsax.security_card,
                title: "Account privacy",
                subTitle: 'Manage data usage and connected accounts',
                onTap: () {},
              ),

              // app settings
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSectionHeading(
                title: "App Settings",
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingsMenuTitle(
                icon: Iconsax.document,
                title: 'Load Data',
                subTitle: 'Upload data to your firebase',
                onTap: () => Get.to(() => UploadDataScreen()),
              ),

              ///
              TSettingsMenuTitle(
                icon: Iconsax.location,
                title: 'Geolocation',
                subTitle: 'Set recommendatin based on location',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              TSettingsMenuTitle(
                icon: Iconsax.security_user,
                title: 'Safe Mode',
                subTitle: 'Search result is safe for all ages',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              TSettingsMenuTitle(
                icon: Iconsax.image,
                title: 'HD Image Quality',
                subTitle: 'Set image quality to be seen',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),

              ///logout button
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      final controller = Get.put(LogoutController());
                      controller.logout();
                    },
                    child: Text("Logout")),
              ),
              SizedBox(
                height: TSizes.spaceBtwSections * 2.5,
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
