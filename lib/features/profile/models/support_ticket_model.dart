class SupportTicketModel {
  bool? error;
  int? code;
  String? message;
  SupportTicketPayload? data;

  SupportTicketModel({this.error, this.code, this.message, this.data});

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? SupportTicketPayload.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}

class SupportTicketPayload {
  List<SupportTicket>? data;
  SupportTicketLinks? links;
  SupportTicketMeta? meta;

  SupportTicketPayload({this.data, this.links, this.meta});

  SupportTicketPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => SupportTicket.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = SupportTicketLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = SupportTicketMeta.fromJson(metaJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      json['links'] = links!.toJson();
    }
    if (meta != null) {
      json['meta'] = meta!.toJson();
    }
    return json;
  }
}

class SupportTicket {
  int? id;
  int? userId;
  String? subject;
  String? description;
  String? status;
  String? priority;
  String? createdAt;
  String? updatedAt;
  SupportTicketUser? user;
  List<SupportTicketReply>? replies;

  SupportTicket({
    this.id,
    this.userId,
    this.subject,
    this.description,
    this.status,
    this.priority,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.replies,
  });

  SupportTicket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subject = json['subject'];
    description = json['description'];
    status = json['status'];
    priority = json['priority'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    final userJson = json['user'];
    if (userJson is Map<String, dynamic>) {
      user = SupportTicketUser.fromJson(userJson);
    }

    final repliesJson = json['replies'];
    if (repliesJson is List) {
      replies = repliesJson
          .whereType<Map<String, dynamic>>()
          .map((v) => SupportTicketReply.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['subject'] = subject;
    json['description'] = description;
    json['status'] = status;
    json['priority'] = priority;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (user != null) {
      json['user'] = user!.toJson();
    }
    if (replies != null) {
      json['replies'] = replies!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class SupportTicketUser {
  int? id;
  String? name;
  String? email;

  SupportTicketUser({this.id, this.name, this.email});

  SupportTicketUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    return json;
  }
}

class SupportTicketReply {
  int? id;
  int? supportTicketId;
  int? userId;
  String? message;
  bool? isStaffReply;
  String? createdAt;
  SupportTicketReplyUser? user;

  SupportTicketReply({
    this.id,
    this.supportTicketId,
    this.userId,
    this.message,
    this.isStaffReply,
    this.createdAt,
    this.user,
  });

  SupportTicketReply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supportTicketId = json['support_ticket_id'];
    userId = json['user_id'];
    message = json['message'];
    isStaffReply = json['is_staff_reply'];
    createdAt = json['created_at'];

    final userJson = json['user'];
    if (userJson is Map<String, dynamic>) {
      user = SupportTicketReplyUser.fromJson(userJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['support_ticket_id'] = supportTicketId;
    json['user_id'] = userId;
    json['message'] = message;
    json['is_staff_reply'] = isStaffReply;
    json['created_at'] = createdAt;
    if (user != null) {
      json['user'] = user!.toJson();
    }
    return json;
  }
}

class SupportTicketReplyUser {
  int? id;
  String? name;

  SupportTicketReplyUser({this.id, this.name});

  SupportTicketReplyUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}

class SupportTicketLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  SupportTicketLinks({this.first, this.last, this.prev, this.next});

  SupportTicketLinks.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev']?.toString();
    next = json['next']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['first'] = first;
    json['last'] = last;
    json['prev'] = prev;
    json['next'] = next;
    return json;
  }
}

class SupportTicketMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<SupportTicketMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  SupportTicketMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  SupportTicketMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];

    final linksJson = json['links'];
    if (linksJson is List) {
      links = linksJson
          .whereType<Map<String, dynamic>>()
          .map((v) => SupportTicketMetaLink.fromJson(v))
          .toList();
    }

    path = json['path']?.toString();
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_page'] = currentPage;
    json['from'] = from;
    json['last_page'] = lastPage;
    if (links != null) {
      json['links'] = links!.map((v) => v.toJson()).toList();
    }
    json['path'] = path;
    json['per_page'] = perPage;
    json['to'] = to;
    json['total'] = total;
    return json;
  }
}

class SupportTicketMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  SupportTicketMetaLink({this.url, this.label, this.page, this.active});

  SupportTicketMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    page = json['page'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['url'] = url;
    json['label'] = label;
    json['page'] = page;
    json['active'] = active;
    return json;
  }
}
