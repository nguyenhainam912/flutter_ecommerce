import 'package:ecommt/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommt/features/shop/controllers/favourite_controller.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavourite(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourite(productId) ? TColors.error : null,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        ));
  }
}
