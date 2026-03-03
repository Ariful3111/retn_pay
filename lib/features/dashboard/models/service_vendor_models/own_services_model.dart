import 'package:renter_pay/features/home/models/properties_model.dart' as home;

class OwnServicesModel {
  bool? error;
  int? code;
  String? message;
  OwnServicesData? data;
  dynamic errors;

  OwnServicesModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  OwnServicesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? OwnServicesData.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['error'] = error;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    map['errors'] = errors;
    return map;
  }
}

class OwnServicesData {
  List<ServiceRequestItem>? data;
  OwnServicesLinks? links;
  OwnServicesMeta? meta;

  OwnServicesData({this.data, this.links, this.meta});

  OwnServicesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServiceRequestItem>[];
      json['data'].forEach((v) {
        data!.add(ServiceRequestItem.fromJson(v));
      });
    }
    links = json['links'] != null
        ? OwnServicesLinks.fromJson(json['links'])
        : null;
    meta = json['meta'] != null ? OwnServicesMeta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links!.toJson();
    }
    if (meta != null) {
      map['meta'] = meta!.toJson();
    }
    return map;
  }
}

class ServiceRequestItem {
  int? id;
  int? userId;
  int? serviceId;
  int? propertyId;
  String? description;
  String? status;
  dynamic adminNotes;
  String? createdAt;
  String? updatedAt;
  ServiceInfo? service;
  home.Property? property;
  List<dynamic>? assignments;

  ServiceRequestItem({
    this.id,
    this.userId,
    this.serviceId,
    this.propertyId,
    this.description,
    this.status,
    this.adminNotes,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.property,
    this.assignments,
  });

  ServiceRequestItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    propertyId = json['property_id'];
    description = json['description'];
    status = json['status'];
    adminNotes = json['admin_notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service = json['service'] != null
        ? ServiceInfo.fromJson(json['service'])
        : null;
    property = json['property'] != null
        ? home.Property.fromJson(json['property'])
        : null;
    if (json['assignments'] != null) {
      assignments = List<dynamic>.from(json['assignments']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['service_id'] = serviceId;
    map['property_id'] = propertyId;
    map['description'] = description;
    map['status'] = status;
    map['admin_notes'] = adminNotes;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (service != null) {
      map['service'] = service!.toJson();
    }
    if (property != null) {
      map['property'] = property!.toJson();
    }
    map['assignments'] = assignments;
    return map;
  }
}

class ServiceInfo {
  int? id;
  String? name;
  String? description;
  String? serviceType;
  List<String>? targetUserTypes;
  bool? isActive;

  ServiceInfo({
    this.id,
    this.name,
    this.description,
    this.serviceType,
    this.targetUserTypes,
    this.isActive,
  });

  ServiceInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    serviceType = json['service_type'];
    if (json['target_user_types'] != null) {
      targetUserTypes = List<String>.from(json['target_user_types']);
    }
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['service_type'] = serviceType;
    map['target_user_types'] = targetUserTypes;
    map['is_active'] = isActive;
    return map;
  }
}

class OwnServicesLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  OwnServicesLinks({this.first, this.last, this.prev, this.next});

  OwnServicesLinks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

class OwnServicesMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<OwnServicesMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  OwnServicesMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  OwnServicesMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <OwnServicesMetaLink>[];
      json['links'].forEach((v) {
        links!.add(OwnServicesMetaLink.fromJson(v));
      });
    }
    path = json['path'];
    perPage = int.tryParse(json['per_page'].toString());
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links!.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

class OwnServicesMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  OwnServicesMetaLink({this.url, this.label, this.page, this.active});

  OwnServicesMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    page = json['page'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['page'] = page;
    map['active'] = active;
    return map;
  }
}
