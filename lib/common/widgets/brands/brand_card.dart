// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/images/t_circular_image.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/features/shop/models/brand_model.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
          padding: EdgeInsets.all(TSizes.sm),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              //icon
              Flexible(
                child: TCircularImage(
                  isNetworkImage: true,
                  image: brand.image,
                  backgroundColor: Colors.transparent,
                  overlayColor: dark ? TColors.white : TColors.black,
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              //text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleWithVerifiedIcon(
                      title: brand.name,
                      brandTextSize: TextSizes.large,
                    ),
                    Text("${brand.productCount ?? 0} products",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
