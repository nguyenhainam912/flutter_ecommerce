// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommt/features/shop/models/brand_model.dart';
import 'package:ecommt/features/shop/screens/brand/brand_products.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
          showBorder: true,
          borderColor: TColors.darkGrey,
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              // brand with product count
              TBrandCard(
                showBorder: false,
                brand: brand,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              // brand top 3 product images
              Row(
                children: images
                    .map((image) => brandToProductImageWidget(image, context))
                    .toList(),
              )
            ],
          )),
    );
  }

  Widget brandToProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
        child: TRoundedContainer(
            height: 100,
            showBorder: true,
            backgroundColor: dark ? TColors.darkGrey : TColors.light,
            margin: EdgeInsets.only(right: TSizes.sm),
            padding: EdgeInsets.all(TSizes.md),
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const TShimmerEffect(width: 100, height: 100),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )));
  }
}
