// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text("John Wich", style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        // reviews
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text("01 Nov 2023", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          "This is product description for blue. there are aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// company reviews
        TRoundedContainer(
            backgroundColor: dark ? TColors.darkGrey : TColors.grey,
            child: Padding(
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("L's store",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text("02 Nov, 2023",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    ReadMoreText(
                      "This is product description for blue. there are aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      trimLines: 1,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                    ),
                  ],
                ))),
        SizedBox(
          width: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
