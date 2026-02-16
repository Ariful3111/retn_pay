class NotificationModel {
  bool? error;
  int? code;
  String? message;
  NotificationPayload? data;

  NotificationModel({this.error, this.code, this.message, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();
    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = NotificationPayload.fromJson(dataJson);
    }
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

class NotificationPayload {
  List<NotificationItem>? data;
  NotificationLinks? links;
  NotificationMeta? meta;

  NotificationPayload({this.data, this.links, this.meta});

  NotificationPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => NotificationItem.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = NotificationLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = NotificationMeta.fromJson(metaJson);
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

class NotificationItem {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotificationContent? data;
  bool? isRead;
  dynamic readAt;
  String? createdAt;
  String? updatedAt;

  NotificationItem({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.isRead,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    notifiableType = json['notifiable_type']?.toString();
    notifiableId = json['notifiable_id'];

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = NotificationContent.fromJson(dataJson);
    }

    isRead = json['is_read'];
    readAt = json['read_at'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type;
    json['notifiable_type'] = notifiableType;
    json['notifiable_id'] = notifiableId;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    json['is_read'] = isRead;
    json['read_at'] = readAt;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class NotificationContent {
  String? title;
  String? body;
  NotificationContentData? data;

  NotificationContent({this.title, this.body, this.data});

  NotificationContent.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    body = json['body']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = NotificationContentData.fromJson(dataJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['body'] = body;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}

class NotificationContentData {
  int? supportTicketId;

  NotificationContentData({this.supportTicketId});

  NotificationContentData.fromJson(Map<String, dynamic> json) {
    supportTicketId = json['support_ticket_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['support_ticket_id'] = supportTicketId;
    return json;
  }
}

class NotificationLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  NotificationLinks({this.first, this.last, this.prev, this.next});

  NotificationLinks.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev'];
    next = json['next'];
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

class NotificationMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<NotificationMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  NotificationMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  NotificationMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];

    final linksJson = json['links'];
    if (linksJson is List) {
      links = linksJson
          .whereType<Map<String, dynamic>>()
          .map((v) => NotificationMetaLink.fromJson(v))
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

class NotificationMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  NotificationMetaLink({this.url, this.label, this.page, this.active});

  NotificationMetaLink.fromJson(Map<String, dynamic> json) {
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
