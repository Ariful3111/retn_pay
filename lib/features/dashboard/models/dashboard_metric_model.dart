class DashboardMetricModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  DashboardMetricModel({this.error, this.code, this.message, this.data});

  DashboardMetricModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? inspectionRequests;
  int? applicationsSubmitted;
  int? repairRequests;
  int? pendingRentCount;
  int? overdueRentCount;
  String? role;
  String? totalRentPaid;
  String? totalRevenue;
  int? totalProperties;
  String? totalRentCollected;
  String? totalRentFromAssignedProperties;
  String? assignedPropertiesCount;
  String? totalBooking;
  String? totalBookingAmount;

  Data({
    this.inspectionRequests,
    this.applicationsSubmitted,
    this.repairRequests,
    this.pendingRentCount,
    this.overdueRentCount,
    this.role,
    this.totalRentPaid,
    this.totalRevenue,
    this.totalProperties,
    this.totalRentCollected,
    this.totalRentFromAssignedProperties,
    this.assignedPropertiesCount,
    this.totalBooking,
    this.totalBookingAmount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    inspectionRequests = _parseInt(json['inspection_requests']);
    applicationsSubmitted = _parseInt(json['applications_submitted']);
    repairRequests = _parseInt(json['repair_requests']);
    pendingRentCount = _parseInt(json['pending_rent_count']);
    overdueRentCount = _parseInt(json['overdue_rent_count']);
    role = json['role'];
    totalRentPaid = json['total_rent_paid']?.toString();
    totalRevenue = json['total_revenue']?.toString();
    totalProperties = _parseInt(json['total_properties']);
    totalRentCollected = json['total_rent_collected']?.toString();
    totalRentFromAssignedProperties =
        json['total_rent_from_assigned_properties']?.toString();
    assignedPropertiesCount = json['assigned_properties_count']?.toString();
    totalBooking = json['total_booking']?.toString();
    totalBookingAmount = json['total_booking_amount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inspection_requests'] = inspectionRequests;
    data['applications_submitted'] = applicationsSubmitted;
    data['repair_requests'] = repairRequests;
    data['pending_rent_count'] = pendingRentCount;
    data['overdue_rent_count'] = overdueRentCount;
    data['role'] = role;
    data['total_rent_paid'] = totalRentPaid;
    data['total_revenue'] = totalRevenue;
    data['total_properties'] = totalProperties;
    data['total_rent_collected'] = totalRentCollected;
    data['total_rent_from_assigned_properties'] =
        totalRentFromAssignedProperties;
    data['assigned_properties_count'] = assignedPropertiesCount;
    data['total_booking'] = totalBooking;
    data['total_booking_amount'] = totalBookingAmount;
    return data;
  }
}

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) {
    try {
      return int.parse(value);
    } catch (e) {
      return null;
    }
  }
  return null;
}
