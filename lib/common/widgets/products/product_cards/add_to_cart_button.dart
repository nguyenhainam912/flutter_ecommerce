// ignore_for_file: prefer_const_constructors

import 'package:ecommt/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation selection. // ELse add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.cardRadiusMd),
                    bottomRight: Radius.circular(TSizes.productImageRadius)),
                color:
                    productQuantityCart > 0 ? TColors.primary : TColors.dark),
            child: SizedBox(
              width: TSizes.iconLg * 1.2,
              height: TSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityCart > 0
                    ? Text(productQuantityCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.white))
                    : Icon(Iconsax.add, color: TColors.white),
              ),
            ));
      }),
    );
  }
}
