class ConditionalReportsModel {
  bool? error;
  int? code;
  String? message;
  ConditionalReportsData? data;
  dynamic errors;

  ConditionalReportsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  ConditionalReportsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? ConditionalReportsData.fromJson(json['data'])
        : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['error'] = error;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    map['errors'] = errors;
    return map;
  }
}

class ConditionalReportsData {
  List<ConditionReportItem>? data;
  ConditionalReportsLinks? links;
  ConditionalReportsMeta? meta;

  ConditionalReportsData({this.data, this.links, this.meta});

  ConditionalReportsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ConditionReportItem>[];
      json['data'].forEach((v) {
        data!.add(ConditionReportItem.fromJson(v));
      });
    }
    links = json['links'] != null
        ? ConditionalReportsLinks.fromJson(json['links'])
        : null;
    meta = json['meta'] != null
        ? ConditionalReportsMeta.fromJson(json['meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links!.toJson();
    }
    if (meta != null) {
      map['meta'] = meta!.toJson();
    }
    return map;
  }
}

class ConditionReportItem {
  int? id;
  int? propertyId;
  int? inspectionId;
  String? reportType;
  String? fileName;
  String? fileUrl;
  String? summary;
  ConditionReportProperty? property;
  dynamic inspection;
  CreatedByUser? createdByUser;
  String? createdAt;
  String? updatedAt;

  ConditionReportItem({
    this.id,
    this.propertyId,
    this.inspectionId,
    this.reportType,
    this.fileName,
    this.fileUrl,
    this.summary,
    this.property,
    this.inspection,
    this.createdByUser,
    this.createdAt,
    this.updatedAt,
  });

  ConditionReportItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    inspectionId = json['inspection_id'];
    reportType = json['report_type'];
    fileName = json['file_name'];
    fileUrl = json['file_url'];
    summary = json['summary'];
    property = json['property'] != null
        ? ConditionReportProperty.fromJson(json['property'])
        : null;
    inspection = json['inspection'];
    createdByUser = json['created_by_user'] != null
        ? CreatedByUser.fromJson(json['created_by_user'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['property_id'] = propertyId;
    map['inspection_id'] = inspectionId;
    map['report_type'] = reportType;
    map['file_name'] = fileName;
    map['file_url'] = fileUrl;
    map['summary'] = summary;
    if (property != null) {
      map['property'] = property!.toJson();
    }
    map['inspection'] = inspection;
    if (createdByUser != null) {
      map['created_by_user'] = createdByUser!.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class ConditionReportProperty {
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
  List<String>? features;
  LeaseAgreementDefaults? leaseAgreementDefaults;
  String? rating;
  int? ratingCount;
  List<PropertyUnit>? units;
  ReviewSummary? reviewSummary;
  String? createdAt;
  String? updatedAt;

  ConditionReportProperty({
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

  ConditionReportProperty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landlordId = json['landlord_id'];
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
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parkingSpaces = json['parking_spaces'];
    landSize = json['land_size'];
    buildingSize = json['building_size'];
    yearBuilt = json['year_built'];
    status = json['status'];
    isVerified = json['is_verified'];
    isInPersonInspectionAvailable = json['is_in_person_inspection_available'];
    isVirtualInspectionAvailable = json['is_virtual_inspection_available'];
    isFavourite = json['is_favourite'];
    if (json['features'] != null) {
      features = List<String>.from(json['features']);
    }
    leaseAgreementDefaults = json['lease_agreement_defaults'] != null
        ? LeaseAgreementDefaults.fromJson(json['lease_agreement_defaults'])
        : null;
    rating = json['rating'];
    ratingCount = json['rating_count'];
    if (json['units'] != null) {
      units = <PropertyUnit>[];
      json['units'].forEach((v) {
        units!.add(PropertyUnit.fromJson(v));
      });
    }
    reviewSummary = json['review_summary'] != null
        ? ReviewSummary.fromJson(json['review_summary'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['landlord_id'] = landlordId;
    map['property_type_id'] = propertyTypeId;
    map['title'] = title;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['postal_code'] = postalCode;
    map['country'] = country;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['bedrooms'] = bedrooms;
    map['bathrooms'] = bathrooms;
    map['parking_spaces'] = parkingSpaces;
    map['land_size'] = landSize;
    map['building_size'] = buildingSize;
    map['year_built'] = yearBuilt;
    map['status'] = status;
    map['is_verified'] = isVerified;
    map['is_in_person_inspection_available'] = isInPersonInspectionAvailable;
    map['is_virtual_inspection_available'] = isVirtualInspectionAvailable;
    map['is_favourite'] = isFavourite;
    map['features'] = features;
    if (leaseAgreementDefaults != null) {
      map['lease_agreement_defaults'] = leaseAgreementDefaults!.toJson();
    }
    map['rating'] = rating;
    map['rating_count'] = ratingCount;
    if (units != null) {
      map['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (reviewSummary != null) {
      map['review_summary'] = reviewSummary!.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class LeaseAgreementDefaults {
  int? keysCount;
  String? inclusions;
  String? terms;
  int? bondAmount;
  String? currency;
  String? paymentFrequency;
  LeaseDisclosures? disclosures;
  PropertyManagerDetails? propertyManagerDetails;

  LeaseAgreementDefaults({
    this.keysCount,
    this.inclusions,
    this.terms,
    this.bondAmount,
    this.currency,
    this.paymentFrequency,
    this.disclosures,
    this.propertyManagerDetails,
  });

  LeaseAgreementDefaults.fromJson(Map<String, dynamic> json) {
    keysCount = json['keys_count'];
    inclusions = json['inclusions'];
    terms = json['terms'];
    bondAmount = json['bond_amount'];
    currency = json['currency'];
    paymentFrequency = json['payment_frequency'];
    disclosures = json['disclosures'] != null
        ? LeaseDisclosures.fromJson(json['disclosures'])
        : null;
    propertyManagerDetails = json['property_manager_details'] != null
        ? PropertyManagerDetails.fromJson(json['property_manager_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['keys_count'] = keysCount;
    map['inclusions'] = inclusions;
    map['terms'] = terms;
    map['bond_amount'] = bondAmount;
    map['currency'] = currency;
    map['payment_frequency'] = paymentFrequency;
    if (disclosures != null) {
      map['disclosures'] = disclosures!.toJson();
    }
    if (propertyManagerDetails != null) {
      map['property_manager_details'] = propertyManagerDetails!.toJson();
    }
    return map;
  }
}

class LeaseDisclosures {
  IntentToSellPremises? intentToSellPremises;
  MortgageeAction? mortgageeAction;
  OwnershipDisclosure? ownership;
  EmbeddedElectricityNetwork? embeddedElectricityNetwork;
  PropertyHistory? propertyHistory;
  RentalCompliance? rentalCompliance;
  SafetyChecks? safetyChecks;
  Heritage? heritage;
  PlanningAndLegal? planningAndLegal;
  String? additionalNotes;

  LeaseDisclosures({
    this.intentToSellPremises,
    this.mortgageeAction,
    this.ownership,
    this.embeddedElectricityNetwork,
    this.propertyHistory,
    this.rentalCompliance,
    this.safetyChecks,
    this.heritage,
    this.planningAndLegal,
    this.additionalNotes,
  });

  LeaseDisclosures.fromJson(Map<String, dynamic> json) {
    intentToSellPremises = json['intent_to_sell_premises'] != null
        ? IntentToSellPremises.fromJson(json['intent_to_sell_premises'])
        : null;
    mortgageeAction = json['mortgagee_action'] != null
        ? MortgageeAction.fromJson(json['mortgagee_action'])
        : null;
    ownership = json['ownership'] != null
        ? OwnershipDisclosure.fromJson(json['ownership'])
        : null;
    embeddedElectricityNetwork = json['embedded_electricity_network'] != null
        ? EmbeddedElectricityNetwork.fromJson(
            json['embedded_electricity_network'],
          )
        : null;
    propertyHistory = json['property_history'] != null
        ? PropertyHistory.fromJson(json['property_history'])
        : null;
    rentalCompliance = json['rental_compliance'] != null
        ? RentalCompliance.fromJson(json['rental_compliance'])
        : null;
    safetyChecks = json['safety_checks'] != null
        ? SafetyChecks.fromJson(json['safety_checks'])
        : null;
    heritage = json['heritage'] != null
        ? Heritage.fromJson(json['heritage'])
        : null;
    planningAndLegal = json['planning_and_legal'] != null
        ? PlanningAndLegal.fromJson(json['planning_and_legal'])
        : null;
    additionalNotes = json['additional_notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (intentToSellPremises != null) {
      map['intent_to_sell_premises'] = intentToSellPremises!.toJson();
    }
    if (mortgageeAction != null) {
      map['mortgagee_action'] = mortgageeAction!.toJson();
    }
    if (ownership != null) {
      map['ownership'] = ownership!.toJson();
    }
    if (embeddedElectricityNetwork != null) {
      map['embedded_electricity_network'] = embeddedElectricityNetwork!
          .toJson();
    }
    if (propertyHistory != null) {
      map['property_history'] = propertyHistory!.toJson();
    }
    if (rentalCompliance != null) {
      map['rental_compliance'] = rentalCompliance!.toJson();
    }
    if (safetyChecks != null) {
      map['safety_checks'] = safetyChecks!.toJson();
    }
    if (heritage != null) {
      map['heritage'] = heritage!.toJson();
    }
    if (planningAndLegal != null) {
      map['planning_and_legal'] = planningAndLegal!.toJson();
    }
    map['additional_notes'] = additionalNotes;
    return map;
  }
}

class IntentToSellPremises {
  bool? intendsToSell;
  bool? engagedAgent;
  bool? contractPrepared;

  IntentToSellPremises({
    this.intendsToSell,
    this.engagedAgent,
    this.contractPrepared,
  });

  IntentToSellPremises.fromJson(Map<String, dynamic> json) {
    intendsToSell = json['intends_to_sell'];
    engagedAgent = json['engaged_agent'];
    contractPrepared = json['contract_prepared'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['intends_to_sell'] = intendsToSell;
    map['engaged_agent'] = engagedAgent;
    map['contract_prepared'] = contractPrepared;
    return map;
  }
}

class MortgageeAction {
  bool? mortgageeTakingPossession;
  bool? enforcementProceedingsCommenced;

  MortgageeAction({
    this.mortgageeTakingPossession,
    this.enforcementProceedingsCommenced,
  });

  MortgageeAction.fromJson(Map<String, dynamic> json) {
    mortgageeTakingPossession = json['mortgagee_taking_possession'];
    enforcementProceedingsCommenced = json['enforcement_proceedings_commenced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['mortgagee_taking_possession'] = mortgageeTakingPossession;
    map['enforcement_proceedings_commenced'] = enforcementProceedingsCommenced;
    return map;
  }
}

class OwnershipDisclosure {
  bool? isOwner;
  bool? hasRightToRent;

  OwnershipDisclosure({this.isOwner, this.hasRightToRent});

  OwnershipDisclosure.fromJson(Map<String, dynamic> json) {
    isOwner = json['is_owner'];
    hasRightToRent = json['has_right_to_rent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['is_owner'] = isOwner;
    map['has_right_to_rent'] = hasRightToRent;
    return map;
  }
}

class EmbeddedElectricityNetwork {
  bool? suppliedByEmbeddedNetwork;

  EmbeddedElectricityNetwork({this.suppliedByEmbeddedNetwork});

  EmbeddedElectricityNetwork.fromJson(Map<String, dynamic> json) {
    suppliedByEmbeddedNetwork = json['supplied_by_embedded_network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['supplied_by_embedded_network'] = suppliedByEmbeddedNetwork;
    return map;
  }
}

class PropertyHistory {
  bool? homicideInLast5Years;
  bool? drugActivityInLast5Years;
  bool? asbestosPresent;

  PropertyHistory({
    this.homicideInLast5Years,
    this.drugActivityInLast5Years,
    this.asbestosPresent,
  });

  PropertyHistory.fromJson(Map<String, dynamic> json) {
    homicideInLast5Years = json['homicide_in_last_5_years'];
    drugActivityInLast5Years = json['drug_activity_in_last_5_years'];
    asbestosPresent = json['asbestos_present'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['homicide_in_last_5_years'] = homicideInLast5Years;
    map['drug_activity_in_last_5_years'] = drugActivityInLast5Years;
    map['asbestos_present'] = asbestosPresent;
    return map;
  }
}

class RentalCompliance {
  bool? meetsMinimumStandards;
  bool? mouldOrDampRepairNoticesLast3Years;

  RentalCompliance({
    this.meetsMinimumStandards,
    this.mouldOrDampRepairNoticesLast3Years,
  });

  RentalCompliance.fromJson(Map<String, dynamic> json) {
    meetsMinimumStandards = json['meets_minimum_standards'];
    mouldOrDampRepairNoticesLast3Years =
        json['mould_or_damp_repair_notices_last_3_years'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['meets_minimum_standards'] = meetsMinimumStandards;
    map['mould_or_damp_repair_notices_last_3_years'] =
        mouldOrDampRepairNoticesLast3Years;
    return map;
  }
}

class SafetyChecks {
  String? electricitySafetyCheckDate;
  String? gasSafetyCheckDate;
  String? poolBarrierComplianceCheckDate;
  bool? outstandingRecommendations;

  SafetyChecks({
    this.electricitySafetyCheckDate,
    this.gasSafetyCheckDate,
    this.poolBarrierComplianceCheckDate,
    this.outstandingRecommendations,
  });

  SafetyChecks.fromJson(Map<String, dynamic> json) {
    electricitySafetyCheckDate = json['electricity_safety_check_date'];
    gasSafetyCheckDate = json['gas_safety_check_date'];
    poolBarrierComplianceCheckDate = json['pool_barrier_compliance_check_date'];
    outstandingRecommendations = json['outstanding_recommendations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['electricity_safety_check_date'] = electricitySafetyCheckDate;
    map['gas_safety_check_date'] = gasSafetyCheckDate;
    map['pool_barrier_compliance_check_date'] = poolBarrierComplianceCheckDate;
    map['outstanding_recommendations'] = outstandingRecommendations;
    return map;
  }
}

class Heritage {
  bool? isHeritageListed;

  Heritage({this.isHeritageListed});

  Heritage.fromJson(Map<String, dynamic> json) {
    isHeritageListed = json['is_heritage_listed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['is_heritage_listed'] = isHeritageListed;
    return map;
  }
}

class PlanningAndLegal {
  bool? affectedByPlanningApplication;
  bool? buildingOrSafetyNoticesIssued;
  bool? domesticBuildingWorkDispute;
  bool? ownersCorporationDispute;
  bool? subjectToOwnersCorporationRules;

  PlanningAndLegal({
    this.affectedByPlanningApplication,
    this.buildingOrSafetyNoticesIssued,
    this.domesticBuildingWorkDispute,
    this.ownersCorporationDispute,
    this.subjectToOwnersCorporationRules,
  });

  PlanningAndLegal.fromJson(Map<String, dynamic> json) {
    affectedByPlanningApplication = json['affected_by_planning_application'];
    buildingOrSafetyNoticesIssued = json['building_or_safety_notices_issued'];
    domesticBuildingWorkDispute = json['domestic_building_work_dispute'];
    ownersCorporationDispute = json['owners_corporation_dispute'];
    subjectToOwnersCorporationRules =
        json['subject_to_owners_corporation_rules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['affected_by_planning_application'] = affectedByPlanningApplication;
    map['building_or_safety_notices_issued'] = buildingOrSafetyNoticesIssued;
    map['domestic_building_work_dispute'] = domesticBuildingWorkDispute;
    map['owners_corporation_dispute'] = ownersCorporationDispute;
    map['subject_to_owners_corporation_rules'] =
        subjectToOwnersCorporationRules;
    return map;
  }
}

class PropertyManagerDetails {
  String? propertyManagerName;
  String? phoneNumber;
  String? emailAddress;
  String? estateAgencyName;

  PropertyManagerDetails({
    this.propertyManagerName,
    this.phoneNumber,
    this.emailAddress,
    this.estateAgencyName,
  });

  PropertyManagerDetails.fromJson(Map<String, dynamic> json) {
    propertyManagerName = json['property_manager_name'];
    phoneNumber = json['phone_number'];
    emailAddress = json['email_address'];
    estateAgencyName = json['estate_agency_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['property_manager_name'] = propertyManagerName;
    map['phone_number'] = phoneNumber;
    map['email_address'] = emailAddress;
    map['estate_agency_name'] = estateAgencyName;
    return map;
  }
}

class PropertyUnit {
  int? id;
  int? propertyId;
  String? unitNumber;
  String? unitName;
  String? rentAmount;
  RentType? rentType;
  Currency? currency;
  int? displayRentAmount;
  Currency? displayCurrency;
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
    unitNumber = json['unit_number'];
    unitName = json['unit_name'];
    rentAmount = json['rent_amount'];
    rentType = json['rent_type'] != null
        ? RentType.fromJson(json['rent_type'])
        : null;
    currency = json['currency'] != null
        ? Currency.fromJson(json['currency'])
        : null;
    displayRentAmount = json['display_rent_amount'];
    displayCurrency = json['display_currency'] != null
        ? Currency.fromJson(json['display_currency'])
        : null;
    status = json['status'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    size = json['size'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['property_id'] = propertyId;
    map['unit_number'] = unitNumber;
    map['unit_name'] = unitName;
    map['rent_amount'] = rentAmount;
    if (rentType != null) {
      map['rent_type'] = rentType!.toJson();
    }
    if (currency != null) {
      map['currency'] = currency!.toJson();
    }
    map['display_rent_amount'] = displayRentAmount;
    if (displayCurrency != null) {
      map['display_currency'] = displayCurrency!.toJson();
    }
    map['status'] = status;
    map['bedrooms'] = bedrooms;
    map['bathrooms'] = bathrooms;
    map['size'] = size;
    map['description'] = description;
    return map;
  }
}

class RentType {
  int? id;
  String? name;
  String? slug;
  int? rentDays;

  RentType({this.id, this.name, this.slug, this.rentDays});

  RentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    rentDays = json['rent_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['rent_days'] = rentDays;
    return map;
  }
}

class Currency {
  int? id;
  String? code;
  String? name;
  String? symbol;
  String? logo;
  String? type;

  Currency({this.id, this.code, this.name, this.symbol, this.logo, this.type});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
    logo = json['logo'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['symbol'] = symbol;
    map['logo'] = logo;
    map['type'] = type;
    return map;
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
    final Map<String, dynamic> map = <String, dynamic>{};
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    return map;
  }
}

class CreatedByUser {
  int? id;
  String? name;
  String? email;

  CreatedByUser({this.id, this.name, this.email});

  CreatedByUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}

class ConditionalReportsLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  ConditionalReportsLinks({this.first, this.last, this.prev, this.next});

  ConditionalReportsLinks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

class ConditionalReportsMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<ConditionalReportsMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  ConditionalReportsMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  ConditionalReportsMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <ConditionalReportsMetaLink>[];
      json['links'].forEach((v) {
        links!.add(ConditionalReportsMetaLink.fromJson(v));
      });
    }
    path = json['path'];
    perPage = int.tryParse(json['per_page'].toString());
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links!.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

class ConditionalReportsMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  ConditionalReportsMetaLink({this.url, this.label, this.page, this.active});

  ConditionalReportsMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    page = json['page'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['page'] = page;
    map['active'] = active;
    return map;
  }
}
