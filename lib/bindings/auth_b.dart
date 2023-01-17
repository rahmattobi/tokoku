import 'package:get/get.dart';
import 'package:tokoku/controllers/auth_c.dart';

class AuthB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
