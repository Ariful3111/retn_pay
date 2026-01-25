import 'package:get/get.dart';

class BlogController extends GetxController{
  RxInt currentPage = 1.obs;
  int totalPage = 100;
  void previousPage() {
    if (currentPage > 1) currentPage.value--;
  }

  void nextPage() {
    if (currentPage < totalPage) currentPage++;
  }

  List<dynamic> get pageNumber {
    int page = currentPage.value;

    if (totalPage <= 6) {
      return List.generate(totalPage, (i) => i + 1);
    }

    if (page <= 3) {
      return [1, 2, 3,'...', totalPage - 1, totalPage];
    }

    if (page >= totalPage - 2) {
      return [1, 2, '...', totalPage - 1, totalPage];
    }

    return [1, '...', page - 1, page, page + 1, '...', totalPage];
  }
}