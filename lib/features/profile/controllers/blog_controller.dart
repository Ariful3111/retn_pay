import 'package:get/get.dart';
import 'package:renter_pay/features/profile/models/blogs_model.dart';
import 'package:renter_pay/features/profile/repositories/get_blog_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class BlogController extends GetxController {
  final GetBlogRepository getBlogRepository;
  BlogController({required this.getBlogRepository});

  RxInt currentPage = 1.obs;
  int totalPage = 100;

  final blogs = Rxn<BlogsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBlogs();
  }

  Future<void> getBlogs() async {
    final response = await getBlogRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        blogs.value = data;
      },
    );
  }

  // void previousPage() {
  //   if (currentPage > 1) currentPage.value--;
  // }

  // void nextPage() {
  //   if (currentPage < totalPage) currentPage++;
  // }

  // List<dynamic> get pageNumber {
  //   int page = currentPage.value;

  //   if (totalPage <= 6) {
  //     return List.generate(totalPage, (i) => i + 1);
  //   }

  //   if (page <= 3) {
  //     return [1, 2, 3,'...', totalPage - 1, totalPage];
  //   }

  //   if (page >= totalPage - 2) {
  //     return [1, 2, '...', totalPage - 1, totalPage];
  //   }

  //   return [1, '...', page - 1, page, page + 1, '...', totalPage];
  // }
}
