// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/screens/brand/brand_products.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///heading
                TSectionHeading(
                  title: "Brands",
                  showActionButton: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// brands
                TGridLayout(
                    itemCount: 10,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) => TBrandCard(
                          showBorder: true,
                          onTap: () => Get.to(() => BrandProducts()),
                        ))
              ],
            )),
      ),
    );
  }
}
