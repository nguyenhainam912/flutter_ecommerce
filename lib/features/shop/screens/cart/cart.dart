// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/loaders/animation_loader.dart';
import 'package:ecommt/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommt/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommt/features/shop/screens/checkout/checkout.dart';
import 'package:ecommt/navigation_menu.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                ///item in cart
                child: TCartItems()),
          );
        }
      }),

      ///checkout button
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => CheckoutScreen()),
                  child: Obx(() => Text(
                      "Checkout \$${cartController.totalCartPrice.value} "))),
            ),
    );
  }
}
