class ChatListModel {
  final bool? error;
  final int? code;
  final String? message;
  final ChatListPayload? data;
  final dynamic errors;

  const ChatListModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    return ChatListModel(
      error: json['error'] == true,
      code: _toInt(json['code']),
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic>
          ? ChatListPayload.fromJson(json['data'])
          : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() => {
    'error': error,
    'code': code,
    'message': message,
    'data': data?.toJson(),
    'errors': errors,
  };
}

class ChatListPayload {
  final List<ChatConversation>? data;
  final ChatPaginationLinks? links;
  final ChatPaginationMeta? meta;

  const ChatListPayload({this.data, this.links, this.meta});

  factory ChatListPayload.fromJson(Map<String, dynamic> json) {
    return ChatListPayload(
      data: (json['data'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ChatConversation.fromJson)
          .toList(),
      links: json['links'] is Map<String, dynamic>
          ? ChatPaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] is Map<String, dynamic>
          ? ChatPaginationMeta.fromJson(json['meta'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
  };
}

class ChatConversation {
  final int? id;
  final int? userOneId;
  final int? userTwoId;
  final ChatUser? otherUser;
  final ChatLastMessage? lastMessage;
  final int? messageCount;
  final int? unreadCount;
  final String? createdAt;
  final String? updatedAt;

  const ChatConversation({
    this.id,
    this.userOneId,
    this.userTwoId,
    this.otherUser,
    this.lastMessage,
    this.messageCount,
    this.unreadCount,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatConversation.fromJson(Map<String, dynamic> json) {
    return ChatConversation(
      id: _toInt(json['id']),
      userOneId: _toInt(json['user_one_id']),
      userTwoId: _toInt(json['user_two_id']),
      otherUser: json['other_user'] is Map<String, dynamic>
          ? ChatUser.fromJson(json['other_user'])
          : null,
      lastMessage: json['last_message'] is Map<String, dynamic>
          ? ChatLastMessage.fromJson(json['last_message'])
          : null,
      messageCount: _toInt(json['message_count']),
      unreadCount: _toInt(json['unread_count']),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_one_id': userOneId,
    'user_two_id': userTwoId,
    'other_user': otherUser?.toJson(),
    'last_message': lastMessage?.toJson(),
    'message_count': messageCount,
    'unread_count': unreadCount,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class ChatUser {
  final int? id;
  final String? name;
  final String? email;
  final String? image;
  final List<String>? roles;

  const ChatUser({this.id, this.name, this.email, this.image, this.roles});

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: _toInt(json['id']),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      image: _cleanBacktickedString(json['image']),
      roles: (json['roles'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'image': image,
    'roles': roles,
  };
}

class ChatLastMessage {
  final int? id;
  final int? senderId;
  final bool? isSentByMe;
  final String? message;
  final String? createdAt;
  final int? messageCount;

  const ChatLastMessage({
    this.id,
    this.senderId,
    this.isSentByMe,
    this.message,
    this.createdAt,
    this.messageCount,
  });

  factory ChatLastMessage.fromJson(Map<String, dynamic> json) {
    return ChatLastMessage(
      id: _toInt(json['id']),
      senderId: _toInt(json['sender_id']),
      isSentByMe: json['is_sent_by_me'] == true,
      message: json['message']?.toString(),
      createdAt: json['created_at']?.toString(),
      messageCount: _toInt(json['message_count']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'sender_id': senderId,
    'is_sent_by_me': isSentByMe,
    'message': message,
    'created_at': createdAt,
    'message_count': messageCount,
  };
}

class ChatPaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const ChatPaginationLinks({this.first, this.last, this.prev, this.next});

  factory ChatPaginationLinks.fromJson(Map<String, dynamic> json) {
    return ChatPaginationLinks(
      first: _cleanBacktickedString(json['first']),
      last: _cleanBacktickedString(json['last']),
      prev: _cleanBacktickedString(json['prev']),
      next: _cleanBacktickedString(json['next']),
    );
  }

  Map<String, dynamic> toJson() => {
    'first': first,
    'last': last,
    'prev': prev,
    'next': next,
  };
}

class ChatPaginationMeta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<ChatMetaLink>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const ChatPaginationMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory ChatPaginationMeta.fromJson(Map<String, dynamic> json) {
    return ChatPaginationMeta(
      currentPage: _toInt(json['current_page']),
      from: _toInt(json['from']),
      lastPage: _toInt(json['last_page']),
      links: (json['links'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ChatMetaLink.fromJson)
          .toList(),
      path: _cleanBacktickedString(json['path']),
      perPage: _toInt(json['per_page']),
      to: _toInt(json['to']),
      total: _toInt(json['total']),
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'from': from,
    'last_page': lastPage,
    'links': links?.map((e) => e.toJson()).toList(),
    'path': path,
    'per_page': perPage,
    'to': to,
    'total': total,
  };
}

class ChatMetaLink {
  final String? url;
  final String? label;
  final int? page;
  final bool? active;

  const ChatMetaLink({this.url, this.label, this.page, this.active});

  factory ChatMetaLink.fromJson(Map<String, dynamic> json) {
    return ChatMetaLink(
      url: _cleanBacktickedString(json['url']),
      label: json['label']?.toString(),
      page: _toInt(json['page']),
      active: json['active'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'page': page,
    'active': active,
  };
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  return int.tryParse(value.toString());
}

String? _cleanBacktickedString(dynamic value) {
  final s = value?.toString();
  if (s == null) return null;
  return s.replaceAll('`', '').trim();
}
