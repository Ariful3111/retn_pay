class PlanModel {
  bool? error;
  int? code;
  String? message;
  List<Plan>? data;

  PlanModel({this.error, this.code, this.message, this.data});

  PlanModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Plan>[];
      json['data'].forEach((v) {
        data!.add(Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  int? id;
  String? forRole;
  String? name;
  int? price;
  String? billingCycle;
  int? trialPeriodDays;
  bool? isActive;
  List<PlanFeature>? features;

  Plan({
    this.id,
    this.forRole,
    this.name,
    this.price,
    this.billingCycle,
    this.trialPeriodDays,
    this.isActive,
    this.features,
  });

  Plan.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    forRole = json['for_role']?.toString();
    name = json['name']?.toString();
    price = int.tryParse(json['price']?.toString() ?? '');
    billingCycle = json['billing_cycle']?.toString();
    trialPeriodDays = int.tryParse(json['trial_period_days']?.toString() ?? '');
    isActive = json['is_active'] == true;

    final rawFeatures = json['features'];
    if (rawFeatures is List) {
      features = <PlanFeature>[];
      for (final v in rawFeatures) {
        if (v is Map<String, dynamic>) {
          features!.add(PlanFeature.fromJson(v));
        } else if (v != null) {
          features!.add(PlanFeature(title: v.toString()));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['for_role'] = forRole;
    data['name'] = name;
    data['price'] = price;
    data['billing_cycle'] = billingCycle;
    data['trial_period_days'] = trialPeriodDays;
    data['is_active'] = isActive;
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanFeature {
  String? title;
  String? value;
  List<String>? features;

  PlanFeature({this.title, this.value, this.features});

  PlanFeature.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value']?.toString();
    if (json['features'] != null) {
      features = <String>[];
      json['features'].forEach((v) {
        features!.add(v.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['features'] = features;
    return data;
  }
}
