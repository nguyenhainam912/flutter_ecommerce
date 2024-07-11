// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/features/personalization/controllers/update_name_controller.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:ecommt/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Change Name",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //title
              Text(
                "Use real name for easy verification. This name will appear on sevaral pages.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///textfield and button
              Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(children: [
                    // email
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText("First name", value),
                      expands: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: TTexts.firstName),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyText("Last name", value),
                      expands: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: TTexts.lastName),
                    ),
                  ])),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ));
  }
}
