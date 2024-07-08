// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => TRoundedContainer(
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
                        Text('Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary, fontWeightDelta: 1)),
                        Text('07 Nov 2023',
                            style: Theme.of(context).textTheme.bodyLarge!)
                      ],
                    ),
                  ),

                  /// icon
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm))
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('[#22222]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium!)
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('03 Feb 2025',
                                  style:
                                      Theme.of(context).textTheme.titleMedium!)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
