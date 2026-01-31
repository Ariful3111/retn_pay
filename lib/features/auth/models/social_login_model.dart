class SocialLoginModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  SocialLoginModel({this.error, this.code, this.message, this.data});

  SocialLoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? email;
  String? phone;
  bool? isActive;
  String? provider;
  String? providerId;
  List<String>? roles;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.email,
    this.phone,
    this.isActive,
    this.provider,
    this.providerId,
    this.roles,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    isActive = json['is_active'];
    provider = json['provider'];
    providerId = json['provider_id'];
    roles = json['roles'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['email'] = email;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['provider'] = provider;
    data['provider_id'] = providerId;
    data['roles'] = roles;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
