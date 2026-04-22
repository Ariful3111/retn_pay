class ReminderModel {
  bool? error;
  int? code;
  String? message;
  ReminderPayload? data;
  dynamic errors;

  ReminderModel({this.error, this.code, this.message, this.data, this.errors});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    error = _parseBool(json['error']);
    code = _parseInt(json['code']);
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
  dynamic readAt;
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
    notifiableId = _parseInt(json['notifiable_id']);

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = ReminderContent.fromJson(dataJson);
    }

    isRead = _parseBool(json['is_read']);
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
  int? propertyId;
  int? chatConversationId;
  int? chatMessageId;
  int? senderId;
  int? rentPaymentId;
  String? lateFeeTotal;
  String? dueDate;
  int? transactionId;
  String? amount;
  String? currency;

  ReminderContentData({
    this.supportTicketId,
    this.propertyId,
    this.chatConversationId,
    this.chatMessageId,
    this.senderId,
    this.rentPaymentId,
    this.lateFeeTotal,
    this.dueDate,
    this.transactionId,
    this.amount,
    this.currency,
  });

  ReminderContentData.fromJson(Map<String, dynamic> json) {
    supportTicketId = _parseInt(json['support_ticket_id']);
    propertyId = _parseInt(json['property_id']);
    chatConversationId = _parseInt(json['chat_conversation_id']);
    chatMessageId = _parseInt(json['chat_message_id']);
    senderId = _parseInt(json['sender_id']);
    rentPaymentId = _parseInt(json['rent_payment_id']);
    lateFeeTotal = json['late_fee_total']?.toString();
    dueDate = json['due_date']?.toString();
    transactionId = _parseInt(json['transaction_id']);
    amount = json['amount']?.toString();
    currency = json['currency']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['support_ticket_id'] = supportTicketId;
    json['property_id'] = propertyId;
    json['chat_conversation_id'] = chatConversationId;
    json['chat_message_id'] = chatMessageId;
    json['sender_id'] = senderId;
    json['rent_payment_id'] = rentPaymentId;
    json['late_fee_total'] = lateFeeTotal;
    json['due_date'] = dueDate;
    json['transaction_id'] = transactionId;
    json['amount'] = amount;
    json['currency'] = currency;
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
    currentPage = _parseInt(json['current_page']);
    from = _parseInt(json['from']);
    lastPage = _parseInt(json['last_page']);

    final list = json['links'];
    if (list is List) {
      links = list
          .whereType<Map<String, dynamic>>()
          .map((v) => ReminderMetaLink.fromJson(v))
          .toList();
    }

    path = json['path']?.toString();
    perPage = _parseInt(json['per_page']);
    to = _parseInt(json['to']);
    total = _parseInt(json['total']);
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
    page = _parseInt(json['page']);
    active = _parseBool(json['active']);
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

bool? _parseBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
  }
  return null;
}

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}
