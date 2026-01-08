import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/bindings/document_verification_bindings.dart';
import 'package:renter_pay/features/auth/bindings/first_onboarding_bindings.dart';
import 'package:renter_pay/features/auth/bindings/forgot_password_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/landlord_key_release_bindings.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/application_management_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/landlord_calender_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/landlord_key_release.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/property_management_details.dart';
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
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/chat/views/message_view.dart';
import 'package:renter_pay/features/dashboard/bindings/active_properties_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/add_repair_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/inspection_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/key_release_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/payment_management_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/repair_maintenance_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/repair_request_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/service_booked_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/service_booked_details_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/service_search_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/services_bindings.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/repair_maintenance_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/active_properties_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/dashboard_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/inspection_request_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/key_release_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/payment_management_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/repair_request_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/service_booked_details.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/service_booked_view.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/service_search_details.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/services_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/property_management.dart';
import 'package:renter_pay/features/favorite/bindings/favorite_bindings.dart';
import 'package:renter_pay/features/favorite/views/favorite_view.dart';
import 'package:renter_pay/features/home/bindings/home_bindings.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/home/views/main_home_view.dart';
import 'package:renter_pay/features/notification/bindings/notification_bindings.dart';
import 'package:renter_pay/features/notification/views/notification_view.dart';
import 'package:renter_pay/features/profile/bindings/profile_edit_bindings.dart';
import 'package:renter_pay/features/profile/bindings/support_bindings.dart';
import 'package:renter_pay/features/profile/views/blog_view.dart';
import 'package:renter_pay/features/profile/views/contact_us.dart';
import 'package:renter_pay/features/profile/views/privacy_policy.dart';
import 'package:renter_pay/features/profile/views/profile_edit.dart';
import 'package:renter_pay/features/profile/widgets/blog_details.dart';
import 'package:renter_pay/features/profile/views/support_view.dart';
import 'package:renter_pay/features/profile/views/terms_and_condition.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_plan.dart';
import 'package:renter_pay/features/profile/bindings/profile_bindings.dart';
import 'package:renter_pay/features/profile/bindings/settings_bindings.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/profile/views/setting_view.dart';
import 'package:renter_pay/features/rent/bindings/rent_bindings.dart';
import 'package:renter_pay/features/rent/bindings/rent_details_bindings.dart';
import 'package:renter_pay/features/rent/views/inspection_from.dart';
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
  GetPage(name: AppRoutes.subsPlan, page: () => SubscriptionPlan()),
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
  GetPage(name: AppRoutes.inspectionFrom, page: () => InspectionFrom()),
  GetPage(name: AppRoutes.contactUs, page: () => ContactUs()),
  GetPage(name: AppRoutes.blog, page: () => BlogView()),
  GetPage(name: AppRoutes.blogDetails, page: () => BlogDetails()),
  GetPage(name: AppRoutes.messageView, page: () => MessageView()),
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
    bindings: [
      ServiceBookedBindings(),
      ServiceBookedDetailsBindings(),
      ServiceSearchBindings(),
    ],
  ),
  GetPage(
    name: AppRoutes.serviceBookedView,
    page: () => ServiceBookedView(),
    bindings: [ServiceBookedBindings()],
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
  GetPage(name: AppRoutes.inspectionFrom, page: () => InspectionFrom()),
  GetPage(name: AppRoutes.contactUs, page: () => ContactUs()),
  GetPage(name: AppRoutes.blog, page: () => BlogView()),
  GetPage(name: AppRoutes.blogDetails, page: () => BlogDetails()),
  GetPage(name: AppRoutes.messageView, page: () => MessageView()),
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
    bindings: [
      ServiceBookedBindings(),
      ServiceBookedDetailsBindings(),
      ServiceSearchBindings(),
    ],
  ),
  GetPage(
    name: AppRoutes.serviceBookedView,
    page: () => ServiceBookedView(),
    bindings: [ServiceBookedBindings()],
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
  GetPage(name: AppRoutes.termsAndCondition, page: () => TermsAndCondition()),
  GetPage(
    name: AppRoutes.privacyPolicy,
    page: () => PrivacyPolicy(),
    binding: ProfileBindings(),
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
  GetPage(name: AppRoutes.landlordInspectionView, page:()=> LandlordInspectionView()),
  GetPage(name: AppRoutes.applicationManagementView, page: ()=>ApplicationManagementView(),binding: DashboardBindings()),
  GetPage(name: AppRoutes.landlordCalenderView, page: ()=>LandlordCalenderView(),binding: DashboardBindings())
];
