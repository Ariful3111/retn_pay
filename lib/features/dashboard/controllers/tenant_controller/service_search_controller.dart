import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_certification.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_offered.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_past_work.dart';

class ServiceSearchController extends GetxController {
  RxBool isShowInfo = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  RxList<XFile> uploadedImage = <XFile>[].obs;
  RxList<bool> selectedWidgetList = <bool>[].obs;
  RxString state = 'State*'.obs;
  RxList<String> stateList = ['Dhaka', 'Khulna', 'Rajshahi'].obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxInt checkboxIndex = 0.obs;
  RxBool isCheck = false.obs;
  final List<Widget> widgetList = [
    ServiceSearchCertification(),
    ServiceSearchOffered(),
    ServiceSearchPastWork(),
    // ServiceSearchReview(),
  ];
  final List timePeriodList = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    '',
  ];
  final List<String> widgetTitle = [
    'Why Choose Us?',
    'Services Offered',
    'Past Work Showcase',
    'What Our Clients Say',
  ];
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    numberController.dispose();
    address1Controller.dispose();
    problemController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    zipController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    selectedWidgetList.value = List.generate(widgetList.length, (_) => false);
    super.onInit();
  }
}
