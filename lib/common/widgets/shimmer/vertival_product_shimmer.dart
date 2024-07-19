// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) {
        return SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(
                width: 180,
                height: 180,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TShimmerEffect(
                width: 160,
                height: 15,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TShimmerEffect(
                width: 110,
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}
