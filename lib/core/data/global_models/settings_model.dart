class GetSettingsModel {
  bool? error;
  int? code;
  String? message;
  SettingsData? data;
  dynamic errors;

  GetSettingsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  GetSettingsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? SettingsData.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

class SettingsData {
  String? appLogo;
  String? maintenanceMessage;
  String? appVersion;
  int? androidAppCode;
  int? androidAppCodeMin;
  int? iosAppCode;
  int? iosAppCodeMin;
  String? appIcon;
  String? playStoreUrl;
  String? appStoreUrl;
  bool? appMaintenanceMode;
  String? contactMessage;
  String? address;
  String? email;
  String? phone;
  String? web;
  String? facebook;
  String? tiktok;
  String? instagram;
  String? twitter;
  String? youtube;
  String? appLogoDark;
  String? abn;

  SettingsData({
    this.appLogo,
    this.maintenanceMessage,
    this.appVersion,
    this.androidAppCode,
    this.androidAppCodeMin,
    this.iosAppCode,
    this.iosAppCodeMin,
    this.appIcon,
    this.playStoreUrl,
    this.appStoreUrl,
    this.appMaintenanceMode,
    this.contactMessage,
    this.address,
    this.email,
    this.phone,
    this.web,
    this.facebook,
    this.tiktok,
    this.instagram,
    this.twitter,
    this.youtube,
    this.appLogoDark,
    this.abn,
  });

  SettingsData.fromJson(Map<String, dynamic> json) {
    appLogo = json['app_logo']?.toString();
    maintenanceMessage = json['maintenance_message']?.toString();
    appVersion = json['app_version']?.toString();
    androidAppCode = (json['android_app_code'] as num?)?.toInt();
    androidAppCodeMin = (json['android_app_code_min'] as num?)?.toInt();
    iosAppCode = (json['ios_app_code'] as num?)?.toInt();
    iosAppCodeMin = (json['ios_app_code_min'] as num?)?.toInt();
    appIcon = json['app_icon']?.toString();
    playStoreUrl = json['play_store_url']?.toString();
    appStoreUrl = json['app_store_url']?.toString();
    appMaintenanceMode = json['app_maintenance_mode'];
    contactMessage = json['contact_message']?.toString();
    address = json['address']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    web = json['web']?.toString();
    facebook = json['facebook']?.toString();
    tiktok = json['tiktok']?.toString();
    instagram = json['instagram']?.toString();
    twitter = json['twitter']?.toString();
    youtube = json['youtube']?.toString();
    appLogoDark = json['app_logo_dark']?.toString();
    abn = json['ABN']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_logo'] = appLogo;
    data['maintenance_message'] = maintenanceMessage;
    data['app_version'] = appVersion;
    data['android_app_code'] = androidAppCode;
    data['android_app_code_min'] = androidAppCodeMin;
    data['ios_app_code'] = iosAppCode;
    data['ios_app_code_min'] = iosAppCodeMin;
    data['app_icon'] = appIcon;
    data['play_store_url'] = playStoreUrl;
    data['app_store_url'] = appStoreUrl;
    data['app_maintenance_mode'] = appMaintenanceMode;
    data['contact_message'] = contactMessage;
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['web'] = web;
    data['facebook'] = facebook;
    data['tiktok'] = tiktok;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    data['youtube'] = youtube;
    data['app_logo_dark'] = appLogoDark;
    data['ABN'] = abn;
    return data;
  }
}
