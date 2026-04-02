class MonthlyRevenueModel {
  final bool error;
  final int code;
  final String message;
  final MonthlyRevenueData? data;
  final dynamic errors;

  MonthlyRevenueModel({
    required this.error,
    required this.code,
    required this.message,
    this.data,
    this.errors,
  });

  factory MonthlyRevenueModel.fromJson(Map<String, dynamic> json) {
    return MonthlyRevenueModel(
      error: json['error'] ?? false,
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? MonthlyRevenueData.fromJson(json['data'])
          : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'code': code,
      'message': message,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class MonthlyRevenueData {
  final List<String> labels;
  final List<PropertySeries> series;

  MonthlyRevenueData({required this.labels, required this.series});

  factory MonthlyRevenueData.fromJson(Map<String, dynamic> json) {
    return MonthlyRevenueData(
      labels:
          (json['labels'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      series:
          (json['series'] as List<dynamic>?)
              ?.map((e) => PropertySeries.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'labels': labels, 'series': series.map((e) => e.toJson()).toList()};
  }
}

class PropertySeries {
  final String name;
  final List<double> data;

  PropertySeries({required this.name, required this.data});

  factory PropertySeries.fromJson(Map<String, dynamic> json) {
    return PropertySeries(
      name: json['name'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => (e is int) ? e.toDouble() : e as double)
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'data': data};
  }
}
