import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class InspectionModel {
  bool? error;
  int? code;
  String? message;
  List<TenantInspection>? data;
  InspectionLinks? links;
  InspectionMeta? meta;
  dynamic errors;

  InspectionModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.links,
    this.meta,
    this.errors,
  });

  InspectionModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    final dynamic rawData = json['data'];
    if (rawData is List) {
      data = _parseInspectionList(rawData);
    } else if (rawData is Map<String, dynamic>) {
      final dynamic rawList = rawData['data'];
      if (rawList is List) {
        data = _parseInspectionList(rawList);
      }

      final dynamic rawLinks = rawData['links'];
      if (rawLinks is Map<String, dynamic>) {
        links = InspectionLinks.fromJson(rawLinks);
      }

      final dynamic rawMeta = rawData['meta'];
      if (rawMeta is Map<String, dynamic>) {
        meta = InspectionMeta.fromJson(rawMeta);
      }
    }
    errors = json['errors'];
  }

  static List<TenantInspection> _parseInspectionList(List rawList) {
    final parsed = <TenantInspection>[];
    for (final v in rawList) {
      if (v is Map<String, dynamic>) {
        parsed.add(TenantInspection.fromJson(v));
      }
    }
    return parsed;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['code'] = code;
    json['message'] = message;
    if (links != null || meta != null) {
      json['data'] = {
        'data': data?.map((v) => v.toJson()).toList() ?? [],
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
    } else if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    json['errors'] = errors;
    return json;
  }
}

class InspectionLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  InspectionLinks({this.first, this.last, this.prev, this.next});

  InspectionLinks.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class InspectionMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<InspectionMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  InspectionMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  InspectionMeta.fromJson(Map<String, dynamic> json) {
    currentPage = _toInt(json['current_page']);
    from = _toInt(json['from']);
    lastPage = _toInt(json['last_page']);
    if (json['links'] is List) {
      links = <InspectionMetaLink>[];
      for (final v in (json['links'] as List)) {
        if (v is Map<String, dynamic>) {
          links!.add(InspectionMetaLink.fromJson(v));
        }
      }
    }
    path = json['path']?.toString();
    perPage = _toInt(json['per_page']);
    to = _toInt(json['to']);
    total = _toInt(json['total']);
  }

  static int? _toInt(dynamic v) {
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['links'] = links?.map((v) => v.toJson()).toList();
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class InspectionMetaLink {
  dynamic url;
  String? label;
  int? page;
  bool? active;

  InspectionMetaLink({this.url, this.label, this.page, this.active});

  InspectionMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label']?.toString();
    page = InspectionMeta._toInt(json['page']);
    active = json['active'] == true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['page'] = page;
    data['active'] = active;
    return data;
  }
}

class TenantInspection {
  int? id;
  int? propertyId;
  int? tenantId;
  String? inspectionDate;
  String? type;
  String? status;
  dynamic notes;
  bool? isApproved;
  int? approvedBy;
  String? approvedAt;
  String? rejectionReason;
  home_models.Property? property;
  Tenant? tenant;
  ApprovedByUser? approvedByUser;
  String? createdAt;
  String? updatedAt;

  TenantInspection({
    this.id,
    this.propertyId,
    this.tenantId,
    this.inspectionDate,
    this.type,
    this.status,
    this.notes,
    this.isApproved,
    this.approvedBy,
    this.approvedAt,
    this.rejectionReason,
    this.property,
    this.tenant,
    this.approvedByUser,
    this.createdAt,
    this.updatedAt,
  });

  TenantInspection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    tenantId = json['tenant_id'];
    inspectionDate = json['inspection_date']?.toString();
    type = json['type']?.toString();
    status = json['status']?.toString();
    notes = json['notes'];
    isApproved = json['is_approved'];

    final dynamic approvedByValue = json['approved_by'];
    if (approvedByValue is num) {
      approvedBy = approvedByValue.toInt();
    } else if (approvedByValue is String) {
      approvedBy = int.tryParse(approvedByValue);
    }

    approvedAt = json['approved_at']?.toString();
    rejectionReason = json['rejection_reason']?.toString();

    property =
        json['property'] != null && json['property'] is Map<String, dynamic>
        ? home_models.Property.fromJson(json['property'])
        : null;
    tenant = json['tenant'] != null && json['tenant'] is Map<String, dynamic>
        ? Tenant.fromJson(json['tenant'])
        : null;
    approvedByUser =
        json['approved_by_user'] != null &&
            json['approved_by_user'] is Map<String, dynamic>
        ? ApprovedByUser.fromJson(json['approved_by_user'])
        : null;
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['tenant_id'] = tenantId;
    data['inspection_date'] = inspectionDate;
    data['type'] = type;
    data['status'] = status;
    data['notes'] = notes;
    data['is_approved'] = isApproved;
    data['approved_by'] = approvedBy;
    data['approved_at'] = approvedAt;
    data['rejection_reason'] = rejectionReason;
    if (property != null) {
      data['property'] = property!.toJson();
    }
    if (tenant != null) {
      data['tenant'] = tenant!.toJson();
    }
    if (approvedByUser != null) {
      data['approved_by_user'] = approvedByUser!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tenant {
  int? id;
  String? name;
  String? email;

  Tenant({this.id, this.name, this.email});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    email = json['email']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class ApprovedByUser {
  int? id;
  String? name;
  String? email;

  ApprovedByUser({this.id, this.name, this.email});

  ApprovedByUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    email = json['email']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
