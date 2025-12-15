import 'package:get/get.dart';

class ServicesController extends GetxController {
  RxList serviceType = ['Search', 'Booked'].obs;
  RxString selectedServiceType = 'Search'.obs;
  RxBool isSelected = false.obs;
  List serviceList = ['Plumbing','Wall Painting','Roofing Maintenance','Ac Repair'];
}
