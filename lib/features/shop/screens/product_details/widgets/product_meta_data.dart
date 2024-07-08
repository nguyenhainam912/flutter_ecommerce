// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/images/t_circular_image.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ///sale tag
            TRoundedContainer(
                radius: TSizes.sm,
                padding: EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                backgroundColor: TColors.secondary.withOpacity(0.8),
                child: Text("25%",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: TColors.black,
                        ))),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// price
            Text("\$250",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    )),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        /// title
        TProductTitleText(title: "Green Nike Sport"),
        SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        // stock status
        Row(
          children: [
            TProductTitleText(title: "Status"),
            SizedBox(width: TSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        /// brand
        Row(
          children: [
            TCircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
