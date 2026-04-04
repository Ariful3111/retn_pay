import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
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

  // Reference to main agreements controller
  final GetAgreementsController agreementsController =
      Get.find<GetAgreementsController>();
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

  // Populate data from API response
  void populateFromApi() {
    final agreement = agreementsController.firstAgreement;
    if (agreement == null) return;

    final basicTerms = agreement.agreementDetails?.basicTerms;
    if (basicTerms == null) return;

    // Date of agreement
    if (basicTerms.agreement?.signedDate != null) {
      dateOfAgreementController.text = _formatDate(
        basicTerms.agreement!.signedDate!,
      );
    }

    // Premises (from property)
    if (agreement.property != null) {
      addressController.text = agreement.property!.address ?? '';
      postcodeController.text = agreement.property!.postalCode ?? '';
    }

    // Rental Provider details
    if (basicTerms.rentalProvider != null) {
      rentalProviderNameController.text =
          basicTerms.rentalProvider!.fullNameOrCompanyName ?? '';
      rentalProviderABNController.text = basicTerms.rentalProvider!.abn ?? '';
      rentalProviderAddressController.text =
          basicTerms.rentalProvider!.address ?? '';
      rentalProviderPostcodeController.text =
          basicTerms.rentalProvider!.postcode ?? '';
    }

    // Rental Provider Contact
    if (basicTerms.rentalProviderContact != null) {
      rentalProviderPhoneController.text =
          basicTerms.rentalProviderContact!.phoneNumber ?? '';
      rentalProviderEmailController.text =
          basicTerms.rentalProviderContact!.emailAddress ?? '';
    }

    // Agent details
    if (basicTerms.agent != null) {
      agentNameController.text = basicTerms.agent!.fullName ?? '';
      agentAddressController.text = basicTerms.agent!.address ?? '';
      agentPostcodeController.text = basicTerms.agent!.postcode ?? '';
      agentPhoneController.text = basicTerms.agent!.phoneNumber ?? '';
      agentEmailController.text = basicTerms.agent!.emailAddress ?? '';
      agentABNController.text = basicTerms.agent!.abn ?? '';
    }

    // Renters
    if (basicTerms.renters != null && basicTerms.renters!.isNotEmpty) {
      for (int i = 0; i < basicTerms.renters!.length && i < 4; i++) {
        final renter = basicTerms.renters![i];
        if (i < renterControllers.length) {
          renterControllers[i][0].text = renter.fullName ?? '';
          renterControllers[i][1].text = renter.address ?? '';
          renterControllers[i][2].text = renter.postcode ?? '';
          renterControllers[i][3].text = renter.phoneNumber ?? '';
          renterControllers[i][4].text = renter.emailAddress ?? '';
        }
      }
    }

    // Length of agreement
    if (basicTerms.agreementTerm != null) {
      final termType = basicTerms.agreementTerm!.termType;
      isAgreement.value = termType == 'fixed';
      isPeriodic.value = termType == 'periodic';

      if (basicTerms.agreementTerm!.fixedTerm != null) {
        fixedTermStartDateController.text = _formatDate(
          basicTerms.agreementTerm!.fixedTerm!.startDate ?? '',
        );
        fixedTermEndDateController.text = _formatDate(
          basicTerms.agreementTerm!.fixedTerm!.endDate ?? '',
        );
      }

      if (basicTerms.agreementTerm!.periodicTerm != null) {
        periodicStartDateController.text = _formatDate(
          basicTerms.agreementTerm!.periodicTerm!.startDate ?? '',
        );
      }
    }

    // Rent details
    if (basicTerms.rent != null) {
      rentAmountController.text = basicTerms.rent!.amount?.toString() ?? '';
      selectedPaymentType.value = basicTerms.rent!.frequency ?? 'monthly';
      if (basicTerms.rent!.rentDueDate != null) {
        rentPaymentDateController.text = _formatDate(
          basicTerms.rent!.rentDueDate!,
        );
      }
    }

    // Bond details
    if (basicTerms.bond != null) {
      bondAmountController.text = basicTerms.bond!.amount?.toString() ?? '';
      if (basicTerms.bond!.paymentDueDate != null) {
        bondDateController.text = _formatDate(basicTerms.bond!.paymentDueDate!);
      }
    }
  }

  // Helper method to format date
  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return dateStr;
    }
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    renterControllers = List.generate(
      4,
      (_) => List.generate(5, (_) => TextEditingController()),
    );

    // Populate data from API after a short delay to ensure agreements are loaded
    Future.delayed(Duration(milliseconds: 500), () {
      populateFromApi();
    });

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
