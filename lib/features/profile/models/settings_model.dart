class SettingsModel {
  bool? success;
  Settings? data;

  SettingsModel({this.success, this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Settings.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Settings {
  bool? notificationsEnabled;
  bool? emailNotifications;
  bool? pushNotifications;
  bool? smsNotifications;
  bool? darkMode;
  bool? autoPayRent;
  int? paymentReminderDays;
  String? defaultCurrency;
  String? dateFormat;
  String? theme;
  String? defaultPaymentMethod;
  String? language;
  String? timezone;
  String? profileVisibility;
  bool? showOnlineStatus;
  bool? twoFactorEnabled;
  int? sessionTimeout;
  bool? landDataRegistryExpiry;
  bool? landlordInsuranceExpiry;
  bool? fireAlarmSafetyServiceExpiry;

  Settings({
    this.notificationsEnabled,
    this.emailNotifications,
    this.pushNotifications,
    this.smsNotifications,
    this.darkMode,
    this.autoPayRent,
    this.paymentReminderDays,
    this.defaultCurrency,
    this.dateFormat,
    this.theme,
    this.defaultPaymentMethod,
    this.language,
    this.timezone,
    this.profileVisibility,
    this.showOnlineStatus,
    this.twoFactorEnabled,
    this.sessionTimeout,
    this.landDataRegistryExpiry,
    this.landlordInsuranceExpiry,
    this.fireAlarmSafetyServiceExpiry,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    notificationsEnabled = _parseBool(json['notifications_enabled']);
    emailNotifications = _parseBool(json['email_notifications']);
    pushNotifications = _parseBool(json['push_notifications']);
    smsNotifications = _parseBool(json['sms_notifications']);
    darkMode = _parseBool(json['dark_mode']);
    autoPayRent = _parseBool(json['auto_pay_rent']);
    paymentReminderDays = json['payment_reminder_days'] is int
        ? json['payment_reminder_days']
        : int.tryParse(json['payment_reminder_days']?.toString() ?? '');
    defaultCurrency = json['default_currency']?.toString();
    dateFormat = json['date_format']?.toString();
    theme = json['theme']?.toString();
    defaultPaymentMethod = json['default_payment_method']?.toString();
    language = json['language']?.toString();
    timezone = json['timezone']?.toString();
    profileVisibility = json['profile_visibility']?.toString();
    showOnlineStatus = _parseBool(json['show_online_status']);
    twoFactorEnabled = _parseBool(json['two_factor_enabled']);
    sessionTimeout = json['session_timeout'] is int
        ? json['session_timeout']
        : int.tryParse(json['session_timeout']?.toString() ?? '');
    landDataRegistryExpiry = _parseBool(json['land_data_registry_expiry']);
    landlordInsuranceExpiry = _parseBool(json['landlord_insurance_expiry']);
    fireAlarmSafetyServiceExpiry = _parseBool(
      json['fire_alarm_safety_service_expiry'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notifications_enabled'] = notificationsEnabled;
    data['email_notifications'] = emailNotifications;
    data['push_notifications'] = pushNotifications;
    data['sms_notifications'] = smsNotifications;
    data['dark_mode'] = darkMode;
    data['auto_pay_rent'] = autoPayRent;
    data['payment_reminder_days'] = paymentReminderDays;
    data['default_currency'] = defaultCurrency;
    data['date_format'] = dateFormat;
    data['theme'] = theme;
    data['default_payment_method'] = defaultPaymentMethod;
    data['language'] = language;
    data['timezone'] = timezone;
    data['profile_visibility'] = profileVisibility;
    data['show_online_status'] = showOnlineStatus;
    data['two_factor_enabled'] = twoFactorEnabled;
    data['session_timeout'] = sessionTimeout;
    data['land_data_registry_expiry'] = landDataRegistryExpiry;
    data['landlord_insurance_expiry'] = landlordInsuranceExpiry;
    data['fire_alarm_safety_service_expiry'] = fireAlarmSafetyServiceExpiry;
    return data;
  }
}

bool? _parseBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
  }
  return null;
}
