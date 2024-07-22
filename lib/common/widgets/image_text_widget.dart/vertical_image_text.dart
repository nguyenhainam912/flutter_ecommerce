// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVertivalImageText extends StatelessWidget {
  const TVertivalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
                width: 56,
                height: 56,
                padding: EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                    color: backgroundColor ??
                        (THelperFunctions.isDarkMode(context)
                            ? TColors.black
                            : TColors.white),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: isNetworkImage
                        ? CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                            color: THelperFunctions.isDarkMode(context)
                                ? TColors.light
                                : TColors.dark,
                          ))),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
