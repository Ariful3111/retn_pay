class VerificationModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  VerificationModel({this.error, this.code, this.message, this.data});

  VerificationModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? code;
  String? contactType;
  String? contact;
  String? expiresAt;

  Data({this.code, this.contactType, this.contact, this.expiresAt});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    contactType = json['contact_type'];
    contact = json['contact'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['contact_type'] = contactType;
    data['contact'] = contact;
    data['expires_at'] = expiresAt;
    return data;
  }
}
