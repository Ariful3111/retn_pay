class MessageListModel {
  final bool? error;
  final int? code;
  final String? message;
  final MessageListPayload? data;
  final dynamic errors;

  const MessageListModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory MessageListModel.fromJson(Map<String, dynamic> json) {
    return MessageListModel(
      error: json['error'] == true,
      code: _toInt(json['code']),
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic>
          ? MessageListPayload.fromJson(json['data'])
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

class MessageListPayload {
  final List<MessageItem>? data;
  final MessagePaginationLinks? links;
  final MessagePaginationMeta? meta;
  final MessageOtherUser? otherUser;

  const MessageListPayload({this.data, this.links, this.meta, this.otherUser});

  factory MessageListPayload.fromJson(Map<String, dynamic> json) {
    return MessageListPayload(
      data: (json['data'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(MessageItem.fromJson)
          .toList(),
      links: json['links'] is Map<String, dynamic>
          ? MessagePaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] is Map<String, dynamic>
          ? MessagePaginationMeta.fromJson(json['meta'])
          : null,
      otherUser: json['other_user'] is Map<String, dynamic>
          ? MessageOtherUser.fromJson(json['other_user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
    'other_user': otherUser?.toJson(),
  };
}

class MessageItem {
  final int? id;
  final int? chatConversationId;
  final int? senderId;
  final bool? isSentByMe;
  final String? message;
  final List<String>? images;
  final String? readAt;
  final String? createdAt;
  final MessageSender? sender;

  const MessageItem({
    this.id,
    this.chatConversationId,
    this.senderId,
    this.isSentByMe,
    this.message,
    this.images,
    this.readAt,
    this.createdAt,
    this.sender,
  });

  factory MessageItem.fromJson(Map<String, dynamic> json) {
    return MessageItem(
      id: _toInt(json['id']),
      chatConversationId: _toInt(json['chat_conversation_id']),
      senderId: _toInt(json['sender_id']),
      isSentByMe: json['is_sent_by_me'] == true,
      message: json['message']?.toString(),
      images: (json['images'] as List?)
          ?.map((e) => _cleanBacktickedString(e))
          .whereType<String>()
          .toList(),
      readAt: json['read_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      sender: json['sender'] is Map<String, dynamic>
          ? MessageSender.fromJson(json['sender'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'chat_conversation_id': chatConversationId,
    'sender_id': senderId,
    'is_sent_by_me': isSentByMe,
    'message': message,
    'images': images,
    'read_at': readAt,
    'created_at': createdAt,
    'sender': sender?.toJson(),
  };
}

class MessageSender {
  final int? id;
  final String? name;
  final String? image;

  const MessageSender({this.id, this.name, this.image});

  factory MessageSender.fromJson(Map<String, dynamic> json) {
    return MessageSender(
      id: _toInt(json['id']),
      name: json['name']?.toString(),
      image: _cleanBacktickedString(json['image']),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}

class MessageOtherUser {
  final int? id;
  final String? name;
  final String? email;
  final String? image;
  final List<String>? roles;

  const MessageOtherUser({
    this.id,
    this.name,
    this.email,
    this.image,
    this.roles,
  });

  factory MessageOtherUser.fromJson(Map<String, dynamic> json) {
    return MessageOtherUser(
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

class MessagePaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const MessagePaginationLinks({this.first, this.last, this.prev, this.next});

  factory MessagePaginationLinks.fromJson(Map<String, dynamic> json) {
    return MessagePaginationLinks(
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

class MessagePaginationMeta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<MessageMetaLink>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const MessagePaginationMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory MessagePaginationMeta.fromJson(Map<String, dynamic> json) {
    return MessagePaginationMeta(
      currentPage: _toInt(json['current_page']),
      from: _toInt(json['from']),
      lastPage: _toInt(json['last_page']),
      links: (json['links'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(MessageMetaLink.fromJson)
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

class MessageMetaLink {
  final String? url;
  final String? label;
  final int? page;
  final bool? active;

  const MessageMetaLink({this.url, this.label, this.page, this.active});

  factory MessageMetaLink.fromJson(Map<String, dynamic> json) {
    return MessageMetaLink(
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
