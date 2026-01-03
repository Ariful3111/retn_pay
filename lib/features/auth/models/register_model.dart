class RegisterModel {
  bool? error;
  int? code;
  String? message;
  Data? data;
  String? errors;

  RegisterModel({this.error, this.code, this.message, this.data, this.errors});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'].toString();
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
  String? image;
  String? gender;
  String? email;
  String? phone;
  bool? isActive;
  List<String>? roles;
  String? provider;
  String? providerId;
  String? avatar;

  User({
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
    this.provider,
    this.providerId,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'].toString();
    isActive = json['is_active'];
    roles = json['roles'].cast<String>();
    provider = json['provider'].toString();
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
    data['provider'] = provider;
    data['provider_id'] = providerId;
    data['avatar'] = avatar;
    return data;
  }
}
