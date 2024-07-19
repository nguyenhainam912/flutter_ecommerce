// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommt/features/shop/controllers/product/image_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    final dark = THelperFunctions.isDarkMode(context);

    return CurvedEdgeWidget(
        child: Container(
            color: dark ? TColors.darkGrey : TColors.light,
            child: Stack(
              children: [
                ///main large image
                SizedBox(
                    height: 400,
                    child: Padding(
                        padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                        child: Center(child: Obx(() {
                          final image = controller.selectedProductImage.value;
                          return GestureDetector(
                            onTap: () => controller.showEnlargedImage(image),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              progressIndicatorBuilder: (_, __,
                                      downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: TColors.primary),
                            ),
                          );
                        })))),

                /// image slider
                ///
                Positioned(
                  right: 0,
                  bottom: 30,
                  left: TSizes.defaultSpace,
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                      itemCount: images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      separatorBuilder: (_, __) =>
                          SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (_, index) => Obx(() {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return TRoundedImage(
                            width: 80,
                            isNetworkImage: true,
                            backgroundColor:
                                dark ? TColors.dark : TColors.white,
                            border: Border.all(
                                color: imageSelected
                                    ? TColors.primary
                                    : Colors.transparent),
                            padding: EdgeInsets.all(TSizes.sm),
                            onPressed: () => controller
                                .selectedProductImage.value = images[index],
                            imageUrl: images[index]);
                      }),
                    ),
                  ),
                ),

                /// appbar items
                TAppBar(
                  showBackArrow: true,
                  actions: [
                    TFavouriteIcon(
                      productId: product.id,
                    )
                  ],
                )
              ],
            )));
  }
}
