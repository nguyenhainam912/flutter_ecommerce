// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/personalization/controllers/address_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () => controller.selectNewAddressPopup(context),
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coding with L",
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Text("+92-333-888889",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Expanded(
                        child: Text(
                          "South Liana, maine 99999, USA",
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Text(
                "Select Address",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}
