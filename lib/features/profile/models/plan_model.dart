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
  List<String>? features;

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
    id = json['id'];
    forRole = json['for_role'];
    name = json['name'];
    price = json['price'];
    billingCycle = json['billing_cycle'];
    trialPeriodDays = json['trial_period_days'];
    isActive = json['is_active'];
    features = json['features'].cast<String>();
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
    data['features'] = features;
    return data;
  }
}
