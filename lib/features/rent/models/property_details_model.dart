class PropertyDetailsModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  PropertyDetailsModel({this.error, this.code, this.message, this.data});

  PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
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
  bool? hasArTour;
  bool? isFavourite;
  List<String>? features;
  String? rating;
  int? ratingCount;
  Landlord? landlord;
  Landlord? agent;
  List<Units>? units;
  List<Images>? images;
  List<Amenities>? amenities;
  MaintenanceProfile? maintenanceProfile;
  ReviewSummary? reviewSummary;
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
    this.hasArTour,
    this.isFavourite,
    this.features,
    this.rating,
    this.ratingCount,
    this.landlord,
    this.agent,
    this.units,
    this.images,
    this.amenities,
    this.maintenanceProfile,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landlordId = json['landlord_id'];
    agentId = json['agent_id'];
    propertyTypeId = json['property_type_id'];
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
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parkingSpaces = json['parking_spaces'];
    landSize = json['land_size'].toString();
    buildingSize = json['building_size'];
    yearBuilt = json['year_built'];
    status = json['status'];
    subscriptionTier = json['subscription_tier'];
    isVerified = json['is_verified'];
    hasArTour = json['has_ar_tour'];
    isFavourite = json['is_favourite'];
    features = json['features'].cast<String>();
    rating = json['rating'];
    ratingCount = json['rating_count'];
    landlord = json['landlord'] != null
        ? Landlord.fromJson(json['landlord'])
        : null;
    agent = json['agent'] != null ? Landlord.fromJson(json['agent']) : null;
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

    maintenanceProfile = json['maintenance_profile'] != null
        ? MaintenanceProfile.fromJson(json['maintenance_profile'])
        : null;
    reviewSummary = json['review_summary'] != null
        ? ReviewSummary.fromJson(json['review_summary'])
        : null;

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
    data['has_ar_tour'] = hasArTour;
    data['is_favourite'] = isFavourite;
    data['features'] = features;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    if (landlord != null) {
      data['landlord'] = landlord!.toJson();
    }
    if (agent != null) {
      data['agent'] = agent!.toJson();
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

    if (maintenanceProfile != null) {
      data['maintenance_profile'] = maintenanceProfile!.toJson();
    }
    if (reviewSummary != null) {
      data['review_summary'] = reviewSummary!.toJson();
    }
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

  PropertyType({this.id, this.name, this.slug, this.image});

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}

class Landlord {
  int? id;
  String? name;
  String? email;

  Landlord({this.id, this.name, this.email});

  Landlord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    id = json['id'];
    propertyId = json['property_id'];
    unitNumber = json['unit_number'];
    unitName = json['unit_name'];
    rentAmount = json['rent_amount'];
    currency = json['currency'];
    status = json['status'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    size = json['size'];
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
    data['currency'] = currency;
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
    id = json['id'];
    propertyId = json['property_id'];
    imagePath = json['image_path'];
    type = json['type'];
    order = json['order'];
    isPrimary = json['is_primary'];
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
    id = json['id'];
    propertyId = json['property_id'];
    amenityTypeId = json['amenity_type_id'];
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
  String? description;

  AmenityType({this.id, this.name, this.slug, this.icon, this.description});

  AmenityType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['description'] = description;
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
    id = json['id'];
    propertyId = json['property_id'];
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
    deletedAt = json['deleted_at'].toString();
    createdBy = json['created_by'].toString();
    updatedBy = json['updated_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
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
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    return data;
  }
}
