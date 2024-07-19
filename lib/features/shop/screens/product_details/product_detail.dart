// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/bottom_add_to_card.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommt/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommt/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TBottomAddToCard(product: product),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// product image slider
              TProductImageSlider(
                product: product,
              ),

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
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// price, title, stock, bard

                      TProductMetaData(
                        product: product,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// attributer

                      if (product.productType ==
                          ProductType.variable.toString())
                        TProductAttributes(
                          product: product,
                        ),
                      if (product.productType ==
                          ProductType.variable.toString())
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                      /// checkout button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Checkout"))),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// description
                      TSectionHeading(
                        title: "Description",
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      ReadMoreText(
                        product.description ?? '',
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
