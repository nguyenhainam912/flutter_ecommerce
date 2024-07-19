// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommt/common/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/controllers/category_controller.dart';
import 'package:ecommt/features/shop/models/category_model.dart';
import 'package:ecommt/features/shop/screens/all_products/all_products.dart';
import 'package:ecommt/features/shop/screens/store/widgets/category_brand.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // brands
                CategoryBrands(category: category),
                SizedBox(height: TSizes.spaceBtwItems),

                //products
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      /// Helper Function: Handle Loader, No Record, OR ERROR Message
                      final response =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const TVerticalProductShimmer());
                      if (response != null) return response;

                      /// Record Found!
                      final products = snapshot.data!;

                      return Column(
                        children: [
                          TSectionHeading(
                            title: "You might like",
                            onPressed: () => Get.to(AllProductsScreen(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            )),
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          TGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => TProductCardVertical(
                                    product: products[index],
                                  )),
                          SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      );
                    }),
              ],
            ))
      ],
    );
  }
}
