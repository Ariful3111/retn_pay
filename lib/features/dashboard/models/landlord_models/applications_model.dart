import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class ApplicationsModel {
  final bool? error;
  final int? code;
  final String? message;
  final ApplicationsPayload? data;
  final dynamic errors;

  const ApplicationsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory ApplicationsModel.fromJson(Map<String, dynamic> json) {
    return ApplicationsModel(
      error: json['error'] == true,
      code: _toInt(json['code']),
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic>
          ? ApplicationsPayload.fromJson(json['data'])
          : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() => {
    'error': error,
    'code': code,
    'message': message,
    'data': data?.toJson(),
    'errors': errors,
  };
}

class ApplicationsPayload {
  final List<ApplicationItem>? data;
  final ApplicationsLinks? links;
  final ApplicationsMeta? meta;

  const ApplicationsPayload({this.data, this.links, this.meta});

  factory ApplicationsPayload.fromJson(Map<String, dynamic> json) {
    return ApplicationsPayload(
      data: (json['data'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ApplicationItem.fromJson)
          .toList(),
      links: json['links'] is Map<String, dynamic>
          ? ApplicationsLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] is Map<String, dynamic>
          ? ApplicationsMeta.fromJson(json['meta'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
  };
}

class ApplicationsLinks {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  const ApplicationsLinks({this.first, this.last, this.prev, this.next});

  factory ApplicationsLinks.fromJson(Map<String, dynamic> json) {
    return ApplicationsLinks(
      first: json['first']?.toString(),
      last: json['last']?.toString(),
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() => {
    'first': first,
    'last': last,
    'prev': prev,
    'next': next,
  };
}

class ApplicationsMeta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<ApplicationsMetaLink>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const ApplicationsMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory ApplicationsMeta.fromJson(Map<String, dynamic> json) {
    return ApplicationsMeta(
      currentPage: _toInt(json['current_page']),
      from: _toInt(json['from']),
      lastPage: _toInt(json['last_page']),
      links: (json['links'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ApplicationsMetaLink.fromJson)
          .toList(),
      path: json['path']?.toString(),
      perPage: _toInt(json['per_page']),
      to: _toInt(json['to']),
      total: _toInt(json['total']),
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'from': from,
    'last_page': lastPage,
    'links': links?.map((e) => e.toJson()).toList(),
    'path': path,
    'per_page': perPage,
    'to': to,
    'total': total,
  };
}

class ApplicationsMetaLink {
  final dynamic url;
  final String? label;
  final int? page;
  final bool? active;

  const ApplicationsMetaLink({this.url, this.label, this.page, this.active});

  factory ApplicationsMetaLink.fromJson(Map<String, dynamic> json) {
    return ApplicationsMetaLink(
      url: json['url'],
      label: json['label']?.toString(),
      page: _toInt(json['page']),
      active: json['active'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'page': page,
    'active': active,
  };
}

class ApplicationItem {
  final int? id;
  final int? tenantId;
  final int? propertyId;
  final int? propertyUnitId;
  final String? status;
  final String? rejectionReason;
  final String? notes;
  final ApplicationDetails? applicationDetails;
  final String? signature;
  final String? signedAt;
  final home_models.Property? property;
  final home_models.Units? propertyUnit;
  final ApplicationTenant? tenant;
  final String? createdAt;
  final String? updatedAt;

  const ApplicationItem({
    this.id,
    this.tenantId,
    this.propertyId,
    this.propertyUnitId,
    this.status,
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

  factory ApplicationItem.fromJson(Map<String, dynamic> json) {
    return ApplicationItem(
      id: _toInt(json['id']),
      tenantId: _toInt(json['tenant_id']),
      propertyId: _toInt(json['property_id']),
      propertyUnitId: _toInt(json['property_unit_id']),
      status: json['status']?.toString(),
      rejectionReason: json['rejection_reason']?.toString(),
      notes: json['notes']?.toString(),
      applicationDetails: json['application_details'] is Map<String, dynamic>
          ? ApplicationDetails.fromJson(json['application_details'])
          : null,
      signature: json['signature']?.toString(),
      signedAt: json['signed_at']?.toString(),
      property: json['property'] is Map<String, dynamic>
          ? home_models.Property.fromJson(json['property'])
          : null,
      propertyUnit: json['property_unit'] is Map<String, dynamic>
          ? home_models.Units.fromJson(json['property_unit'])
          : null,
      tenant: json['tenant'] is Map<String, dynamic>
          ? ApplicationTenant.fromJson(json['tenant'])
          : null,
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tenant_id': tenantId,
    'property_id': propertyId,
    'property_unit_id': propertyUnitId,
    'status': status,
    'rejection_reason': rejectionReason,
    'notes': notes,
    'application_details': applicationDetails?.toJson(),
    'signature': signature,
    'signed_at': signedAt,
    'property': property?.toJson(),
    'property_unit': propertyUnit?.toJson(),
    'tenant': tenant?.toJson(),
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class ApplicationTenant {
  final int? id;
  final String? name;
  final String? email;

  const ApplicationTenant({this.id, this.name, this.email});

  factory ApplicationTenant.fromJson(Map<String, dynamic> json) {
    return ApplicationTenant(
      id: _toInt(json['id']),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}

class ApplicationDetails {
  final ApplicationPets? pets;
  final ApplicationDeclaration? declaration;
  final ApplicationDisclosures? disclosures;
  final ApplicationApplicantDetails? applicantDetails;
  final ApplicationEmployment? currentEmployment;
  final List<ApplicationPersonalReference>? personalReferences;
  final ApplicationEmployment? previousEmployment;
  final ApplicationEmploymentAndIncome? employmentAndIncome;
  final ApplicationRentalPropertyDetails? rentalPropertyDetails;
  final ApplicationPreviousRentalProvider? previousRentalProvider;
  final ApplicationPropertyManagerDetails? propertyManagerDetails;

  const ApplicationDetails({
    this.pets,
    this.declaration,
    this.disclosures,
    this.applicantDetails,
    this.currentEmployment,
    this.personalReferences,
    this.previousEmployment,
    this.employmentAndIncome,
    this.rentalPropertyDetails,
    this.previousRentalProvider,
    this.propertyManagerDetails,
  });

  factory ApplicationDetails.fromJson(Map<String, dynamic> json) {
    return ApplicationDetails(
      pets: json['pets'] is Map<String, dynamic>
          ? ApplicationPets.fromJson(json['pets'])
          : null,
      declaration: json['declaration'] is Map<String, dynamic>
          ? ApplicationDeclaration.fromJson(json['declaration'])
          : null,
      disclosures: json['disclosures'] is Map<String, dynamic>
          ? ApplicationDisclosures.fromJson(json['disclosures'])
          : null,
      applicantDetails: json['applicant_details'] is Map<String, dynamic>
          ? ApplicationApplicantDetails.fromJson(json['applicant_details'])
          : null,
      currentEmployment: json['current_employment'] is Map<String, dynamic>
          ? ApplicationEmployment.fromJson(json['current_employment'])
          : null,
      personalReferences: (json['personal_references'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ApplicationPersonalReference.fromJson)
          .toList(),
      previousEmployment: json['previous_employment'] is Map<String, dynamic>
          ? ApplicationEmployment.fromJson(json['previous_employment'])
          : null,
      employmentAndIncome: json['employment_and_income'] is Map<String, dynamic>
          ? ApplicationEmploymentAndIncome.fromJson(
              json['employment_and_income'],
            )
          : null,
      rentalPropertyDetails:
          json['rental_property_details'] is Map<String, dynamic>
          ? ApplicationRentalPropertyDetails.fromJson(
              json['rental_property_details'],
            )
          : null,
      previousRentalProvider:
          json['previous_rental_provider'] is Map<String, dynamic>
          ? ApplicationPreviousRentalProvider.fromJson(
              json['previous_rental_provider'],
            )
          : null,
      propertyManagerDetails:
          json['property_manager_details'] is Map<String, dynamic>
          ? ApplicationPropertyManagerDetails.fromJson(
              json['property_manager_details'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'pets': pets?.toJson(),
    'declaration': declaration?.toJson(),
    'disclosures': disclosures?.toJson(),
    'applicant_details': applicantDetails?.toJson(),
    'current_employment': currentEmployment?.toJson(),
    'personal_references': personalReferences?.map((e) => e.toJson()).toList(),
    'previous_employment': previousEmployment?.toJson(),
    'employment_and_income': employmentAndIncome?.toJson(),
    'rental_property_details': rentalPropertyDetails?.toJson(),
    'previous_rental_provider': previousRentalProvider?.toJson(),
    'property_manager_details': propertyManagerDetails?.toJson(),
  };
}

class ApplicationPets {
  final String? details;
  final bool? hasPets;

  const ApplicationPets({this.details, this.hasPets});

  factory ApplicationPets.fromJson(Map<String, dynamic> json) {
    return ApplicationPets(
      details: json['details']?.toString(),
      hasPets: json['has_pets'] == true,
    );
  }

  Map<String, dynamic> toJson() => {'details': details, 'has_pets': hasPets};
}

class ApplicationDeclaration {
  final String? date;
  final String? applicantSignature;

  const ApplicationDeclaration({this.date, this.applicantSignature});

  factory ApplicationDeclaration.fromJson(Map<String, dynamic> json) {
    return ApplicationDeclaration(
      date: json['date']?.toString(),
      applicantSignature: json['applicant_signature']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date,
    'applicant_signature': applicantSignature,
  };
}

class ApplicationDisclosures {
  final ApplicationHeritage? heritage;
  final ApplicationOwnership? ownership;
  final ApplicationSafetyChecks? safetyChecks;
  final String? additionalNotes;
  final ApplicationMortgageeAction? mortgageeAction;
  final ApplicationPropertyHistory? propertyHistory;
  final ApplicationRentalCompliance? rentalCompliance;
  final ApplicationPlanningAndLegal? planningAndLegal;
  final ApplicationIntentToSellPremises? intentToSellPremises;
  final ApplicationEmbeddedElectricityNetwork? embeddedElectricityNetwork;

  const ApplicationDisclosures({
    this.heritage,
    this.ownership,
    this.safetyChecks,
    this.additionalNotes,
    this.mortgageeAction,
    this.propertyHistory,
    this.rentalCompliance,
    this.planningAndLegal,
    this.intentToSellPremises,
    this.embeddedElectricityNetwork,
  });

  factory ApplicationDisclosures.fromJson(Map<String, dynamic> json) {
    return ApplicationDisclosures(
      heritage: json['heritage'] is Map<String, dynamic>
          ? ApplicationHeritage.fromJson(json['heritage'])
          : null,
      ownership: json['ownership'] is Map<String, dynamic>
          ? ApplicationOwnership.fromJson(json['ownership'])
          : null,
      safetyChecks: json['safety_checks'] is Map<String, dynamic>
          ? ApplicationSafetyChecks.fromJson(json['safety_checks'])
          : null,
      additionalNotes: json['additional_notes']?.toString(),
      mortgageeAction: json['mortgagee_action'] is Map<String, dynamic>
          ? ApplicationMortgageeAction.fromJson(json['mortgagee_action'])
          : null,
      propertyHistory: json['property_history'] is Map<String, dynamic>
          ? ApplicationPropertyHistory.fromJson(json['property_history'])
          : null,
      rentalCompliance: json['rental_compliance'] is Map<String, dynamic>
          ? ApplicationRentalCompliance.fromJson(json['rental_compliance'])
          : null,
      planningAndLegal: json['planning_and_legal'] is Map<String, dynamic>
          ? ApplicationPlanningAndLegal.fromJson(json['planning_and_legal'])
          : null,
      intentToSellPremises:
          json['intent_to_sell_premises'] is Map<String, dynamic>
          ? ApplicationIntentToSellPremises.fromJson(
              json['intent_to_sell_premises'],
            )
          : null,
      embeddedElectricityNetwork:
          json['embedded_electricity_network'] is Map<String, dynamic>
          ? ApplicationEmbeddedElectricityNetwork.fromJson(
              json['embedded_electricity_network'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'heritage': heritage?.toJson(),
    'ownership': ownership?.toJson(),
    'safety_checks': safetyChecks?.toJson(),
    'additional_notes': additionalNotes,
    'mortgagee_action': mortgageeAction?.toJson(),
    'property_history': propertyHistory?.toJson(),
    'rental_compliance': rentalCompliance?.toJson(),
    'planning_and_legal': planningAndLegal?.toJson(),
    'intent_to_sell_premises': intentToSellPremises?.toJson(),
    'embedded_electricity_network': embeddedElectricityNetwork?.toJson(),
  };
}

class ApplicationHeritage {
  final String? heritageRegister;
  final bool? isHeritageListed;

  const ApplicationHeritage({this.heritageRegister, this.isHeritageListed});

  factory ApplicationHeritage.fromJson(Map<String, dynamic> json) {
    return ApplicationHeritage(
      heritageRegister: json['heritage_register']?.toString(),
      isHeritageListed: json['is_heritage_listed'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'heritage_register': heritageRegister,
    'is_heritage_listed': isHeritageListed,
  };
}

class ApplicationOwnership {
  final bool? isOwner;
  final bool? hasRightToRent;

  const ApplicationOwnership({this.isOwner, this.hasRightToRent});

  factory ApplicationOwnership.fromJson(Map<String, dynamic> json) {
    return ApplicationOwnership(
      isOwner: json['is_owner'] == true,
      hasRightToRent: json['has_right_to_rent'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'is_owner': isOwner,
    'has_right_to_rent': hasRightToRent,
  };
}

class ApplicationSafetyChecks {
  final String? gasSafetyCheckDate;
  final String? recommendationsDetails;
  final bool? outstandingRecommendations;
  final String? electricitySafetyCheckDate;
  final String? poolBarrierComplianceCheckDate;

  const ApplicationSafetyChecks({
    this.gasSafetyCheckDate,
    this.recommendationsDetails,
    this.outstandingRecommendations,
    this.electricitySafetyCheckDate,
    this.poolBarrierComplianceCheckDate,
  });

  factory ApplicationSafetyChecks.fromJson(Map<String, dynamic> json) {
    return ApplicationSafetyChecks(
      gasSafetyCheckDate: json['gas_safety_check_date']?.toString(),
      recommendationsDetails: json['recommendations_details']?.toString(),
      outstandingRecommendations: json['outstanding_recommendations'] == true,
      electricitySafetyCheckDate: json['electricity_safety_check_date']
          ?.toString(),
      poolBarrierComplianceCheckDate: json['pool_barrier_compliance_check_date']
          ?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'gas_safety_check_date': gasSafetyCheckDate,
    'recommendations_details': recommendationsDetails,
    'outstanding_recommendations': outstandingRecommendations,
    'electricity_safety_check_date': electricitySafetyCheckDate,
    'pool_barrier_compliance_check_date': poolBarrierComplianceCheckDate,
  };
}

class ApplicationMortgageeAction {
  final bool? mortgageeTakingPossession;
  final bool? enforcementProceedingsCommenced;

  const ApplicationMortgageeAction({
    this.mortgageeTakingPossession,
    this.enforcementProceedingsCommenced,
  });

  factory ApplicationMortgageeAction.fromJson(Map<String, dynamic> json) {
    return ApplicationMortgageeAction(
      mortgageeTakingPossession: json['mortgagee_taking_possession'] == true,
      enforcementProceedingsCommenced:
          json['enforcement_proceedings_commenced'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'mortgagee_taking_possession': mortgageeTakingPossession,
    'enforcement_proceedings_commenced': enforcementProceedingsCommenced,
  };
}

class ApplicationPropertyHistory {
  final bool? asbestosPresent;
  final bool? homicideInLast5Years;
  final bool? drugActivityInLast5Years;

  const ApplicationPropertyHistory({
    this.asbestosPresent,
    this.homicideInLast5Years,
    this.drugActivityInLast5Years,
  });

  factory ApplicationPropertyHistory.fromJson(Map<String, dynamic> json) {
    return ApplicationPropertyHistory(
      asbestosPresent: json['asbestos_present'] == true,
      homicideInLast5Years: json['homicide_in_last_5_years'] == true,
      drugActivityInLast5Years: json['drug_activity_in_last_5_years'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'asbestos_present': asbestosPresent,
    'homicide_in_last_5_years': homicideInLast5Years,
    'drug_activity_in_last_5_years': drugActivityInLast5Years,
  };
}

class ApplicationRentalCompliance {
  final bool? meetsMinimumStandards;
  final bool? mouldOrDampRepairNoticesLast3Years;

  const ApplicationRentalCompliance({
    this.meetsMinimumStandards,
    this.mouldOrDampRepairNoticesLast3Years,
  });

  factory ApplicationRentalCompliance.fromJson(Map<String, dynamic> json) {
    return ApplicationRentalCompliance(
      meetsMinimumStandards: json['meets_minimum_standards'] == true,
      mouldOrDampRepairNoticesLast3Years:
          json['mould_or_damp_repair_notices_last_3_years'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'meets_minimum_standards': meetsMinimumStandards,
    'mould_or_damp_repair_notices_last_3_years':
        mouldOrDampRepairNoticesLast3Years,
  };
}

class ApplicationPlanningAndLegal {
  final bool? ownersCorporationDispute;
  final bool? domesticBuildingWorkDispute;
  final bool? affectedByPlanningApplication;
  final bool? buildingOrSafetyNoticesIssued;
  final bool? subjectToOwnersCorporationRules;

  const ApplicationPlanningAndLegal({
    this.ownersCorporationDispute,
    this.domesticBuildingWorkDispute,
    this.affectedByPlanningApplication,
    this.buildingOrSafetyNoticesIssued,
    this.subjectToOwnersCorporationRules,
  });

  factory ApplicationPlanningAndLegal.fromJson(Map<String, dynamic> json) {
    return ApplicationPlanningAndLegal(
      ownersCorporationDispute: json['owners_corporation_dispute'] == true,
      domesticBuildingWorkDispute:
          json['domestic_building_work_dispute'] == true,
      affectedByPlanningApplication:
          json['affected_by_planning_application'] == true,
      buildingOrSafetyNoticesIssued:
          json['building_or_safety_notices_issued'] == true,
      subjectToOwnersCorporationRules:
          json['subject_to_owners_corporation_rules'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'owners_corporation_dispute': ownersCorporationDispute,
    'domestic_building_work_dispute': domesticBuildingWorkDispute,
    'affected_by_planning_application': affectedByPlanningApplication,
    'building_or_safety_notices_issued': buildingOrSafetyNoticesIssued,
    'subject_to_owners_corporation_rules': subjectToOwnersCorporationRules,
  };
}

class ApplicationIntentToSellPremises {
  final bool? engagedAgent;
  final bool? intendsToSell;
  final bool? contractPrepared;

  const ApplicationIntentToSellPremises({
    this.engagedAgent,
    this.intendsToSell,
    this.contractPrepared,
  });

  factory ApplicationIntentToSellPremises.fromJson(Map<String, dynamic> json) {
    return ApplicationIntentToSellPremises(
      engagedAgent: json['engaged_agent'] == true,
      intendsToSell: json['intends_to_sell'] == true,
      contractPrepared: json['contract_prepared'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'engaged_agent': engagedAgent,
    'intends_to_sell': intendsToSell,
    'contract_prepared': contractPrepared,
  };
}

class ApplicationEmbeddedElectricityNetwork {
  final ApplicationEmbeddedNetworkOperator? operator;
  final bool? suppliedByEmbeddedNetwork;

  const ApplicationEmbeddedElectricityNetwork({
    this.operator,
    this.suppliedByEmbeddedNetwork,
  });

  factory ApplicationEmbeddedElectricityNetwork.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationEmbeddedElectricityNetwork(
      operator: json['operator'] is Map<String, dynamic>
          ? ApplicationEmbeddedNetworkOperator.fromJson(json['operator'])
          : null,
      suppliedByEmbeddedNetwork: json['supplied_by_embedded_network'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'operator': operator?.toJson(),
    'supplied_by_embedded_network': suppliedByEmbeddedNetwork,
  };
}

class ApplicationEmbeddedNetworkOperator {
  final String? abn;
  final String? phone;
  final String? website;
  final String? tariffsUrl;
  final String? tradingName;

  const ApplicationEmbeddedNetworkOperator({
    this.abn,
    this.phone,
    this.website,
    this.tariffsUrl,
    this.tradingName,
  });

  factory ApplicationEmbeddedNetworkOperator.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationEmbeddedNetworkOperator(
      abn: json['abn']?.toString(),
      phone: json['phone']?.toString(),
      website: json['website']?.toString(),
      tariffsUrl: json['tariffs_url']?.toString(),
      tradingName: json['trading_name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'abn': abn,
    'phone': phone,
    'website': website,
    'tariffs_url': tariffsUrl,
    'trading_name': tradingName,
  };
}

class ApplicationApplicantDetails {
  final int? age;
  final String? name;
  final ApplicationContact? contact;
  final String? dateOfBirth;

  const ApplicationApplicantDetails({
    this.age,
    this.name,
    this.contact,
    this.dateOfBirth,
  });

  factory ApplicationApplicantDetails.fromJson(Map<String, dynamic> json) {
    return ApplicationApplicantDetails(
      age: _toInt(json['age']),
      name: json['name']?.toString(),
      contact: json['contact'] is Map<String, dynamic>
          ? ApplicationContact.fromJson(json['contact'])
          : null,
      dateOfBirth: json['date_of_birth']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'age': age,
    'name': name,
    'contact': contact?.toJson(),
    'date_of_birth': dateOfBirth,
  };
}

class ApplicationContact {
  final String? email;
  final String? address;
  final String? postcode;
  final String? mobileNumber;
  final String? phoneAfterHours;
  final String? phoneBusinessHours;

  const ApplicationContact({
    this.email,
    this.address,
    this.postcode,
    this.mobileNumber,
    this.phoneAfterHours,
    this.phoneBusinessHours,
  });

  factory ApplicationContact.fromJson(Map<String, dynamic> json) {
    return ApplicationContact(
      email: json['email']?.toString(),
      address: json['address']?.toString(),
      postcode: json['postcode']?.toString(),
      mobileNumber: json['mobile_number']?.toString(),
      phoneAfterHours: json['phone_after_hours']?.toString(),
      phoneBusinessHours: json['phone_business_hours']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'address': address,
    'postcode': postcode,
    'mobile_number': mobileNumber,
    'phone_after_hours': phoneAfterHours,
    'phone_business_hours': phoneBusinessHours,
  };
}

class ApplicationEmployment {
  final String? address;
  final String? remarks;
  final String? postcode;
  final String? phoneNumber;
  final String? employerName;
  final String? positionHeld;
  final int? yearsEmployed;
  final int? monthsEmployed;
  final String? contactPersonName;

  const ApplicationEmployment({
    this.address,
    this.remarks,
    this.postcode,
    this.phoneNumber,
    this.employerName,
    this.positionHeld,
    this.yearsEmployed,
    this.monthsEmployed,
    this.contactPersonName,
  });

  factory ApplicationEmployment.fromJson(Map<String, dynamic> json) {
    return ApplicationEmployment(
      address: json['address']?.toString(),
      remarks: json['remarks']?.toString(),
      postcode: json['postcode']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      employerName: json['employer_name']?.toString(),
      positionHeld: json['position_held']?.toString(),
      yearsEmployed: _toInt(json['years_employed']),
      monthsEmployed: _toInt(json['months_employed']),
      contactPersonName: json['contact_person_name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'remarks': remarks,
    'postcode': postcode,
    'phone_number': phoneNumber,
    'employer_name': employerName,
    'position_held': positionHeld,
    'years_employed': yearsEmployed,
    'months_employed': monthsEmployed,
    'contact_person_name': contactPersonName,
  };
}

class ApplicationPersonalReference {
  final String? name;
  final String? homePhoneNumber;
  final String? workPhoneNumber;
  final String? relationshipToApplicant;

  const ApplicationPersonalReference({
    this.name,
    this.homePhoneNumber,
    this.workPhoneNumber,
    this.relationshipToApplicant,
  });

  factory ApplicationPersonalReference.fromJson(Map<String, dynamic> json) {
    return ApplicationPersonalReference(
      name: json['name']?.toString(),
      homePhoneNumber: json['home_phone_number']?.toString(),
      workPhoneNumber: json['work_phone_number']?.toString(),
      relationshipToApplicant: json['relationship_to_applicant']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'home_phone_number': homePhoneNumber,
    'work_phone_number': workPhoneNumber,
    'relationship_to_applicant': relationshipToApplicant,
  };
}

class ApplicationEmploymentAndIncome {
  final String? employmentStatus;
  final int? salaryIncomePerWeek;
  final int? otherNetIncomePerWeek;

  const ApplicationEmploymentAndIncome({
    this.employmentStatus,
    this.salaryIncomePerWeek,
    this.otherNetIncomePerWeek,
  });

  factory ApplicationEmploymentAndIncome.fromJson(Map<String, dynamic> json) {
    return ApplicationEmploymentAndIncome(
      employmentStatus: json['employment_status']?.toString(),
      salaryIncomePerWeek: _toInt(json['salary_income_per_week']),
      otherNetIncomePerWeek: _toInt(json['other_net_income_per_week']),
    );
  }

  Map<String, dynamic> toJson() => {
    'employment_status': employmentStatus,
    'salary_income_per_week': salaryIncomePerWeek,
    'other_net_income_per_week': otherNetIncomePerWeek,
  };
}

class ApplicationRentalPropertyDetails {
  final String? city;
  final String? state;
  final String? address;
  final String? currency;
  final String? postcode;
  final int? bondAmount;
  final int? rentAmount;
  final String? rentFrequency;
  final String? tenancyEndDate;
  final String? tenancyStartDate;

  const ApplicationRentalPropertyDetails({
    this.city,
    this.state,
    this.address,
    this.currency,
    this.postcode,
    this.bondAmount,
    this.rentAmount,
    this.rentFrequency,
    this.tenancyEndDate,
    this.tenancyStartDate,
  });

  factory ApplicationRentalPropertyDetails.fromJson(Map<String, dynamic> json) {
    return ApplicationRentalPropertyDetails(
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      address: json['address']?.toString(),
      currency: json['currency']?.toString(),
      postcode: json['postcode']?.toString(),
      bondAmount: _toInt(json['bond_amount']),
      rentAmount: _toInt(json['rent_amount']),
      rentFrequency: json['rent_frequency']?.toString(),
      tenancyEndDate: json['tenancy_end_date']?.toString(),
      tenancyStartDate: json['tenancy_start_date']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'city': city,
    'state': state,
    'address': address,
    'currency': currency,
    'postcode': postcode,
    'bond_amount': bondAmount,
    'rent_amount': rentAmount,
    'rent_frequency': rentFrequency,
    'tenancy_end_date': tenancyEndDate,
    'tenancy_start_date': tenancyStartDate,
  };
}

class ApplicationPreviousRentalProvider {
  final String? name;
  final String? phoneNumber;
  final String? emailAddress;

  const ApplicationPreviousRentalProvider({
    this.name,
    this.phoneNumber,
    this.emailAddress,
  });

  factory ApplicationPreviousRentalProvider.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationPreviousRentalProvider(
      name: json['name']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      emailAddress: json['email_address']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
  };
}

class ApplicationPropertyManagerDetails {
  final String? phoneNumber;
  final String? emailAddress;
  final String? estateAgencyName;
  final String? propertyManagerName;

  const ApplicationPropertyManagerDetails({
    this.phoneNumber,
    this.emailAddress,
    this.estateAgencyName,
    this.propertyManagerName,
  });

  factory ApplicationPropertyManagerDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationPropertyManagerDetails(
      phoneNumber: json['phone_number']?.toString(),
      emailAddress: json['email_address']?.toString(),
      estateAgencyName: json['estate_agency_name']?.toString(),
      propertyManagerName: json['property_manager_name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'phone_number': phoneNumber,
    'email_address': emailAddress,
    'estate_agency_name': estateAgencyName,
    'property_manager_name': propertyManagerName,
  };
}

int? _toInt(dynamic v) {
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}
