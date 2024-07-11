// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/image_text_widget.dart/vertical_image_text.dart';
import 'package:ecommt/features/shop/screens/sub_category/sub_categories.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVertivalImageText(
            image: TImages.shoeIcon,
            title: "Shoes",
            onTap: () => Get.to(() => SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
