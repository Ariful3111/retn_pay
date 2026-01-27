import 'package:get/get.dart';
import 'package:renter_pay/features/profile/models/blog_details_model.dart';
import 'package:renter_pay/features/profile/repositories/blog_details_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class BlogDetailsController extends GetxController {
  final GetBlogDetailsRepository getBlogRepository;
  BlogDetailsController({required this.getBlogRepository});

  final blogDetails = Rxn<BlogDetailsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBlogDetails(slug: Get.arguments.toString());
  }

  Future<void> getBlogDetails({required String slug}) async {
    final response = await getBlogRepository.execute(slug: slug);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        blogDetails.value = data;
      },
    );
  }
}
