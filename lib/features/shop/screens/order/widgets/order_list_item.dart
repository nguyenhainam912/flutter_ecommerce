// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/loaders/animation_loader.dart';
import 'package:ecommt/features/shop/controllers/product/order_controller.dart';
import 'package:ecommt/navigation_menu.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/cloud_helper_functions.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());

    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: TImages.orderCompleteAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          ); // TAnimationLoaderWidget
          /// Helper Function: Handle Loader, No Record, OR ERROR Message
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations Record found.
          final orders = snapshot.data!;

          return ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (_, __) => SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                return TRoundedContainer(
                    showBorder: true,
                    padding: EdgeInsets.all(TSizes.md),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///row1
                        Row(
                          children: [
                            /// icon
                            Icon(Iconsax.ship),
                            SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),

                            ///status & date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: TColors.primary,
                                              fontWeightDelta: 1)),
                                  Text(order.formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!)
                                ],
                              ),
                            ),

                            /// icon
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.arrow_right_34,
                                    size: TSizes.iconSm))
                          ],
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///row2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  /// icon
                                  Icon(Iconsax.tag),
                                  SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  ///status & date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Order',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(order.id,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  /// icon
                                  Icon(Iconsax.calendar),
                                  SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  ///status & date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Shipping Date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(order.formattedDeliveryDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              });
        });
  }
}
