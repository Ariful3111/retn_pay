import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_activities.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_relocatable.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_report.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_smoke.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_swimming.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c_water.dart';

class AgreementPartCController extends GetxController{
  RxList<bool> isOpenList = <bool>[].obs;
  List<String> title = [
    '13. Condition report',
    '14. Gas safety activities',
    '15. Smoke alarm safety activities',
    '16. Swimming pool barrier safety activities',
    '17. Relocatable swimming pool safety activities',
    '18. Relocatable water tank safety activities',
  ];
  List<Widget> widgetList = [
    AgreementPartCReport(),
    AgreementPartCActivities(),
    AgreementPartCSmoke(),
    AgreementPartCSwimming(),
    AgreementPartCRelocatable(),
    AgreementPartCWater(),
  ];
  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    super.onInit();
  }
}