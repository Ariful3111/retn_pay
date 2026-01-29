import 'package:get/get.dart';
import 'package:renter_pay/features/profile/models/blogs_model.dart';
import 'package:renter_pay/features/profile/repositories/get_blog_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class BlogController extends GetxController {
  final GetBlogRepository getBlogRepository;
  BlogController({required this.getBlogRepository});

  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;
  static const int perPage = 20;

  final blogs = Rxn<BlogsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBlogs();
    ever(currentPage, (_) => getBlogs());
  }

  Future<void> getBlogs() async {
    isLoading.value = true;
    final response = await getBlogRepository.execute(
      page: currentPage.value,
      perPage: perPage,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        blogs.value = data;
        totalPage.value = data.data?.meta?.lastPage ?? 1;
      },
    );
  }

  void previousPage() {
    if (currentPage.value > 1) currentPage.value--;
  }

  void nextPage() {
    if (currentPage.value < totalPage.value) currentPage.value++;
  }

  List<dynamic> get pageNumber {
    int page = currentPage.value;
    int total = totalPage.value;

    if (total <= 6) {
      return List.generate(total, (i) => i + 1);
    }

    if (page <= 3) {
      return [1, 2, 3, '...', total - 1, total];
    }

    if (page >= total - 2) {
      return [1, 2, '...', total - 1, total];
    }

    return [1, '...', page - 1, page, page + 1, '...', total];
  }
}
