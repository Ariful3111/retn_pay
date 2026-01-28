import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/blog_details_controller.dart';
import 'package:renter_pay/features/profile/repositories/blog_details_repo.dart';

class BlogDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetBlogDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => BlogDetailsController(getBlogRepository: Get.find()));
  }
}
