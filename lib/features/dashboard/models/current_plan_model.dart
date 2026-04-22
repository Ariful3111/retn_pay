class CurrentPlanModel {
  bool? error;
  int? code;
  String? message;
  List<CurrentSubscription>? data;
  dynamic errors;

  CurrentPlanModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  CurrentPlanModel.fromJson(Map<String, dynamic> json) {
    error = _parseBool(json['error']);
    code = _parseInt(json['code']);
    message = json['message']?.toString();

    if (json['data'] is List) {
      data = (json['data'] as List)
          .whereType<Map<String, dynamic>>()
          .map((v) => CurrentSubscription.fromJson(v))
          .toList();
    }

    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    json['errors'] = errors;
    return json;
  }
}

class CurrentSubscription {
  int? id;
  int? userId;
  String? role;
  int? planId;
  String? startDate;
  String? endDate;
  bool? isTrial;
  dynamic trialEndsAt;
  String? status;
  bool? autoRenew;
  SubscriptionPlan? plan;
  SubscriptionPlan? suggestedUpgradePlan;

  CurrentSubscription({
    this.id,
    this.userId,
    this.role,
    this.planId,
    this.startDate,
    this.endDate,
    this.isTrial,
    this.trialEndsAt,
    this.status,
    this.autoRenew,
    this.plan,
    this.suggestedUpgradePlan,
  });

  CurrentSubscription.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    userId = _parseInt(json['user_id']);
    role = json['role']?.toString();
    planId = _parseInt(json['plan_id']);
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
    isTrial = _parseBool(json['is_trial']);
    trialEndsAt = json['trial_ends_at'];
    status = json['status']?.toString();
    autoRenew = _parseBool(json['auto_renew']);

    final planJson = json['plan'];
    if (planJson is Map<String, dynamic>) {
      plan = SubscriptionPlan.fromJson(planJson);
    }

    final suggestedUpgradeJson = json['suggested_upgrade_plan'];
    if (suggestedUpgradeJson is Map<String, dynamic>) {
      suggestedUpgradePlan = SubscriptionPlan.fromJson(suggestedUpgradeJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['role'] = role;
    json['plan_id'] = planId;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['is_trial'] = isTrial;
    json['trial_ends_at'] = trialEndsAt;
    json['status'] = status;
    json['auto_renew'] = autoRenew;
    if (plan != null) {
      json['plan'] = plan!.toJson();
    }
    if (suggestedUpgradePlan != null) {
      json['suggested_upgrade_plan'] = suggestedUpgradePlan!.toJson();
    }
    return json;
  }
}

class SubscriptionPlan {
  int? id;
  String? forRole;
  String? name;
  num? price;
  String? billingCycle;
  int? trialPeriodDays;
  bool? isActive;
  List<PlanFeature>? features;

  SubscriptionPlan({
    this.id,
    this.forRole,
    this.name,
    this.price,
    this.billingCycle,
    this.trialPeriodDays,
    this.isActive,
    this.features,
  });

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    forRole = json['for_role']?.toString();
    name = json['name']?.toString();
    price = _parseNum(json['price']);
    billingCycle = json['billing_cycle']?.toString();
    trialPeriodDays = _parseInt(json['trial_period_days']);
    isActive = _parseBool(json['is_active']);

    if (json['features'] is List) {
      features = (json['features'] as List)
          .whereType<Map<String, dynamic>>()
          .map((v) => PlanFeature.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['for_role'] = forRole;
    json['name'] = name;
    json['price'] = price;
    json['billing_cycle'] = billingCycle;
    json['trial_period_days'] = trialPeriodDays;
    json['is_active'] = isActive;
    if (features != null) {
      json['features'] = features!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class PlanFeature {
  String? title;
  String? value;
  List<String>? features;

  PlanFeature({this.title, this.value, this.features});

  PlanFeature.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    value = json['value']?.toString();

    if (json['features'] is List) {
      features = (json['features'] as List)
          .map((e) => e.toString())
          .where((e) => e.trim().isNotEmpty)
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['value'] = value;
    json['features'] = features;
    return json;
  }
}

bool? _parseBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
  }
  return null;
}

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

num? _parseNum(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) {
    return num.tryParse(value);
  }
  return null;
}
