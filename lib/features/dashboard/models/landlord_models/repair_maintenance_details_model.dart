import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class RepairMaintenanceDetailsModel {
  bool? error;
  int? code;
  String? message;
  RepairMaintenanceDetailsData? data;
  dynamic errors;

  RepairMaintenanceDetailsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  RepairMaintenanceDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = RepairMaintenanceDetailsData.fromJson(dataJson);
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

class RepairMaintenanceDetailsData {
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
  RepairMaintenanceDetailsTenant? tenant;
  List<RepairMaintenanceAssignment>? assignments;
  List<RepairMaintenanceUpdate>? updates;
  String? createdAt;
  String? updatedAt;

  RepairMaintenanceDetailsData({
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
    this.updates,
    this.createdAt,
    this.updatedAt,
  });

  RepairMaintenanceDetailsData.fromJson(Map<String, dynamic> json) {
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
      tenant = RepairMaintenanceDetailsTenant.fromJson(tenantJson);
    }

    final assignmentsRaw = json['assignments'];
    if (assignmentsRaw is List) {
      assignments = assignmentsRaw
          .whereType<Map<String, dynamic>>()
          .map((v) => RepairMaintenanceAssignment.fromJson(v))
          .toList();
    }

    final updatesRaw = json['updates'];
    if (updatesRaw is List) {
      updates = updatesRaw
          .whereType<Map<String, dynamic>>()
          .map((v) => RepairMaintenanceUpdate.fromJson(v))
          .toList();
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
    if (images != null) {
      json['images'] = images;
    }
    json['preferred_date'] = preferredDate;
    if (preferredTimeSlots != null) {
      json['preferred_time_slots'] = preferredTimeSlots;
    }
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
    if (assignments != null) {
      json['assignments'] = assignments!.map((v) => v.toJson()).toList();
    }
    if (updates != null) {
      json['updates'] = updates!.map((v) => v.toJson()).toList();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RepairMaintenanceDetailsTenant {
  int? id;
  String? name;
  String? email;

  RepairMaintenanceDetailsTenant({this.id, this.name, this.email});

  RepairMaintenanceDetailsTenant.fromJson(Map<String, dynamic> json) {
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

class RepairMaintenanceAssignment {
  int? id;
  int? maintenanceRequestId;
  int? vendorId;
  int? assignedBy;
  String? assignedAt;
  String? completedAt;
  dynamic cost;
  RepairMaintenanceVendor? vendor;
  String? createdAt;
  String? updatedAt;

  RepairMaintenanceAssignment({
    this.id,
    this.maintenanceRequestId,
    this.vendorId,
    this.assignedBy,
    this.assignedAt,
    this.completedAt,
    this.cost,
    this.vendor,
    this.createdAt,
    this.updatedAt,
  });

  RepairMaintenanceAssignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintenanceRequestId = json['maintenance_request_id'];
    vendorId = json['vendor_id'];
    assignedBy = json['assigned_by'];
    assignedAt = json['assigned_at']?.toString();
    completedAt = json['completed_at']?.toString();
    cost = json['cost'];

    final vendorJson = json['vendor'];
    if (vendorJson is Map<String, dynamic>) {
      vendor = RepairMaintenanceVendor.fromJson(vendorJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['maintenance_request_id'] = maintenanceRequestId;
    json['vendor_id'] = vendorId;
    json['assigned_by'] = assignedBy;
    json['assigned_at'] = assignedAt;
    json['completed_at'] = completedAt;
    json['cost'] = cost;
    if (vendor != null) {
      json['vendor'] = vendor!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RepairMaintenanceUpdate {
  int? id;
  int? maintenanceRequestId;
  int? userId;
  String? message;
  String? statusChange;
  RepairMaintenanceUser? user;
  String? createdAt;
  String? updatedAt;

  RepairMaintenanceUpdate({
    this.id,
    this.maintenanceRequestId,
    this.userId,
    this.message,
    this.statusChange,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  RepairMaintenanceUpdate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintenanceRequestId = json['maintenance_request_id'];
    userId = json['user_id'];
    message = json['message']?.toString();
    statusChange = json['status_change']?.toString();

    final userJson = json['user'];
    if (userJson is Map<String, dynamic>) {
      user = RepairMaintenanceUser.fromJson(userJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['maintenance_request_id'] = maintenanceRequestId;
    json['user_id'] = userId;
    json['message'] = message;
    json['status_change'] = statusChange;
    if (user != null) {
      json['user'] = user!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RepairMaintenanceVendor {
  int? id;
  String? name;
  String? email;

  RepairMaintenanceVendor({this.id, this.name, this.email});

  RepairMaintenanceVendor.fromJson(Map<String, dynamic> json) {
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

class RepairMaintenanceUser {
  int? id;
  String? name;
  String? email;

  RepairMaintenanceUser({this.id, this.name, this.email});

  RepairMaintenanceUser.fromJson(Map<String, dynamic> json) {
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
