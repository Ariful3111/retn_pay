import 'package:get/get.dart';

class UserRoleController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  void selectUser(int index) {
    selectedIndex.value = index;
  }
}
