class CalenderModel {
  bool? error;
  int? code;
  String? message;
  CalenderData? data;
  dynamic errors;

  CalenderModel({this.error, this.code, this.message, this.data, this.errors});

  CalenderModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();
    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = CalenderData.fromJson(dataJson);
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

class CalenderData {
  List<CalenderEntry>? data;
  CalenderLinks? links;
  CalenderMeta? meta;

  CalenderData({this.data, this.links, this.meta});

  CalenderData.fromJson(Map<String, dynamic> json) {
    final listRaw = json['data'];
    if (listRaw is List) {
      data = listRaw
          .whereType<Map<String, dynamic>>()
          .map((v) => CalenderEntry.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = CalenderLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = CalenderMeta.fromJson(metaJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.map((e) => e.toJson()).toList();
    if (links != null) {
      json['links'] = links!.toJson();
    }
    if (meta != null) {
      json['meta'] = meta!.toJson();
    }
    return json;
  }
}

class CalenderEntry {
  int? id;
  String? title;
  String? description;
  String? startDatetime;
  String? endDatetime;
  String? type;
  String? typeLabel;
  String? color;
  int? propertyId;
  CalenderProperty? property;
  String? createdAt;
  String? updatedAt;

  CalenderEntry({
    this.id,
    this.title,
    this.description,
    this.startDatetime,
    this.endDatetime,
    this.type,
    this.typeLabel,
    this.color,
    this.propertyId,
    this.property,
    this.createdAt,
    this.updatedAt,
  });

  CalenderEntry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    description = json['description']?.toString();
    startDatetime = json['start_datetime']?.toString();
    endDatetime = json['end_datetime']?.toString();
    type = json['type']?.toString();
    typeLabel = json['type_label']?.toString();
    color = json['color']?.toString();
    propertyId = json['property_id'];

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = CalenderProperty.fromJson(propertyJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['description'] = description;
    json['start_datetime'] = startDatetime;
    json['end_datetime'] = endDatetime;
    json['type'] = type;
    json['type_label'] = typeLabel;
    json['color'] = color;
    json['property_id'] = propertyId;
    if (property != null) {
      json['property'] = property!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class CalenderProperty {
  int? id;
  String? title;
  String? address;

  CalenderProperty({this.id, this.title, this.address});

  CalenderProperty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    address = json['address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['address'] = address;
    return json;
  }
}

class CalenderLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  CalenderLinks({this.first, this.last, this.prev, this.next});

  CalenderLinks.fromJson(Map<String, dynamic> json) {
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

class CalenderMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<CalenderMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  CalenderMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  CalenderMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];

    final linksRaw = json['links'];
    if (linksRaw is List) {
      links = linksRaw
          .whereType<Map<String, dynamic>>()
          .map((v) => CalenderMetaLink.fromJson(v))
          .toList();
    }

    path = json['path']?.toString();
    final perPageRaw = json['per_page'];
    perPage = perPageRaw is int ? perPageRaw : int.tryParse('$perPageRaw');
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_page'] = currentPage;
    json['from'] = from;
    json['last_page'] = lastPage;
    json['links'] = links?.map((e) => e.toJson()).toList();
    json['path'] = path;
    json['per_page'] = perPage;
    json['to'] = to;
    json['total'] = total;
    return json;
  }
}

class CalenderMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  CalenderMetaLink({this.url, this.label, this.page, this.active});

  CalenderMetaLink.fromJson(Map<String, dynamic> json) {
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
