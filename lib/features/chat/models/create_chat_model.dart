class CreateChatModel {
  final bool error;
  final int code;
  final String message;
  final CreateChatData? data;
  final dynamic errors;

  CreateChatModel({
    required this.error,
    required this.code,
    required this.message,
    this.data,
    this.errors,
  });

  factory CreateChatModel.fromJson(Map<String, dynamic> json) {
    return CreateChatModel(
      error: json['error'] ?? false,
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null ? CreateChatData.fromJson(json['data']) : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'code': code,
      'message': message,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class CreateChatData {
  final int id;
  final int userOneId;
  final int userTwoId;
  final OtherUser? otherUser;
  final int messageCount;
  final String createdAt;
  final String updatedAt;

  CreateChatData({
    required this.id,
    required this.userOneId,
    required this.userTwoId,
    this.otherUser,
    required this.messageCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreateChatData.fromJson(Map<String, dynamic> json) {
    return CreateChatData(
      id: json['id'] ?? 0,
      userOneId: json['user_one_id'] ?? 0,
      userTwoId: json['user_two_id'] ?? 0,
      otherUser: json['other_user'] != null
          ? OtherUser.fromJson(json['other_user'])
          : null,
      messageCount: json['message_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_one_id': userOneId,
      'user_two_id': userTwoId,
      'other_user': otherUser?.toJson(),
      'message_count': messageCount,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class OtherUser {
  final int id;
  final String name;
  final String email;
  final String image;
  final List<String> roles;

  OtherUser({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.roles,
  });

  factory OtherUser.fromJson(Map<String, dynamic> json) {
    return OtherUser(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'roles': roles,
    };
  }
}
