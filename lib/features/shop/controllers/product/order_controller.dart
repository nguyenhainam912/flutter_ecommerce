import 'package:ecommt/common/widgets/success_screen/success_screen.dart';
import 'package:ecommt/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommt/data/repositories/order/order_repository.dart';
import 'package:ecommt/features/personalization/controllers/address_controller.dart';
import 'package:ecommt/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommt/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommt/features/shop/models/order_model.dart';
import 'package:ecommt/features/shop/screens/home/home.dart';
import 'package:ecommt/utils/constants/enums.dart';
import 'package:ecommt/utils/constants/image_strings.dart';
import 'package:ecommt/utils/popups/full_screen_loader.dart';
import 'package:ecommt/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);
      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;
      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);
      // Update the cart status
      cartController.clearCart();
      // Show Success screen
      Get.off(() => SuccessScreen(
            image: TImages.orderCompleteAnimation,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const HomeScreen()),
          )); // SuccessScreen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
