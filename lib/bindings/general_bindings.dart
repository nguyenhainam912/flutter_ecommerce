import 'package:ecommt/features/personalization/controllers/address_controller.dart';
import 'package:ecommt/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommt/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommt/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
