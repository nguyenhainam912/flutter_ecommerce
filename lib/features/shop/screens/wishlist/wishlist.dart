// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/loaders/animation_loader.dart';
import 'package:ecommt/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommt/common/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommt/features/shop/controllers/favourite_controller.dart';
import 'package:ecommt/features/shop/screens/home/home.dart';
import 'package:ecommt/navigation_menu.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            "Wishlist",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCircularIcon(
              icon: Iconsax.add,
              onPressed: () => Get.to(HomeScreen()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Obx(
                () => FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      /// Nothing Found Widget
                      final emptyWidget = TAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: TImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );

                      const loader = TVerticalProductShimmer(itemCount: 6);
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                                product: products[index],
                              ));
                    }),
              )),
        ));
  }
}
