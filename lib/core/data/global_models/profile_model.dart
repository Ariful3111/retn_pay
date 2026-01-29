class ProfileModel {
  bool? error;
  int? code;
  String? message;
  User? data;

  ProfileModel({this.error, this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
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
  String? providerId;
  String? avatar;
  List<UserDocument>? documents;

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
    this.providerId,
    this.avatar,
    this.documents,
  });

  User.fromJson(Map<String, dynamic> json) {
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
    if (json['documents'] != null) {
      documents = <UserDocument>[];
      json['documents'].forEach((v) {
        documents!.add(UserDocument.fromJson(v));
      });
    }
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
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDocument {
  int? id;
  int? userId;
  String? documentType;
  String? documentNumber;
  String? filePath;
  String? fileUrl;
  String? backFilePath;
  String? backFileUrl;
  String? expiryDate;
  String? status;
  String? rejectionReason;
  String? verifiedAt;
  String? createdAt;
  String? updatedAt;

  UserDocument({
    this.id,
    this.userId,
    this.documentType,
    this.documentNumber,
    this.filePath,
    this.fileUrl,
    this.backFilePath,
    this.backFileUrl,
    this.expiryDate,
    this.status,
    this.rejectionReason,
    this.verifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    documentType = json['document_type'];
    documentNumber = json['document_number'].toString();
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    backFilePath = json['back_file_path'];
    backFileUrl = json['back_file_url'];
    expiryDate = json['expiry_date'].toString();
    status = json['status'];
    rejectionReason = json['rejection_reason'].toString();
    verifiedAt = json['verified_at'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['document_type'] = documentType;
    data['document_number'] = documentNumber;
    data['file_path'] = filePath;
    data['file_url'] = fileUrl;
    data['back_file_path'] = backFilePath;
    data['back_file_url'] = backFileUrl;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    data['rejection_reason'] = rejectionReason;
    data['verified_at'] = verifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
