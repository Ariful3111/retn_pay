class ProfileModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  ProfileModel({this.error, this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? image;
  String? gender;
  String? email;
  String? phone;
  bool? isActive;
  List<String>? roles;
  String? providerId;
  String? avatar;

  Data({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.image,
    this.gender,
    this.email,
    this.phone,
    this.isActive,
    this.roles,
    this.providerId,
    this.avatar,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    isActive = json['is_active'];
    roles = json['roles'].cast<String>();
    providerId = json['provider_id'].toString();
    avatar = json['avatar'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['roles'] = roles;
    data['provider_id'] = providerId;
    data['avatar'] = avatar;
    return data;
  }
}
