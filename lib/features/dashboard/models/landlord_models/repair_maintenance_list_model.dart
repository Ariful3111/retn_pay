import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class RepairMaintenanceListModel {
  bool? error;
  int? code;
  String? message;
  RepairMaintenanceListPayload? data;
  dynamic errors;

  RepairMaintenanceListModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  RepairMaintenanceListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = RepairMaintenanceListPayload.fromJson(dataJson);
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

class RepairMaintenanceListPayload {
  List<RepairMaintenanceListItem>? data;
  RepairMaintenanceListLinks? links;
  RepairMaintenanceListMeta? meta;

  RepairMaintenanceListPayload({this.data, this.links, this.meta});

  RepairMaintenanceListPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => RepairMaintenanceListItem.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = RepairMaintenanceListLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = RepairMaintenanceListMeta.fromJson(metaJson);
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

class RepairMaintenanceListItem {
  int? id;
  int? tenantId;
  int? propertyId;
  int? propertyUnitId;
  String? title;
  String? description;
  String? urgency;
  String? status;
  List<String>? images;
  String? preferredDate;
  List<String>? preferredTimeSlots;
  String? preferredTimeOther;
  home_models.Property? property;
  home_models.Units? propertyUnit;
  RepairMaintenanceListTenant? tenant;
  List<dynamic>? assignments;
  String? createdAt;
  String? updatedAt;

  RepairMaintenanceListItem({
    this.id,
    this.tenantId,
    this.propertyId,
    this.propertyUnitId,
    this.title,
    this.description,
    this.urgency,
    this.status,
    this.images,
    this.preferredDate,
    this.preferredTimeSlots,
    this.preferredTimeOther,
    this.property,
    this.propertyUnit,
    this.tenant,
    this.assignments,
    this.createdAt,
    this.updatedAt,
  });

  RepairMaintenanceListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    propertyId = json['property_id'];
    propertyUnitId = json['property_unit_id'];
    title = json['title']?.toString();
    description = json['description']?.toString();
    urgency = json['urgency']?.toString();
    status = json['status']?.toString();

    final imagesRaw = json['images'];
    if (imagesRaw is List) {
      images = imagesRaw
          .map((e) => e?.toString() ?? '')
          .where((e) => e.isNotEmpty)
          .toList();
    }

    preferredDate = json['preferred_date']?.toString();

    final timeSlotsRaw = json['preferred_time_slots'];
    if (timeSlotsRaw is List) {
      preferredTimeSlots = timeSlotsRaw
          .map((e) => e?.toString() ?? '')
          .where((e) => e.isNotEmpty)
          .toList();
    }

    preferredTimeOther = json['preferred_time_other']?.toString();

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = home_models.Property.fromJson(propertyJson);
    }

    final unitJson = json['property_unit'];
    if (unitJson is Map<String, dynamic>) {
      propertyUnit = home_models.Units.fromJson(unitJson);
    }

    final tenantJson = json['tenant'];
    if (tenantJson is Map<String, dynamic>) {
      tenant = RepairMaintenanceListTenant.fromJson(tenantJson);
    }

    final assignmentsRaw = json['assignments'];
    if (assignmentsRaw is List) {
      assignments = assignmentsRaw;
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['tenant_id'] = tenantId;
    json['property_id'] = propertyId;
    json['property_unit_id'] = propertyUnitId;
    json['title'] = title;
    json['description'] = description;
    json['urgency'] = urgency;
    json['status'] = status;
    json['images'] = images;
    json['preferred_date'] = preferredDate;
    json['preferred_time_slots'] = preferredTimeSlots;
    json['preferred_time_other'] = preferredTimeOther;
    if (property != null) {
      json['property'] = property!.toJson();
    }
    if (propertyUnit != null) {
      json['property_unit'] = propertyUnit!.toJson();
    }
    if (tenant != null) {
      json['tenant'] = tenant!.toJson();
    }
    json['assignments'] = assignments;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RepairMaintenanceListTenant {
  int? id;
  String? name;
  String? email;

  RepairMaintenanceListTenant({this.id, this.name, this.email});

  RepairMaintenanceListTenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    email = json['email']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    return json;
  }
}

class RepairMaintenanceListLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  RepairMaintenanceListLinks({this.first, this.last, this.prev, this.next});

  RepairMaintenanceListLinks.fromJson(Map<String, dynamic> json) {
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

class RepairMaintenanceListMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<RepairMaintenanceListMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  RepairMaintenanceListMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  RepairMaintenanceListMeta.fromJson(Map<String, dynamic> json) {
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
          .map((v) => RepairMaintenanceListMetaLink.fromJson(v))
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

class RepairMaintenanceListMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  RepairMaintenanceListMetaLink({this.url, this.label, this.page, this.active});

  RepairMaintenanceListMetaLink.fromJson(Map<String, dynamic> json) {
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
