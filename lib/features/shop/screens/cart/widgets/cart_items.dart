// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommt/common/widgets/products/cart/cart_item.dart';
import 'package:ecommt/common/widgets/products/cart/product_quantity_with_add_remove.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              /// cart item
              TCartItem(
                cartItem: item,
              ),
              if (showAddRemoveButtons)
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

              /// add remove button row with total price
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),

                        /// add remove buttons
                        TProductQuantityWithAddRemove(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    /// total price
                    TProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
