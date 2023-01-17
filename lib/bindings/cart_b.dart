import 'package:get/get.dart';

import '../controllers/cart_c.dart';

class CartB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
