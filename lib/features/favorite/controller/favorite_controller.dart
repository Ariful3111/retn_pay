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

  bool  isFavorite(int item)=>favoriteItem.contains(item);
}