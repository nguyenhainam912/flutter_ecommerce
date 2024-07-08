// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/screens/all_products/all_products.dart';
import 'package:ecommt/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommt/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecommt/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                //   appbar
                THomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //   searchbar
                TSearchContainer(
                  text: 'Search In Store',
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //  categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      // heading
                      TSectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      // categories
                      THomeCategories()
                    ],
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),

          // body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // promo slider
                TPromoSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // heading
                TSectionHeading(
                  title: "Popular Products",
                  onPressed: () => Get.to(() => AllProductsScreen()),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                // product popular
                TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => TProductCardVertical())
              ],
            ),
          )
        ],
      ),
    ));
  }
}
