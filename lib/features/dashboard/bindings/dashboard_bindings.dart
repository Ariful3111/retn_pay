import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_metric_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/dashboard_metrics_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/create_property_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/property_document_repo.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/features/home/repositories/property_amenities_repo.dart';
import 'package:renter_pay/features/home/repositories/property_category_repo.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePropertyRepository(imageWithResponse: Get.find()));
    Get.lazyPut(() => PropertyDocumentRepository(imageNetwork: Get.find()));

    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DashboardLandlordController());
    Get.lazyPut(() => PropertyManagementController());
    Get.lazyPut(
      () => AddNewPropertyController(createPropertyRepository: Get.find()),
    );
    Get.lazyPut(
      () => PropertyManagementDocumentController(
        propertyDocumentRepository: Get.find(),
      ),
    );
    Get.lazyPut(() => PropertyManagementDetailsController());
    Get.lazyPut(() => ApplicationManagementController());
    Get.lazyPut(() => LandlordCalenderController());
    Get.lazyPut(() => ServiceVendorDashboardController());
    Get.lazyPut(() => BookingManagementController());
    Get.lazyPut(() => DashboardMetricsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => DashboardMetricController(dashboardMetricsRepository: Get.find()),
    );

    if (!Get.isRegistered<PropertyCategoryRepository>()) {
      Get.lazyPut(() => PropertyCategoryRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PropertyCategoryController>()) {
      Get.lazyPut(
        () =>
            PropertyCategoryController(propertyCategoryRepository: Get.find()),
      );
    }
    if (!Get.isRegistered<PropertyAmenitiesRepository>()) {
      Get.lazyPut(() => PropertyAmenitiesRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PropertyAmenitiesController>()) {
      Get.lazyPut(
        () => PropertyAmenitiesController(
          propertyAmenitiesRepository: Get.find(),
        ),
      );
    }
  }
}
