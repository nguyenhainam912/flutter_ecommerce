// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommt/common/widgets/products/product_cards/add_to_cart_button.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/features/shop/controllers/product/product_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.softGrey,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        child: Row(
          children: [
            // thumbnail, widhlist, discount tag
            TRoundedContainer(
                height: 120,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColors.dark : TColors.light,
                child: Stack(
                  children: [
                    // thumbnail image
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: TRoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),

                    // sale tag
                    if (salePercentage != null)
                      Positioned(
                        top: 12,
                        child: TRoundedContainer(
                            radius: TSizes.sm,
                            padding: EdgeInsets.symmetric(
                                horizontal: TSizes.sm, vertical: TSizes.xs),
                            backgroundColor: TColors.secondary.withOpacity(0.8),
                            child: Text('$salePercentage%',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(
                                      color: TColors.black,
                                    ))),
                      ),

                    // favourite icon button
                    Positioned(
                        top: 0,
                        right: 0,
                        child: TFavouriteIcon(
                          productId: product.id,
                        )),
                  ],
                )),

            // detail
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TProductTitleText(
                              title: product.title,
                              smallSize: true,
                            ),
                            SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            TBrandTitleWithVerifiedIcon(
                              title: product.brand!.name,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price
                        Flexible(
                          child: Column(
                            children: [
                              if (product.productType ==
                                      ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: TSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(
                                  price: controller.getProductPrice(product),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProductCardAddToCartButton(
                          product: product,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
