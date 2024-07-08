// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/brands/brand_show_case.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // brands
                TBrandShowcase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage3,
                    TImages.productImage4
                  ],
                ),
                TBrandShowcase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage3,
                    TImages.productImage4
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                //products
                TSectionHeading(
                  title: "You might like",
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => TProductCardVertical()),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            ))
      ],
    );
  }
}
