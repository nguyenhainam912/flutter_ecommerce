// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommt/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => AddNewAddressScreen()),
          child: Icon(Iconsax.add, color: TColors.white),
          backgroundColor: TColors.primary,
        ),
        appBar: TAppBar(
            showBackArrow: true,
            title: Text("Address",
                style: Theme.of(context).textTheme.headlineSmall)),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSingleAddress(
                    selectedAddress: true,
                  ),
                  TSingleAddress(
                    selectedAddress: false,
                  )
                ],
              )),
        ));
  }
}
