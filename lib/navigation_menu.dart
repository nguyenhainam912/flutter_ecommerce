// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommt/features/personalization/screens/settings/settings.dart';
import 'package:ecommt/features/shop/screens/home/home.dart';
import 'package:ecommt/features/shop/screens/store/store.dart';
import 'package:ecommt/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selctedIndex.value,
            onDestinationSelected: (index) =>
                controller.selctedIndex.value = index,
            backgroundColor: dark ? TColors.black : TColors.white,
            indicatorColor: dark
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selctedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selctedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    SettingsScreen()
  ];
}
