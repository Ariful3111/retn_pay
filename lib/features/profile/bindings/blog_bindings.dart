import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/blog_controller.dart';

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogController());
  }
}
