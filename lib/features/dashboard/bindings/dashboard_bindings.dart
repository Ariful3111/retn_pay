import 'package:get/get.dart';
import 'package:renter_pay/features/chat/controllers/create_chat_controller.dart';
import 'package:renter_pay/features/chat/repositories/create_chat_repo.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/create_conditional_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_metric_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/reminder_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/dashboard_metrics_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/agent_repositories/create_conditional_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/calender_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/conditional_reports_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/create_property_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/get_applications_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/property_document_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/submit_property_review_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/lease_agreement_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/reminder_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/service_list_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/get_bookings_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/own_service_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/add_repair_request_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/rent_notice_repo.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/features/home/repositories/property_amenities_repo.dart';
import 'package:renter_pay/features/home/repositories/property_category_repo.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/rent_notice_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/submit_property_review_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/monthly_revenue_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/mark_reminder_as_read_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/current_plan_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/monthly_revenue_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/upcoming_payment_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/mark_reminder_as_read_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/current_plan_repo.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalenderRepository(getNetwork: Get.find()));
    Get.lazyPut(() => CreatePropertyRepository(imageWithResponse: Get.find()));
    Get.lazyPut(
      () => CreateConditionalReportRepository(imageWithoutResponse: Get.find()),
    );
    Get.lazyPut(() => ConditionalReportsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => DashboardMetricsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PropertyDocumentRepository(imageNetwork: Get.find()));
    if (!Get.isRegistered<GetApplicationsRepository>()) {
      Get.lazyPut(() => GetApplicationsRepository(getNetwork: Get.find()));
    }

    if (!Get.isRegistered<ReminderRepository>()) {
      Get.lazyPut(() => ReminderRepository(getNetwork: Get.find()));
    }

    if (!Get.isRegistered<RentNoticeRepository>()) {
      Get.lazyPut(() => RentNoticeRepository(getNetwork: Get.find()));
    }

    if (!Get.isRegistered<LeaseAgreementRepository>()) {
      Get.lazyPut(() => LeaseAgreementRepository(getNetwork: Get.find()));
    }

    if (!Get.isRegistered<CreateChatRepository>()) {
      Get.lazyPut(() => CreateChatRepository(postWithResponse: Get.find()));
    }

    if (!Get.isRegistered<CreateChatController>()) {
      Get.lazyPut(() => CreateChatController(createChatRepository: Get.find()));
    }

    if (!Get.isRegistered<PropertyCategoryRepository>()) {
      Get.lazyPut(() => PropertyCategoryRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PropertyAmenitiesRepository>()) {
      Get.lazyPut(() => PropertyAmenitiesRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<SubmitPropertyReviewRepository>()) {
      Get.lazyPut(
        () => SubmitPropertyReviewRepository(postNetwork: Get.find()),
      );
    }
    Get.lazyPut(() => OwnServicesRepository(getNetwork: Get.find()));
    if (!Get.isRegistered<GetBookingsRepository>()) {
      Get.lazyPut(
        () => GetBookingsRepository(getNetwork: Get.find()),
        fenix: true,
      );
    }
    if (!Get.isRegistered<AddRepairRequestRepository>()) {
      Get.lazyPut(() => AddRepairRequestRepository(imageNetwork: Get.find()));
    }

    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DashboardLandlordController());
    if (!Get.isRegistered<AddRepairRequestController>()) {
      Get.lazyPut(
        () =>
            AddRepairRequestController(addRepairRequestRepository: Get.find()),
      );
    }

    Get.lazyPut(
      () => CreateConditionalReportController(
        createConditionalReportRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => PropertyManagementController(
        conditionalReportsRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => AddNewPropertyController(createPropertyRepository: Get.find()),
    );
    Get.lazyPut(
      () => PropertyManagementDocumentController(
        propertyDocumentRepository: Get.find(),
      ),
    );
    Get.lazyPut(() => PropertyManagementDetailsController());
    if (!Get.isRegistered<ApplicationManagementController>()) {
      Get.lazyPut(
        () => ApplicationManagementController(
          getApplicationsRepository: Get.find(),
        ),
      );
    }
    Get.lazyPut(
      () => LandlordCalenderController(calenderRepository: Get.find()),
    );
    Get.lazyPut(
      () => ServiceVendorDashboardController(ownServicesRepository: Get.find()),
    );
    if (!Get.isRegistered<BookingManagementController>()) {
      Get.lazyPut(
        () => BookingManagementController(getBookingsRepository: Get.find()),
        fenix: true,
      );
    }
    if (!Get.isRegistered<ServiceListRepository>()) {
      Get.lazyPut(
        () => ServiceListRepository(getNetwork: Get.find()),
        fenix: true,
      );
    }
    if (!Get.isRegistered<ServiceManagementController>()) {
      Get.lazyPut(
        () => ServiceManagementController(serviceListRepository: Get.find()),
        fenix: true,
      );
    }
    Get.lazyPut(
      () => DashboardMetricController(dashboardMetricsRepository: Get.find()),
    );

    if (!Get.isRegistered<ReminderController>()) {
      Get.lazyPut(() => ReminderController(reminderRepository: Get.find()));
    }

    if (!Get.isRegistered<MarkReminderAsReadRepository>()) {
      Get.lazyPut(
        () => MarkReminderAsReadRepository(patchWithoutResponse: Get.find()),
      );
    }

    if (!Get.isRegistered<MarkReminderAsReadController>()) {
      Get.lazyPut(
        () => MarkReminderAsReadController(
          markReminderAsReadRepository: Get.find(),
        ),
      );
    }

    if (!Get.isRegistered<RentNoticeController>()) {
      Get.lazyPut(() => RentNoticeController(rentNoticeRepository: Get.find()));
    }

    if (!Get.isRegistered<LeaseAgreementController>()) {
      Get.lazyPut(
        () => LeaseAgreementController(leaseAgreementRepository: Get.find()),
      );
    }

    if (!Get.isRegistered<PropertyCategoryController>()) {
      Get.lazyPut(
        () =>
            PropertyCategoryController(propertyCategoryRepository: Get.find()),
      );
    }
    if (!Get.isRegistered<PropertyAmenitiesController>()) {
      Get.lazyPut(
        () => PropertyAmenitiesController(
          propertyAmenitiesRepository: Get.find(),
        ),
      );
    }
    if (!Get.isRegistered<SubmitPropertyReviewController>()) {
      Get.lazyPut(
        () => SubmitPropertyReviewController(
          submitPropertyReviewRepository: Get.find(),
        ),
      );
    }

    // Monthly Revenue Controller
    if (!Get.isRegistered<GetMonthlyRevenueRepository>()) {
      Get.lazyPut(() => GetMonthlyRevenueRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<MonthlyRevenueController>()) {
      Get.lazyPut(
        () => MonthlyRevenueController(getMonthlyRevenueRepository: Get.find()),
      );
    }

    // Upcoming Payment Repository
    if (!Get.isRegistered<UpcomingPaymentRepository>()) {
      Get.lazyPut(() => UpcomingPaymentRepository(getNetwork: Get.find()));
    }

    // Upcoming Payment Controller
    if (!Get.isRegistered<UpcomingPaymentController>()) {
      Get.lazyPut(
        () => UpcomingPaymentController(upcomingPaymentRepository: Get.find()),
      );
    }

    // Current Plan Repository
    if (!Get.isRegistered<CurrentPlanRepository>()) {
      Get.lazyPut(() => CurrentPlanRepository(getNetwork: Get.find()));
    }

    // Current Plan Controller
    if (!Get.isRegistered<CurrentPlanController>()) {
      Get.lazyPut(
        () => CurrentPlanController(currentPlanRepository: Get.find()),
      );
    }
  }
}
