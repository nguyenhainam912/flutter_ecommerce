// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        padding: EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            // brand with product count
            TBrandCard(showBorder: false),
            SizedBox(height: TSizes.spaceBtwItems),

            // brand top 3 product images
            Row(
              children: images
                  .map((image) => brandToProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ));
  }

  Widget brandToProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
        child: TRoundedContainer(
            height: 100,
            showBorder: true,
            backgroundColor: dark ? TColors.darkGrey : TColors.light,
            margin: EdgeInsets.only(right: TSizes.sm),
            padding: EdgeInsets.all(TSizes.md),
            child: Image(fit: BoxFit.contain, image: AssetImage(image))));
  }
}
