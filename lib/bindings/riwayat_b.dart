import 'package:get/get.dart';
import 'package:tokoku/controllers/riwayat_c.dart';

class RiwayatB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatC>(
      () => RiwayatC(),
    );
  }
}
