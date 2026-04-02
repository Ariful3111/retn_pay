bool _parseBool(dynamic value) {
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return false;
}

class InspectionDetailsModel {
  bool? error;
  int? code;
  String? message;
  InspectionDetailsData? data;
  dynamic errors;

  InspectionDetailsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory InspectionDetailsModel.fromJson(Map<String, dynamic> json) {
    return InspectionDetailsModel(
      error: json['error'] != null ? _parseBool(json['error']) : null,
      code: json['code'] != null ? int.tryParse(json['code'].toString()) : null,
      message: json['message'],
      data: json['data'] != null
          ? InspectionDetailsData.fromJson(json['data'])
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

class InspectionDetailsData {
  int? id;
  int? propertyId;
  dynamic propertyUnitId;
  int? tenantId;
  String? inspectionDate;
  String? type;
  String? status;
  String? notes;
  bool? isApproved;
  dynamic approvedBy;
  dynamic approvedAt;
  dynamic rejectionReason;
  InspectionProperty? property;
  InspectionTenant? tenant;
  dynamic approvedByUser;
  String? createdAt;
  String? updatedAt;

  InspectionDetailsData({
    this.id,
    this.propertyId,
    this.propertyUnitId,
    this.tenantId,
    this.inspectionDate,
    this.type,
    this.status,
    this.notes,
    this.isApproved,
    this.approvedBy,
    this.approvedAt,
    this.rejectionReason,
    this.property,
    this.tenant,
    this.approvedByUser,
    this.createdAt,
    this.updatedAt,
  });

  factory InspectionDetailsData.fromJson(Map<String, dynamic> json) {
    return InspectionDetailsData(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      propertyId: json['property_id'] != null
          ? int.tryParse(json['property_id'].toString())
          : null,
      propertyUnitId: json['property_unit_id'],
      tenantId: json['tenant_id'] != null
          ? int.tryParse(json['tenant_id'].toString())
          : null,
      inspectionDate: json['inspection_date'],
      type: json['type'],
      status: json['status'],
      notes: json['notes'],
      isApproved: json['is_approved'] != null
          ? _parseBool(json['is_approved'])
          : null,
      approvedBy: json['approved_by'],
      approvedAt: json['approved_at'],
      rejectionReason: json['rejection_reason'],
      property: json['property'] != null
          ? InspectionProperty.fromJson(json['property'])
          : null,
      tenant: json['tenant'] != null
          ? InspectionTenant.fromJson(json['tenant'])
          : null,
      approvedByUser: json['approved_by_user'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'property_id': propertyId,
      'property_unit_id': propertyUnitId,
      'tenant_id': tenantId,
      'inspection_date': inspectionDate,
      'type': type,
      'status': status,
      'notes': notes,
      'is_approved': isApproved,
      'approved_by': approvedBy,
      'approved_at': approvedAt,
      'rejection_reason': rejectionReason,
      'property': property?.toJson(),
      'tenant': tenant?.toJson(),
      'approved_by_user': approvedByUser,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class InspectionProperty {
  int? id;
  int? landlordId;
  int? propertyTypeId;
  String? title;
  String? name;
  String? description;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  dynamic latitude;
  dynamic longitude;
  int? bedrooms;
  int? bathrooms;
  int? parkingSpaces;
  String? landSize;
  String? buildingSize;
  int? yearBuilt;
  String? status;
  String? availableFrom;
  bool? isVerified;
  bool? isInPersonInspectionAvailable;
  bool? isVirtualInspectionAvailable;
  bool? isFavourite;
  List<String>? features;
  String? rating;
  int? ratingCount;
  List<InspectionUnit>? units;
  InspectionReviewSummary? reviewSummary;
  String? createdAt;
  String? updatedAt;

  InspectionProperty({
    this.id,
    this.landlordId,
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
    this.bedrooms,
    this.bathrooms,
    this.parkingSpaces,
    this.landSize,
    this.buildingSize,
    this.yearBuilt,
    this.status,
    this.availableFrom,
    this.isVerified,
    this.isInPersonInspectionAvailable,
    this.isVirtualInspectionAvailable,
    this.isFavourite,
    this.features,
    this.rating,
    this.ratingCount,
    this.units,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  });

  factory InspectionProperty.fromJson(Map<String, dynamic> json) {
    return InspectionProperty(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      landlordId: json['landlord_id'] != null
          ? int.tryParse(json['landlord_id'].toString())
          : null,
      propertyTypeId: json['property_type_id'] != null
          ? int.tryParse(json['property_type_id'].toString())
          : null,
      title: json['title'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      bedrooms: json['bedrooms'] != null
          ? int.tryParse(json['bedrooms'].toString())
          : null,
      bathrooms: json['bathrooms'] != null
          ? int.tryParse(json['bathrooms'].toString())
          : null,
      parkingSpaces: json['parking_spaces'] != null
          ? int.tryParse(json['parking_spaces'].toString())
          : null,
      landSize: json['land_size'],
      buildingSize: json['building_size'],
      yearBuilt: json['year_built'] != null
          ? int.tryParse(json['year_built'].toString())
          : null,
      status: json['status'],
      availableFrom: json['available_from'],
      isVerified: json['is_verified'] != null
          ? _parseBool(json['is_verified'])
          : null,
      isInPersonInspectionAvailable:
          json['is_in_person_inspection_available'] != null
          ? _parseBool(json['is_in_person_inspection_available'])
          : null,
      isVirtualInspectionAvailable:
          json['is_virtual_inspection_available'] != null
          ? _parseBool(json['is_virtual_inspection_available'])
          : null,
      isFavourite: json['is_favourite'] != null
          ? _parseBool(json['is_favourite'])
          : null,
      features: json['features'] != null
          ? List<String>.from(json['features'])
          : null,
      rating: json['rating'],
      ratingCount: json['rating_count'] != null
          ? int.tryParse(json['rating_count'].toString())
          : null,
      units: json['units'] != null
          ? (json['units'] as List)
                .map((e) => InspectionUnit.fromJson(e))
                .toList()
          : null,
      reviewSummary: json['review_summary'] != null
          ? InspectionReviewSummary.fromJson(json['review_summary'])
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'landlord_id': landlordId,
      'property_type_id': propertyTypeId,
      'title': title,
      'name': name,
      'description': description,
      'address': address,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'parking_spaces': parkingSpaces,
      'land_size': landSize,
      'building_size': buildingSize,
      'year_built': yearBuilt,
      'status': status,
      'available_from': availableFrom,
      'is_verified': isVerified,
      'is_in_person_inspection_available': isInPersonInspectionAvailable,
      'is_virtual_inspection_available': isVirtualInspectionAvailable,
      'is_favourite': isFavourite,
      'features': features,
      'rating': rating,
      'rating_count': ratingCount,
      'units': units?.map((e) => e.toJson()).toList(),
      'review_summary': reviewSummary?.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class InspectionUnit {
  int? id;
  int? propertyId;
  String? unitNumber;
  String? unitName;
  String? rentAmount;
  InspectionRentType? rentType;
  InspectionCurrency? currency;
  int? displayRentAmount;
  InspectionCurrency? displayCurrency;
  String? status;
  int? bedrooms;
  int? bathrooms;
  String? size;
  String? description;

  InspectionUnit({
    this.id,
    this.propertyId,
    this.unitNumber,
    this.unitName,
    this.rentAmount,
    this.rentType,
    this.currency,
    this.displayRentAmount,
    this.displayCurrency,
    this.status,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.description,
  });

  factory InspectionUnit.fromJson(Map<String, dynamic> json) {
    return InspectionUnit(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      propertyId: json['property_id'] != null
          ? int.tryParse(json['property_id'].toString())
          : null,
      unitNumber: json['unit_number'],
      unitName: json['unit_name'],
      rentAmount: json['rent_amount'],
      rentType: json['rent_type'] != null
          ? InspectionRentType.fromJson(json['rent_type'])
          : null,
      currency: json['currency'] != null
          ? InspectionCurrency.fromJson(json['currency'])
          : null,
      displayRentAmount: json['display_rent_amount'] != null
          ? int.tryParse(json['display_rent_amount'].toString())
          : null,
      displayCurrency: json['display_currency'] != null
          ? InspectionCurrency.fromJson(json['display_currency'])
          : null,
      status: json['status'],
      bedrooms: json['bedrooms'] != null
          ? int.tryParse(json['bedrooms'].toString())
          : null,
      bathrooms: json['bathrooms'] != null
          ? int.tryParse(json['bathrooms'].toString())
          : null,
      size: json['size'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'property_id': propertyId,
      'unit_number': unitNumber,
      'unit_name': unitName,
      'rent_amount': rentAmount,
      'rent_type': rentType?.toJson(),
      'currency': currency?.toJson(),
      'display_rent_amount': displayRentAmount,
      'display_currency': displayCurrency?.toJson(),
      'status': status,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'size': size,
      'description': description,
    };
  }
}

class InspectionRentType {
  int? id;
  String? name;
  String? slug;
  int? rentDays;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  InspectionRentType({
    this.id,
    this.name,
    this.slug,
    this.rentDays,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory InspectionRentType.fromJson(Map<String, dynamic> json) {
    return InspectionRentType(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      name: json['name'],
      slug: json['slug'],
      rentDays: json['rent_days'] != null
          ? int.tryParse(json['rent_days'].toString())
          : null,
      description: json['description'],
      status: json['status'] != null ? _parseBool(json['status']) : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'rent_days': rentDays,
      'description': description,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class InspectionCurrency {
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

  InspectionCurrency({
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

  factory InspectionCurrency.fromJson(Map<String, dynamic> json) {
    return InspectionCurrency(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
      logo: json['logo'],
      type: json['type'],
      decimalPlaces: json['decimal_places'] != null
          ? int.tryParse(json['decimal_places'].toString())
          : null,
      exchangeRate: json['exchange_rate'] != null
          ? int.tryParse(json['exchange_rate'].toString())
          : null,
      isActive: json['is_active'] != null
          ? _parseBool(json['is_active'])
          : null,
      sortOrder: json['sort_order'] != null
          ? int.tryParse(json['sort_order'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'symbol': symbol,
      'logo': logo,
      'type': type,
      'decimal_places': decimalPlaces,
      'exchange_rate': exchangeRate,
      'is_active': isActive,
      'sort_order': sortOrder,
    };
  }
}

class InspectionReviewSummary {
  int? totalReviews;
  String? averageRating;

  InspectionReviewSummary({this.totalReviews, this.averageRating});

  factory InspectionReviewSummary.fromJson(Map<String, dynamic> json) {
    return InspectionReviewSummary(
      totalReviews: json['total_reviews'] != null
          ? int.tryParse(json['total_reviews'].toString())
          : null,
      averageRating: json['average_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'total_reviews': totalReviews, 'average_rating': averageRating};
  }
}

class InspectionTenant {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? email;
  String? phone;
  bool? isActive;
  dynamic provider;
  dynamic providerId;
  List<String>? roles;
  InspectionTenantProfile? tenantProfile;
  List<InspectionDocument>? documents;
  String? createdAt;
  String? updatedAt;

  InspectionTenant({
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

  factory InspectionTenant.fromJson(Map<String, dynamic> json) {
    return InspectionTenant(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      image: json['image'],
      email: json['email'],
      phone: json['phone'],
      isActive: json['is_active'] != null
          ? _parseBool(json['is_active'])
          : null,
      provider: json['provider'],
      providerId: json['provider_id'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      tenantProfile: json['tenant_profile'] != null
          ? InspectionTenantProfile.fromJson(json['tenant_profile'])
          : null,
      documents: json['documents'] != null
          ? (json['documents'] as List)
                .map((e) => InspectionDocument.fromJson(e))
                .toList()
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'image': image,
      'email': email,
      'phone': phone,
      'is_active': isActive,
      'provider': provider,
      'provider_id': providerId,
      'roles': roles,
      'tenant_profile': tenantProfile?.toJson(),
      'documents': documents?.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class InspectionTenantProfile {
  int? id;
  dynamic employmentStatus;
  dynamic employerName;
  dynamic jobTitle;
  dynamic monthlyIncome;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  InspectionTenantProfile({
    this.id,
    this.employmentStatus,
    this.employerName,
    this.jobTitle,
    this.monthlyIncome,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory InspectionTenantProfile.fromJson(Map<String, dynamic> json) {
    return InspectionTenantProfile(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      employmentStatus: json['employment_status'],
      employerName: json['employer_name'],
      jobTitle: json['job_title'],
      monthlyIncome: json['monthly_income'],
      isVerified: json['is_verified'] != null
          ? _parseBool(json['is_verified'])
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employment_status': employmentStatus,
      'employer_name': employerName,
      'job_title': jobTitle,
      'monthly_income': monthlyIncome,
      'is_verified': isVerified,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class InspectionDocument {
  int? id;
  int? userId;
  String? documentType;
  dynamic documentNumber;
  String? filePath;
  String? fileUrl;
  String? backFilePath;
  String? backFileUrl;
  dynamic expiryDate;
  String? status;
  dynamic rejectionReason;
  bool? isVerified;
  dynamic verifiedAt;
  String? createdAt;
  String? updatedAt;

  InspectionDocument({
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

  factory InspectionDocument.fromJson(Map<String, dynamic> json) {
    return InspectionDocument(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      userId: json['user_id'] != null
          ? int.tryParse(json['user_id'].toString())
          : null,
      documentType: json['document_type'],
      documentNumber: json['document_number'],
      filePath: json['file_path'],
      fileUrl: json['file_url'],
      backFilePath: json['back_file_path'],
      backFileUrl: json['back_file_url'],
      expiryDate: json['expiry_date'],
      status: json['status'],
      rejectionReason: json['rejection_reason'],
      isVerified: json['is_verified'] != null
          ? _parseBool(json['is_verified'])
          : null,
      verifiedAt: json['verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'document_type': documentType,
      'document_number': documentNumber,
      'file_path': filePath,
      'file_url': fileUrl,
      'back_file_path': backFilePath,
      'back_file_url': backFileUrl,
      'expiry_date': expiryDate,
      'status': status,
      'rejection_reason': rejectionReason,
      'is_verified': isVerified,
      'verified_at': verifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
