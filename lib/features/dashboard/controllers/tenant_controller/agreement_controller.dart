import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_b_widgets/agreement_part_b.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_c_widgets/agreement_part_c.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_d_widgets/agreement_part_d.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_e_widgets/agreement_part_e.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_info.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_service.dart';

class AgreementController extends GetxController{
  RxList<bool> isOpenList = <bool>[].obs;

  List<String> title = [
    'Part A - Basic terms',
    'Part B - Standard terms',
    'Part C - Safety-related activities',
    'Part D - Rights and obligations',
    'Part E - Additional terms',
    'Help or further information',
    'Telephone interpreter service',
  ];

  List<Widget> widgetList = [
   AgreementPartA(),
    AgreementPartB(),
    AgreementPartC(),
    AgreementPartD(),
    AgreementPartE(),
    ApplicationManagementDetailsInfo(),
    ApplicationManagementDetailsService(),
  ];
  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    super.onInit();
  }
}