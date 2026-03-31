import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_bond.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_date.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_length.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_premises.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_rent.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_part_a_widgets/agreement_part_a_renter.dart';

class AgreementPartAController extends GetxController {
  // State management
  RxList<bool> isOpenList = <bool>[].obs;
  RxBool isAgreement = false.obs;
  RxBool isPeriodic = false.obs;
  // Text Controllers
  TextEditingController dateOfAgreementController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();

  // Rental Provider Details Controllers
  TextEditingController rentalProviderNameController = TextEditingController();
  TextEditingController rentalProviderABNController = TextEditingController();
  TextEditingController rentalProviderAddressController =
      TextEditingController();
  TextEditingController rentalProviderPostcodeController =
      TextEditingController();
  TextEditingController rentalProviderPhoneController = TextEditingController();
  TextEditingController rentalProviderEmailController = TextEditingController();

  // Agent Details Controllers
  TextEditingController agentNameController = TextEditingController();
  TextEditingController agentAddressController = TextEditingController();
  TextEditingController agentPostcodeController = TextEditingController();
  TextEditingController agentPhoneController = TextEditingController();
  TextEditingController agentEmailController = TextEditingController();
  TextEditingController agentABNController = TextEditingController();

  final List<String> renterFieldLabels = [
    'Full name',
    'Address',
    'Postcode',
    'Phone number',
    'Email address',
  ];
  late List<List<TextEditingController>> renterControllers;

  // Length of Agreement Controllers
  TextEditingController fixedTermStartDateController = TextEditingController();
  TextEditingController fixedTermEndDateController = TextEditingController();
  TextEditingController periodicStartDateController = TextEditingController();

  // Rent Section Controllers
  TextEditingController rentAmountController = TextEditingController();
  RxString selectedPaymentType = 'Calendar month'.obs;
  TextEditingController rentPaymentDateController = TextEditingController();

  TextEditingController bondAmountController = TextEditingController();
  TextEditingController bondDateController = TextEditingController();

  List<String> title = [
    '1. Date of agreement',
    '2. Premises let by the rental provider',
    '3. Rental provider details',
    '4. Renter details',
    '5. Length of the agreement',
    '6. Rent',
    '7. Bond',
  ];

  List<Widget> widgetList = [
    AgreementPartADate(),
    AgreementPartAPremises(),
    AgreementPartAProvider(),
    AgreementPartARenter(),
    AgreementPartALength(),
    AgreementPartARent(),
    AgreementPartABond(),
  ];

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    renterControllers = List.generate(
      4,
      (_) => List.generate(5, (_) => TextEditingController()),
    );
    super.onInit();
  }

  @override
  void dispose() {
    // Dispose Part A Date Controllers
    dateOfAgreementController.dispose();

    // Dispose Part A Premises Controllers
    addressController.dispose();
    postcodeController.dispose();

    // Dispose Rental Provider Controllers
    rentalProviderNameController.dispose();
    rentalProviderABNController.dispose();
    rentalProviderAddressController.dispose();
    rentalProviderPostcodeController.dispose();
    rentalProviderPhoneController.dispose();
    rentalProviderEmailController.dispose();

    // Dispose Agent Controllers
    agentNameController.dispose();
    agentAddressController.dispose();
    agentPostcodeController.dispose();
    agentPhoneController.dispose();
    agentEmailController.dispose();
    agentABNController.dispose();

    // Dispose Renter Controllers
    for (var renterList in renterControllers) {
      for (var controller in renterList) {
        controller.dispose();
      }
    }

    // Dispose Length of Agreement Controllers
    fixedTermStartDateController.dispose();
    fixedTermEndDateController.dispose();
    periodicStartDateController.dispose();

    // Dispose Rent Section Controllers
    rentAmountController.dispose();
    rentPaymentDateController.dispose();
    bondAmountController.dispose();
    bondDateController.dispose();

    super.dispose();
  }
}
