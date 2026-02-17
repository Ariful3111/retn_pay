class RentNoticeModel {
  bool? error;
  int? code;
  String? message;
  RentNoticePayload? data;
  dynamic errors;

  RentNoticeModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  RentNoticeModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = RentNoticePayload.fromJson(dataJson);
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

class RentNoticePayload {
  List<RentNoticeItem>? data;
  RentNoticeLinks? links;
  RentNoticeMeta? meta;

  RentNoticePayload({this.data, this.links, this.meta});

  RentNoticePayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => RentNoticeItem.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = RentNoticeLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = RentNoticeMeta.fromJson(metaJson);
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

class RentNoticeItem {
  int? id;
  int? leaseAgreementId;
  num? currentRent;
  num? newRentAmount;
  String? effectiveDate;
  String? reason;
  String? status;
  String? rejectedReason;
  RentNoticeLeaseAgreement? leaseAgreement;
  String? createdAt;
  String? updatedAt;

  RentNoticeItem({
    this.id,
    this.leaseAgreementId,
    this.currentRent,
    this.newRentAmount,
    this.effectiveDate,
    this.reason,
    this.status,
    this.rejectedReason,
    this.leaseAgreement,
    this.createdAt,
    this.updatedAt,
  });

  RentNoticeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaseAgreementId = json['lease_agreement_id'];
    currentRent = json['current_rent'];
    newRentAmount = json['new_rent_amount'];
    effectiveDate = json['effective_date']?.toString();
    reason = json['reason']?.toString();
    status = json['status']?.toString();
    rejectedReason = json['rejected_reason']?.toString();

    final leaseJson = json['lease_agreement'];
    if (leaseJson is Map<String, dynamic>) {
      leaseAgreement = RentNoticeLeaseAgreement.fromJson(leaseJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['lease_agreement_id'] = leaseAgreementId;
    json['current_rent'] = currentRent;
    json['new_rent_amount'] = newRentAmount;
    json['effective_date'] = effectiveDate;
    json['reason'] = reason;
    json['status'] = status;
    json['rejected_reason'] = rejectedReason;
    if (leaseAgreement != null) {
      json['lease_agreement'] = leaseAgreement!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RentNoticeLeaseAgreement {
  int? id;
  int? tenantId;
  int? landlordId;
  int? propertyId;
  int? propertyUnitId;
  String? status;
  String? startDate;
  String? endDate;
  String? rentAmount;
  String? currency;
  int? currencyId;
  String? paymentFrequency;
  int? rentTypeId;
  num? bondAmount;
  RentNoticeCurrencyDetail? currencyDetail;
  RentNoticeProperty? property;
  RentNoticePropertyUnit? propertyUnit;
  dynamic agreementDetails;

  RentNoticeLeaseAgreement({
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
    this.property,
    this.propertyUnit,
    this.agreementDetails,
  });

  RentNoticeLeaseAgreement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    landlordId = json['landlord_id'];
    propertyId = json['property_id'];
    propertyUnitId = json['property_unit_id'];
    status = json['status']?.toString();
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
    rentAmount = json['rent_amount']?.toString();
    currency = json['currency']?.toString();
    currencyId = json['currency_id'];
    paymentFrequency = json['payment_frequency']?.toString();
    rentTypeId = json['rent_type_id'];
    bondAmount = json['bond_amount'];

    final currencyJson = json['currency_detail'];
    if (currencyJson is Map<String, dynamic>) {
      currencyDetail = RentNoticeCurrencyDetail.fromJson(currencyJson);
    }

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = RentNoticeProperty.fromJson(propertyJson);
    }

    final unitJson = json['property_unit'];
    if (unitJson is Map<String, dynamic>) {
      propertyUnit = RentNoticePropertyUnit.fromJson(unitJson);
    }

    agreementDetails = json['agreement_details'];
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
    json['rent_amount'] = rentAmount;
    json['currency'] = currency;
    json['currency_id'] = currencyId;
    json['payment_frequency'] = paymentFrequency;
    json['rent_type_id'] = rentTypeId;
    json['bond_amount'] = bondAmount;
    if (currencyDetail != null) {
      json['currency_detail'] = currencyDetail!.toJson();
    }
    if (property != null) {
      json['property'] = property!.toJson();
    }
    if (propertyUnit != null) {
      json['property_unit'] = propertyUnit!.toJson();
    }
    json['agreement_details'] = agreementDetails;
    return json;
  }
}

class RentNoticeCurrencyDetail {
  int? id;
  String? code;
  String? name;
  String? symbol;

  RentNoticeCurrencyDetail({this.id, this.code, this.name, this.symbol});

  RentNoticeCurrencyDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code']?.toString();
    name = json['name']?.toString();
    symbol = json['symbol']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['name'] = name;
    json['symbol'] = symbol;
    return json;
  }
}

class RentNoticeProperty {
  int? id;
  String? title;
  String? name;
  String? description;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? image;

  RentNoticeProperty({
    this.id,
    this.title,
    this.name,
    this.description,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.image,
  });

  RentNoticeProperty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    state = json['state']?.toString();
    postalCode = json['postal_code']?.toString();
    country = json['country']?.toString();
    image = json['image']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['name'] = name;
    json['description'] = description;
    json['address'] = address;
    json['city'] = city;
    json['state'] = state;
    json['postal_code'] = postalCode;
    json['country'] = country;
    json['image'] = image;
    return json;
  }
}

class RentNoticePropertyUnit {
  int? id;
  String? unitNumber;
  String? unitName;

  RentNoticePropertyUnit({this.id, this.unitNumber, this.unitName});

  RentNoticePropertyUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitNumber = json['unit_number']?.toString();
    unitName = json['unit_name']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['unit_number'] = unitNumber;
    json['unit_name'] = unitName;
    return json;
  }
}

class RentNoticeLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  RentNoticeLinks({this.first, this.last, this.prev, this.next});

  RentNoticeLinks.fromJson(Map<String, dynamic> json) {
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

class RentNoticeMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<RentNoticeMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  RentNoticeMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  RentNoticeMeta.fromJson(Map<String, dynamic> json) {
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
          .map((v) => RentNoticeMetaLink.fromJson(v))
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

class RentNoticeMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  RentNoticeMetaLink({this.url, this.label, this.page, this.active});

  RentNoticeMetaLink.fromJson(Map<String, dynamic> json) {
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
