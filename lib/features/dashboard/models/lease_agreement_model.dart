class LeaseAgreementModel {
  final bool? error;
  final int? code;
  final String? message;
  final LeaseAgreementPayload? data;
  final dynamic errors;

  const LeaseAgreementModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory LeaseAgreementModel.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementModel(
      error: json['error'],
      code: json['code'],
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic>
          ? LeaseAgreementPayload.fromJson(json['data'])
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

// ============================================================
// PAYLOAD (wrapper with pagination)
// ============================================================

class LeaseAgreementPayload {
  final List<LeaseAgreementItem>? data;
  final LeaseAgreementLinks? links;
  final LeaseAgreementMeta? meta;

  const LeaseAgreementPayload({this.data, this.links, this.meta});

  factory LeaseAgreementPayload.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementPayload(
      data: (json['data'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => LeaseAgreementItem.fromJson(e))
          .toList(),
      links: json['links'] is Map<String, dynamic>
          ? LeaseAgreementLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] is Map<String, dynamic>
          ? LeaseAgreementMeta.fromJson(json['meta'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
  };
}

// ============================================================
// LEASE AGREEMENT ITEM (main record)
// ============================================================

class LeaseAgreementItem {
  final int? id;
  final int? tenantId;
  final int? landlordId;
  final int? propertyId;
  final int? propertyUnitId;
  final String? status;
  final String? startDate;
  final String? endDate;
  final String? rentAmount;
  final String? currency;
  final int? currencyId;
  final String? paymentFrequency;
  final int? rentTypeId;
  final num? bondAmount;
  final LeaseAgreementCurrencyDetail? currencyDetail;
  final LeaseAgreementRentType? rentType;
  final dynamic signedAt;
  final String? terms;
  final dynamic rejectionReason;
  final AgreementDetails? agreementDetails;
  final String? inclusions;
  final num? keysCount;
  final LeaseAgreementProperty? property;
  final LeaseAgreementPropertyUnit? propertyUnit;
  final LeaseAgreementTenant? tenant;
  final LeaseAgreementLandlord? landlord;
  final String? createdAt;

  const LeaseAgreementItem({
    this.id,
    this.tenantId,
    this.landlordId,
    this.propertyId,
    this.propertyUnitId,
    this.status,
    this.startDate,
    this.endDate,
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
    this.tenant,
    this.landlord,
    this.createdAt,
  });

  factory LeaseAgreementItem.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementItem(
      id: json['id'],
      tenantId: json['tenant_id'],
      landlordId: json['landlord_id'],
      propertyId: json['property_id'],
      propertyUnitId: json['property_unit_id'],
      status: json['status']?.toString(),
      startDate: json['start_date']?.toString(),
      endDate: json['end_date']?.toString(),
      rentAmount: json['rent_amount']?.toString(),
      currency: json['currency']?.toString(),
      currencyId: json['currency_id'],
      paymentFrequency: json['payment_frequency']?.toString(),
      rentTypeId: json['rent_type_id'],
      bondAmount: _parseNum(json['bond_amount']),
      currencyDetail: json['currency_detail'] is Map<String, dynamic>
          ? LeaseAgreementCurrencyDetail.fromJson(json['currency_detail'])
          : null,
      rentType: json['rent_type'] is Map<String, dynamic>
          ? LeaseAgreementRentType.fromJson(json['rent_type'])
          : null,
      signedAt: json['signed_at'],
      terms: json['terms']?.toString(),
      rejectionReason: json['rejection_reason'],
      agreementDetails: json['agreement_details'] is Map<String, dynamic>
          ? AgreementDetails.fromJson(json['agreement_details'])
          : null,
      inclusions: json['inclusions']?.toString(),
      keysCount: _parseNum(json['keys_count']),
      property: json['property'] is Map<String, dynamic>
          ? LeaseAgreementProperty.fromJson(json['property'])
          : null,
      propertyUnit: json['property_unit'] is Map<String, dynamic>
          ? LeaseAgreementPropertyUnit.fromJson(json['property_unit'])
          : null,
      tenant: json['tenant'] is Map<String, dynamic>
          ? LeaseAgreementTenant.fromJson(json['tenant'])
          : null,
      landlord: json['landlord'] is Map<String, dynamic>
          ? LeaseAgreementLandlord.fromJson(json['landlord'])
          : null,
      createdAt: json['created_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tenant_id': tenantId,
    'landlord_id': landlordId,
    'property_id': propertyId,
    'property_unit_id': propertyUnitId,
    'status': status,
    'start_date': startDate,
    'end_date': endDate,
    'rent_amount': rentAmount,
    'currency': currency,
    'currency_id': currencyId,
    'payment_frequency': paymentFrequency,
    'rent_type_id': rentTypeId,
    'bond_amount': bondAmount,
    'currency_detail': currencyDetail?.toJson(),
    'rent_type': rentType?.toJson(),
    'signed_at': signedAt,
    'terms': terms,
    'rejection_reason': rejectionReason,
    'agreement_details': agreementDetails?.toJson(),
    'inclusions': inclusions,
    'keys_count': keysCount,
    'property': property?.toJson(),
    'property_unit': propertyUnit?.toJson(),
    'tenant': tenant?.toJson(),
    'landlord': landlord?.toJson(),
    'created_at': createdAt,
  };
}

// ============================================================
// CURRENCY DETAIL
// ============================================================

class LeaseAgreementCurrencyDetail {
  final int? id;
  final String? code;
  final String? name;
  final String? symbol;

  const LeaseAgreementCurrencyDetail({
    this.id,
    this.code,
    this.name,
    this.symbol,
  });

  factory LeaseAgreementCurrencyDetail.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementCurrencyDetail(
      id: json['id'],
      code: json['code']?.toString(),
      name: json['name']?.toString(),
      symbol: json['symbol']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'symbol': symbol,
  };
}

// ============================================================
// RENT TYPE
// ============================================================

class LeaseAgreementRentType {
  final int? id;
  final String? name;
  final String? slug;

  const LeaseAgreementRentType({this.id, this.name, this.slug});

  factory LeaseAgreementRentType.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementRentType(
      id: json['id'],
      name: json['name']?.toString(),
      slug: json['slug']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'slug': slug};
}

// ============================================================
// AGREEMENT DETAILS (nested structure)
// ============================================================

class AgreementDetails {
  final BasicTerms? basicTerms;
  final StandardTerms? standardTerms;
  final AgreementSignatures? signatures;

  const AgreementDetails({
    this.basicTerms,
    this.standardTerms,
    this.signatures,
  });

  factory AgreementDetails.fromJson(Map<String, dynamic> json) {
    return AgreementDetails(
      basicTerms: json['basic_terms'] is Map<String, dynamic>
          ? BasicTerms.fromJson(json['basic_terms'])
          : null,
      standardTerms: json['standard_terms'] is Map<String, dynamic>
          ? StandardTerms.fromJson(json['standard_terms'])
          : null,
      signatures: json['signatures'] is Map<String, dynamic>
          ? AgreementSignatures.fromJson(json['signatures'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'basic_terms': basicTerms?.toJson(),
    'standard_terms': standardTerms?.toJson(),
    'signatures': signatures?.toJson(),
  };
}

// ============================================================
// BASIC TERMS
// ============================================================

class BasicTerms {
  final AgreementMeta? agreement;
  final RentalProvider? rentalProvider;
  final RentalProviderContact? rentalProviderContact;
  final Agent? agent;
  final AgreementTerm? agreementTerm;
  final RentDetail? rent;
  final BondDetail? bond;
  final List<RenterDetail>? renters;

  const BasicTerms({
    this.agreement,
    this.rentalProvider,
    this.rentalProviderContact,
    this.agent,
    this.agreementTerm,
    this.rent,
    this.bond,
    this.renters,
  });

  factory BasicTerms.fromJson(Map<String, dynamic> json) {
    return BasicTerms(
      agreement: json['agreement'] is Map<String, dynamic>
          ? AgreementMeta.fromJson(json['agreement'])
          : null,
      rentalProvider: json['rental_provider'] is Map<String, dynamic>
          ? RentalProvider.fromJson(json['rental_provider'])
          : null,
      rentalProviderContact:
          json['rental_provider_contact'] is Map<String, dynamic>
          ? RentalProviderContact.fromJson(json['rental_provider_contact'])
          : null,
      agent: json['agent'] is Map<String, dynamic>
          ? Agent.fromJson(json['agent'])
          : null,
      agreementTerm: json['agreement_term'] is Map<String, dynamic>
          ? AgreementTerm.fromJson(json['agreement_term'])
          : null,
      rent: json['rent'] is Map<String, dynamic>
          ? RentDetail.fromJson(json['rent'])
          : null,
      bond: json['bond'] is Map<String, dynamic>
          ? BondDetail.fromJson(json['bond'])
          : null,
      renters: (json['renters'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => RenterDetail.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'agreement': agreement?.toJson(),
    'rental_provider': rentalProvider?.toJson(),
    'rental_provider_contact': rentalProviderContact?.toJson(),
    'agent': agent?.toJson(),
    'agreement_term': agreementTerm?.toJson(),
    'rent': rent?.toJson(),
    'bond': bond?.toJson(),
    'renters': renters?.map((e) => e.toJson()).toList(),
  };
}

class AgreementMeta {
  final String? signedDate;

  const AgreementMeta({this.signedDate});

  factory AgreementMeta.fromJson(Map<String, dynamic> json) =>
      AgreementMeta(signedDate: json['signed_date']?.toString());

  Map<String, dynamic> toJson() => {'signed_date': signedDate};
}

class RentalProvider {
  final String? fullNameOrCompanyName;
  final String? abn;
  final String? address;
  final String? postcode;

  const RentalProvider({
    this.fullNameOrCompanyName,
    this.abn,
    this.address,
    this.postcode,
  });

  factory RentalProvider.fromJson(Map<String, dynamic> json) {
    return RentalProvider(
      fullNameOrCompanyName: json['full_name_or_company_name']?.toString(),
      abn: json['abn']?.toString(),
      address: json['address']?.toString(),
      postcode: json['postcode']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name_or_company_name': fullNameOrCompanyName,
    'abn': abn,
    'address': address,
    'postcode': postcode,
  };
}

class RentalProviderContact {
  final String? address;
  final String? postcode;
  final String? phoneNumber;
  final String? emailAddress;

  const RentalProviderContact({
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
  });

  factory RentalProviderContact.fromJson(Map<String, dynamic> json) {
    return RentalProviderContact(
      address: json['address']?.toString(),
      postcode: json['postcode']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      emailAddress: json['email_address']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'postcode': postcode,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
  };
}

class Agent {
  final String? fullName;
  final String? address;
  final String? postcode;
  final String? phoneNumber;
  final String? emailAddress;
  final String? abn;

  const Agent({
    this.fullName,
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
    this.abn,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      fullName: json['full_name']?.toString(),
      address: json['address']?.toString(),
      postcode: json['postcode']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      emailAddress: json['email_address']?.toString(),
      abn: json['abn']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'address': address,
    'postcode': postcode,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
    'abn': abn,
  };
}

class AgreementTerm {
  final String? termType;
  final FixedTerm? fixedTerm;
  final PeriodicTerm? periodicTerm;

  const AgreementTerm({this.termType, this.fixedTerm, this.periodicTerm});

  factory AgreementTerm.fromJson(Map<String, dynamic> json) {
    return AgreementTerm(
      termType: json['term_type']?.toString(),
      fixedTerm: json['fixed_term'] is Map<String, dynamic>
          ? FixedTerm.fromJson(json['fixed_term'])
          : null,
      periodicTerm: json['periodic_term'] is Map<String, dynamic>
          ? PeriodicTerm.fromJson(json['periodic_term'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'term_type': termType,
    'fixed_term': fixedTerm?.toJson(),
    'periodic_term': periodicTerm?.toJson(),
  };
}

class FixedTerm {
  final String? startDate;
  final String? endDate;

  const FixedTerm({this.startDate, this.endDate});

  factory FixedTerm.fromJson(Map<String, dynamic> json) => FixedTerm(
    startDate: json['start_date']?.toString(),
    endDate: json['end_date']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'start_date': startDate,
    'end_date': endDate,
  };
}

class PeriodicTerm {
  final String? startDate;

  const PeriodicTerm({this.startDate});

  factory PeriodicTerm.fromJson(Map<String, dynamic> json) =>
      PeriodicTerm(startDate: json['start_date']?.toString());

  Map<String, dynamic> toJson() => {'start_date': startDate};
}

class RentDetail {
  final num? amount;
  final String? currency;
  final String? frequency;
  final String? rentDueDate;

  const RentDetail({
    this.amount,
    this.currency,
    this.frequency,
    this.rentDueDate,
  });

  factory RentDetail.fromJson(Map<String, dynamic> json) => RentDetail(
    amount: _parseNum(json['amount']),
    currency: json['currency']?.toString(),
    frequency: json['frequency']?.toString(),
    rentDueDate: json['rent_due_date']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currency': currency,
    'frequency': frequency,
    'rent_due_date': rentDueDate,
  };
}

class BondDetail {
  final num? amount;
  final String? paymentDueDate;

  const BondDetail({this.amount, this.paymentDueDate});

  factory BondDetail.fromJson(Map<String, dynamic> json) => BondDetail(
    amount: _parseNum(json['amount']),
    paymentDueDate: json['payment_due_date']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'payment_due_date': paymentDueDate,
  };
}

class RenterDetail {
  final String? fullName;
  final String? address;
  final String? postcode;
  final String? phoneNumber;
  final String? emailAddress;

  const RenterDetail({
    this.fullName,
    this.address,
    this.postcode,
    this.phoneNumber,
    this.emailAddress,
  });

  factory RenterDetail.fromJson(Map<String, dynamic> json) => RenterDetail(
    fullName: json['full_name']?.toString(),
    address: json['address']?.toString(),
    postcode: json['postcode']?.toString(),
    phoneNumber: json['phone_number']?.toString(),
    emailAddress: json['email_address']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'address': address,
    'postcode': postcode,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
  };
}

// ============================================================
// STANDARD TERMS
// ============================================================

class StandardTerms {
  final String? rentalPaymentMethod;
  final LatePaymentPolicy? latePaymentPolicy;
  final EmergencyContact? emergencyContact;
  final List<RenterContactConsent>? renterContactConsents;

  const StandardTerms({
    this.rentalPaymentMethod,
    this.latePaymentPolicy,
    this.emergencyContact,
    this.renterContactConsents,
  });

  factory StandardTerms.fromJson(Map<String, dynamic> json) {
    return StandardTerms(
      rentalPaymentMethod: json['rental_payment_method']?.toString(),
      latePaymentPolicy: json['late_payment_policy'] is Map<String, dynamic>
          ? LatePaymentPolicy.fromJson(json['late_payment_policy'])
          : null,
      emergencyContact: json['emergency_contact'] is Map<String, dynamic>
          ? EmergencyContact.fromJson(json['emergency_contact'])
          : null,
      renterContactConsents: (json['renter_contact_consents'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => RenterContactConsent.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'rental_payment_method': rentalPaymentMethod,
    'late_payment_policy': latePaymentPolicy?.toJson(),
    'emergency_contact': emergencyContact?.toJson(),
    'renter_contact_consents': renterContactConsents
        ?.map((e) => e.toJson())
        .toList(),
  };
}

class LatePaymentPolicy {
  final String? purpose;
  final RentDueDate? rentDueDate;
  final LateFees? lateFees;
  final String? communication;
  final ReturnedPayments? returnedPayments;
  final NonPaymentAndEviction? nonPaymentAndEviction;
  final String? applicationOfPayments;
  final String? amendments;

  const LatePaymentPolicy({
    this.purpose,
    this.rentDueDate,
    this.lateFees,
    this.communication,
    this.returnedPayments,
    this.nonPaymentAndEviction,
    this.applicationOfPayments,
    this.amendments,
  });

  factory LatePaymentPolicy.fromJson(Map<String, dynamic> json) {
    return LatePaymentPolicy(
      purpose: json['purpose']?.toString(),
      rentDueDate: json['rent_due_date'] is Map<String, dynamic>
          ? RentDueDate.fromJson(json['rent_due_date'])
          : null,
      lateFees: json['late_fees'] is Map<String, dynamic>
          ? LateFees.fromJson(json['late_fees'])
          : null,
      communication: json['communication']?.toString(),
      returnedPayments: json['returned_payments'] is Map<String, dynamic>
          ? ReturnedPayments.fromJson(json['returned_payments'])
          : null,
      nonPaymentAndEviction:
          json['non_payment_and_eviction'] is Map<String, dynamic>
          ? NonPaymentAndEviction.fromJson(json['non_payment_and_eviction'])
          : null,
      applicationOfPayments: json['application_of_payments']?.toString(),
      amendments: json['amendments']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'purpose': purpose,
    'rent_due_date': rentDueDate?.toJson(),
    'late_fees': lateFees?.toJson(),
    'communication': communication,
    'returned_payments': returnedPayments?.toJson(),
    'non_payment_and_eviction': nonPaymentAndEviction?.toJson(),
    'application_of_payments': applicationOfPayments,
    'amendments': amendments,
  };
}

class RentDueDate {
  final String? frequency;
  final String? timeCutoff;
  final bool? lateIfAfterCutoff;

  const RentDueDate({this.frequency, this.timeCutoff, this.lateIfAfterCutoff});

  factory RentDueDate.fromJson(Map<String, dynamic> json) => RentDueDate(
    frequency: json['frequency']?.toString(),
    timeCutoff: json['time_cutoff']?.toString(),
    lateIfAfterCutoff: _parseBool(json['late_if_after_cutoff']),
  );

  Map<String, dynamic> toJson() => {
    'frequency': frequency,
    'time_cutoff': timeCutoff,
    'late_if_after_cutoff': lateIfAfterCutoff,
  };
}

class LateFees {
  final num? initialLateFee;
  final num? initialLateFeeAppliesAfterDays;
  final num? additionalDailyFee;
  final num? maximumAdditionalFeePeriodDays;

  const LateFees({
    this.initialLateFee,
    this.initialLateFeeAppliesAfterDays,
    this.additionalDailyFee,
    this.maximumAdditionalFeePeriodDays,
  });

  factory LateFees.fromJson(Map<String, dynamic> json) => LateFees(
    initialLateFee: _parseNum(json['initial_late_fee']),
    initialLateFeeAppliesAfterDays: _parseNum(
      json['initial_late_fee_applies_after_days'],
    ),
    additionalDailyFee: _parseNum(json['additional_daily_fee']),
    maximumAdditionalFeePeriodDays: _parseNum(
      json['maximum_additional_fee_period_days'],
    ),
  );

  Map<String, dynamic> toJson() => {
    'initial_late_fee': initialLateFee,
    'initial_late_fee_applies_after_days': initialLateFeeAppliesAfterDays,
    'additional_daily_fee': additionalDailyFee,
    'maximum_additional_fee_period_days': maximumAdditionalFeePeriodDays,
  };
}

class ReturnedPayments {
  final num? returnedPaymentFee;
  final bool? additionalLateFeesApply;

  const ReturnedPayments({
    this.returnedPaymentFee,
    this.additionalLateFeesApply,
  });

  factory ReturnedPayments.fromJson(Map<String, dynamic> json) =>
      ReturnedPayments(
        returnedPaymentFee: _parseNum(json['returned_payment_fee']),
        additionalLateFeesApply: _parseBool(json['additional_late_fees_apply']),
      );

  Map<String, dynamic> toJson() => {
    'returned_payment_fee': returnedPaymentFee,
    'additional_late_fees_apply': additionalLateFeesApply,
  };
}

class NonPaymentAndEviction {
  final num? daysBeforeAction;
  final List<String>? actions;

  const NonPaymentAndEviction({this.daysBeforeAction, this.actions});

  factory NonPaymentAndEviction.fromJson(Map<String, dynamic> json) =>
      NonPaymentAndEviction(
        daysBeforeAction: _parseNum(json['days_before_action']),
        actions: (json['actions'] as List?)?.map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
    'days_before_action': daysBeforeAction,
    'actions': actions,
  };
}

class EmergencyContact {
  final String? name;
  final String? phoneNumber;
  final String? emailAddress;

  const EmergencyContact({this.name, this.phoneNumber, this.emailAddress});

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        name: json['name']?.toString(),
        phoneNumber: json['phone_number']?.toString(),
        emailAddress: json['email_address']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
  };
}

class RenterContactConsent {
  final int? renterIndex;
  final bool? consentGiven;
  final String? contactDetails;

  const RenterContactConsent({
    this.renterIndex,
    this.consentGiven,
    this.contactDetails,
  });

  factory RenterContactConsent.fromJson(Map<String, dynamic> json) =>
      RenterContactConsent(
        renterIndex: _parseInt(json['renter_index']),
        consentGiven: _parseBool(json['consent_given']),
        contactDetails: json['contact_details']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'renter_index': renterIndex,
    'consent_given': consentGiven,
    'contact_details': contactDetails,
  };
}

// ============================================================
// SIGNATURES
// ============================================================

class AgreementSignatures {
  final List<ProviderSignature>? rentalProviders;
  final List<RenterSignature>? renters;

  const AgreementSignatures({this.rentalProviders, this.renters});

  factory AgreementSignatures.fromJson(Map<String, dynamic> json) {
    return AgreementSignatures(
      rentalProviders: (json['rental_providers'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => ProviderSignature.fromJson(e))
          .toList(),
      renters: (json['renters'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => RenterSignature.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'rental_providers': rentalProviders?.map((e) => e.toJson()).toList(),
    'renters': renters?.map((e) => e.toJson()).toList(),
  };
}

class ProviderSignature {
  final int? providerIndex;
  final String? signature;
  final String? signedDate;

  const ProviderSignature({
    this.providerIndex,
    this.signature,
    this.signedDate,
  });

  factory ProviderSignature.fromJson(Map<String, dynamic> json) =>
      ProviderSignature(
        providerIndex: _parseInt(json['provider_index']),
        signature: json['signature']?.toString(),
        signedDate: json['signed_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'provider_index': providerIndex,
    'signature': signature,
    'signed_date': signedDate,
  };
}

class RenterSignature {
  final int? renterIndex;
  final String? signature;
  final String? signedDate;

  const RenterSignature({this.renterIndex, this.signature, this.signedDate});

  factory RenterSignature.fromJson(Map<String, dynamic> json) =>
      RenterSignature(
        renterIndex: _parseInt(json['renter_index']),
        signature: json['signature']?.toString(),
        signedDate: json['signed_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'renter_index': renterIndex,
    'signature': signature,
    'signed_date': signedDate,
  };
}

// ============================================================
// PROPERTY
// ============================================================

class LeaseAgreementProperty {
  final int? id;
  final int? landlordId;
  final int? propertyTypeId;
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
  final int? bedrooms;
  final int? bathrooms;
  final int? parkingSpaces;
  final String? buildingSize;
  final int? yearBuilt;
  final String? status;
  final bool? isVerified;
  final bool? isInPersonInspectionAvailable;
  final bool? isVirtualInspectionAvailable;
  final bool? isFavourite;
  final List<String>? features;
  final String? rating;
  final int? ratingCount;
  final List<LeaseAgreementPropertyUnit>? units;
  final List<LeaseAgreementPropertyImage>? images;
  final List<LeaseAgreementPropertyAmenity>? amenities;
  final PropertyReviewSummary? reviewSummary;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  const LeaseAgreementProperty({
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
    this.buildingSize,
    this.yearBuilt,
    this.status,
    this.isVerified,
    this.isInPersonInspectionAvailable,
    this.isVirtualInspectionAvailable,
    this.isFavourite,
    this.features,
    this.rating,
    this.ratingCount,
    this.units,
    this.images,
    this.amenities,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory LeaseAgreementProperty.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementProperty(
      id: json['id'],
      landlordId: json['landlord_id'],
      propertyTypeId: json['property_type_id'],
      title: json['title']?.toString(),
      name: json['name']?.toString(),
      description: json['description']?.toString(),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      postalCode: json['postal_code']?.toString(),
      country: json['country']?.toString(),
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      parkingSpaces: json['parking_spaces'],
      buildingSize: json['building_size']?.toString(),
      yearBuilt: json['year_built'],
      status: json['status']?.toString(),
      isVerified: json['is_verified'],
      isInPersonInspectionAvailable: json['is_in_person_inspection_available'],
      isVirtualInspectionAvailable: json['is_virtual_inspection_available'],
      isFavourite: json['is_favourite'],
      features: (json['features'] as List?)?.map((e) => e.toString()).toList(),
      rating: json['rating']?.toString(),
      ratingCount: json['rating_count'],
      units: (json['units'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => LeaseAgreementPropertyUnit.fromJson(e))
          .toList(),
      images: (json['images'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => LeaseAgreementPropertyImage.fromJson(e))
          .toList(),
      amenities: (json['amenities'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => LeaseAgreementPropertyAmenity.fromJson(e))
          .toList(),
      reviewSummary: json['review_summary'] is Map<String, dynamic>
          ? PropertyReviewSummary.fromJson(json['review_summary'])
          : null,
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      image: json['image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
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
    'building_size': buildingSize,
    'year_built': yearBuilt,
    'status': status,
    'is_verified': isVerified,
    'is_in_person_inspection_available': isInPersonInspectionAvailable,
    'is_virtual_inspection_available': isVirtualInspectionAvailable,
    'is_favourite': isFavourite,
    'features': features,
    'rating': rating,
    'rating_count': ratingCount,
    'units': units?.map((e) => e.toJson()).toList(),
    'images': images?.map((e) => e.toJson()).toList(),
    'amenities': amenities?.map((e) => e.toJson()).toList(),
    'review_summary': reviewSummary?.toJson(),
    'created_at': createdAt,
    'updated_at': updatedAt,
    'image': image,
  };
}

class LeaseAgreementPropertyImage {
  final int? id;
  final int? propertyId;
  final String? imagePath;
  final String? type;
  final int? order;
  final bool? isPrimary;
  final String? caption;
  final String? createdAt;
  final String? updatedAt;

  const LeaseAgreementPropertyImage({
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

  factory LeaseAgreementPropertyImage.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementPropertyImage(
        id: json['id'],
        propertyId: json['property_id'],
        imagePath: json['image_path']?.toString(),
        type: json['type']?.toString(),
        order: json['order'],
        isPrimary: json['is_primary'],
        caption: json['caption']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'property_id': propertyId,
    'image_path': imagePath,
    'type': type,
    'order': order,
    'is_primary': isPrimary,
    'caption': caption,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class LeaseAgreementPropertyAmenity {
  final int? id;
  final int? propertyId;
  final int? amenityTypeId;
  final LeaseAgreementAmenityType? amenityType;
  final String? createdAt;
  final String? updatedAt;

  const LeaseAgreementPropertyAmenity({
    this.id,
    this.propertyId,
    this.amenityTypeId,
    this.amenityType,
    this.createdAt,
    this.updatedAt,
  });

  factory LeaseAgreementPropertyAmenity.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementPropertyAmenity(
        id: json['id'],
        propertyId: json['property_id'],
        amenityTypeId: json['amenity_type_id'],
        amenityType: json['amenity_type'] is Map<String, dynamic>
            ? LeaseAgreementAmenityType.fromJson(json['amenity_type'])
            : null,
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'property_id': propertyId,
    'amenity_type_id': amenityTypeId,
    'amenity_type': amenityType?.toJson(),
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class LeaseAgreementAmenityType {
  final int? id;
  final String? name;
  final String? slug;
  final String? icon;
  final String? description;

  const LeaseAgreementAmenityType({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.description,
  });

  factory LeaseAgreementAmenityType.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementAmenityType(
        id: json['id'],
        name: json['name']?.toString(),
        slug: json['slug']?.toString(),
        icon: json['icon']?.toString(),
        description: json['description']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'icon': icon,
    'description': description,
  };
}

class PropertyReviewSummary {
  final int? totalReviews;
  final String? averageRating;

  const PropertyReviewSummary({this.totalReviews, this.averageRating});

  factory PropertyReviewSummary.fromJson(Map<String, dynamic> json) =>
      PropertyReviewSummary(
        totalReviews: json['total_reviews'],
        averageRating: json['average_rating']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'total_reviews': totalReviews,
    'average_rating': averageRating,
  };
}

// ============================================================
// PROPERTY UNIT (with full Currency + RentType)
// ============================================================

class LeaseAgreementPropertyUnit {
  final int? id;
  final int? propertyId;
  final String? unitNumber;
  final String? unitName;
  final String? rentAmount;
  final PropertyUnitRentType? rentType;
  final PropertyUnitCurrency? currency;
  final num? displayRentAmount;
  final PropertyUnitCurrency? displayCurrency;
  final String? status;
  final num? bedrooms;
  final num? bathrooms;
  final String? size;
  final String? description;

  const LeaseAgreementPropertyUnit({
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

  factory LeaseAgreementPropertyUnit.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementPropertyUnit(
      id: json['id'],
      propertyId: json['property_id'],
      unitNumber: json['unit_number']?.toString(),
      unitName: json['unit_name']?.toString(),
      rentAmount: json['rent_amount']?.toString(),
      rentType: json['rent_type'] is Map<String, dynamic>
          ? PropertyUnitRentType.fromJson(json['rent_type'])
          : null,
      currency: json['currency'] is Map<String, dynamic>
          ? PropertyUnitCurrency.fromJson(json['currency'])
          : null,
      displayRentAmount: _parseNum(json['display_rent_amount']),
      displayCurrency: json['display_currency'] is Map<String, dynamic>
          ? PropertyUnitCurrency.fromJson(json['display_currency'])
          : null,
      status: json['status']?.toString(),
      bedrooms: json['bedrooms']?.toDouble(),
      bathrooms: json['bathrooms']?.toDouble(),
      size: json['size']?.toString(),
      description: json['description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
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

class PropertyUnitRentType {
  final int? id;
  final String? name;
  final String? slug;
  final int? rentDays;

  const PropertyUnitRentType({this.id, this.name, this.slug, this.rentDays});

  factory PropertyUnitRentType.fromJson(Map<String, dynamic> json) =>
      PropertyUnitRentType(
        id: json['id'],
        name: json['name']?.toString(),
        slug: json['slug']?.toString(),
        rentDays: json['rent_days'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'rent_days': rentDays,
  };
}

class PropertyUnitCurrency {
  final int? id;
  final String? code;
  final String? name;
  final String? symbol;
  final String? logo;
  final String? type;

  const PropertyUnitCurrency({
    this.id,
    this.code,
    this.name,
    this.symbol,
    this.logo,
    this.type,
  });

  factory PropertyUnitCurrency.fromJson(Map<String, dynamic> json) =>
      PropertyUnitCurrency(
        id: json['id'],
        code: json['code']?.toString(),
        name: json['name']?.toString(),
        symbol: json['symbol']?.toString(),
        logo: json['logo']?.toString(),
        type: json['type']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'symbol': symbol,
    'logo': logo,
    'type': type,
  };
}

// ============================================================
// TENANT
// ============================================================

class LeaseAgreementTenant {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  const LeaseAgreementTenant({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  });

  factory LeaseAgreementTenant.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementTenant(
        id: json['id'],
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        image: json['image']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
  };
}

// ============================================================
// LANDLORD
// ============================================================

class LeaseAgreementLandlord {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  const LeaseAgreementLandlord({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  });

  factory LeaseAgreementLandlord.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementLandlord(
        id: json['id'],
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        image: json['image']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
  };
}

// ============================================================
// PAGINATION
// ============================================================

class LeaseAgreementLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const LeaseAgreementLinks({this.first, this.last, this.prev, this.next});

  factory LeaseAgreementLinks.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementLinks(
        first: json['first']?.toString(),
        last: json['last']?.toString(),
        prev: json['prev']?.toString(),
        next: json['next']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'first': first,
    'last': last,
    'prev': prev,
    'next': next,
  };
}

class LeaseAgreementMeta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<LeaseAgreementMetaLink>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const LeaseAgreementMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory LeaseAgreementMeta.fromJson(Map<String, dynamic> json) {
    return LeaseAgreementMeta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: (json['links'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map((e) => LeaseAgreementMetaLink.fromJson(e))
          .toList(),
      path: json['path']?.toString(),
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
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

class LeaseAgreementMetaLink {
  final String? url;
  final String? label;
  final int? page;
  final bool? active;

  const LeaseAgreementMetaLink({this.url, this.label, this.page, this.active});

  factory LeaseAgreementMetaLink.fromJson(Map<String, dynamic> json) =>
      LeaseAgreementMetaLink(
        url: json['url']?.toString(),
        label: json['label']?.toString(),
        page: json['page'] is int
            ? json['page']
            : int.tryParse(json['page']?.toString() ?? ''),
        active: json['active'],
      );

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'page': page,
    'active': active,
  };
}

// ============================================================
// HELPER FUNCTION TO PARSE NUM (STRING OR NUM)
// ============================================================

num? _parseNum(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) {
    // Try to parse as integer first
    final intValue = int.tryParse(value);
    if (intValue != null) return intValue;
    // Try to parse as double
    final doubleValue = double.tryParse(value);
    if (doubleValue != null) return doubleValue;
    return null;
  }
  return null;
}

// ============================================================
// HELPER FUNCTION TO PARSE BOOL (STRING OR BOOL)
// ============================================================

bool? _parseBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true';
  }
  return null;
}

// ============================================================
// HELPER FUNCTION TO PARSE INT (STRING OR INT)
// ============================================================

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}
