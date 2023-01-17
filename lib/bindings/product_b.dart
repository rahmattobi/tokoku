import 'package:get/get.dart';
import 'package:tokoku/controllers/product_c.dart';

class ProductB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductC>(
      () => ProductC(),
    );
  }
}
