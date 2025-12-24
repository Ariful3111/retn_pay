import 'package:get/get.dart';

class UpcomingModel {
  final String address;
  final String date;
  final String amount;
  UpcomingModel({
    required this.address,
    required this.date,
    required this.amount,
  });
}

class DashboardLandlordController extends GetxController {
  RxInt checkedIndex = (-1).obs;
}
