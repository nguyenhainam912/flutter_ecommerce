// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:ecommt/common/widgets/image_text_widget.dart/vertical_image_text.dart';
import 'package:ecommt/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommt/features/shop/controllers/category_controller.dart';
import 'package:ecommt/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return TCategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return TVertivalImageText(
              image: category.image,
              title: category.name,
              onTap: () =>
                  Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
