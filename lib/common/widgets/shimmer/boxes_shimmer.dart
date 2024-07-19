import 'package:ecommt/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(children: [
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
      ])
    ]);
  }
}
