// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommt/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/controllers/category_controller.dart';
import 'package:ecommt/features/shop/models/category_model.dart';
import 'package:ecommt/features/shop/screens/all_products/all_products.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
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
                  FutureBuilder(
                      future: controller.getSubCategories(category.id),
                      builder: (context, snapshot) {
                        /// Handle Loader, No Record, OR Error Message
                        const loader = THorizontalProductShimmer();
                        final widget =
                            TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot, loader: loader);
                        if (widget != null) return widget;

                        /// Record found.
                        final subCategories = snapshot.data!;

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: subCategories.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final subCategory = subCategories[index];
                              return FutureBuilder(
                                  future: controller.getCategoryProducts(
                                      categoryId: subCategory.id),
                                  builder: (context, snapshot) {
                                    /// Handle Loader, No Record, OR Error Message
                                    const loader = THorizontalProductShimmer();
                                    final widget = TCloudHelperFunctions
                                        .checkMultiRecordState(
                                            snapshot: snapshot, loader: loader);
                                    if (widget != null) return widget;

                                    final products = snapshot.data!;

                                    return Column(
                                      children: [
                                        TSectionHeading(
                                          title: subCategory.name,
                                          onPressed: () =>
                                              Get.to(() => AllProductsScreen(
                                                    title: subCategory.name,
                                                    futureMethod: controller
                                                        .getCategoryProducts(
                                                            categoryId:
                                                                subCategory.id,
                                                            limit: -1),
                                                  )),
                                        ),
                                        SizedBox(
                                          height: TSizes.spaceBtwItems / 2,
                                        ),
                                        SizedBox(
                                          height: 120,
                                          child: ListView.separated(
                                              itemCount: products.length,
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (context,
                                                      index) =>
                                                  SizedBox(
                                                    width: TSizes.spaceBtwItems,
                                                  ),
                                              itemBuilder: ((context, index) =>
                                                  TProductCardHorizontal(
                                                      product:
                                                          products[index]))),
                                        ),
                                        SizedBox(
                                          height: TSizes.spaceBtwSections,
                                        )
                                      ],
                                    );
                                  });
                            });
                      })
                ],
              ))),
    );
  }
}
