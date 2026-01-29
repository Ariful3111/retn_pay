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
  });

  Settings.fromJson(Map<String, dynamic> json) {
    notificationsEnabled = json['notifications_enabled'];
    emailNotifications = json['email_notifications'];
    pushNotifications = json['push_notifications'];
    smsNotifications = json['sms_notifications'];
    darkMode = json['dark_mode'];
    autoPayRent = json['auto_pay_rent'];
    paymentReminderDays = json['payment_reminder_days'];
    defaultCurrency = json['default_currency'];
    dateFormat = json['date_format'];
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
    return data;
  }
}
