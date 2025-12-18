import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/service_search_certification.dart';
import 'package:renter_pay/features/dashboard/widgets/service_search_offered.dart';
import 'package:renter_pay/features/dashboard/widgets/service_search_past_work.dart';
import 'package:renter_pay/features/dashboard/widgets/service_search_review.dart';

class ServiceSearchController extends GetxController {
  RxBool isShowInfo = false.obs;
  RxInt widgetIndex = (-1).obs;
  final List<Widget> widgetList = [
    ServiceSearchCertification(),
    ServiceSearchOffered(),
    ServiceSearchPastWork(),
    ServiceSearchReview(),
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
      'subTitle': 'Fast detection & repair of pipe leaks, faucets, and taps. ',
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
    {'Image':ImagesPath.service,'Text':'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.'},
    {'Image':ImagesPath.service,'Text':'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.'},
    {'Image':ImagesPath.service,'Text':'Emergency pipe burst fixed within hours, restoring full water flow and preventing further damage.'},
  ];
}
