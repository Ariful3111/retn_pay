import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/blog_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_blog_repo.dart';

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetBlogRepository(getNetwork: Get.find()));
    Get.lazyPut(() => BlogController(getBlogRepository: Get.find()));
  }
}
