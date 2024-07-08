// ignore_for_file: prefer_const_constructors

import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
    required this.title,
    required this.value,
  });

  final VoidCallback onPressed;
  final String title, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Expanded(child: Icon(icon, size: 18))
          ],
        ),
      ),
    );
  }
}
