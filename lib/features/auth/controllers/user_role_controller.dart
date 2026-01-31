import 'package:get/get.dart';

class UserRoleController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  void selectUser({required int index}) {
    selectedIndex.value = index;
  }

  String getUserRole() {
    if (selectedIndex.value == 0) {
      return "tenant";
    } else if (selectedIndex.value == 1) {
      return "landlord";
    } else if (selectedIndex.value == 2) {
      return "agent";
    } else if (selectedIndex.value == 3) {
      return "service-vendor";
    } else {
      return "tenant";
    }
  }
}
