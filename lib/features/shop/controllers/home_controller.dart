import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  // Update Curren index shen page scroll
  void updatePageIndicator(index) => carousalCurrentIndex.value = index;
}
