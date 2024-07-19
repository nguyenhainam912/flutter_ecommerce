// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/images/t_circular_image.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/features/shop/controllers/product/product_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ///sale tag
            TRoundedContainer(
                radius: TSizes.sm,
                padding: EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                backgroundColor: TColors.secondary.withOpacity(0.8),
                child: Text("$salePercentage%",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: TColors.black,
                        ))),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text("\$${product.price}",
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                        decoration: TextDecoration.lineThrough,
                      )),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// title
        TProductTitleText(title: product.title),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // stock status
        Row(
          children: [
            TProductTitleText(title: "Status"),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.black : TColors.white,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : "",
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
