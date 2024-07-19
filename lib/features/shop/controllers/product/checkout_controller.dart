// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/models/payment_method_model.dart';
import 'package:ecommt/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: TImages.paypal)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: TImages.googlePay)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: TImages.applePay)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: TImages.visa)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: TImages.masterCard)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Paytm', image: TImages.paytm)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: TImages.paystack)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: TImages.creditCard)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
