class GetAgreementsModel {
  bool? error;
  int? code;
  String? message;
  GetAgreementsPayload? data;
  dynamic errors;

  GetAgreementsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  GetAgreementsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = GetAgreementsPayload.fromJson(dataJson);
    }

    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['error'] = error;
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    json['errors'] = errors;
    return json;
  }
}

class GetAgreementsPayload {
  List<AgreementItem>? data;
  AgreementLinks? links;
  AgreementMetaPagination? meta;

  GetAgreementsPayload({this.data, this.links, this.meta});

  GetAgreementsPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => AgreementItem.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = AgreementLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = AgreementMetaPagination.fromJson(metaJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      json['links'] = links!.toJson();
    }
    if (meta != null) {
      json['meta'] = meta!.toJson();
    }
    return json;
  }
}

class AgreementItem {
  int? id;
  int? tenantApplicationId;
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
  num? bondAmount;
  CurrencyDetail? currencyDetail;
  RentType? rentType;
  dynamic signedAt;
  String? terms;
  dynamic rejectionReason;
  AgreementDetails? agreementDetails;
  String? inclusions;
  num? keysCount;
  AgreementProperty? property;
  AgreementPropertyUnit? propertyUnit;
  dynamic tenantApplication;
  AgreementTenant? tenant;
  AgreementLandlord? landlord;
  String? createdAt;

  AgreementItem({
    this.id,
    this.tenantApplicationId,
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
    this.tenantApplication,
    this.tenant,
    this.landlord,
    this.createdAt,
  });

  AgreementItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantApplicationId = json['tenant_application_id'];
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
    bondAmount = _parseNum(json['bond_amount']);
    signedAt = json['signed_at'];
    terms = json['terms']?.toString();
    rejectionReason = json['rejection_reason'];
    inclusions = json['inclusions']?.toString();
    keysCount = _parseNum(json['keys_count']);
    createdAt = json['created_at']?.toString();

    final currencyDetailJson = json['currency_detail'];
    if (currencyDetailJson is Map<String, dynamic>) {
      currencyDetail = CurrencyDetail.fromJson(currencyDetailJson);
    }

    final rentTypeJson = json['rent_type'];
    if (rentTypeJson is Map<String, dynamic>) {
      rentType = RentType.fromJson(rentTypeJson);
    }

    final agreementDetailsJson = json['agreement_details'];
    if (agreementDetailsJson is Map<String, dynamic>) {
      agreementDetails = AgreementDetails.fromJson(agreementDetailsJson);
    }

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = AgreementProperty.fromJson(propertyJson);
    }

    final propertyUnitJson = json['property_unit'];
    if (propertyUnitJson is Map<String, dynamic>) {
      propertyUnit = AgreementPropertyUnit.fromJson(propertyUnitJson);
    }

    tenantApplication = json['tenant_application'];

    final tenantJson = json['tenant'];
    if (tenantJson is Map<String, dynamic>) {
      tenant = AgreementTenant.fromJson(tenantJson);
    }

    final landlordJson = json['landlord'];
    if (landlordJson is Map<String, dynamic>) {
      landlord = AgreementLandlord.fromJson(landlordJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['tenant_application_id'] = tenantApplicationId;
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
    json['signed_at'] = signedAt;
    json['terms'] = terms;
    json['rejection_reason'] = rejectionReason;
    json['inclusions'] = inclusions;
    json['keys_count'] = keysCount;
    json['created_at'] = createdAt;
    if (currencyDetail != null) {
      json['currency_detail'] = currencyDetail!.toJson();
    }
    if (rentType != null) {
      json['rent_type'] = rentType!.toJson();
    }
    if (agreementDetails != null) {
      json['agreement_details'] = agreementDetails!.toJson();
    }
    if (property != null) {
      json['property'] = property!.toJson();
    }
    if (propertyUnit != null) {
      json['property_unit'] = propertyUnit!.toJson();
    }
    json['tenant_application'] = tenantApplication;
    if (tenant != null) {
      json['tenant'] = tenant!.toJson();
    }
    if (landlord != null) {
      json['landlord'] = landlord!.toJson();
    }
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
  num? exchangeRate;
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
    exchangeRate = _parseNum(json['exchange_rate']);
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

class AgreementDetails {
  BasicTerms? basicTerms;
  StandardTerms? standardTerms;
  Signatures? signatures;

  AgreementDetails({this.basicTerms, this.standardTerms, this.signatures});

  AgreementDetails.fromJson(Map<String, dynamic> json) {
    final basicTermsJson = json['basic_terms'];
    if (basicTermsJson is Map<String, dynamic>) {
      basicTerms = BasicTerms.fromJson(basicTermsJson);
    }

    final standardTermsJson = json['standard_terms'];
    if (standardTermsJson is Map<String, dynamic>) {
      standardTerms = StandardTerms.fromJson(standardTermsJson);
    }

    final signaturesJson = json['signatures'];
    if (signaturesJson is Map<String, dynamic>) {
      signatures = Signatures.fromJson(signaturesJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (basicTerms != null) {
      json['basic_terms'] = basicTerms!.toJson();
    }
    if (standardTerms != null) {
      json['standard_terms'] = standardTerms!.toJson();
    }
    if (signatures != null) {
      json['signatures'] = signatures!.toJson();
    }
    return json;
  }
}

class BasicTerms {
  AgreementMetaInfo? agreement;
  RentalProvider? rentalProvider;
  RentalProviderContact? rentalProviderContact;
  Agent? agent;
  AgreementTerm? agreementTerm;
  RentDetail? rent;
  BondDetail? bond;
  List<Renter>? renters;

  BasicTerms({
    this.agreement,
    this.rentalProvider,
    this.rentalProviderContact,
    this.agent,
    this.agreementTerm,
    this.rent,
    this.bond,
    this.renters,
  });

  BasicTerms.fromJson(Map<String, dynamic> json) {
    final agreementJson = json['agreement'];
    if (agreementJson is Map<String, dynamic>) {
      agreement = AgreementMetaInfo.fromJson(agreementJson);
    }

    final rentalProviderJson = json['rental_provider'];
    if (rentalProviderJson is Map<String, dynamic>) {
      rentalProvider = RentalProvider.fromJson(rentalProviderJson);
    }

    final rentalProviderContactJson = json['rental_provider_contact'];
    if (rentalProviderContactJson is Map<String, dynamic>) {
      rentalProviderContact = RentalProviderContact.fromJson(
        rentalProviderContactJson,
      );
    }

    final agentJson = json['agent'];
    if (agentJson is Map<String, dynamic>) {
      agent = Agent.fromJson(agentJson);
    }

    final agreementTermJson = json['agreement_term'];
    if (agreementTermJson is Map<String, dynamic>) {
      agreementTerm = AgreementTerm.fromJson(agreementTermJson);
    }

    final rentJson = json['rent'];
    if (rentJson is Map<String, dynamic>) {
      rent = RentDetail.fromJson(rentJson);
    }

    final bondJson = json['bond'];
    if (bondJson is Map<String, dynamic>) {
      bond = BondDetail.fromJson(bondJson);
    }

    final rentersJson = json['renters'];
    if (rentersJson is List) {
      renters = rentersJson
          .whereType<Map<String, dynamic>>()
          .map((v) => Renter.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (agreement != null) {
      json['agreement'] = agreement!.toJson();
    }
    if (rentalProvider != null) {
      json['rental_provider'] = rentalProvider!.toJson();
    }
    if (rentalProviderContact != null) {
      json['rental_provider_contact'] = rentalProviderContact!.toJson();
    }
    if (agent != null) {
      json['agent'] = agent!.toJson();
    }
    if (agreementTerm != null) {
      json['agreement_term'] = agreementTerm!.toJson();
    }
    if (rent != null) {
      json['rent'] = rent!.toJson();
    }
    if (bond != null) {
      json['bond'] = bond!.toJson();
    }
    if (renters != null) {
      json['renters'] = renters!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class AgreementMetaInfo {
  String? signedDate;

  AgreementMetaInfo({this.signedDate});

  AgreementMetaInfo.fromJson(Map<String, dynamic> json) {
    signedDate = json['signed_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['signed_date'] = signedDate;
    return json;
  }
}

class RentalProvider {
  String? fullNameOrCompanyName;
  String? abn;
  String? address;
  String? postcode;

  RentalProvider({
    this.fullNameOrCompanyName,
    this.abn,
    this.address,
    this.postcode,
  });

  RentalProvider.fromJson(Map<String, dynamic> json) {
    fullNameOrCompanyName = json['full_name_or_company_name']?.toString();
    abn = json['abn']?.toString();
    address = json['address']?.toString();
    postcode = json['postcode']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['full_name_or_company_name'] = fullNameOrCompanyName;
    json['abn'] = abn;
    json['address'] = address;
    json['postcode'] = postcode;
    return json;
  }
}

class RentalProviderContact {
  String? address;
  String? postcode;
  String? phoneNumber;
  String? emailAddress;

  RentalProviderContact({
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
  });

  RentalProviderContact.fromJson(Map<String, dynamic> json) {
    address = json['address']?.toString();
    postcode = json['postcode']?.toString();
    phoneNumber = json['phone_number']?.toString();
    emailAddress = json['email_address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['address'] = address;
    json['postcode'] = postcode;
    json['phone_number'] = phoneNumber;
    json['email_address'] = emailAddress;
    return json;
  }
}

class Agent {
  String? fullName;
  String? address;
  String? postcode;
  String? phoneNumber;
  String? emailAddress;
  String? abn;

  Agent({
    this.fullName,
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
    this.abn,
  });

  Agent.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name']?.toString();
    address = json['address']?.toString();
    postcode = json['postcode']?.toString();
    phoneNumber = json['phone_number']?.toString();
    emailAddress = json['email_address']?.toString();
    abn = json['abn']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['full_name'] = fullName;
    json['address'] = address;
    json['postcode'] = postcode;
    json['phone_number'] = phoneNumber;
    json['email_address'] = emailAddress;
    json['abn'] = abn;
    return json;
  }
}

class AgreementTerm {
  String? termType;
  FixedTerm? fixedTerm;
  PeriodicTerm? periodicTerm;

  AgreementTerm({this.termType, this.fixedTerm, this.periodicTerm});

  AgreementTerm.fromJson(Map<String, dynamic> json) {
    termType = json['term_type']?.toString();

    final fixedTermJson = json['fixed_term'];
    if (fixedTermJson is Map<String, dynamic>) {
      fixedTerm = FixedTerm.fromJson(fixedTermJson);
    }

    final periodicTermJson = json['periodic_term'];
    if (periodicTermJson is Map<String, dynamic>) {
      periodicTerm = PeriodicTerm.fromJson(periodicTermJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['term_type'] = termType;
    if (fixedTerm != null) {
      json['fixed_term'] = fixedTerm!.toJson();
    }
    if (periodicTerm != null) {
      json['periodic_term'] = periodicTerm!.toJson();
    }
    return json;
  }
}

class FixedTerm {
  String? startDate;
  String? endDate;

  FixedTerm({this.startDate, this.endDate});

  FixedTerm.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    return json;
  }
}

class PeriodicTerm {
  dynamic startDate;

  PeriodicTerm({this.startDate});

  PeriodicTerm.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['start_date'] = startDate;
    return json;
  }
}

class RentDetail {
  num? amount;
  String? currency;
  String? frequency;
  String? rentDueDate;

  RentDetail({this.amount, this.currency, this.frequency, this.rentDueDate});

  RentDetail.fromJson(Map<String, dynamic> json) {
    amount = _parseNum(json['amount']);
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

class BondDetail {
  num? amount;
  String? paymentDueDate;

  BondDetail({this.amount, this.paymentDueDate});

  BondDetail.fromJson(Map<String, dynamic> json) {
    amount = _parseNum(json['amount']);
    paymentDueDate = json['payment_due_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['amount'] = amount;
    json['payment_due_date'] = paymentDueDate;
    return json;
  }
}

class Renter {
  String? fullName;
  String? address;
  String? postcode;
  String? phoneNumber;
  String? emailAddress;

  Renter({
    this.fullName,
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
  });

  Renter.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name']?.toString();
    address = json['address']?.toString();
    postcode = json['postcode']?.toString();
    phoneNumber = json['phone_number']?.toString();
    emailAddress = json['email_address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['full_name'] = fullName;
    json['address'] = address;
    json['postcode'] = postcode;
    json['phone_number'] = phoneNumber;
    json['email_address'] = emailAddress;
    return json;
  }
}

class StandardTerms {
  String? rentalPaymentMethod;
  LatePaymentPolicy? latePaymentPolicy;
  EmergencyContact? emergencyContact;
  List<RenterContactConsent>? renterContactConsents;

  StandardTerms({
    this.rentalPaymentMethod,
    this.latePaymentPolicy,
    this.emergencyContact,
    this.renterContactConsents,
  });

  StandardTerms.fromJson(Map<String, dynamic> json) {
    rentalPaymentMethod = json['rental_payment_method']?.toString();

    final latePaymentPolicyJson = json['late_payment_policy'];
    if (latePaymentPolicyJson is Map<String, dynamic>) {
      latePaymentPolicy = LatePaymentPolicy.fromJson(latePaymentPolicyJson);
    }

    final emergencyContactJson = json['emergency_contact'];
    if (emergencyContactJson is Map<String, dynamic>) {
      emergencyContact = EmergencyContact.fromJson(emergencyContactJson);
    }

    final renterContactConsentsJson = json['renter_contact_consents'];
    if (renterContactConsentsJson is List) {
      renterContactConsents = renterContactConsentsJson
          .whereType<Map<String, dynamic>>()
          .map((v) => RenterContactConsent.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['rental_payment_method'] = rentalPaymentMethod;
    if (latePaymentPolicy != null) {
      json['late_payment_policy'] = latePaymentPolicy!.toJson();
    }
    if (emergencyContact != null) {
      json['emergency_contact'] = emergencyContact!.toJson();
    }
    if (renterContactConsents != null) {
      json['renter_contact_consents'] = renterContactConsents!
          .map((v) => v.toJson())
          .toList();
    }
    return json;
  }
}

class LatePaymentPolicy {
  String? purpose;
  RentDueDate? rentDueDate;
  LateFees? lateFees;
  String? communication;
  ReturnedPayments? returnedPayments;
  NonPaymentAndEviction? nonPaymentAndEviction;
  String? applicationOfPayments;
  String? amendments;

  LatePaymentPolicy({
    this.purpose,
    this.rentDueDate,
    this.lateFees,
    this.communication,
    this.returnedPayments,
    this.nonPaymentAndEviction,
    this.applicationOfPayments,
    this.amendments,
  });

  LatePaymentPolicy.fromJson(Map<String, dynamic> json) {
    purpose = json['purpose']?.toString();

    final rentDueDateJson = json['rent_due_date'];
    if (rentDueDateJson is Map<String, dynamic>) {
      rentDueDate = RentDueDate.fromJson(rentDueDateJson);
    }

    final lateFeesJson = json['late_fees'];
    if (lateFeesJson is Map<String, dynamic>) {
      lateFees = LateFees.fromJson(lateFeesJson);
    }

    communication = json['communication']?.toString();

    final returnedPaymentsJson = json['returned_payments'];
    if (returnedPaymentsJson is Map<String, dynamic>) {
      returnedPayments = ReturnedPayments.fromJson(returnedPaymentsJson);
    }

    final nonPaymentAndEvictionJson = json['non_payment_and_eviction'];
    if (nonPaymentAndEvictionJson is Map<String, dynamic>) {
      nonPaymentAndEviction = NonPaymentAndEviction.fromJson(
        nonPaymentAndEvictionJson,
      );
    }

    applicationOfPayments = json['application_of_payments']?.toString();
    amendments = json['amendments']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['purpose'] = purpose;
    if (rentDueDate != null) {
      json['rent_due_date'] = rentDueDate!.toJson();
    }
    if (lateFees != null) {
      json['late_fees'] = lateFees!.toJson();
    }
    json['communication'] = communication;
    if (returnedPayments != null) {
      json['returned_payments'] = returnedPayments!.toJson();
    }
    if (nonPaymentAndEviction != null) {
      json['non_payment_and_eviction'] = nonPaymentAndEviction!.toJson();
    }
    json['application_of_payments'] = applicationOfPayments;
    json['amendments'] = amendments;
    return json;
  }
}

class RentDueDate {
  String? frequency;
  String? timeCutoff;
  bool? lateIfAfterCutoff;

  RentDueDate({this.frequency, this.timeCutoff, this.lateIfAfterCutoff});

  RentDueDate.fromJson(Map<String, dynamic> json) {
    frequency = json['frequency']?.toString();
    timeCutoff = json['time_cutoff']?.toString();
    lateIfAfterCutoff = json['late_if_after_cutoff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['frequency'] = frequency;
    json['time_cutoff'] = timeCutoff;
    json['late_if_after_cutoff'] = lateIfAfterCutoff;
    return json;
  }
}

class LateFees {
  num? initialLateFee;
  num? initialLateFeeAppliesAfterDays;
  num? additionalDailyFee;
  num? maximumAdditionalFeePeriodDays;

  LateFees({
    this.initialLateFee,
    this.initialLateFeeAppliesAfterDays,
    this.additionalDailyFee,
    this.maximumAdditionalFeePeriodDays,
  });

  LateFees.fromJson(Map<String, dynamic> json) {
    initialLateFee = _parseNum(json['initial_late_fee']);
    initialLateFeeAppliesAfterDays = _parseNum(
      json['initial_late_fee_applies_after_days'],
    );
    additionalDailyFee = _parseNum(json['additional_daily_fee']);
    maximumAdditionalFeePeriodDays = _parseNum(
      json['maximum_additional_fee_period_days'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['initial_late_fee'] = initialLateFee;
    json['initial_late_fee_applies_after_days'] =
        initialLateFeeAppliesAfterDays;
    json['additional_daily_fee'] = additionalDailyFee;
    json['maximum_additional_fee_period_days'] = maximumAdditionalFeePeriodDays;
    return json;
  }
}

class ReturnedPayments {
  num? returnedPaymentFee;
  bool? additionalLateFeesApply;

  ReturnedPayments({this.returnedPaymentFee, this.additionalLateFeesApply});

  ReturnedPayments.fromJson(Map<String, dynamic> json) {
    returnedPaymentFee = _parseNum(json['returned_payment_fee']);
    additionalLateFeesApply = json['additional_late_fees_apply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['returned_payment_fee'] = returnedPaymentFee;
    json['additional_late_fees_apply'] = additionalLateFeesApply;
    return json;
  }
}

class NonPaymentAndEviction {
  num? daysBeforeAction;
  List<String>? actions;

  NonPaymentAndEviction({this.daysBeforeAction, this.actions});

  NonPaymentAndEviction.fromJson(Map<String, dynamic> json) {
    daysBeforeAction = _parseNum(json['days_before_action']);
    final actionsRaw = json['actions'];
    if (actionsRaw is List) {
      actions = actionsRaw.map((e) => e.toString()).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['days_before_action'] = daysBeforeAction;
    json['actions'] = actions;
    return json;
  }
}

class EmergencyContact {
  String? name;
  String? phoneNumber;
  String? emailAddress;

  EmergencyContact({this.name, this.phoneNumber, this.emailAddress});

  EmergencyContact.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    phoneNumber = json['phone_number']?.toString();
    emailAddress = json['email_address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['phone_number'] = phoneNumber;
    json['email_address'] = emailAddress;
    return json;
  }
}

class RenterContactConsent {
  int? renterIndex;
  bool? consentGiven;
  String? contactDetails;

  RenterContactConsent({
    this.renterIndex,
    this.consentGiven,
    this.contactDetails,
  });

  RenterContactConsent.fromJson(Map<String, dynamic> json) {
    renterIndex = json['renter_index'];
    consentGiven = json['consent_given'];
    contactDetails = json['contact_details']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['renter_index'] = renterIndex;
    json['consent_given'] = consentGiven;
    json['contact_details'] = contactDetails;
    return json;
  }
}

class Signatures {
  List<ProviderSignature>? rentalProviders;
  List<RenterSignature>? renters;

  Signatures({this.rentalProviders, this.renters});

  Signatures.fromJson(Map<String, dynamic> json) {
    final rentalProvidersJson = json['rental_providers'];
    if (rentalProvidersJson is List) {
      rentalProviders = rentalProvidersJson
          .whereType<Map<String, dynamic>>()
          .map((v) => ProviderSignature.fromJson(v))
          .toList();
    }

    final rentersJson = json['renters'];
    if (rentersJson is List) {
      renters = rentersJson
          .whereType<Map<String, dynamic>>()
          .map((v) => RenterSignature.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (rentalProviders != null) {
      json['rental_providers'] = rentalProviders!
          .map((v) => v.toJson())
          .toList();
    }
    if (renters != null) {
      json['renters'] = renters!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class ProviderSignature {
  int? providerIndex;
  dynamic signature;
  dynamic signedDate;

  ProviderSignature({this.providerIndex, this.signature, this.signedDate});

  ProviderSignature.fromJson(Map<String, dynamic> json) {
    providerIndex = json['provider_index'];
    signature = json['signature'];
    signedDate = json['signed_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['provider_index'] = providerIndex;
    json['signature'] = signature;
    json['signed_date'] = signedDate;
    return json;
  }
}

class RenterSignature {
  int? renterIndex;
  String? signature;
  String? signedDate;

  RenterSignature({this.renterIndex, this.signature, this.signedDate});

  RenterSignature.fromJson(Map<String, dynamic> json) {
    renterIndex = json['renter_index'];
    signature = json['signature']?.toString();
    signedDate = json['signed_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['renter_index'] = renterIndex;
    json['signature'] = signature;
    json['signed_date'] = signedDate;
    return json;
  }
}

class AgreementProperty {
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
  String? latitude;
  String? longitude;
  int? bedrooms;
  int? bathrooms;
  int? parkingSpaces;
  dynamic landSize;
  String? buildingSize;
  int? yearBuilt;
  String? status;
  String? availableFrom;
  bool? isVerified;
  bool? isInPersonInspectionAvailable;
  bool? isVirtualInspectionAvailable;
  bool? isFavourite;
  List<String>? features;
  List<dynamic>? leaseAgreementDefaults;
  String? rating;
  int? ratingCount;
  List<AgreementPropertyUnit>? units;
  List<PropertyImage>? images;
  List<PropertyAmenity>? amenities;
  List<dynamic>? documents;
  ReviewSummary? reviewSummary;
  String? createdAt;
  String? updatedAt;

  AgreementProperty({
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
    this.leaseAgreementDefaults,
    this.rating,
    this.ratingCount,
    this.units,
    this.images,
    this.amenities,
    this.documents,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  });

  AgreementProperty.fromJson(Map<String, dynamic> json) {
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
    latitude = json['latitude']?.toString();
    longitude = json['longitude']?.toString();
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parkingSpaces = json['parking_spaces'];
    landSize = json['land_size'];
    buildingSize = json['building_size']?.toString();
    yearBuilt = json['year_built'];
    status = json['status']?.toString();
    availableFrom = json['available_from']?.toString();
    isVerified = json['is_verified'];
    isInPersonInspectionAvailable = json['is_in_person_inspection_available'];
    isVirtualInspectionAvailable = json['is_virtual_inspection_available'];
    isFavourite = json['is_favourite'];

    final featuresRaw = json['features'];
    if (featuresRaw is List) {
      features = featuresRaw.map((e) => e.toString()).toList();
    }

    final leaseAgreementDefaultsRaw = json['lease_agreement_defaults'];
    if (leaseAgreementDefaultsRaw is List) {
      leaseAgreementDefaults = leaseAgreementDefaultsRaw;
    }

    rating = json['rating']?.toString();
    ratingCount = json['rating_count'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();

    final unitsJson = json['units'];
    if (unitsJson is List) {
      units = unitsJson
          .whereType<Map<String, dynamic>>()
          .map((v) => AgreementPropertyUnit.fromJson(v))
          .toList();
    }

    final imagesJson = json['images'];
    if (imagesJson is List) {
      images = imagesJson
          .whereType<Map<String, dynamic>>()
          .map((v) => PropertyImage.fromJson(v))
          .toList();
    }

    final amenitiesJson = json['amenities'];
    if (amenitiesJson is List) {
      amenities = amenitiesJson
          .whereType<Map<String, dynamic>>()
          .map((v) => PropertyAmenity.fromJson(v))
          .toList();
    }

    final documentsRaw = json['documents'];
    if (documentsRaw is List) {
      documents = documentsRaw;
    }

    final reviewSummaryJson = json['review_summary'];
    if (reviewSummaryJson is Map<String, dynamic>) {
      reviewSummary = ReviewSummary.fromJson(reviewSummaryJson);
    }
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
    json['available_from'] = availableFrom;
    json['is_verified'] = isVerified;
    json['is_in_person_inspection_available'] = isInPersonInspectionAvailable;
    json['is_virtual_inspection_available'] = isVirtualInspectionAvailable;
    json['is_favourite'] = isFavourite;
    json['features'] = features;
    json['lease_agreement_defaults'] = leaseAgreementDefaults;
    json['rating'] = rating;
    json['rating_count'] = ratingCount;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (units != null) {
      json['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      json['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (amenities != null) {
      json['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    json['documents'] = documents;
    if (reviewSummary != null) {
      json['review_summary'] = reviewSummary!.toJson();
    }
    return json;
  }
}

class AgreementPropertyUnit {
  int? id;
  int? propertyId;
  String? unitNumber;
  String? unitName;
  String? rentAmount;
  UnitRentType? rentType;
  UnitCurrency? currency;
  num? displayRentAmount;
  UnitCurrency? displayCurrency;
  String? status;
  int? bedrooms;
  int? bathrooms;
  String? size;
  String? description;

  AgreementPropertyUnit({
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

  AgreementPropertyUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    unitNumber = json['unit_number']?.toString();
    unitName = json['unit_name']?.toString();
    rentAmount = json['rent_amount']?.toString();
    displayRentAmount = _parseNum(json['display_rent_amount']);
    status = json['status']?.toString();
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    size = json['size']?.toString();
    description = json['description']?.toString();

    final rentTypeJson = json['rent_type'];
    if (rentTypeJson is Map<String, dynamic>) {
      rentType = UnitRentType.fromJson(rentTypeJson);
    }

    final currencyJson = json['currency'];
    if (currencyJson is Map<String, dynamic>) {
      currency = UnitCurrency.fromJson(currencyJson);
    }

    final displayCurrencyJson = json['display_currency'];
    if (displayCurrencyJson is Map<String, dynamic>) {
      displayCurrency = UnitCurrency.fromJson(displayCurrencyJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['property_id'] = propertyId;
    json['unit_number'] = unitNumber;
    json['unit_name'] = unitName;
    json['rent_amount'] = rentAmount;
    json['display_rent_amount'] = displayRentAmount;
    json['status'] = status;
    json['bedrooms'] = bedrooms;
    json['bathrooms'] = bathrooms;
    json['size'] = size;
    json['description'] = description;
    if (rentType != null) {
      json['rent_type'] = rentType!.toJson();
    }
    if (currency != null) {
      json['currency'] = currency!.toJson();
    }
    if (displayCurrency != null) {
      json['display_currency'] = displayCurrency!.toJson();
    }
    return json;
  }
}

class UnitRentType {
  int? id;
  String? name;
  String? slug;
  int? rentDays;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  UnitRentType({
    this.id,
    this.name,
    this.slug,
    this.rentDays,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  UnitRentType.fromJson(Map<String, dynamic> json) {
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

class UnitCurrency {
  int? id;
  String? code;
  String? name;
  String? symbol;
  String? logo;
  String? type;
  int? decimalPlaces;
  num? exchangeRate;
  bool? isActive;
  int? sortOrder;

  UnitCurrency({
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

  UnitCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code']?.toString();
    name = json['name']?.toString();
    symbol = json['symbol']?.toString();
    logo = json['logo']?.toString();
    type = json['type']?.toString();
    decimalPlaces = json['decimal_places'];
    exchangeRate = _parseNum(json['exchange_rate']);
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

class PropertyImage {
  int? id;
  int? propertyId;
  String? imagePath;
  String? type;
  int? order;
  bool? isPrimary;
  String? caption;
  String? createdAt;
  String? updatedAt;

  PropertyImage({
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

  PropertyImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    imagePath = json['image_path']?.toString();
    type = json['type']?.toString();
    order = json['order'];
    isPrimary = json['is_primary'];
    caption = json['caption']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['property_id'] = propertyId;
    json['image_path'] = imagePath;
    json['type'] = type;
    json['order'] = order;
    json['is_primary'] = isPrimary;
    json['caption'] = caption;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class PropertyAmenity {
  int? id;
  int? propertyId;
  int? amenityTypeId;
  AmenityType? amenityType;
  String? createdAt;
  String? updatedAt;

  PropertyAmenity({
    this.id,
    this.propertyId,
    this.amenityTypeId,
    this.amenityType,
    this.createdAt,
    this.updatedAt,
  });

  PropertyAmenity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    amenityTypeId = json['amenity_type_id'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();

    final amenityTypeJson = json['amenity_type'];
    if (amenityTypeJson is Map<String, dynamic>) {
      amenityType = AmenityType.fromJson(amenityTypeJson);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['property_id'] = propertyId;
    json['amenity_type_id'] = amenityTypeId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (amenityType != null) {
      json['amenity_type'] = amenityType!.toJson();
    }
    return json;
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
    id = json['id'];
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    icon = json['icon']?.toString();
    iconUrl = json['icon_url']?.toString();
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
    json['icon'] = icon;
    json['icon_url'] = iconUrl;
    json['description'] = description;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class ReviewSummary {
  int? totalReviews;
  String? averageRating;

  ReviewSummary({this.totalReviews, this.averageRating});

  ReviewSummary.fromJson(Map<String, dynamic> json) {
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total_reviews'] = totalReviews;
    json['average_rating'] = averageRating;
    return json;
  }
}

class AgreementTenant {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? email;
  dynamic phone;
  bool? isActive;
  String? provider;
  String? providerId;
  List<String>? roles;
  TenantProfile? tenantProfile;
  List<dynamic>? documents;
  String? createdAt;
  String? updatedAt;

  AgreementTenant({
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

  AgreementTenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    gender = json['gender']?.toString();
    image = json['image']?.toString();
    email = json['email']?.toString();
    phone = json['phone'];
    isActive = json['is_active'];
    provider = json['provider']?.toString();
    providerId = json['provider_id']?.toString();

    final rolesRaw = json['roles'];
    if (rolesRaw is List) {
      roles = rolesRaw.map((e) => e.toString()).toList();
    }

    final tenantProfileJson = json['tenant_profile'];
    if (tenantProfileJson is Map<String, dynamic>) {
      tenantProfile = TenantProfile.fromJson(tenantProfileJson);
    }

    final documentsRaw = json['documents'];
    if (documentsRaw is List) {
      documents = documentsRaw;
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['gender'] = gender;
    json['image'] = image;
    json['email'] = email;
    json['phone'] = phone;
    json['is_active'] = isActive;
    json['provider'] = provider;
    json['provider_id'] = providerId;
    json['roles'] = roles;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (tenantProfile != null) {
      json['tenant_profile'] = tenantProfile!.toJson();
    }
    json['documents'] = documents;
    return json;
  }
}

class TenantProfile {
  int? id;
  dynamic employmentStatus;
  dynamic employerName;
  dynamic jobTitle;
  dynamic monthlyIncome;
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
    id = json['id'];
    employmentStatus = json['employment_status'];
    employerName = json['employer_name'];
    jobTitle = json['job_title'];
    monthlyIncome = json['monthly_income'];
    isVerified = json['is_verified'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['employment_status'] = employmentStatus;
    json['employer_name'] = employerName;
    json['job_title'] = jobTitle;
    json['monthly_income'] = monthlyIncome;
    json['is_verified'] = isVerified;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class AgreementLandlord {
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
  AgentProfile? agentProfile;
  LandlordProfile? landlordProfile;
  List<dynamic>? documents;
  String? createdAt;
  String? updatedAt;

  AgreementLandlord({
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
    this.agentProfile,
    this.landlordProfile,
    this.documents,
    this.createdAt,
    this.updatedAt,
  });

  AgreementLandlord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    gender = json['gender']?.toString();
    image = json['image']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    isActive = json['is_active'];
    provider = json['provider'];
    providerId = json['provider_id'];

    final rolesRaw = json['roles'];
    if (rolesRaw is List) {
      roles = rolesRaw.map((e) => e.toString()).toList();
    }

    final agentProfileJson = json['agent_profile'];
    if (agentProfileJson is Map<String, dynamic>) {
      agentProfile = AgentProfile.fromJson(agentProfileJson);
    }

    final landlordProfileJson = json['landlord_profile'];
    if (landlordProfileJson is Map<String, dynamic>) {
      landlordProfile = LandlordProfile.fromJson(landlordProfileJson);
    }

    final documentsRaw = json['documents'];
    if (documentsRaw is List) {
      documents = documentsRaw;
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['gender'] = gender;
    json['image'] = image;
    json['email'] = email;
    json['phone'] = phone;
    json['is_active'] = isActive;
    json['provider'] = provider;
    json['provider_id'] = providerId;
    json['roles'] = roles;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (agentProfile != null) {
      json['agent_profile'] = agentProfile!.toJson();
    }
    if (landlordProfile != null) {
      json['landlord_profile'] = landlordProfile!.toJson();
    }
    json['documents'] = documents;
    return json;
  }
}

class AgentProfile {
  int? id;
  String? agencyName;
  String? abn;
  String? reiaNumber;
  bool? isVerified;
  String? status;
  dynamic rejectionReason;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  dynamic subscription;

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
    id = json['id'];
    agencyName = json['agency_name']?.toString();
    abn = json['abn']?.toString();
    reiaNumber = json['reia_number']?.toString();
    isVerified = json['is_verified'];
    status = json['status']?.toString();
    rejectionReason = json['rejection_reason'];
    approvedAt = json['approved_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['agency_name'] = agencyName;
    json['abn'] = abn;
    json['reia_number'] = reiaNumber;
    json['is_verified'] = isVerified;
    json['status'] = status;
    json['rejection_reason'] = rejectionReason;
    json['approved_at'] = approvedAt;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['subscription'] = subscription;
    return json;
  }
}

class LandlordProfile {
  int? id;
  String? description;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  dynamic subscription;

  LandlordProfile({
    this.id,
    this.description,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  LandlordProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description']?.toString();
    isVerified = json['is_verified'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['description'] = description;
    json['is_verified'] = isVerified;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['subscription'] = subscription;
    return json;
  }
}

class AgreementLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  AgreementLinks({this.first, this.last, this.prev, this.next});

  AgreementLinks.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['first'] = first;
    json['last'] = last;
    json['prev'] = prev;
    json['next'] = next;
    return json;
  }
}

class AgreementMetaPagination {
  int? currentPage;
  int? from;
  int? lastPage;
  List<AgreementMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  AgreementMetaPagination({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  AgreementMetaPagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path']?.toString();
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];

    final list = json['links'];
    if (list is List) {
      links = list
          .whereType<Map<String, dynamic>>()
          .map((v) => AgreementMetaLink.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_page'] = currentPage;
    json['from'] = from;
    json['last_page'] = lastPage;
    if (links != null) {
      json['links'] = links!.map((v) => v.toJson()).toList();
    }
    json['path'] = path;
    json['per_page'] = perPage;
    json['to'] = to;
    json['total'] = total;
    return json;
  }
}

class AgreementMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  AgreementMetaLink({this.url, this.label, this.page, this.active});

  AgreementMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    final rawPage = json['page'];
    page = rawPage is int ? rawPage : int.tryParse(rawPage?.toString() ?? '');
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['url'] = url;
    json['label'] = label;
    json['page'] = page;
    json['active'] = active;
    return json;
  }
}

// ============================================================
// HELPER FUNCTION TO PARSE NUM (STRING OR NUM)
// ============================================================

num? _parseNum(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) {
    final intValue = int.tryParse(value);
    if (intValue != null) return intValue;
    final doubleValue = double.tryParse(value);
    if (doubleValue != null) return doubleValue;
    return null;
  }
  return null;
}
