class CheckValidityModel {
  bool? error;
  int? code;
  String? message;
  bool? data;

  CheckValidityModel({this.error, this.code, this.message, this.data});

  CheckValidityModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
