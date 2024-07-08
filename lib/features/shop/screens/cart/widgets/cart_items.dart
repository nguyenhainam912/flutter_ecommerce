// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommt/common/widgets/products/cart/cart_item.dart';
import 'package:ecommt/common/widgets/products/cart/product_quantity_with_add_remove.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          /// cart item
          TCartItem(),
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
                    TProductQuantityWithAddRemove(),
                  ],
                ),

                /// total price
                TProductPriceText(price: '250'),
              ],
            )
        ],
      ),
    );
  }
}
