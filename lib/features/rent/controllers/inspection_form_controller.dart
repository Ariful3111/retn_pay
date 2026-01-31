import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/features/rent/repositories/create_inspect_repo.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_extension.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class InspectionFormController extends GetxController {
  final CreateInspectionRepository createInspectionRepository;
  InspectionFormController({required this.createInspectionRepository});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RxList inspectOption = ['In-Person Visit', 'Virtual Tour'].obs;
  RxString selectedInspection = 'In-Person Visit'.obs;
  RxBool isSelectedInspection = false.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  RxBool isAgree = false.obs;
  final user = Get.find<ProfileController>().profileData.value;

  RxList<bool> isShowFAQ = <bool>[].obs;
  RxBool isLoading = false.obs;

  List<Map<String, dynamic>> faqList = [
    {
      'title': 'How long does an inspection take?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Can I reschedule my appointment?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Do I need to bring documents?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
    {
      'title': 'Is there any cost for booking an inspection?',
      'subtitle':
          'Most inspections take 20-45 minutes, depending on\nthe size of the property. Our agent will guide you\nthrough each feature and answer your questions\nduring the visit.',
    },
  ];
  @override
  void onInit() {
    isShowFAQ.value = List.filled(faqList.length + 1, true);
    nameController.text = user?.data?.name ?? '';
    emailController.text = user?.data?.email ?? '';
    phoneController.text = user?.data?.phone ?? '';
    super.onInit();
  }

  Future<void> submitInspect({required BuildContext context}) async {
    if (selectedDate.value == null) {
      ErrorSnackbar.show(description: 'Please select date');
      return;
    }
    if (selectedTime.value == null) {
      ErrorSnackbar.show(description: 'Please select time');
      return;
    }
    if (!isAgree.value) {
      ErrorSnackbar.show(description: 'Please agree to terms and conditions');
      return;
    }
    isLoading.value = true;
    final response = await createInspectionRepository.execute(
      propertyID: Get.find<PropertyViewController>()
          .propertyDetails
          .value!
          .data!
          .propertyTypeId
          .toString(),
      type: selectedInspection.value == 'In-Person Visit'
          ? 'in_person'
          : 'virtual',
      inspectionDate: selectedDate.value!.toIso8601WithTime(
        selectedTime.value!,
      ),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        showDialog(
          context: context,
          builder: (context) {
            return SuccessDialog(
              title1: 'Your inspection request has been submitted!',
              subtitle:
                  'Our agent will contact you within 24 hours to confirm your appointment.',
              button: Row(
                children: [
                  CustomPrimaryButton(
                    height: 35.h,
                    width: 122.w,
                    borderRadius: BorderRadius.circular(4.27.r),
                    text: 'Back To Property',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                  ),
                  SizedBox(width: 9.w),
                  CustomSecondaryButton(
                    height: 35.h,
                    width: 154.w,
                    borderRadius: BorderRadius.circular(4.27.r),
                    text: 'Browse More Properties',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.mainHome);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    timeController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
