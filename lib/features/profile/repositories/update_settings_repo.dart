import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/update_without_response.dart';

class UpdateSettingsRepository {
  final UpdateWithoutResponse postWithoutResponse;
  const UpdateSettingsRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    bool? notificationsEnabled,
    bool? emailNotifications,
    bool? pushNotifications,
    bool? smsNotifications,
    bool? darkMode,
    bool? autoPayRent,
    int? paymentReminderDays,
    String? defaultPaymentMethod,
    String? defaultCurrency,
    String? dateFormat,
    bool? landDataRegistryExpiry,
    bool? landlordInsuranceExpiry,
    bool? fireAlarmSafetyServiceExpiry,
  }) async {
    final body = <String, dynamic>{};
    void addBody({required String key, dynamic value}) {
      if (value != null) {
        body[key] = value;
      }
    }

    addBody(key: "notifications_enabled", value: notificationsEnabled);
    addBody(key: "email_notifications", value: emailNotifications);
    addBody(key: "push_notifications", value: pushNotifications);
    addBody(key: "sms_notifications", value: smsNotifications);
    addBody(key: "dark_mode", value: darkMode);
    addBody(key: "auto_pay_rent", value: autoPayRent);
    addBody(key: "payment_reminder_days", value: paymentReminderDays);
    addBody(key: "default_payment_method", value: defaultPaymentMethod);
    addBody(key: "default_currency", value: defaultCurrency);
    addBody(key: "date_format", value: dateFormat);
    addBody(key: "land_data_registry_expiry", value: landDataRegistryExpiry);
    addBody(key: "landlord_insurance_expiry", value: landlordInsuranceExpiry);
    addBody(
      key: "fire_alarm_safety_service_expiry",
      value: fireAlarmSafetyServiceExpiry,
    );

    final response = await postWithoutResponse.updateData(
      url: "/api/${NetworkLinks.version}/user/settings",
      headers: {
        // "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: body,
    );
    return response;
  }
}
