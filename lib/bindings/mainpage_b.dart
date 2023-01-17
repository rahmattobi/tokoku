import 'package:get/get.dart';
import 'package:tokoku/controllers/mainpage_c.dart';

class MainPageB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageC>(
      () => MainPageC(),
    );
  }
}
