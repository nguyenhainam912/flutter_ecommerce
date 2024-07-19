// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:ecommt/common/widgets/images/t_rounded_image.dart';
import 'package:ecommt/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/features/shop/models/cart_item_model.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        ///image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// title, price size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: TProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),

              /// attibutes
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: '${e.key}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${e.value}',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
