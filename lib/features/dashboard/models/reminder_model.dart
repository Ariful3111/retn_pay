class ReminderModel {
  bool? error;
  int? code;
  String? message;
  ReminderPayload? data;
  dynamic errors;

  ReminderModel({this.error, this.code, this.message, this.data, this.errors});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = ReminderPayload.fromJson(dataJson);
    }

    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    json['errors'] = errors;
    return json;
  }
}

class ReminderPayload {
  List<ReminderItem>? data;
  ReminderLinks? links;
  ReminderMeta? meta;

  ReminderPayload({this.data, this.links, this.meta});

  ReminderPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => ReminderItem.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = ReminderLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = ReminderMeta.fromJson(metaJson);
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

class ReminderItem {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  ReminderContent? data;
  bool? isRead;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  ReminderItem({
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

  ReminderItem.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    notifiableType = json['notifiable_type']?.toString();
    notifiableId = json['notifiable_id'];

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = ReminderContent.fromJson(dataJson);
    }

    isRead = json['is_read'];
    readAt = json['read_at']?.toString();
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

class ReminderContent {
  String? title;
  String? body;
  ReminderContentData? data;

  ReminderContent({this.title, this.body, this.data});

  ReminderContent.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    body = json['body']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = ReminderContentData.fromJson(dataJson);
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

class ReminderContentData {
  int? supportTicketId;

  ReminderContentData({this.supportTicketId});

  ReminderContentData.fromJson(Map<String, dynamic> json) {
    supportTicketId = json['support_ticket_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['support_ticket_id'] = supportTicketId;
    return json;
  }
}

class ReminderLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  ReminderLinks({this.first, this.last, this.prev, this.next});

  ReminderLinks.fromJson(Map<String, dynamic> json) {
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

class ReminderMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<ReminderMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  ReminderMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  ReminderMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path']?.toString();
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];

    final list = json['links'];
    if (list is List) {
      links = list
          .whereType<Map<String, dynamic>>()
          .map((v) => ReminderMetaLink.fromJson(v))
          .toList();
    }
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

class ReminderMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  ReminderMetaLink({this.url, this.label, this.page, this.active});

  ReminderMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    final rawPage = json['page'];
    page = rawPage is int ? rawPage : int.tryParse(rawPage?.toString() ?? '');
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
