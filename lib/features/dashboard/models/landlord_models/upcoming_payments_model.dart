class UpcomingPaymentsModel {
  bool? error;
  int? code;
  String? message;
  List<UpcomingPayment>? data;
  dynamic errors;

  UpcomingPaymentsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  UpcomingPaymentsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is List) {
      data = dataJson
          .whereType<Map<String, dynamic>>()
          .map((v) => UpcomingPayment.fromJson(v))
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

class UpcomingPayment {
  int? id;
  int? leaseAgreementId;
  int? rentTypeId;
  String? amount;
  String? nextPaymentDate;
  bool? autoPayEnabled;
  String? frequency;
  String? endDate;
  LeaseAgreement? leaseAgreement;
  RentType? rentType;
  String? createdAt;
  String? updatedAt;

  UpcomingPayment({
    this.id,
    this.leaseAgreementId,
    this.rentTypeId,
    this.amount,
    this.nextPaymentDate,
    this.autoPayEnabled,
    this.frequency,
    this.endDate,
    this.leaseAgreement,
    this.rentType,
    this.createdAt,
    this.updatedAt,
  });

  UpcomingPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaseAgreementId = json['lease_agreement_id'];
    rentTypeId = json['rent_type_id'];
    amount = json['amount']?.toString();
    nextPaymentDate = json['next_payment_date']?.toString();
    autoPayEnabled = json['auto_pay_enabled'];
    frequency = json['frequency']?.toString();
    endDate = json['end_date']?.toString();

    final leaseAgreementJson = json['lease_agreement'];
    if (leaseAgreementJson is Map<String, dynamic>) {
      leaseAgreement = LeaseAgreement.fromJson(leaseAgreementJson);
    }

    final rentTypeJson = json['rent_type'];
    if (rentTypeJson is Map<String, dynamic>) {
      rentType = RentType.fromJson(rentTypeJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['lease_agreement_id'] = leaseAgreementId;
    json['rent_type_id'] = rentTypeId;
    json['amount'] = amount;
    json['next_payment_date'] = nextPaymentDate;
    json['auto_pay_enabled'] = autoPayEnabled;
    json['frequency'] = frequency;
    json['end_date'] = endDate;
    if (leaseAgreement != null) {
      json['lease_agreement'] = leaseAgreement!.toJson();
    }
    if (rentType != null) {
      json['rent_type'] = rentType!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class LeaseAgreement {
  int? id;
  int? tenantId;
  int? landlordId;
  int? propertyId;
  int? propertyUnitId;
  String? status;
  String? startDate;
  String? endDate;
  int? durationYears;
  int? durationMonths;
  String? rentAmount;
  String? currency;
  int? currencyId;
  String? paymentFrequency;
  int? rentTypeId;
  int? bondAmount;
  CurrencyDetail? currencyDetail;
  RentType? rentType;
  dynamic signedAt;
  String? terms;
  dynamic rejectionReason;
  AgreementDetails? agreementDetails;
  String? inclusions;
  int? keysCount;
  Property? property;
  PropertyUnit? propertyUnit;
  String? createdAt;

  LeaseAgreement({
    this.id,
    this.tenantId,
    this.landlordId,
    this.propertyId,
    this.propertyUnitId,
    this.status,
    this.startDate,
    this.endDate,
    this.durationYears,
    this.durationMonths,
    this.rentAmount,
    this.currency,
    this.currencyId,
    this.paymentFrequency,
    this.rentTypeId,
    this.bondAmount,
    this.currencyDetail,
    this.rentType,
    this.signedAt,
    this.terms,
    this.rejectionReason,
    this.agreementDetails,
    this.inclusions,
    this.keysCount,
    this.property,
    this.propertyUnit,
    this.createdAt,
  });

  LeaseAgreement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    landlordId = json['landlord_id'];
    propertyId = json['property_id'];
    propertyUnitId = json['property_unit_id'];
    status = json['status']?.toString();
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
    durationYears = json['duration_years'];
    durationMonths = json['duration_months'];
    rentAmount = json['rent_amount']?.toString();
    currency = json['currency']?.toString();
    currencyId = json['currency_id'];
    paymentFrequency = json['payment_frequency']?.toString();
    rentTypeId = json['rent_type_id'];
    bondAmount = json['bond_amount'];
    signedAt = json['signed_at'];
    terms = json['terms']?.toString();
    rejectionReason = json['rejection_reason'];

    final agreementDetailsJson = json['agreement_details'];
    if (agreementDetailsJson is Map<String, dynamic>) {
      agreementDetails = AgreementDetails.fromJson(agreementDetailsJson);
    }

    inclusions = json['inclusions']?.toString();
    keysCount = json['keys_count'];

    final currencyDetailJson = json['currency_detail'];
    if (currencyDetailJson is Map<String, dynamic>) {
      currencyDetail = CurrencyDetail.fromJson(currencyDetailJson);
    }

    final rentTypeJson = json['rent_type'];
    if (rentTypeJson is Map<String, dynamic>) {
      rentType = RentType.fromJson(rentTypeJson);
    }

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = Property.fromJson(propertyJson);
    }

    final propertyUnitJson = json['property_unit'];
    if (propertyUnitJson is Map<String, dynamic>) {
      propertyUnit = PropertyUnit.fromJson(propertyUnitJson);
    }

    createdAt = json['created_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['tenant_id'] = tenantId;
    json['landlord_id'] = landlordId;
    json['property_id'] = propertyId;
    json['property_unit_id'] = propertyUnitId;
    json['status'] = status;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['duration_years'] = durationYears;
    json['duration_months'] = durationMonths;
    json['rent_amount'] = rentAmount;
    json['currency'] = currency;
    json['currency_id'] = currencyId;
    json['payment_frequency'] = paymentFrequency;
    json['rent_type_id'] = rentTypeId;
    json['bond_amount'] = bondAmount;
    if (currencyDetail != null) {
      json['currency_detail'] = currencyDetail!.toJson();
    }
    if (rentType != null) {
      json['rent_type'] = rentType!.toJson();
    }
    json['signed_at'] = signedAt;
    json['terms'] = terms;
    json['rejection_reason'] = rejectionReason;
    if (agreementDetails != null) {
      json['agreement_details'] = agreementDetails!.toJson();
    }
    json['inclusions'] = inclusions;
    json['keys_count'] = keysCount;
    if (property != null) {
      json['property'] = property!.toJson();
    }
    if (propertyUnit != null) {
      json['property_unit'] = propertyUnit!.toJson();
    }
    json['created_at'] = createdAt;
    return json;
  }
}

class CurrencyDetail {
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

  CurrencyDetail({
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

  CurrencyDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code']?.toString();
    name = json['name']?.toString();
    symbol = json['symbol']?.toString();
    logo = json['logo']?.toString();
    type = json['type']?.toString();
    decimalPlaces = json['decimal_places'];
    exchangeRate = json['exchange_rate'];
    isActive = json['is_active'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['name'] = name;
    json['symbol'] = symbol;
    json['logo'] = logo;
    json['type'] = type;
    json['decimal_places'] = decimalPlaces;
    json['exchange_rate'] = exchangeRate;
    json['is_active'] = isActive;
    json['sort_order'] = sortOrder;
    return json;
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
    id = json['id'];
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    rentDays = json['rent_days'];
    description = json['description']?.toString();
    status = json['status'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['rent_days'] = rentDays;
    json['description'] = description;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class Property {
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
  bool? isVerified;
  bool? isInPersonInspectionAvailable;
  bool? isVirtualInspectionAvailable;
  bool? isFavourite;
  List<dynamic>? features;
  dynamic leaseAgreementDefaults;
  String? rating;
  int? ratingCount;
  List<dynamic>? units;
  dynamic reviewSummary;
  String? createdAt;
  String? updatedAt;

  Property({
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
    this.isVerified,
    this.isInPersonInspectionAvailable,
    this.isVirtualInspectionAvailable,
    this.isFavourite,
    this.features,
    this.leaseAgreementDefaults,
    this.rating,
    this.ratingCount,
    this.units,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  });

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landlordId = json['landlord_id'];
    propertyTypeId = json['property_type_id'];
    title = json['title']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    state = json['state']?.toString();
    postalCode = json['postal_code']?.toString();
    country = json['country']?.toString();
    latitude = json['latitude'];
    longitude = json['longitude'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parkingSpaces = json['parking_spaces'];
    landSize = json['land_size']?.toString();
    buildingSize = json['building_size']?.toString();
    yearBuilt = json['year_built'];
    status = json['status']?.toString();
    isVerified = json['is_verified'];
    isInPersonInspectionAvailable = json['is_in_person_inspection_available'];
    isVirtualInspectionAvailable = json['is_virtual_inspection_available'];
    isFavourite = json['is_favourite'];
    features = json['features'];
    leaseAgreementDefaults = json['lease_agreement_defaults'];
    rating = json['rating']?.toString();
    ratingCount = json['rating_count'];
    units = json['units'];
    reviewSummary = json['review_summary'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['landlord_id'] = landlordId;
    json['property_type_id'] = propertyTypeId;
    json['title'] = title;
    json['name'] = name;
    json['description'] = description;
    json['address'] = address;
    json['city'] = city;
    json['state'] = state;
    json['postal_code'] = postalCode;
    json['country'] = country;
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    json['bedrooms'] = bedrooms;
    json['bathrooms'] = bathrooms;
    json['parking_spaces'] = parkingSpaces;
    json['land_size'] = landSize;
    json['building_size'] = buildingSize;
    json['year_built'] = yearBuilt;
    json['status'] = status;
    json['is_verified'] = isVerified;
    json['is_in_person_inspection_available'] = isInPersonInspectionAvailable;
    json['is_virtual_inspection_available'] = isVirtualInspectionAvailable;
    json['is_favourite'] = isFavourite;
    json['features'] = features;
    json['lease_agreement_defaults'] = leaseAgreementDefaults;
    json['rating'] = rating;
    json['rating_count'] = ratingCount;
    json['units'] = units;
    json['review_summary'] = reviewSummary;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class PropertyUnit {
  int? id;
  int? propertyId;
  String? unitNumber;
  dynamic unitName;
  String? rentAmount;
  RentType? rentType;
  CurrencyDetail? currency;
  int? displayRentAmount;
  CurrencyDetail? displayCurrency;
  String? status;
  int? bedrooms;
  int? bathrooms;
  String? size;
  dynamic description;

  PropertyUnit({
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

  PropertyUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    unitNumber = json['unit_number']?.toString();
    unitName = json['unit_name'];
    rentAmount = json['rent_amount']?.toString();
    status = json['status']?.toString();
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    size = json['size']?.toString();
    description = json['description'];

    final rentTypeJson = json['rent_type'];
    if (rentTypeJson is Map<String, dynamic>) {
      rentType = RentType.fromJson(rentTypeJson);
    }

    final currencyJson = json['currency'];
    if (currencyJson is Map<String, dynamic>) {
      currency = CurrencyDetail.fromJson(currencyJson);
    }

    displayRentAmount = json['display_rent_amount'];

    final displayCurrencyJson = json['display_currency'];
    if (displayCurrencyJson is Map<String, dynamic>) {
      displayCurrency = CurrencyDetail.fromJson(displayCurrencyJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['property_id'] = propertyId;
    json['unit_number'] = unitNumber;
    json['unit_name'] = unitName;
    json['rent_amount'] = rentAmount;
    if (rentType != null) {
      json['rent_type'] = rentType!.toJson();
    }
    if (currency != null) {
      json['currency'] = currency!.toJson();
    }
    json['display_rent_amount'] = displayRentAmount;
    if (displayCurrency != null) {
      json['display_currency'] = displayCurrency!.toJson();
    }
    json['status'] = status;
    json['bedrooms'] = bedrooms;
    json['bathrooms'] = bathrooms;
    json['size'] = size;
    json['description'] = description;
    return json;
  }
}

class AgreementDetails {
  dynamic signatures;
  BasicTerms? basicTerms;
  dynamic disclosures;
  dynamic standardTerms;
  dynamic propertyManagerDetails;

  AgreementDetails({
    this.signatures,
    this.basicTerms,
    this.disclosures,
    this.standardTerms,
    this.propertyManagerDetails,
  });

  AgreementDetails.fromJson(Map<String, dynamic> json) {
    signatures = json['signatures'];

    final basicTermsJson = json['basic_terms'];
    if (basicTermsJson is Map<String, dynamic>) {
      basicTerms = BasicTerms.fromJson(basicTermsJson);
    }

    disclosures = json['disclosures'];
    standardTerms = json['standard_terms'];
    propertyManagerDetails = json['property_manager_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['signatures'] = signatures;
    if (basicTerms != null) {
      json['basic_terms'] = basicTerms!.toJson();
    }
    json['disclosures'] = disclosures;
    json['standard_terms'] = standardTerms;
    json['property_manager_details'] = propertyManagerDetails;
    return json;
  }
}

class BasicTerms {
  dynamic bond;
  RentInfo? rent;
  dynamic agent;
  dynamic renters;
  dynamic agreement;
  dynamic agreementTerm;
  dynamic rentalProvider;
  dynamic rentalProviderContact;

  BasicTerms({
    this.bond,
    this.rent,
    this.agent,
    this.renters,
    this.agreement,
    this.agreementTerm,
    this.rentalProvider,
    this.rentalProviderContact,
  });

  BasicTerms.fromJson(Map<String, dynamic> json) {
    bond = json['bond'];

    final rentJson = json['rent'];
    if (rentJson is Map<String, dynamic>) {
      rent = RentInfo.fromJson(rentJson);
    }

    agent = json['agent'];
    renters = json['renters'];
    agreement = json['agreement'];
    agreementTerm = json['agreement_term'];
    rentalProvider = json['rental_provider'];
    rentalProviderContact = json['rental_provider_contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['bond'] = bond;
    if (rent != null) {
      json['rent'] = rent!.toJson();
    }
    json['agent'] = agent;
    json['renters'] = renters;
    json['agreement'] = agreement;
    json['agreement_term'] = agreementTerm;
    json['rental_provider'] = rentalProvider;
    json['rental_provider_contact'] = rentalProviderContact;
    return json;
  }
}

class RentInfo {
  dynamic amount;
  String? currency;
  String? frequency;
  String? rentDueDate;

  RentInfo({this.amount, this.currency, this.frequency, this.rentDueDate});

  RentInfo.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency']?.toString();
    frequency = json['frequency']?.toString();
    rentDueDate = json['rent_due_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['amount'] = amount;
    json['currency'] = currency;
    json['frequency'] = frequency;
    json['rent_due_date'] = rentDueDate;
    return json;
  }
}
