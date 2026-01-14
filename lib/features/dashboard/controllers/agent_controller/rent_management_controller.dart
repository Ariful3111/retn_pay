import 'package:get/get.dart';

class PaymentModel {
  final String tenantName;
  final String landlordName;
  final String landlordEmail;
  final String landlordPhone;
  final String propertyAddress;
  final String date;
  final String amount;
  final String plan;
  PaymentModel({
    required this.tenantName,
    required this.landlordName,
    required this.landlordEmail,
    required this.landlordPhone,
    required this.propertyAddress,
    required this.date,
    required this.amount, required this.plan,
  });
}

class RentManagementController extends GetxController {
  List rentType = ['Upcoming Payments', 'Payment History'];
  RxList<bool> expanded = <bool>[].obs;
  final List<String> tableColumn = ['Property Address', 'Due Date', 'Amount'];
  RxList<PaymentModel> allRows = <PaymentModel>[].obs;
  List<MapEntry<int, PaymentModel>> get filterRow {
    final tempRow = <MapEntry<int, PaymentModel>>[];
    for (int i = 0; i < allRows.length; i++) {
      tempRow.add(MapEntry(i, allRows[i]));
    }
    return tempRow;
  }

  void initRows() {
    allRows.value = [
      PaymentModel(tenantName: 'Arif', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
      PaymentModel(tenantName: 'Rafi', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
      PaymentModel(tenantName: 'Rafi', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
      PaymentModel(tenantName: 'Shanto', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
      PaymentModel(tenantName: 'Shanto', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
      PaymentModel(tenantName: 'Arif', landlordName: 'Islam', landlordEmail: 'test@gmail.com', landlordPhone: '+088153465', propertyAddress: 'Dhaka', date: '1 Aug, 2025', amount: '\$450', plan: 'Silver'),
    ];
    expanded.value = List.generate(allRows.length, (_) => false);
    update();
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < expanded.length) {
      expanded[index] = !expanded[index];
    }
    expanded.refresh();
  }

  @override
  void onReady() {
    initRows();
    super.onReady();
  }
}
