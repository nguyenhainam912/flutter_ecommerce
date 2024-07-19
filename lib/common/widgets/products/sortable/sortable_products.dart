// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommt/features/shop/controllers/all_product_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(

        ///dropdown
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              controller.sortProducts(value!);
            },
            items: ["Name", "High price", "Lower price", "Sale", "Newest"]
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          ///grid
          Obx(
            () => TGridLayout(
                itemCount: controller.products.length,
                itemBuilder: (_, index) => TProductCardVertical(
                      product: controller.products[index],
                    )),
          )
        ]);
  }
}
