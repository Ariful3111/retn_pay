class ApplicationDetailsModel {
  final bool error;
  final int code;
  final String message;
  final ApplicationData? data;
  final dynamic errors;

  ApplicationDetailsModel({
    required this.error,
    required this.code,
    required this.message,
    this.data,
    this.errors,
  });

  factory ApplicationDetailsModel.fromJson(Map<String, dynamic> json) {
    return ApplicationDetailsModel(
      error: json['error'] as bool? ?? false,
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? ApplicationData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      errors: json['errors'],
    );
  }
}

class ApplicationData {
  final int id;
  final int tenantId;
  final int propertyId;
  final int propertyUnitId;
  final String status;
  final String? rejectionReason;
  final String? notes;
  final ApplicationDetails? applicationDetails;
  final String? signature;
  final String? signedAt;
  final Property? property;
  final PropertyUnit? propertyUnit;
  final Tenant? tenant;
  final String? createdAt;
  final String? updatedAt;

  ApplicationData({
    required this.id,
    required this.tenantId,
    required this.propertyId,
    required this.propertyUnitId,
    required this.status,
    this.rejectionReason,
    this.notes,
    this.applicationDetails,
    this.signature,
    this.signedAt,
    this.property,
    this.propertyUnit,
    this.tenant,
    this.createdAt,
    this.updatedAt,
  });

  factory ApplicationData.fromJson(Map<String, dynamic> json) {
    return ApplicationData(
      id: json['id'] as int? ?? 0,
      tenantId: json['tenant_id'] as int? ?? 0,
      propertyId: json['property_id'] as int? ?? 0,
      propertyUnitId: json['property_unit_id'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      rejectionReason: json['rejection_reason'] as String?,
      notes: json['notes'] as String?,
      applicationDetails: json['application_details'] != null
          ? ApplicationDetails.fromJson(
              json['application_details'] as Map<String, dynamic>,
            )
          : null,
      signature: json['signature'] as String?,
      signedAt: json['signed_at'] as String?,
      property: json['property'] != null
          ? Property.fromJson(json['property'] as Map<String, dynamic>)
          : null,
      propertyUnit: json['property_unit'] != null
          ? PropertyUnit.fromJson(json['property_unit'] as Map<String, dynamic>)
          : null,
      tenant: json['tenant'] != null
          ? Tenant.fromJson(json['tenant'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class ApplicationDetails {
  final ApplicantDetails? applicantDetails;
  final PreviousRentalProvider? previousRentalProvider;
  final EmploymentAndIncome? employmentAndIncome;
  final Employment? currentEmployment;
  final Employment? previousEmployment;
  final Pets? pets;
  final Declaration? declaration;
  final List<PersonalReference>? personalReferences;

  ApplicationDetails({
    this.applicantDetails,
    this.previousRentalProvider,
    this.employmentAndIncome,
    this.currentEmployment,
    this.previousEmployment,
    this.pets,
    this.declaration,
    this.personalReferences,
  });

  factory ApplicationDetails.fromJson(Map<String, dynamic> json) {
    return ApplicationDetails(
      applicantDetails: json['applicant_details'] != null
          ? ApplicantDetails.fromJson(
              json['applicant_details'] as Map<String, dynamic>,
            )
          : null,
      previousRentalProvider: json['previous_rental_provider'] != null
          ? PreviousRentalProvider.fromJson(
              json['previous_rental_provider'] as Map<String, dynamic>,
            )
          : null,
      employmentAndIncome: json['employment_and_income'] != null
          ? EmploymentAndIncome.fromJson(
              json['employment_and_income'] as Map<String, dynamic>,
            )
          : null,
      currentEmployment: json['current_employment'] != null
          ? Employment.fromJson(
              json['current_employment'] as Map<String, dynamic>,
            )
          : null,
      previousEmployment: json['previous_employment'] != null
          ? Employment.fromJson(
              json['previous_employment'] as Map<String, dynamic>,
            )
          : null,
      pets: json['pets'] != null
          ? Pets.fromJson(json['pets'] as Map<String, dynamic>)
          : null,
      declaration: json['declaration'] != null
          ? Declaration.fromJson(json['declaration'] as Map<String, dynamic>)
          : null,
      personalReferences: json['personal_references'] != null
          ? (json['personal_references'] as List)
                .map(
                  (e) => PersonalReference.fromJson(e as Map<String, dynamic>),
                )
                .toList()
          : null,
    );
  }
}

class ApplicantDetails {
  final String? name;
  final String? dateOfBirth;
  final int age;
  final Contact? contact;

  ApplicantDetails({this.name, this.dateOfBirth, this.age = 0, this.contact});

  factory ApplicantDetails.fromJson(Map<String, dynamic> json) {
    return ApplicantDetails(
      name: json['name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      age: json['age'] as int? ?? 0,
      contact: json['contact'] != null
          ? Contact.fromJson(json['contact'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Contact {
  final String? address;
  final String? postcode;
  final String? email;
  final String? phoneBusinessHours;
  final String? phoneAfterHours;
  final String? mobileNumber;

  Contact({
    this.address,
    this.postcode,
    this.email,
    this.phoneBusinessHours,
    this.phoneAfterHours,
    this.mobileNumber,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      address: json['address'] as String?,
      postcode: json['postcode'] as String?,
      email: json['email'] as String?,
      phoneBusinessHours: json['phone_business_hours'] as String?,
      phoneAfterHours: json['phone_after_hours'] as String?,
      mobileNumber: json['mobile_number'] as String?,
    );
  }
}

class PreviousRentalProvider {
  final String? name;
  final String? phoneNumber;
  final String? emailAddress;

  PreviousRentalProvider({this.name, this.phoneNumber, this.emailAddress});

  factory PreviousRentalProvider.fromJson(Map<String, dynamic> json) {
    return PreviousRentalProvider(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      emailAddress: json['email_address'] as String?,
    );
  }
}

class EmploymentAndIncome {
  final String? employmentStatus;
  final int salaryIncomePerWeek;
  final int otherNetIncomePerWeek;

  EmploymentAndIncome({
    this.employmentStatus,
    this.salaryIncomePerWeek = 0,
    this.otherNetIncomePerWeek = 0,
  });

  factory EmploymentAndIncome.fromJson(Map<String, dynamic> json) {
    return EmploymentAndIncome(
      employmentStatus: json['employment_status'] as String?,
      salaryIncomePerWeek: json['salary_income_per_week'] as int? ?? 0,
      otherNetIncomePerWeek: json['other_net_income_per_week'] as int? ?? 0,
    );
  }
}

class Employment {
  final String? employerName;
  final String? address;
  final String? postcode;
  final int yearsEmployed;
  final int monthsEmployed;
  final String? positionHeld;
  final String? contactPersonName;
  final String? phoneNumber;
  final String? remarks;

  Employment({
    this.employerName,
    this.address,
    this.postcode,
    this.yearsEmployed = 0,
    this.monthsEmployed = 0,
    this.positionHeld,
    this.contactPersonName,
    this.phoneNumber,
    this.remarks,
  });

  factory Employment.fromJson(Map<String, dynamic> json) {
    return Employment(
      employerName: json['employer_name'] as String?,
      address: json['address'] as String?,
      postcode: json['postcode'] as String?,
      yearsEmployed: json['years_employed'] as int? ?? 0,
      monthsEmployed: json['months_employed'] as int? ?? 0,
      positionHeld: json['position_held'] as String?,
      contactPersonName: json['contact_person_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      remarks: json['remarks'] as String?,
    );
  }
}

class Pets {
  final bool hasPets;
  final String? details;

  Pets({this.hasPets = false, this.details});

  factory Pets.fromJson(Map<String, dynamic> json) {
    return Pets(
      hasPets: json['has_pets'] as bool? ?? false,
      details: json['details'] as String?,
    );
  }
}

class Declaration {
  final String? applicantSignature;
  final String? date;

  Declaration({this.applicantSignature, this.date});

  factory Declaration.fromJson(Map<String, dynamic> json) {
    return Declaration(
      applicantSignature: json['applicant_signature'] as String?,
      date: json['date'] as String?,
    );
  }
}

class PersonalReference {
  final String? name;
  final String? relationshipToApplicant;
  final String? homePhoneNumber;
  final String? workPhoneNumber;

  PersonalReference({
    this.name,
    this.relationshipToApplicant,
    this.homePhoneNumber,
    this.workPhoneNumber,
  });

  factory PersonalReference.fromJson(Map<String, dynamic> json) {
    return PersonalReference(
      name: json['name'] as String?,
      relationshipToApplicant: json['relationship_to_applicant'] as String?,
      homePhoneNumber: json['home_phone_number'] as String?,
      workPhoneNumber: json['work_phone_number'] as String?,
    );
  }
}

class Property {
  final int id;
  final int landlordId;
  final int propertyTypeId;
  final String? title;
  final String? name;
  final String? description;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? latitude;
  final String? longitude;
  final int bedrooms;
  final int bathrooms;
  final int parkingSpaces;
  final String? landSize;
  final String? buildingSize;
  final int yearBuilt;
  final String? status;
  final String? availableFrom;
  final bool isVerified;
  final bool isInPersonInspectionAvailable;
  final bool isVirtualInspectionAvailable;
  final bool isFavourite;
  final List<String>? features;
  final LeaseAgreementDefaults? leaseAgreementDefaults;
  final String? rating;
  final int ratingCount;
  final Landlord? landlord;
  final List<PropertyUnit>? units;
  final ReviewSummary? reviewSummary;
  final String? createdAt;
  final String? updatedAt;

  Property({
    this.id = 0,
    this.landlordId = 0,
    this.propertyTypeId = 0,
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
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.parkingSpaces = 0,
    this.landSize,
    this.buildingSize,
    this.yearBuilt = 0,
    this.status,
    this.availableFrom,
    this.isVerified = false,
    this.isInPersonInspectionAvailable = false,
    this.isVirtualInspectionAvailable = false,
    this.isFavourite = false,
    this.features,
    this.leaseAgreementDefaults,
    this.rating,
    this.ratingCount = 0,
    this.landlord,
    this.units,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as int? ?? 0,
      landlordId: json['landlord_id'] as int? ?? 0,
      propertyTypeId: json['property_type_id'] as int? ?? 0,
      title: json['title'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      country: json['country'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      bedrooms: json['bedrooms'] as int? ?? 0,
      bathrooms: json['bathrooms'] as int? ?? 0,
      parkingSpaces: json['parking_spaces'] as int? ?? 0,
      landSize: json['land_size'] as String?,
      buildingSize: json['building_size'] as String?,
      yearBuilt: json['year_built'] as int? ?? 0,
      status: json['status'] as String?,
      availableFrom: json['available_from'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      isInPersonInspectionAvailable:
          json['is_in_person_inspection_available'] as bool? ?? false,
      isVirtualInspectionAvailable:
          json['is_virtual_inspection_available'] as bool? ?? false,
      isFavourite: json['is_favourite'] as bool? ?? false,
      features: json['features'] != null
          ? List<String>.from(json['features'] as List)
          : null,
      leaseAgreementDefaults: json['lease_agreement_defaults'] != null
          ? LeaseAgreementDefaults.fromJson(
              json['lease_agreement_defaults'] as Map<String, dynamic>,
            )
          : null,
      rating: json['rating'] as String?,
      ratingCount: json['rating_count'] as int? ?? 0,
      landlord: json['landlord'] != null
          ? Landlord.fromJson(json['landlord'] as Map<String, dynamic>)
          : null,
      units: json['units'] != null
          ? (json['units'] as List)
                .map((e) => PropertyUnit.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      reviewSummary: json['review_summary'] != null
          ? ReviewSummary.fromJson(
              json['review_summary'] as Map<String, dynamic>,
            )
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class LeaseAgreementDefaults {
  final String? keysCount;
  final String? bondAmount;
  final String? currency;
  final String? paymentFrequency;
  final Disclosures? disclosures;
  final PropertyManagerDetails? propertyManagerDetails;

  LeaseAgreementDefaults({
    this.keysCount,
    this.bondAmount,
    this.currency,
    this.paymentFrequency,
    this.disclosures,
    this.propertyManagerDetails,
  });

  factory LeaseAgreementDefaults.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementDefaults(
      keysCount: json['keys_count'] as String?,
      bondAmount: json['bond_amount'] as String?,
      currency: json['currency'] as String?,
      paymentFrequency: json['payment_frequency'] as String?,
      disclosures: json['disclosures'] != null
          ? Disclosures.fromJson(json['disclosures'] as Map<String, dynamic>)
          : null,
      propertyManagerDetails: json['property_manager_details'] != null
          ? PropertyManagerDetails.fromJson(
              json['property_manager_details'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class Disclosures {
  final IntentToSellPremises? intentToSellPremises;
  final MortgageeAction? mortgageeAction;
  final Ownership? ownership;
  final EmbeddedElectricityNetwork? embeddedElectricityNetwork;
  final PropertyHistory? propertyHistory;
  final RentalCompliance? rentalCompliance;
  final SafetyChecks? safetyChecks;
  final Heritage? heritage;
  final PlanningAndLegal? planningAndLegal;
  final String? additionalNotes;

  Disclosures({
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

  factory Disclosures.fromJson(Map<String, dynamic> json) {
    return Disclosures(
      intentToSellPremises: json['intent_to_sell_premises'] != null
          ? IntentToSellPremises.fromJson(
              json['intent_to_sell_premises'] as Map<String, dynamic>,
            )
          : null,
      mortgageeAction: json['mortgagee_action'] != null
          ? MortgageeAction.fromJson(
              json['mortgagee_action'] as Map<String, dynamic>,
            )
          : null,
      ownership: json['ownership'] != null
          ? Ownership.fromJson(json['ownership'] as Map<String, dynamic>)
          : null,
      embeddedElectricityNetwork: json['embedded_electricity_network'] != null
          ? EmbeddedElectricityNetwork.fromJson(
              json['embedded_electricity_network'] as Map<String, dynamic>,
            )
          : null,
      propertyHistory: json['property_history'] != null
          ? PropertyHistory.fromJson(
              json['property_history'] as Map<String, dynamic>,
            )
          : null,
      rentalCompliance: json['rental_compliance'] != null
          ? RentalCompliance.fromJson(
              json['rental_compliance'] as Map<String, dynamic>,
            )
          : null,
      safetyChecks: json['safety_checks'] != null
          ? SafetyChecks.fromJson(json['safety_checks'] as Map<String, dynamic>)
          : null,
      heritage: json['heritage'] != null
          ? Heritage.fromJson(json['heritage'] as Map<String, dynamic>)
          : null,
      planningAndLegal: json['planning_and_legal'] != null
          ? PlanningAndLegal.fromJson(
              json['planning_and_legal'] as Map<String, dynamic>,
            )
          : null,
      additionalNotes: json['additional_notes'] as String?,
    );
  }
}

class IntentToSellPremises {
  final String? intendsToSell;
  final String? engagedAgent;
  final String? contractPrepared;

  IntentToSellPremises({
    this.intendsToSell,
    this.engagedAgent,
    this.contractPrepared,
  });

  factory IntentToSellPremises.fromJson(Map<String, dynamic> json) {
    return IntentToSellPremises(
      intendsToSell: json['intends_to_sell'] as String?,
      engagedAgent: json['engaged_agent'] as String?,
      contractPrepared: json['contract_prepared'] as String?,
    );
  }
}

class MortgageeAction {
  final String? mortgageeTakingPossession;
  final String? enforcementProceedingsCommenced;

  MortgageeAction({
    this.mortgageeTakingPossession,
    this.enforcementProceedingsCommenced,
  });

  factory MortgageeAction.fromJson(Map<String, dynamic> json) {
    return MortgageeAction(
      mortgageeTakingPossession: json['mortgagee_taking_possession'] as String?,
      enforcementProceedingsCommenced:
          json['enforcement_proceedings_commenced'] as String?,
    );
  }
}

class Ownership {
  final String? isOwner;
  final String? hasRightToRent;

  Ownership({this.isOwner, this.hasRightToRent});

  factory Ownership.fromJson(Map<String, dynamic> json) {
    return Ownership(
      isOwner: json['is_owner'] as String?,
      hasRightToRent: json['has_right_to_rent'] as String?,
    );
  }
}

class EmbeddedElectricityNetwork {
  final String? suppliedByEmbeddedNetwork;

  EmbeddedElectricityNetwork({this.suppliedByEmbeddedNetwork});

  factory EmbeddedElectricityNetwork.fromJson(Map<String, dynamic> json) {
    return EmbeddedElectricityNetwork(
      suppliedByEmbeddedNetwork:
          json['supplied_by_embedded_network'] as String?,
    );
  }
}

class PropertyHistory {
  final String? homicideInLast5Years;
  final String? drugActivityInLast5Years;
  final String? asbestosPresent;

  PropertyHistory({
    this.homicideInLast5Years,
    this.drugActivityInLast5Years,
    this.asbestosPresent,
  });

  factory PropertyHistory.fromJson(Map<String, dynamic> json) {
    return PropertyHistory(
      homicideInLast5Years: json['homicide_in_last_5_years'] as String?,
      drugActivityInLast5Years:
          json['drug_activity_in_last_5_years'] as String?,
      asbestosPresent: json['asbestos_present'] as String?,
    );
  }
}

class RentalCompliance {
  final String? meetsMinimumStandards;
  final String? mouldOrDampRepairNoticesLast3Years;

  RentalCompliance({
    this.meetsMinimumStandards,
    this.mouldOrDampRepairNoticesLast3Years,
  });

  factory RentalCompliance.fromJson(Map<String, dynamic> json) {
    return RentalCompliance(
      meetsMinimumStandards: json['meets_minimum_standards'] as String?,
      mouldOrDampRepairNoticesLast3Years:
          json['mould_or_damp_repair_notices_last_3_years'] as String?,
    );
  }
}

class SafetyChecks {
  final String? electricitySafetyCheckDate;
  final String? gasSafetyCheckDate;
  final String? poolBarrierComplianceCheckDate;
  final String? outstandingRecommendations;

  SafetyChecks({
    this.electricitySafetyCheckDate,
    this.gasSafetyCheckDate,
    this.poolBarrierComplianceCheckDate,
    this.outstandingRecommendations,
  });

  factory SafetyChecks.fromJson(Map<String, dynamic> json) {
    return SafetyChecks(
      electricitySafetyCheckDate:
          json['electricity_safety_check_date'] as String?,
      gasSafetyCheckDate: json['gas_safety_check_date'] as String?,
      poolBarrierComplianceCheckDate:
          json['pool_barrier_compliance_check_date'] as String?,
      outstandingRecommendations:
          json['outstanding_recommendations'] as String?,
    );
  }
}

class Heritage {
  final String? isHeritageListed;

  Heritage({this.isHeritageListed});

  factory Heritage.fromJson(Map<String, dynamic> json) {
    return Heritage(isHeritageListed: json['is_heritage_listed'] as String?);
  }
}

class PlanningAndLegal {
  final String? affectedByPlanningApplication;
  final String? buildingOrSafetyNoticesIssued;
  final String? domesticBuildingWorkDispute;
  final String? ownersCorporationDispute;
  final String? subjectToOwnersCorporationRules;

  PlanningAndLegal({
    this.affectedByPlanningApplication,
    this.buildingOrSafetyNoticesIssued,
    this.domesticBuildingWorkDispute,
    this.ownersCorporationDispute,
    this.subjectToOwnersCorporationRules,
  });

  factory PlanningAndLegal.fromJson(Map<String, dynamic> json) {
    return PlanningAndLegal(
      affectedByPlanningApplication:
          json['affected_by_planning_application'] as String?,
      buildingOrSafetyNoticesIssued:
          json['building_or_safety_notices_issued'] as String?,
      domesticBuildingWorkDispute:
          json['domestic_building_work_dispute'] as String?,
      ownersCorporationDispute: json['owners_corporation_dispute'] as String?,
      subjectToOwnersCorporationRules:
          json['subject_to_owners_corporation_rules'] as String?,
    );
  }
}

class PropertyManagerDetails {
  final String? propertyManagerName;
  final String? phoneNumber;
  final String? emailAddress;
  final String? estateAgencyName;

  PropertyManagerDetails({
    this.propertyManagerName,
    this.phoneNumber,
    this.emailAddress,
    this.estateAgencyName,
  });

  factory PropertyManagerDetails.fromJson(Map<String, dynamic> json) {
    return PropertyManagerDetails(
      propertyManagerName: json['property_manager_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      emailAddress: json['email_address'] as String?,
      estateAgencyName: json['estate_agency_name'] as String?,
    );
  }
}

class Landlord {
  final int id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? provider;
  final String? providerId;
  final List<String>? roles;
  final LandlordProfile? landlordProfile;
  final List<dynamic>? documents;
  final String? createdAt;
  final String? updatedAt;

  Landlord({
    this.id = 0,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.email,
    this.phone,
    this.isActive = false,
    this.provider,
    this.providerId,
    this.roles,
    this.landlordProfile,
    this.documents,
    this.createdAt,
    this.updatedAt,
  });

  factory Landlord.fromJson(Map<String, dynamic> json) {
    return Landlord(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? false,
      provider: json['provider'] as String?,
      providerId: json['provider_id'] as String?,
      roles: json['roles'] != null
          ? List<String>.from(json['roles'] as List)
          : null,
      landlordProfile: json['landlord_profile'] != null
          ? LandlordProfile.fromJson(
              json['landlord_profile'] as Map<String, dynamic>,
            )
          : null,
      documents: json['documents'] as List<dynamic>?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class LandlordProfile {
  final int id;
  final String? description;
  final bool isVerified;
  final String? createdAt;
  final String? updatedAt;
  final Subscription? subscription;

  LandlordProfile({
    this.id = 0,
    this.description,
    this.isVerified = false,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  factory LandlordProfile.fromJson(Map<String, dynamic> json) {
    return LandlordProfile(
      id: json['id'] as int? ?? 0,
      description: json['description'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      subscription: json['subscription'] != null
          ? Subscription.fromJson(json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Subscription {
  final int id;
  final int userId;
  final String? role;
  final int planId;
  final String? startDate;
  final String? endDate;
  final bool isTrial;
  final String? trialEndsAt;
  final String? status;
  final bool autoRenew;
  final Plan? plan;

  Subscription({
    this.id = 0,
    this.userId = 0,
    this.role,
    this.planId = 0,
    this.startDate,
    this.endDate,
    this.isTrial = false,
    this.trialEndsAt,
    this.status,
    this.autoRenew = false,
    this.plan,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      role: json['role'] as String?,
      planId: json['plan_id'] as int? ?? 0,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      isTrial: json['is_trial'] as bool? ?? false,
      trialEndsAt: json['trial_ends_at'] as String?,
      status: json['status'] as String?,
      autoRenew: json['auto_renew'] as bool? ?? false,
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Plan {
  final int id;
  final String? forRole;
  final String? name;
  final int price;
  final String? billingCycle;
  final int trialPeriodDays;
  final bool isActive;
  final List<PlanFeature>? features;

  Plan({
    this.id = 0,
    this.forRole,
    this.name,
    this.price = 0,
    this.billingCycle,
    this.trialPeriodDays = 0,
    this.isActive = false,
    this.features,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'] as int? ?? 0,
      forRole: json['for_role'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int? ?? 0,
      billingCycle: json['billing_cycle'] as String?,
      trialPeriodDays: json['trial_period_days'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      features: json['features'] != null
          ? (json['features'] as List)
                .map((e) => PlanFeature.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }
}

class PlanFeature {
  final String? title;
  final String? value;
  final List<String>? features;

  PlanFeature({this.title, this.value, this.features});

  factory PlanFeature.fromJson(Map<String, dynamic> json) {
    return PlanFeature(
      title: json['title'] as String?,
      value: json['value'] as String?,
      features: json['features'] != null
          ? List<String>.from(json['features'] as List)
          : null,
    );
  }
}

class PropertyUnit {
  final int id;
  final int propertyId;
  final String? unitNumber;
  final String? unitName;
  final String? rentAmount;
  final RentType? rentType;
  final Currency? currency;
  final int displayRentAmount;
  final Currency? displayCurrency;
  final String? status;
  final int bedrooms;
  final int bathrooms;
  final String? size;
  final String? description;

  PropertyUnit({
    this.id = 0,
    this.propertyId = 0,
    this.unitNumber,
    this.unitName,
    this.rentAmount,
    this.rentType,
    this.currency,
    this.displayRentAmount = 0,
    this.displayCurrency,
    this.status,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.size,
    this.description,
  });

  factory PropertyUnit.fromJson(Map<String, dynamic> json) {
    return PropertyUnit(
      id: json['id'] as int? ?? 0,
      propertyId: json['property_id'] as int? ?? 0,
      unitNumber: json['unit_number'] as String?,
      unitName: json['unit_name'] as String?,
      rentAmount: json['rent_amount'] as String?,
      rentType: json['rent_type'] != null
          ? RentType.fromJson(json['rent_type'] as Map<String, dynamic>)
          : null,
      currency: json['currency'] != null
          ? Currency.fromJson(json['currency'] as Map<String, dynamic>)
          : null,
      displayRentAmount: json['display_rent_amount'] as int? ?? 0,
      displayCurrency: json['display_currency'] != null
          ? Currency.fromJson(json['display_currency'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
      bedrooms: json['bedrooms'] as int? ?? 0,
      bathrooms: json['bathrooms'] as int? ?? 0,
      size: json['size'] as String?,
      description: json['description'] as String?,
    );
  }
}

class RentType {
  final int id;
  final String? name;
  final String? slug;
  final int rentDays;
  final String? description;
  final bool status;
  final String? createdAt;
  final String? updatedAt;

  RentType({
    this.id = 0,
    this.name,
    this.slug,
    this.rentDays = 0,
    this.description,
    this.status = false,
    this.createdAt,
    this.updatedAt,
  });

  factory RentType.fromJson(Map<String, dynamic> json) {
    return RentType(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      rentDays: json['rent_days'] as int? ?? 0,
      description: json['description'] as String?,
      status: json['status'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class Currency {
  final int id;
  final String? code;
  final String? name;
  final String? symbol;
  final String? logo;
  final String? type;
  final int decimalPlaces;
  final int exchangeRate;
  final bool isActive;
  final int sortOrder;

  Currency({
    this.id = 0,
    this.code,
    this.name,
    this.symbol,
    this.logo,
    this.type,
    this.decimalPlaces = 0,
    this.exchangeRate = 0,
    this.isActive = false,
    this.sortOrder = 0,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      logo: json['logo'] as String?,
      type: json['type'] as String?,
      decimalPlaces: json['decimal_places'] as int? ?? 0,
      exchangeRate: json['exchange_rate'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}

class Tenant {
  final int id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? provider;
  final String? providerId;
  final List<String>? roles;
  final TenantProfile? tenantProfile;
  final List<TenantDocument>? documents;
  final String? createdAt;
  final String? updatedAt;

  Tenant({
    this.id = 0,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.email,
    this.phone,
    this.isActive = false,
    this.provider,
    this.providerId,
    this.roles,
    this.tenantProfile,
    this.documents,
    this.createdAt,
    this.updatedAt,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? false,
      provider: json['provider'] as String?,
      providerId: json['provider_id'] as String?,
      roles: json['roles'] != null
          ? List<String>.from(json['roles'] as List)
          : null,
      tenantProfile: json['tenant_profile'] != null
          ? TenantProfile.fromJson(
              json['tenant_profile'] as Map<String, dynamic>,
            )
          : null,
      documents: json['documents'] != null
          ? (json['documents'] as List)
                .map((e) => TenantDocument.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class TenantProfile {
  final int id;
  final String? employmentStatus;
  final String? employerName;
  final String? jobTitle;
  final String? monthlyIncome;
  final bool isVerified;
  final String? createdAt;
  final String? updatedAt;

  TenantProfile({
    this.id = 0,
    this.employmentStatus,
    this.employerName,
    this.jobTitle,
    this.monthlyIncome,
    this.isVerified = false,
    this.createdAt,
    this.updatedAt,
  });

  factory TenantProfile.fromJson(Map<String, dynamic> json) {
    return TenantProfile(
      id: json['id'] as int? ?? 0,
      employmentStatus: json['employment_status'] as String?,
      employerName: json['employer_name'] as String?,
      jobTitle: json['job_title'] as String?,
      monthlyIncome: json['monthly_income'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class TenantDocument {
  final int id;
  final int userId;
  final String? documentType;
  final String? documentNumber;
  final String? filePath;
  final String? fileUrl;
  final String? backFilePath;
  final String? backFileUrl;
  final String? expiryDate;
  final String? status;
  final String? rejectionReason;
  final bool isVerified;
  final Map<String, dynamic>? verificationResponse;
  final String? verifiedAt;
  final String? createdAt;
  final String? updatedAt;

  TenantDocument({
    this.id = 0,
    this.userId = 0,
    this.documentType,
    this.documentNumber,
    this.filePath,
    this.fileUrl,
    this.backFilePath,
    this.backFileUrl,
    this.expiryDate,
    this.status,
    this.rejectionReason,
    this.isVerified = false,
    this.verificationResponse,
    this.verifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory TenantDocument.fromJson(Map<String, dynamic> json) {
    return TenantDocument(
      id: json['id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      documentType: json['document_type'] as String?,
      documentNumber: json['document_number'] as String?,
      filePath: json['file_path'] as String?,
      fileUrl: json['file_url'] as String?,
      backFilePath: json['back_file_path'] as String?,
      backFileUrl: json['back_file_url'] as String?,
      expiryDate: json['expiry_date'] as String?,
      status: json['status'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      verificationResponse: json['verification_response'] != null
          ? json['verification_response'] as Map<String, dynamic>
          : null,
      verifiedAt: json['verified_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class ReviewSummary {
  final int totalReviews;
  final String? averageRating;

  ReviewSummary({this.totalReviews = 0, this.averageRating});

  factory ReviewSummary.fromJson(Map<String, dynamic> json) {
    return ReviewSummary(
      totalReviews: json['total_reviews'] as int? ?? 0,
      averageRating: json['average_rating'] as String?,
    );
  }
}
