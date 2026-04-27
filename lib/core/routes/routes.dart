import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/utils/vr_capture.dart';
import 'package:renter_pay/core/utils/vr_view.dart';
import 'package:renter_pay/features/auth/bindings/document_verification_bindings.dart';
import 'package:renter_pay/features/auth/bindings/first_onboarding_bindings.dart';
import 'package:renter_pay/features/auth/bindings/forgot_password_bindings.dart';
import 'package:renter_pay/features/checkout/bindings/checkout_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/landlord_bindings/application_management_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/landlord_bindings/landlord_key_release_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/service_vendor_bindings/service_vendor_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/service_vendor_bindings/booking_management_details_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/agreement_bindings.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/add_new_property.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/application_management_details.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/application_management_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/landlord_calender_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/landlord_key_release.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/property_management_details.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/property_owner_document.dart';
import 'package:renter_pay/features/dashboard/views/service_vendor_views/booking_management.dart';
import 'package:renter_pay/features/dashboard/views/service_vendor_views/booking_management_details.dart';
import 'package:renter_pay/features/dashboard/views/service_vendor_views/service_management_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/agreement_view.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view.dart';
import 'package:renter_pay/features/home/bindings/logged_in_bindings.dart';
import 'package:renter_pay/features/auth/bindings/login_bindings.dart';
import 'package:renter_pay/features/auth/bindings/onboarding_bindings.dart';
import 'package:renter_pay/features/auth/bindings/otp_bindings.dart';
import 'package:renter_pay/features/auth/bindings/signup_option_bindings.dart';
import 'package:renter_pay/features/auth/bindings/signup_view_bindings.dart';
import 'package:renter_pay/features/auth/bindings/user_role_binding.dart';
import 'package:renter_pay/features/auth/views/document_verification.dart';
import 'package:renter_pay/features/auth/views/login_view.dart';
import 'package:renter_pay/features/auth/views/onboarding.dart';
import 'package:renter_pay/features/auth/views/otp_view.dart';
import 'package:renter_pay/features/auth/views/signup_option.dart';
import 'package:renter_pay/features/auth/views/signup_view.dart';
import 'package:renter_pay/features/auth/views/user_role.dart';
import 'package:renter_pay/features/chat/bindings/chat_bindings.dart';
import 'package:renter_pay/features/chat/bindings/message_bindings.dart';
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/chat/views/message_view.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/active_properties_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/add_repair_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/landlord_bindings/inspection_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/landlord_bindings/landlord_inspection_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/key_release_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/payment_management_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/repair_maintenance_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/repair_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/service_booked_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/service_booked_details_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/service_search_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/services_bindings.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/repair_maintenance_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/active_properties_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/dashboard_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/inspection_request_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/key_release_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/payment_management_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/repair_request_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/service_booked_details.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/service_search_details.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/services_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/property_management.dart';
import 'package:renter_pay/features/favorite/bindings/favorite_bindings.dart';
import 'package:renter_pay/features/favorite/views/favorite_view.dart';
import 'package:renter_pay/features/home/bindings/home_bindings.dart';
import 'package:renter_pay/features/home/bindings/vr_binding.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/home/views/main_home_view.dart';
import 'package:renter_pay/features/notification/bindings/notification_bindings.dart';
import 'package:renter_pay/features/notification/views/notification_view.dart';
import 'package:renter_pay/features/checkout/views/deposit_checkout.dart';
import 'package:renter_pay/features/checkout/views/withdraw_checkout.dart';
import 'package:renter_pay/features/profile/bindings/blog_bindings.dart';
import 'package:renter_pay/features/profile/bindings/blog_details_bindings.dart';
import 'package:renter_pay/features/profile/bindings/contact_us_bindings.dart';
import 'package:renter_pay/features/profile/bindings/profile_edit_bindings.dart';
import 'package:renter_pay/features/profile/bindings/subscription_plan_bindings.dart';
import 'package:renter_pay/features/profile/bindings/support_bindings.dart';
import 'package:renter_pay/features/profile/views/blog_view.dart';
import 'package:renter_pay/features/profile/views/contact_us.dart';
import 'package:renter_pay/features/profile/views/profile_edit.dart';
import 'package:renter_pay/features/profile/views/blog_details.dart';
import 'package:renter_pay/features/profile/views/support_view.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_plan.dart';
import 'package:renter_pay/features/profile/bindings/profile_bindings.dart';
import 'package:renter_pay/features/profile/bindings/settings_bindings.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/profile/views/setting_view.dart';
import 'package:renter_pay/features/rent/bindings/rent_bindings.dart';
import 'package:renter_pay/features/rent/bindings/rent_details_bindings.dart';
import 'package:renter_pay/features/rent/bindings/inspection_from_binding.dart';
import 'package:renter_pay/features/rent/views/inspection_form.dart';
import 'package:renter_pay/features/rent/views/rent_view.dart';
import 'package:renter_pay/features/rent/views/property_view.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.onboarding,
    page: () => Onboarding(),
    bindings: [OnboardingBindings(), FirstOnboardingBindings()],
  ),
  GetPage(
    name: AppRoutes.userRole,
    page: () => UserRole(),
    bindings: [UserRoleBinding()],
  ),
  GetPage(
    name: AppRoutes.loginView,
    page: () => LoginView(),
    bindings: [LoginBindings(), ForgotPasswordBindings()],
  ),
  GetPage(
    name: AppRoutes.signupOption,
    page: () => SignupOption(),
    bindings: [SignupOptionBindings()],
  ),
  GetPage(
    name: AppRoutes.signupView,
    page: () => SignupView(),
    bindings: [SignupViewBindings()],
  ),
  GetPage(
    name: AppRoutes.otpView,
    page: () => OtpView(),
    bindings: [OtpBindings()],
  ),
  GetPage(
    name: AppRoutes.mainHome,
    page: () => MainHomeView(),
    binding: LoggedInBindings(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => HomeView(),
    bindings: [HomeBindings(), FavoriteBindings()],
  ),
  GetPage(
    name: AppRoutes.documentVerification,
    page: () => DocumentVerification(),
    bindings: [DocumentVerificationBindings()],
  ),
  GetPage(
    name: AppRoutes.subsPlan,
    page: () => SubscriptionPlan(),
    binding: SubscriptionPlanBindings(),
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => ProfileView(),
    bindings: [ProfileBindings()],
  ),
  GetPage(
    name: AppRoutes.rent,
    page: () => RentView(),
    bindings: [RentBindings()],
  ),
  GetPage(
    name: AppRoutes.dashboard,
    page: () => DashboardView(),
    bindings: [DashboardBindings()],
  ),
  GetPage(
    name: AppRoutes.chat,
    page: () => ChatView(),
    bindings: [ChatBindings()],
  ),
  GetPage(
    name: AppRoutes.settings,
    page: () => SettingView(),
    bindings: [SettingsBindings()],
  ),
  GetPage(
    name: AppRoutes.notification,
    page: () => NotificationView(),
    bindings: [NotificationBindings()],
  ),
  GetPage(
    name: AppRoutes.profileEdit,
    page: () => ProfileEdit(),
    bindings: [ProfileEditBindings()],
  ),
  GetPage(
    name: AppRoutes.rentDetails,
    page: () => PropertyView(),
    bindings: [RentDetailsBindings()],
  ),
  GetPage(
    name: AppRoutes.favorite,
    page: () => FavoriteView(),
    bindings: [FavoriteBindings()],
  ),
  GetPage(
    name: AppRoutes.inspectionFrom,
    page: () => InspectionForm(),
    binding: InspectionFromBinding(),
  ),
  GetPage(
    name: AppRoutes.contactUs,
    page: () => ContactUs(),
    binding: ContactUsBindings(),
  ),
  GetPage(
    name: AppRoutes.blog,
    page: () => BlogView(),
    binding: BlogBindings(),
  ),
  GetPage(
    name: AppRoutes.blogDetails,
    page: () => BlogDetails(),
    binding: BlogDetailsBindings(),
  ),
  GetPage(
    name: AppRoutes.messageView,
    page: () => MessageView(),
    binding: MessageBindings(),
  ),
  GetPage(
    name: AppRoutes.activePropertiesView,
    page: () => ActivePropertiesView(),
    bindings: [ActivePropertiesBindings()],
  ),
  GetPage(
    name: AppRoutes.inspectionRequestView,
    page: () => InspectionRequestView(),
    bindings: [InspectionRequestBindings()],
  ),
  GetPage(
    name: AppRoutes.keyReleaseView,
    page: () => KeyReleaseView(),
    bindings: [KeyReleaseBindings()],
  ),
  GetPage(
    name: AppRoutes.paymentManagementView,
    page: () => PaymentManagementView(),
    bindings: [PaymentManagementBindings()],
  ),
  GetPage(
    name: AppRoutes.repairMaintenanceView,
    page: () => RepairMaintenanceView(),
    bindings: [RepairMaintenanceBindings(), AddRepairRequestBindings()],
  ),
  GetPage(
    name: AppRoutes.servicesView,
    page: () => ServicesView(),
    bindings: [ServicesBindings(), ServiceBookedBindings()],
  ),
  GetPage(
    name: AppRoutes.repairRequestView,
    page: () => RepairRequestView(),
    bindings: [RepairRequestBindings(), AddRepairRequestBindings()],
  ),
  GetPage(
    name: AppRoutes.serviceBookedDetails,
    page: () => ServiceBookedDetails(),
    preventDuplicates: false,
    bindings: [
      ServiceBookedBindings(),
      ServiceBookedDetailsBindings(),
      ServiceSearchBindings(),
      ServicesBindings(),
    ],
  ),
  GetPage(
    name: AppRoutes.serviceSearchDetails,
    page: () => ServiceSearchDetails(),
    bindings: [ServiceSearchBindings(), ServicesBindings()],
  ),
  GetPage(
    name: AppRoutes.supportView,
    page: () => SupportView(),
    binding: SupportBindings(),
  ),
  GetPage(
    name: AppRoutes.propertyManagement,
    page: () => PropertyManagement(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.propertyManagementDetails,
    page: () => PropertyManagementDetails(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.landlordKeyRelease,
    page: () => LandlordKeyRelease(),
    binding: LandlordKeyReleaseBindings(),
  ),
  GetPage(
    name: AppRoutes.landlordInspectionView,
    page: () => LandlordInspectionView(),
    binding: LandlordInspectionBindings(),
  ),
  GetPage(
    name: AppRoutes.applicationManagementView,
    page: () => ApplicationManagementView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.landlordCalenderView,
    page: () => LandlordCalenderView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.serviceManagementView,
    page: () => ServiceManagementView(),
    binding: ServiceVendorBindings(),
  ),
  GetPage(
    name: AppRoutes.bookingManagementView,
    page: () => BookingManagement(),
    binding: ServiceVendorBindings(),
  ),
  GetPage(
    name: AppRoutes.bookingManagementDetailsView,
    page: () => BookingManagementDetails(),
    binding: BookingManagementDetailsBindings(),
  ),
  GetPage(
    name: AppRoutes.addNewProperty,
    page: () => AddNewProperty(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.propertyOwnerDocument,
    page: () => PropertyOwnerDocument(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.vrCaptureScreen,
    page: () => VRCaptureScreen(),
    binding: VRBindings(),
  ),
  GetPage(name: AppRoutes.vrViewScreen, page: () => VRView()),
  GetPage(
    name: AppRoutes.applicationManagementDetails,
    page: () => ApplicationManagementDetails(),
    binding: ApplicationManagementBindings(),
  ),
  GetPage(
    name: AppRoutes.agreementView,
    page: () => AgreementView(),
    binding: AgreementBindings(),
  ),
  GetPage(
    name: AppRoutes.depositView,
    page: () => DepositCheckout(),
    binding: CheckoutBindings(),
  ),
  GetPage(
    name: AppRoutes.withdrawView,
    page: () => WithdrawCheckout(),
    binding: CheckoutBindings(),
  ),
];
