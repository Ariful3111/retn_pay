import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/features/home/repositories/get_properties_repo.dart';
import 'package:renter_pay/features/home/repositories/popular_repo.dart';
import 'package:renter_pay/features/home/repositories/property_address_repo.dart';
import 'package:renter_pay/features/home/repositories/property_amenities_repo.dart';
import 'package:renter_pay/features/home/repositories/property_category_repo.dart';
import 'package:renter_pay/features/home/repositories/recommended_repo.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/features/rent/repositories/faq_repo.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPropertiesRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetRecommendedRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetPopularRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PropertyCategoryRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PropertyAddressRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PropertyAmenitiesRepository(getNetwork: Get.find()));
    Get.lazyPut(() => FAQRepository(getNetwork: Get.find()));

    Get.lazyPut(() => HomeController(getPropertiesRepository: Get.find()));
    Get.lazyPut(
      () => RecommendedController(getRecommendedRepository: Get.find()),
    );
    Get.lazyPut(() => PopularController(getPopularRepository: Get.find()));
    Get.lazyPut(
      () => PropertyCategoryController(propertyCategoryRepository: Get.find()),
    );
    Get.lazyPut(
      () => PropertyAddressController(propertyAddressRepository: Get.find()),
    );
    Get.lazyPut(
      () =>
          PropertyAmenitiesController(propertyAmenitiesRepository: Get.find()),
    );
    Get.lazyPut(() => FAQController(faqRepository: Get.find()));
  }
}
