// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/bottom_add_to_card.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommt/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TBottomAddToCard(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// product image slider
              TProductImageSlider(),

              /// product detial
              Padding(
                  padding: EdgeInsets.only(
                      right: TSizes.defaultSpace,
                      left: TSizes.defaultSpace,
                      bottom: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// rating & share button
                      TRatingAndShare(),

                      /// price, title, stock, bard
                      TProductMetaData(),

                      /// attributer
                      TProductAttributes(),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// checkout button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Checkout"))),

                      /// description
                      TSectionHeading(
                        title: "Description",
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      ReadMoreText(
                        "This is product description for blue. there are aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                        lessStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),

                      /// review
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TSectionHeading(
                            title: 'Reviews(199)',
                            onPressed: () {},
                            showActionButton: false,
                          ),
                          IconButton(
                              onPressed: () =>
                                  Get.to(() => ProductReviewsScreen()),
                              icon: Icon(Iconsax.arrow_right_3))
                        ],
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
