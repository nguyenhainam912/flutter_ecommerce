// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommt/common/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommt/features/shop/controllers/brand_controller.dart';
import 'package:ecommt/features/shop/models/brand_model.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            /// brand detail
            TBrandCard(
              showBorder: true,
              brand: brand,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = TVerticalProductShimmer();

                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  final brandProduct = snapshot.data!;

                  return TSortableProducts(
                    products: brandProduct,
                  );
                })
          ]),
        ),
      ),
    );
  }
}
