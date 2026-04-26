
/// Helper method for safe boolean parsing
bool? _parseBool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
  }
  return null;
}

class ProfileModel {
  bool? error;
  int? code;
  String? message;
  User? data;

  ProfileModel({this.error, this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
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

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? image;
  String? gender;
  String? email;
  String? phone;
  bool? isActive;
  String? provider;
  List<String>? roles;
  String? providerId;
  String? avatar;
  TenantProfile? tenantProfile;
  LandlordProfile? landlordProfile;
  AgentProfile? agentProfile;
  ServiceVendorProfile? serviceVendorProfile;
  List<UserDocument>? documents;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.image,
    this.gender,
    this.email,
    this.phone,
    this.isActive,
    this.provider,
    this.roles,
    this.providerId,
    this.avatar,
    this.tenantProfile,
    this.landlordProfile,
    this.agentProfile,
    this.serviceVendorProfile,
    this.documents,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    name = json['name']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    image = json['image']?.toString();
    gender = json['gender']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    isActive = _parseBool(json['is_active']);
    provider = json['provider']?.toString();
    roles = (json['roles'] as List?)
        ?.map((e) => e.toString())
        .where((e) => e.trim().isNotEmpty)
        .toList();
    providerId = json['provider_id']?.toString();
    avatar = json['avatar']?.toString();
    tenantProfile = json['tenant_profile'] is Map<String, dynamic>
        ? TenantProfile.fromJson(json['tenant_profile'])
        : null;
    landlordProfile = json['landlord_profile'] is Map<String, dynamic>
        ? LandlordProfile.fromJson(json['landlord_profile'])
        : null;
    agentProfile = json['agent_profile'] is Map<String, dynamic>
        ? AgentProfile.fromJson(json['agent_profile'])
        : null;
    serviceVendorProfile =
        json['service_vendor_profile'] is Map<String, dynamic>
        ? ServiceVendorProfile.fromJson(json['service_vendor_profile'])
        : null;

    documents = (json['documents'] as List?)
        ?.whereType<Map<String, dynamic>>()
        .map((v) => UserDocument.fromJson(v))
        .toList();

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['provider'] = provider;
    data['roles'] = roles;
    data['provider_id'] = providerId;
    data['avatar'] = avatar;
    if (tenantProfile != null) {
      data['tenant_profile'] = tenantProfile!.toJson();
    }
    if (landlordProfile != null) {
      data['landlord_profile'] = landlordProfile!.toJson();
    }
    if (agentProfile != null) {
      data['agent_profile'] = agentProfile!.toJson();
    }
    if (serviceVendorProfile != null) {
      data['service_vendor_profile'] = serviceVendorProfile!.toJson();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TenantProfile {
  int? id;
  String? employmentStatus;
  String? employerName;
  String? jobTitle;
  String? monthlyIncome;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  TenantProfile({
    this.id,
    this.employmentStatus,
    this.employerName,
    this.jobTitle,
    this.monthlyIncome,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  TenantProfile.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    employmentStatus = json['employment_status']?.toString();
    employerName = json['employer_name']?.toString();
    jobTitle = json['job_title']?.toString();
    monthlyIncome = json['monthly_income']?.toString();
    isVerified = _parseBool(json['is_verified']);
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employment_status'] = employmentStatus;
    data['employer_name'] = employerName;
    data['job_title'] = jobTitle;
    data['monthly_income'] = monthlyIncome;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LandlordProfile {
  int? id;
  String? description;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  UserSubscription? subscription;

  LandlordProfile({
    this.id,
    this.description,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  LandlordProfile.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    description = json['description']?.toString();
    isVerified = _parseBool(json['is_verified']);
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    subscription = json['subscription'] is Map<String, dynamic>
        ? UserSubscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class UserSubscription {
  int? id;
  int? userId;
  String? role;
  int? planId;
  String? startDate;
  String? endDate;
  bool? isTrial;
  String? trialEndsAt;
  String? status;
  bool? autoRenew;
  SubscriptionPlanModel? plan;

  UserSubscription({
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
  });

  UserSubscription.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    userId = (json['user_id'] as num?)?.toInt();
    role = json['role']?.toString();
    planId = (json['plan_id'] as num?)?.toInt();
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
    isTrial = json['is_trial'];
    trialEndsAt = json['trial_ends_at']?.toString();
    status = json['status']?.toString();
    autoRenew = _parseBool(json['auto_renew']);
    plan = json['plan'] is Map<String, dynamic>
        ? SubscriptionPlanModel.fromJson(json['plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['role'] = role;
    data['plan_id'] = planId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_trial'] = isTrial;
    data['trial_ends_at'] = trialEndsAt;
    data['status'] = status;
    data['auto_renew'] = autoRenew;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class SubscriptionPlanModel {
  int? id;
  String? forRole;
  String? name;
  num? price;
  String? billingCycle;
  int? trialPeriodDays;
  bool? isActive;
  List<SubscriptionPlanFeature>? features;

  SubscriptionPlanModel({
    this.id,
    this.forRole,
    this.name,
    this.price,
    this.billingCycle,
    this.trialPeriodDays,
    this.isActive,
    this.features,
  });

  SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    forRole = json['for_role']?.toString();
    name = json['name']?.toString();
    price = json['price'] as num?;
    billingCycle = json['billing_cycle']?.toString();
    trialPeriodDays = (json['trial_period_days'] as num?)?.toInt();
    isActive = _parseBool(json['is_active']);
    features = (json['features'] as List?)
        ?.whereType<Map<String, dynamic>>()
        .map((v) => SubscriptionPlanFeature.fromJson(v))
        .toList();
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

class SubscriptionPlanFeature {
  String? title;
  String? value;
  List<String>? features;

  SubscriptionPlanFeature({this.title, this.value, this.features});

  SubscriptionPlanFeature.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    value = json['value']?.toString();
    features = (json['features'] as List?)?.map((e) => e.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['features'] = features;
    return data;
  }
}

class AgentProfile {
  int? id;
  String? agencyName;
  String? abn;
  String? reiaNumber;
  bool? isVerified;
  String? status;
  String? rejectionReason;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  UserSubscription? subscription;

  AgentProfile({
    this.id,
    this.agencyName,
    this.abn,
    this.reiaNumber,
    this.isVerified,
    this.status,
    this.rejectionReason,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  AgentProfile.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    agencyName = json['agency_name']?.toString();
    abn = json['abn']?.toString();
    reiaNumber = json['reia_number']?.toString();
    isVerified = _parseBool(json['is_verified']);
    status = json['status']?.toString();
    rejectionReason = json['rejection_reason']?.toString();
    approvedAt = json['approved_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    subscription = json['subscription'] is Map<String, dynamic>
        ? UserSubscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agency_name'] = agencyName;
    data['abn'] = abn;
    data['reia_number'] = reiaNumber;
    data['is_verified'] = isVerified;
    data['status'] = status;
    data['rejection_reason'] = rejectionReason;
    data['approved_at'] = approvedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class ServiceVendorProfile {
  int? id;
  int? userId;
  String? businessName;
  String? businessType;
  String? abn;
  String? description;
  bool? isVerified;
  String? status;
  String? rejectionReason;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  UserSubscription? subscription;

  ServiceVendorProfile({
    this.id,
    this.userId,
    this.businessName,
    this.businessType,
    this.abn,
    this.description,
    this.isVerified,
    this.status,
    this.rejectionReason,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  ServiceVendorProfile.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    userId = (json['user_id'] as num?)?.toInt();
    businessName = json['business_name']?.toString();
    businessType = json['business_type']?.toString();
    abn = json['abn']?.toString();
    description = json['description']?.toString();
    isVerified = _parseBool(json['is_verified']);
    status = json['status']?.toString();
    rejectionReason = json['rejection_reason']?.toString();
    approvedAt = json['approved_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    subscription = json['subscription'] is Map<String, dynamic>
        ? UserSubscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['business_name'] = businessName;
    data['business_type'] = businessType;
    data['abn'] = abn;
    data['description'] = description;
    data['is_verified'] = isVerified;
    data['status'] = status;
    data['rejection_reason'] = rejectionReason;
    data['approved_at'] = approvedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class UserDocument {
  int? id;
  int? userId;
  String? documentType;
  String? documentNumber;
  String? filePath;
  String? fileUrl;
  String? backFilePath;
  String? backFileUrl;
  String? expiryDate;
  String? status;
  String? rejectionReason;
  bool? isVerified;
  String? verifiedAt;
  String? createdAt;
  String? updatedAt;

  UserDocument({
    this.id,
    this.userId,
    this.documentType,
    this.documentNumber,
    this.filePath,
    this.fileUrl,
    this.backFilePath,
    this.backFileUrl,
    this.expiryDate,
    this.status,
    this.rejectionReason,
    this.isVerified,
    this.verifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserDocument.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    userId = (json['user_id'] as num?)?.toInt();
    documentType = json['document_type']?.toString();
    documentNumber = json['document_number']?.toString();
    filePath = json['file_path']?.toString();
    fileUrl = json['file_url']?.toString();
    backFilePath = json['back_file_path']?.toString();
    backFileUrl = json['back_file_url']?.toString();
    expiryDate = json['expiry_date']?.toString();
    status = json['status']?.toString();
    rejectionReason = json['rejection_reason']?.toString();
    isVerified = _parseBool(json['is_verified']);
    verifiedAt = json['verified_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['document_type'] = documentType;
    data['document_number'] = documentNumber;
    data['file_path'] = filePath;
    data['file_url'] = fileUrl;
    data['back_file_path'] = backFilePath;
    data['back_file_url'] = backFileUrl;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    data['rejection_reason'] = rejectionReason;
    data['is_verified'] = isVerified;
    data['verified_at'] = verifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
