// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/styles/shadows.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          color: dark ? TColors.darkGrey : TColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        child: Column(
          children: [
            // thumbnail, widhlist, discount tag
            TRoundedContainer(
                height: 180,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColors.dark : TColors.light,
                child: Stack(
                  children: [
                    // thumbnail image
                    TRoundedImage(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                    ),

                    // sale tag
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                          radius: TSizes.sm,
                          padding: EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          child: Text("25%",
                              style:
                                  Theme.of(context).textTheme.labelLarge!.apply(
                                        color: TColors.black,
                                      ))),
                    ),

                    // favourite icon button
                    Positioned(
                        top: 0,
                        right: 0,
                        child: TCircularIcon(
                            icon: Iconsax.heart5, color: Colors.red)),
                  ],
                )),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // detail
            Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: 'Nike shoes',
                          smallSize: true,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        TBrandTitleWithVerifiedIcon(
                          title: 'Nike',
                        ),
                      ],
                    ),
                  ],
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(
                    price: '35.0',
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius)),
                        color: TColors.dark),
                    child: SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: TColors.white),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
