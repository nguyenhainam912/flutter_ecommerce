// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                const SizedBox(width: TSizes.spaceBtwItems),
            itemBuilder: (_, __) =>
                const Row(mainAxisSize: MainAxisSize.min, children: [
                  /// Image
                  TShimmerEffect(width: 120, height: 120),
                  SizedBox(width: TSizes.spaceBtwItems),

                  /// text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [],
                  )
                ])));
  }
}
