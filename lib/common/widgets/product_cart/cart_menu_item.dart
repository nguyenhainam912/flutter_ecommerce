import 'package:ecommt/features/shop/screens/cart/cart.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor = TColors.dark,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(children: [
      IconButton(
          onPressed: () => Get.to(() => CartScreen()),
          icon: Icon(Iconsax.shopping_bag,
              color: dark ? TColors.white : iconColor)),
      Positioned(
          right: 0,
          child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: TColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text("2",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.white, fontSizeFactor: 0.8)),
              )))
    ]);
  }
}
