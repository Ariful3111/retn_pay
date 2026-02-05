import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxString initialSort = 'sortBy'.obs;
  List<String> sortList = ['Low To High', 'High to Low'];
}
