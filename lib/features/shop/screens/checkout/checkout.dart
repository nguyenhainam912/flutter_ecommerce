// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/products/cart/coupon_widget.dart';
import 'package:ecommt/common/widgets/success_screen/success_screen.dart';
import 'package:ecommt/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommt/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommt/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommt/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommt/navigation_menu.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Order review",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwSections),
          child: Column(
            children: [
              ///item in cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// coupon textfield
              TCouponCode(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///billing sections
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.dark : TColors.white,
                child: Column(
                  children: [
                    ///pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///payment methods
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: "Payment Success !",
                  subTitle: "Your item will be shipped soon!",
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                )),
            child: Text("checkout \$250.0 ")),
      ),
    );
  }
}
