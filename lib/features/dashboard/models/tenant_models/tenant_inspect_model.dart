import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class TenantInspectModel {
  bool? error;
  int? code;
  String? message;
  List<TenantInspection>? data;
  dynamic errors;

  TenantInspectModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  TenantInspectModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null && json['data'] is List) {
      data = <TenantInspection>[];
      json['data'].forEach((v) {
        if (v is Map<String, dynamic>) {
          data!.add(TenantInspection.fromJson(v));
        }
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errors'] = errors;
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
