import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_certification.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_offered.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_past_work.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_search_widgets/service_search_review.dart';

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

  RxList<String> uploadedImage = <String>[].obs;
  RxList<bool> selectedWidgetList = <bool>[].obs;
  RxString state = 'State*'.obs;
  RxList stateList = ['Dhaka', 'Khulna', 'Rajshahi'].obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxInt checkboxIndex = 0.obs;
  RxBool isCheck = false.obs;
  final List<Widget> widgetList = [
    ServiceSearchCertification(),
    ServiceSearchOffered(),
    ServiceSearchPastWork(),
    ServiceSearchReview(),
  ];
  final List timePeriodList = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    '',
  ];
  final List<String> widgetTitle = [
    'Why Choose ProFix Plumbing?',
    'Services Offered',
    'Past Work Showcase',
    'What Our Clients Say',
  ];
  final List certificationItem = [
    {
      'icon': IconsPath.serviceTech,
      'title': 'Leak Repairs',
      'subTitle': 'Licensed & insured professionals',
    },
    {
      'icon': IconsPath.serviceResponse,
      'title': 'Quick Response',
      'subTitle': 'Average response time under 2 hours',
    },
    {
      'icon': IconsPath.servicePrice,
      'title': 'Transparent Pricing',
      'subTitle': 'No hidden costs, upfront quotes',
    },
    {
      'icon': IconsPath.serviceClient,
      'title': 'Trusted by 500+ Clients',
      'subTitle': 'Consistently rated 5 stars',
    },
  ];
  final List offeredItem = [
    {
      'icon': IconsPath.serviceRepair,
      'title': 'Certified Technicians',
      'subTitle': 'Licensed & insured professionals',
    },
    {
      'icon': IconsPath.servicePipe,
      'title': 'Pipe Installations',
      'subTitle': 'New pipeline setup, upgrades, and replacements.',
    },
    {
      'icon': IconsPath.serviceDrain,
      'title': 'Drain Cleaning',
      'subTitle': 'Unclogging sinks, toilets, and mainlines.  ',
    },
    {
      'icon': IconsPath.serviceHeater,
      'title': 'Water Heater Setup',
      'subTitle': 'Installation & repair of gas/electric heaters.',
    },
    {
      'icon': IconsPath.serviceBath,
      'title': 'Bathroom Renovation Support',
      'subTitle': 'Fixture installations, shower setup, and maintenance.',
    },
  ];
  final List pastWork = [
    {
      'Image': ImagesPath.service,
      'Text':
          'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.',
    },
    {
      'Image': ImagesPath.service,
      'Text':
          'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.',
    },
    {
      'Image': ImagesPath.service,
      'Text':
          'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.',
    },
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
