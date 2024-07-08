// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:ecommt/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:ecommt/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text("Reviews & Ratings"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Ratings and reviews are verified and are from people who use the same type of device thay you use"),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///overrall prodcut rating
                  TOverallProductRating(),
                  TRatingBarIndicator(
                    rating: 3.4,
                  ),
                  Text("12.66", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// user review list
                  UserReviewCard(),
                ],
              )),
        ));
  }
}
