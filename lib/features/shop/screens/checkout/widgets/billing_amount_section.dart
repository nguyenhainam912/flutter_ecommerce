// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        ///subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$$subTotal", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text(
                "\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}",
                style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${TPricingCalculator.calculateTax(subTotal, 'US')}",
                style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}",
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ],
    );
  }
}
