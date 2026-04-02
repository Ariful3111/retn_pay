import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/application_details_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/application_details_repo.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_info.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_application.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_a_provider.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_b.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_c_widgets/application_management_details_part_c.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_d.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_service.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ApplicationManagementDetailsController extends GetxController {
  final ApplicationDetailsRepository applicationDetailsRepository;
  ApplicationManagementDetailsController({
    required this.applicationDetailsRepository,
  });
  final applicationDetails = Rxn<ApplicationDetailsModel>();
  RxBool isLoading = false.obs;
  RxBool isEditable =
      true.obs; // true if creating new, false if viewing existing

  List<String> items = [
    'Part A-Important information;',
    'Part B-Statement of information for rental applicants; and',
    'Part C-Mandatory disclosures checklist.',
  ];
  RxList<bool> isOpenList = <bool>[].obs;
  RxList<bool> isInformationOpenList = <bool>[].obs;

  List<String> title = [
    'Part A - Important information',
    'Part B - Statement of information for rental applicants',
    'Part C - Mandatory disclosures checklist',
    'Part D - To be completed by rental provider/agent',
    'Part E - To be completed by applicant',
    'Help or further information',
    'Telephone interpreter service',
  ];
  List<String> informationTitle = [
    'Information for the rental provider',
    'Information for the applicant(s)',
  ];

  List<Widget> widgetList = [
    ApplicationManagementDetailsPartA(),
    ApplicationManagementDetailsPartB(),
    ApplicationManagementDetailsPartC(),
    ApplicationManagementDetailsPartD(),
    ApplicationManagementDetailsPartE(),
    ApplicationManagementDetailsInfo(),
    ApplicationManagementDetailsService(),
  ];
  List<Widget> informationWidgetList = [
    ApplicationManagementDetailsPartAProvider(),
    ApplicationManagementDetailsPartAApplication(),
  ];

  RxString selectedPaymentType = ''.obs;

  final Map<String, TextEditingController> fieldControllers = {};

  TextEditingController getFieldController(String key) {
    if (!fieldControllers.containsKey(key)) {
      fieldControllers[key] = TextEditingController();
    }
    return fieldControllers[key]!;
  }

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // If arguments is null, it's a new application (editable)
    // If arguments is provided, it's viewing existing application (read-only)
    isEditable.value = Get.arguments == null;

    if (!isEditable.value) {
      getApplicationDetails();
    }
    isOpenList.value = List.generate(title.length, (_) => false);
    isInformationOpenList.value = List.generate(
      informationTitle.length,
      (_) => false,
    );
  }

  Future<void> getApplicationDetails() async {
    isLoading.value = true;
    final response = await applicationDetailsRepository.execute(
      applicationID: Get.arguments.toString(),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        applicationDetails.value = data;
        _populatePartEController();
        _populatePartCController();
        _populatePartDController();
      },
    );
  }

  void _populatePartEController() {
    final data = applicationDetails.value?.data;
    if (data == null) return;

    final partEController =
        Get.find<ApplicationManagementDetailsPartEController>();
    final appDetails = data.applicationDetails;

    // Set editable flag
    partEController.isEditable.value = isEditable.value;

    // Populate Applicant Details
    partEController.applicantNameController.text =
        appDetails?.applicantDetails?.name ?? '';
    partEController.applicantAddressController.text =
        appDetails?.applicantDetails?.contact?.address ?? '';
    partEController.applicantPostcodeController.text =
        appDetails?.applicantDetails?.contact?.postcode ?? '';
    partEController.dobController.text =
        appDetails?.applicantDetails?.dateOfBirth ?? '';
    partEController.businessHourController.text =
        appDetails?.applicantDetails?.contact?.phoneBusinessHours ?? '';
    partEController.afterHourController.text =
        appDetails?.applicantDetails?.contact?.phoneAfterHours ?? '';
    partEController.applicationEmailController.text =
        appDetails?.applicantDetails?.contact?.email ?? '';

    // Populate Previous Rental Provider
    partEController.previousProviderNameController.text =
        appDetails?.previousRentalProvider?.name ?? '';
    partEController.previousProviderPhoneController.text =
        appDetails?.previousRentalProvider?.phoneNumber ?? '';
    partEController.previousProviderEmailController.text =
        appDetails?.previousRentalProvider?.emailAddress ?? '';

    // Populate Employment and Income
    partEController.salaryController.text =
        appDetails?.employmentAndIncome?.salaryIncomePerWeek.toString() ?? '';
    partEController.otherIncomeController.text =
        appDetails?.employmentAndIncome?.otherNetIncomePerWeek.toString() ?? '';

    // Set employment type
    final employmentStatus =
        appDetails?.employmentAndIncome?.employmentStatus?.toLowerCase() ?? '';
    if (employmentStatus == 'full-time') {
      partEController.employmentType.value = 0;
    } else if (employmentStatus == 'part-time') {
      partEController.employmentType.value = 1;
    } else if (employmentStatus == 'casual') {
      partEController.employmentType.value = 2;
    }

    // Populate Current Employment
    partEController.currentEmployerNameController.text =
        appDetails?.currentEmployment?.employerName ?? '';
    partEController.currentEmployerAddressController.text =
        appDetails?.currentEmployment?.address ?? '';
    partEController.currentEmployerPostcodeController.text =
        appDetails?.currentEmployment?.postcode ?? '';
    partEController.yearsController.text =
        appDetails?.currentEmployment?.yearsEmployed.toString() ?? '';
    partEController.monthsController.text =
        appDetails?.currentEmployment?.monthsEmployed.toString() ?? '';
    partEController.positionController.text =
        appDetails?.currentEmployment?.positionHeld ?? '';
    partEController.contactPersonController.text =
        appDetails?.currentEmployment?.contactPersonName ?? '';
    partEController.phoneController.text =
        appDetails?.currentEmployment?.phoneNumber ?? '';
    partEController.remarksController.text =
        appDetails?.currentEmployment?.remarks ?? '';

    // Populate Previous Employment
    partEController.previousEmployerNameController.text =
        appDetails?.previousEmployment?.employerName ?? '';
    partEController.previousEmployerAddressController.text =
        appDetails?.previousEmployment?.address ?? '';
    partEController.previousEmployerPostcodeController.text =
        appDetails?.previousEmployment?.postcode ?? '';
    partEController.previousYearsController.text =
        appDetails?.previousEmployment?.yearsEmployed.toString() ?? '';
    partEController.previousMonthsController.text =
        appDetails?.previousEmployment?.monthsEmployed.toString() ?? '';
    partEController.previousPositionController.text =
        appDetails?.previousEmployment?.positionHeld ?? '';
    partEController.previousContactPersonController.text =
        appDetails?.previousEmployment?.contactPersonName ?? '';
    partEController.previousPhoneController.text =
        appDetails?.previousEmployment?.phoneNumber ?? '';
    partEController.previousRemarksController.text =
        appDetails?.previousEmployment?.remarks ?? '';

    // Populate Personal References
    final references = appDetails?.personalReferences ?? [];
    if (references.isNotEmpty) {
      partEController.ref1NameController.text = references[0].name ?? '';
      partEController.ref1RelationController.text =
          references[0].relationshipToApplicant ?? '';
      partEController.ref1HomePhoneController.text =
          references[0].homePhoneNumber ?? '';
      partEController.ref1WorkPhoneController.text =
          references[0].workPhoneNumber ?? '';
    }
    if (references.length > 1) {
      partEController.ref2NameController.text = references[1].name ?? '';
      partEController.ref2RelationController.text =
          references[1].relationshipToApplicant ?? '';
      partEController.ref2HomePhoneController.text =
          references[1].homePhoneNumber ?? '';
      partEController.ref2WorkPhoneController.text =
          references[1].workPhoneNumber ?? '';
    }

    // Populate Pets
    partEController.petType.value = appDetails?.pets?.hasPets == true ? 1 : 0;
    partEController.petDetailsController.text = appDetails?.pets?.details ?? '';

    // Populate Declaration
    partEController.dateController.text = appDetails?.declaration?.date ?? '';

    // Store signature from API
    if (appDetails?.declaration?.applicantSignature != null) {
      partEController.setExistingSignature(
        appDetails!.declaration!.applicantSignature!,
      );
    }
  }

  void _populatePartCController() {
    final data = applicationDetails.value?.data;
    if (data == null) return;

    try {
      final partCController =
          Get.find<ApplicationManagementDetailsTableController>();
      partCController.setIsEditable(isEditable.value);

      // Get disclosures from property lease agreement defaults
      final disclosures = data.property?.leaseAgreementDefaults?.disclosures;
      if (disclosures != null) {
        // Convert Disclosures object to Map for the populateFromDisclosures method
        final disclosuresMap = _convertDisclosuresToMap(disclosures);
        partCController.populateFromDisclosures(disclosuresMap);
      }
    } catch (e) {
      // Controller not found, ignore
    }
  }

  Map<String, dynamic> _convertDisclosuresToMap(disclosures) {
    // Convert Disclosures object to Map
    return {
      'intent_to_sell_premises': {
        'intends_to_sell': disclosures.intentToSellPremises?.intendsToSell,
        'engaged_agent': disclosures.intentToSellPremises?.engagedAgent,
        'contract_prepared': disclosures.intentToSellPremises?.contractPrepared,
      },
      'mortgagee_action': {
        'mortgagee_taking_possession':
            disclosures.mortgageeAction?.mortgageeTakingPossession,
        'enforcement_proceedings_commenced':
            disclosures.mortgageeAction?.enforcementProceedingsCommenced,
      },
      'ownership': {
        'is_owner': disclosures.ownership?.isOwner,
        'has_right_to_rent': disclosures.ownership?.hasRightToRent,
      },
      'embedded_electricity_network': {
        'supplied_by_embedded_network':
            disclosures.embeddedElectricityNetwork?.suppliedByEmbeddedNetwork,
      },
      'property_history': {
        'homicide_in_last_5_years':
            disclosures.propertyHistory?.homicideInLast5Years,
        'drug_activity_in_last_5_years':
            disclosures.propertyHistory?.drugActivityInLast5Years,
        'asbestos_present': disclosures.propertyHistory?.asbestosPresent,
      },
      'rental_compliance': {
        'meets_minimum_standards':
            disclosures.rentalCompliance?.meetsMinimumStandards,
        'mould_or_damp_repair_notices_last_3_years':
            disclosures.rentalCompliance?.mouldOrDampRepairNoticesLast3Years,
      },
      'safety_checks': {
        'electricity_safety_check_date':
            disclosures.safetyChecks?.electricitySafetyCheckDate,
        'gas_safety_check_date': disclosures.safetyChecks?.gasSafetyCheckDate,
        'pool_barrier_compliance_check_date':
            disclosures.safetyChecks?.poolBarrierComplianceCheckDate,
        'outstanding_recommendations':
            disclosures.safetyChecks?.outstandingRecommendations,
      },
      'heritage': {
        'is_heritage_listed': disclosures.heritage?.isHeritageListed,
      },
      'planning_and_legal': {
        'affected_by_planning_application':
            disclosures.planningAndLegal?.affectedByPlanningApplication,
        'building_or_safety_notices_issued':
            disclosures.planningAndLegal?.buildingOrSafetyNoticesIssued,
        'domestic_building_work_dispute':
            disclosures.planningAndLegal?.domesticBuildingWorkDispute,
        'owners_corporation_dispute':
            disclosures.planningAndLegal?.ownersCorporationDispute,
        'subject_to_owners_corporation_rules':
            disclosures.planningAndLegal?.subjectToOwnersCorporationRules,
      },
    };
  }

  void _populatePartDController() {
    final data = applicationDetails.value?.data;
    if (data == null) return;

    // Populate Rental Property Details from property data
    getFieldController('Address').text = data.property?.address ?? '';
    getFieldController('Postcode').text = data.property?.postalCode ?? '';
    getFieldController('Rent amount (\$)').text =
        data.propertyUnit?.displayRentAmount.toString() ?? '';
    getFieldController('Property bond amount (\$)').text =
        data.property?.leaseAgreementDefaults?.bondAmount ?? '';

    // Set payment frequency
    final paymentFrequency =
        data.property?.leaseAgreementDefaults?.paymentFrequency
            ?.toLowerCase() ??
        '';
    if (paymentFrequency == 'week') {
      selectedPaymentType.value = 'Week';
    } else if (paymentFrequency == 'fortnight') {
      selectedPaymentType.value = 'Fortnight';
    } else if (paymentFrequency == 'month' ||
        paymentFrequency == 'calendar month') {
      selectedPaymentType.value = 'Calendar month';
    }

    // Populate Property Manager Details
    final propertyManager =
        data.property?.leaseAgreementDefaults?.propertyManagerDetails;
    getFieldController('Name of property manager').text =
        propertyManager?.propertyManagerName ?? '';
    getFieldController('Phone number').text =
        propertyManager?.phoneNumber ?? '';
    getFieldController('Email address').text =
        propertyManager?.emailAddress ?? '';
    getFieldController('Name of estate agency (if applicable)').text =
        propertyManager?.estateAgencyName ?? '';
  }

  @override
  dispose() {
    for (var controller in fieldControllers.values) {
      controller.dispose();
    }
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
