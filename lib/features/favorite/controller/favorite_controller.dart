import 'package:get/get.dart';

class FavoriteController extends GetxController{
  RxList<int> favoriteItem=<int>[].obs;
RxString initialSort = 'sortBy'.obs;
  List sortList = ['Low To High','High to Low'];
  void selectFavorite({required int id}){
    if(favoriteItem.contains(id)){
      favoriteItem.remove(id);
    }else{
      favoriteItem.add(id);
    }
  }

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
      return [1, 2, '...', totalPage - 1, totalPage];
    }

    if (page >= totalPage - 2) {
      return [1, 2,3, '...', totalPage - 1, totalPage];
    }

    return [1, '...', page - 1, page, page + 1, '...', totalPage];
  }

  bool  isFavorite(int item)=>favoriteItem.contains(item);
}