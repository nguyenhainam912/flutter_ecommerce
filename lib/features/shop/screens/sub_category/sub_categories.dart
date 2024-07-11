// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Sport skirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //banner
                  TRoundedImage(
                    imageUrl: TImages.promoBanner1,
                    width: double.infinity,
                    applyImageRadius: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //sub categoties
                  Column(
                    children: [
                      TSectionHeading(
                        title: "Sport skirt",
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),
                            itemBuilder: ((context, index) =>
                                TProductCardHorizontal())),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
