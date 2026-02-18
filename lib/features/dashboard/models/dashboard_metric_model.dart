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
  int? totalRentPaid;

  Data({
    this.inspectionRequests,
    this.applicationsSubmitted,
    this.repairRequests,
    this.pendingRentCount,
    this.overdueRentCount,
    this.role,
    this.totalRentPaid,
  });

  Data.fromJson(Map<String, dynamic> json) {
    inspectionRequests = json['inspection_requests'];
    applicationsSubmitted = json['applications_submitted'];
    repairRequests = json['repair_requests'];
    pendingRentCount = json['pending_rent_count'];
    overdueRentCount = json['overdue_rent_count'];
    role = json['role'];
    totalRentPaid = json['total_rent_paid'];
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
    return data;
  }
}
