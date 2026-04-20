class PropertyDetailsModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  PropertyDetailsModel({this.error, this.code, this.message, this.data});

  PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    error = _parseBool(json['error']);
    code = _parseInt(json['code']);
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
  int? id;
  int? landlordId;
  int? agentId;
  int? propertyTypeId;
  String? title;
  String? name;
  String? description;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? latitude;
  String? longitude;
  PropertyType? propertyType;
  int? bedrooms;
  int? bathrooms;
  int? parkingSpaces;
  String? landSize;
  String? buildingSize;
  int? yearBuilt;
  String? status;
  String? subscriptionTier;
  bool? isVerified;
  bool? isInPersonInspectionAvailable;
  bool? isVirtualInspectionAvailable;
  bool? hasArTour;
  bool? isFavourite;
  bool? hasActiveInspectionRequest;
  bool? isInspected;
  String? availableFrom;
  List<dynamic>? leaseAgreementDefaults;
  List<String>? features;
  String? rating;
  int? ratingCount;
  Landlord? landlord;
  Landlord? agent;
  List<AssignedAgent>? assignedAgents;
  List<Units>? units;
  List<Images>? images;
  List<Amenities>? amenities;
  List<Documents>? documents;
  MaintenanceProfile? maintenanceProfile;
  ReviewSummary? reviewSummary;
  dynamic myReview;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.landlordId,
    this.agentId,
    this.propertyTypeId,
    this.title,
    this.name,
    this.description,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.latitude,
    this.longitude,
    this.propertyType,
    this.bedrooms,
    this.bathrooms,
    this.parkingSpaces,
    this.landSize,
    this.buildingSize,
    this.yearBuilt,
    this.status,
    this.subscriptionTier,
    this.isVerified,
    this.isInPersonInspectionAvailable,
    this.isVirtualInspectionAvailable,
    this.hasArTour,
    this.isFavourite,
    this.hasActiveInspectionRequest,
    this.isInspected,
    this.availableFrom,
    this.leaseAgreementDefaults,
    this.features,
    this.rating,
    this.ratingCount,
    this.landlord,
    this.agent,
    this.assignedAgents,
    this.units,
    this.images,
    this.amenities,
    this.documents,
    this.maintenanceProfile,
    this.reviewSummary,
    this.myReview,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    landlordId = _parseInt(json['landlord_id']);
    agentId = _parseInt(json['agent_id']);
    propertyTypeId = _parseInt(json['property_type_id']);
    title = json['title'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyType = json['property_type'] != null
        ? PropertyType.fromJson(json['property_type'])
        : null;
    bedrooms = _parseInt(json['bedrooms']);
    bathrooms = _parseInt(json['bathrooms']);
    parkingSpaces = _parseInt(json['parking_spaces']);
    landSize = json['land_size']?.toString();
    buildingSize = json['building_size']?.toString();
    yearBuilt = _parseInt(json['year_built']);
    status = json['status'];
    subscriptionTier = json['subscription_tier'];
    isVerified = _parseBool(json['is_verified']);
    isInPersonInspectionAvailable = _parseBool(
      json['is_in_person_inspection_available'],
    );
    isVirtualInspectionAvailable = _parseBool(
      json['is_virtual_inspection_available'],
    );
    hasArTour = _parseBool(json['has_ar_tour']);
    isFavourite = _parseBool(json['is_favourite']);
    hasActiveInspectionRequest = _parseBool(
      json['has_active_inspection_request'],
    );
    isInspected = _parseBool(json['is_inspected']);
    availableFrom = json['available_from'];
    if (json['lease_agreement_defaults'] != null &&
        json['lease_agreement_defaults'] is List) {
      leaseAgreementDefaults = json['lease_agreement_defaults'];
    }
    if (json['features'] != null && json['features'] is List) {
      features = json['features']
          .map((e) => e?.toString())
          .whereType<String>()
          .toList();
    }
    rating = json['rating']?.toString();
    ratingCount = _parseInt(json['rating_count']);
    landlord = json['landlord'] != null
        ? Landlord.fromJson(json['landlord'])
        : null;
    agent = json['agent'] != null ? Landlord.fromJson(json['agent']) : null;
    if (json['assigned_agents'] != null && json['assigned_agents'] is List) {
      assignedAgents = <AssignedAgent>[];
      json['assigned_agents'].forEach((v) {
        assignedAgents!.add(AssignedAgent.fromJson(v));
      });
    }
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(Units.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }

    maintenanceProfile = json['maintenance_profile'] != null
        ? MaintenanceProfile.fromJson(json['maintenance_profile'])
        : null;
    reviewSummary = json['review_summary'] != null
        ? ReviewSummary.fromJson(json['review_summary'])
        : null;
    myReview = json['my_review'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['landlord_id'] = landlordId;
    data['agent_id'] = agentId;
    data['property_type_id'] = propertyTypeId;
    data['title'] = title;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (propertyType != null) {
      data['property_type'] = propertyType!.toJson();
    }
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['parking_spaces'] = parkingSpaces;
    data['land_size'] = landSize;
    data['building_size'] = buildingSize;
    data['year_built'] = yearBuilt;
    data['status'] = status;
    data['subscription_tier'] = subscriptionTier;
    data['is_verified'] = isVerified;
    data['is_in_person_inspection_available'] = isInPersonInspectionAvailable;
    data['is_virtual_inspection_available'] = isVirtualInspectionAvailable;
    data['has_ar_tour'] = hasArTour;
    data['is_favourite'] = isFavourite;
    data['has_active_inspection_request'] = hasActiveInspectionRequest;
    data['is_inspected'] = isInspected;
    data['available_from'] = availableFrom;
    data['lease_agreement_defaults'] = leaseAgreementDefaults;
    data['features'] = features;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    if (landlord != null) {
      data['landlord'] = landlord!.toJson();
    }
    if (agent != null) {
      data['agent'] = agent!.toJson();
    }
    if (assignedAgents != null) {
      data['assigned_agents'] = assignedAgents!.map((v) => v.toJson()).toList();
    }
    if (units != null) {
      data['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }

    if (maintenanceProfile != null) {
      data['maintenance_profile'] = maintenanceProfile!.toJson();
    }
    if (reviewSummary != null) {
      data['review_summary'] = reviewSummary!.toJson();
    }
    data['my_review'] = myReview;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PropertyType {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  PropertyType({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    status = _parseBool(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Landlord {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? email;
  String? phone;
  bool? isActive;
  String? provider;
  String? providerId;
  List<String>? roles;
  TenantProfile? tenantProfile;
  List<dynamic>? documents;
  String? createdAt;
  String? updatedAt;

  Landlord({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.email,
    this.phone,
    this.isActive,
    this.provider,
    this.providerId,
    this.roles,
    this.tenantProfile,
    this.documents,
    this.createdAt,
    this.updatedAt,
  });

  Landlord.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    isActive = _parseBool(json['is_active']);
    provider = json['provider']?.toString();
    providerId = json['provider_id']?.toString();
    if (json['roles'] != null && json['roles'] is List) {
      roles = json['roles']
          .map((e) => e?.toString())
          .whereType<String>()
          .toList();
    }
    tenantProfile = json['tenant_profile'] != null
        ? TenantProfile.fromJson(json['tenant_profile'])
        : null;
    if (json['documents'] != null && json['documents'] is List) {
      documents = json['documents'];
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['email'] = email;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['provider'] = provider;
    data['provider_id'] = providerId;
    data['roles'] = roles;
    if (tenantProfile != null) {
      data['tenant_profile'] = tenantProfile!.toJson();
    }
    data['documents'] = documents;
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
    id = _parseInt(json['id']);
    employmentStatus = json['employment_status'];
    employerName = json['employer_name'];
    jobTitle = json['job_title'];
    monthlyIncome = json['monthly_income']?.toString();
    isVerified = _parseBool(json['is_verified']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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

class AssignedAgent {
  int? id;
  int? userId;
  String? name;
  String? email;

  AssignedAgent({this.id, this.userId, this.name, this.email});

  AssignedAgent.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    userId = _parseInt(json['user_id']);
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Units {
  int? id;
  int? propertyId;
  String? unitNumber;
  String? unitName;
  String? rentAmount;
  RentType? rentType;
  Currency? currencyObj;
  int? displayRentAmount;
  Currency? displayCurrency;
  String? currency;
  String? status;
  int? bedrooms;
  int? bathrooms;
  String? size;
  String? description;
  String? createdAt;
  String? updatedAt;

  Units({
    this.id,
    this.propertyId,
    this.unitNumber,
    this.unitName,
    this.rentAmount,
    this.rentType,
    this.currencyObj,
    this.displayRentAmount,
    this.displayCurrency,
    this.currency,
    this.status,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Units.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    propertyId = _parseInt(json['property_id']);
    unitNumber = json['unit_number'];
    unitName = json['unit_name'];
    rentAmount = json['rent_amount']?.toString();
    rentType = json['rent_type'] != null
        ? RentType.fromJson(json['rent_type'])
        : null;

    final dynamic currencyValue = json['currency'];
    if (currencyValue is Map<String, dynamic>) {
      currencyObj = Currency.fromJson(currencyValue);
      currency = currencyObj?.code;
    } else if (currencyValue is String) {
      currency = currencyValue;
    }

    displayRentAmount = _parseInt(json['display_rent_amount']);

    final dynamic displayCurrencyValue = json['display_currency'];
    if (displayCurrencyValue is Map<String, dynamic>) {
      displayCurrency = Currency.fromJson(displayCurrencyValue);
    }
    status = json['status'];
    bedrooms = _parseInt(json['bedrooms']);
    bathrooms = _parseInt(json['bathrooms']);
    size = json['size']?.toString();
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['unit_number'] = unitNumber;
    data['unit_name'] = unitName;
    data['rent_amount'] = rentAmount;
    if (rentType != null) {
      data['rent_type'] = rentType!.toJson();
    }
    if (currencyObj != null) {
      data['currency'] = currencyObj!.toJson();
    } else {
      data['currency'] = currency;
    }
    data['display_rent_amount'] = displayRentAmount;
    if (displayCurrency != null) {
      data['display_currency'] = displayCurrency!.toJson();
    }
    data['status'] = status;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['size'] = size;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RentType {
  int? id;
  String? name;
  String? slug;
  int? rentDays;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  RentType({
    this.id,
    this.name,
    this.slug,
    this.rentDays,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  RentType.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    rentDays = _parseInt(json['rent_days']);
    description = json['description'];
    status = _parseBool(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['rent_days'] = rentDays;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Currency {
  int? id;
  String? code;
  String? name;
  String? symbol;
  String? logo;
  String? type;
  int? decimalPlaces;
  int? exchangeRate;
  bool? isActive;
  int? sortOrder;

  Currency({
    this.id,
    this.code,
    this.name,
    this.symbol,
    this.logo,
    this.type,
    this.decimalPlaces,
    this.exchangeRate,
    this.isActive,
    this.sortOrder,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
    logo = json['logo'];
    type = json['type'];
    decimalPlaces = _parseInt(json['decimal_places']);
    exchangeRate = _parseInt(json['exchange_rate']);
    isActive = _parseBool(json['is_active']);
    sortOrder = _parseInt(json['sort_order']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    data['logo'] = logo;
    data['type'] = type;
    data['decimal_places'] = decimalPlaces;
    data['exchange_rate'] = exchangeRate;
    data['is_active'] = isActive;
    data['sort_order'] = sortOrder;
    return data;
  }
}

class Documents {
  int? id;
  int? propertyId;
  String? documentType;
  String? filePath;
  String? fileName;
  String? mimeType;
  int? fileSize;
  bool? isVerified;
  String? verifiedAt;
  int? verifiedBy;
  String? verificationNotes;
  String? createdAt;
  String? updatedAt;

  Documents({
    this.id,
    this.propertyId,
    this.documentType,
    this.filePath,
    this.fileName,
    this.mimeType,
    this.fileSize,
    this.isVerified,
    this.verifiedAt,
    this.verifiedBy,
    this.verificationNotes,
    this.createdAt,
    this.updatedAt,
  });

  Documents.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    propertyId = _parseInt(json['property_id']);
    documentType = json['document_type'];
    filePath = json['file_path'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    fileSize = _parseInt(json['file_size']);
    isVerified = _parseBool(json['is_verified']);
    verifiedAt = json['verified_at']?.toString();
    verifiedBy = _parseInt(json['verified_by']);
    verificationNotes = json['verification_notes']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['document_type'] = documentType;
    data['file_path'] = filePath;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['file_size'] = fileSize;
    data['is_verified'] = isVerified;
    data['verified_at'] = verifiedAt;
    data['verified_by'] = verifiedBy;
    data['verification_notes'] = verificationNotes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Images {
  int? id;
  int? propertyId;
  String? imagePath;
  String? type;
  int? order;
  bool? isPrimary;
  String? caption;
  String? createdAt;
  String? updatedAt;

  Images({
    this.id,
    this.propertyId,
    this.imagePath,
    this.type,
    this.order,
    this.isPrimary,
    this.caption,
    this.createdAt,
    this.updatedAt,
  });

  Images.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    propertyId = _parseInt(json['property_id']);
    imagePath = json['image_path'];
    type = json['type'];
    order = _parseInt(json['order']);
    isPrimary = _parseBool(json['is_primary']);
    caption = json['caption'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['image_path'] = imagePath;
    data['type'] = type;
    data['order'] = order;
    data['is_primary'] = isPrimary;
    data['caption'] = caption;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Amenities {
  int? id;
  int? propertyId;
  int? amenityTypeId;
  AmenityType? amenityType;
  String? createdAt;
  String? updatedAt;

  Amenities({
    this.id,
    this.propertyId,
    this.amenityTypeId,
    this.amenityType,
    this.createdAt,
    this.updatedAt,
  });

  Amenities.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    propertyId = _parseInt(json['property_id']);
    amenityTypeId = _parseInt(json['amenity_type_id']);
    amenityType = json['amenity_type'] != null
        ? AmenityType.fromJson(json['amenity_type'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['amenity_type_id'] = amenityTypeId;
    if (amenityType != null) {
      data['amenity_type'] = amenityType!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AmenityType {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? iconUrl;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  AmenityType({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.iconUrl,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  AmenityType.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    iconUrl = json['icon_url'];
    description = json['description'];
    status = _parseBool(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['icon_url'] = iconUrl;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MaintenanceProfile {
  int? id;
  int? propertyId;
  String? fireAlarmDate;
  String? fireAlarmExpiry;
  String? electricalCertDate;
  String? electricalCertExpiry;
  String? plumbingCertDate;
  String? plumbingCertExpiry;
  String? gasSafetyDate;
  String? gasSafetyExpiry;
  String? buildingInspectionDate;
  String? buildingInspectionExpiry;
  String? notes;
  String? deletedAt;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  MaintenanceProfile({
    this.id,
    this.propertyId,
    this.fireAlarmDate,
    this.fireAlarmExpiry,
    this.electricalCertDate,
    this.electricalCertExpiry,
    this.plumbingCertDate,
    this.plumbingCertExpiry,
    this.gasSafetyDate,
    this.gasSafetyExpiry,
    this.buildingInspectionDate,
    this.buildingInspectionExpiry,
    this.notes,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  MaintenanceProfile.fromJson(Map<String, dynamic> json) {
    id = _parseInt(json['id']);
    propertyId = _parseInt(json['property_id']);
    fireAlarmDate = json['fire_alarm_date'];
    fireAlarmExpiry = json['fire_alarm_expiry'];
    electricalCertDate = json['electrical_cert_date'];
    electricalCertExpiry = json['electrical_cert_expiry'];
    plumbingCertDate = json['plumbing_cert_date'];
    plumbingCertExpiry = json['plumbing_cert_expiry'];
    gasSafetyDate = json['gas_safety_date'];
    gasSafetyExpiry = json['gas_safety_expiry'];
    buildingInspectionDate = json['building_inspection_date'];
    buildingInspectionExpiry = json['building_inspection_expiry'];
    notes = json['notes'];
    deletedAt = json['deleted_at']?.toString();
    createdBy = json['created_by']?.toString();
    updatedBy = json['updated_by']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['fire_alarm_date'] = fireAlarmDate;
    data['fire_alarm_expiry'] = fireAlarmExpiry;
    data['electrical_cert_date'] = electricalCertDate;
    data['electrical_cert_expiry'] = electricalCertExpiry;
    data['plumbing_cert_date'] = plumbingCertDate;
    data['plumbing_cert_expiry'] = plumbingCertExpiry;
    data['gas_safety_date'] = gasSafetyDate;
    data['gas_safety_expiry'] = gasSafetyExpiry;
    data['building_inspection_date'] = buildingInspectionDate;
    data['building_inspection_expiry'] = buildingInspectionExpiry;
    data['notes'] = notes;
    data['deleted_at'] = deletedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ReviewSummary {
  int? totalReviews;
  String? averageRating;

  ReviewSummary({this.totalReviews, this.averageRating});

  ReviewSummary.fromJson(Map<String, dynamic> json) {
    totalReviews = _parseInt(json['total_reviews']);
    averageRating = json['average_rating']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    return data;
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
