import 'package:renter_pay/features/home/models/properties_model.dart'
    as home_models;

class RentListModel {
  bool? error;
  int? code;
  String? message;
  RentListPayload? data;
  dynamic errors;

  RentListModel({this.error, this.code, this.message, this.data, this.errors});

  RentListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message']?.toString();

    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = RentListPayload.fromJson(dataJson);
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

class RentListPayload {
  List<RentPayment>? data;
  RentListLinks? links;
  RentListMeta? meta;

  RentListPayload({this.data, this.links, this.meta});

  RentListPayload.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    if (list is List) {
      data = list
          .whereType<Map<String, dynamic>>()
          .map((v) => RentPayment.fromJson(v))
          .toList();
    }

    final linksJson = json['links'];
    if (linksJson is Map<String, dynamic>) {
      links = RentListLinks.fromJson(linksJson);
    }

    final metaJson = json['meta'];
    if (metaJson is Map<String, dynamic>) {
      meta = RentListMeta.fromJson(metaJson);
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

class RentPayment {
  int? id;
  int? tenantId;
  int? landlordId;
  int? propertyId;
  int? propertyUnitId;
  int? leaseAgreementId;
  String? amount;
  int? totalAmountDue;
  String? currency;
  String? status;
  dynamic paymentDate;
  String? dueDate;
  dynamic walletTransactionId;
  String? notes;
  home_models.Property? property;
  home_models.Units? propertyUnit;
  RentListUser? tenant;
  RentListUser? landlord;
  String? createdAt;
  String? updatedAt;

  RentPayment({
    this.id,
    this.tenantId,
    this.landlordId,
    this.propertyId,
    this.propertyUnitId,
    this.leaseAgreementId,
    this.amount,
    this.totalAmountDue,
    this.currency,
    this.status,
    this.paymentDate,
    this.dueDate,
    this.walletTransactionId,
    this.notes,
    this.property,
    this.propertyUnit,
    this.tenant,
    this.landlord,
    this.createdAt,
    this.updatedAt,
  });

  RentPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    landlordId = json['landlord_id'];
    propertyId = json['property_id'];
    propertyUnitId = json['property_unit_id'];
    leaseAgreementId = json['lease_agreement_id'];
    amount = json['amount']?.toString();

    final rawTotal = json['total_amount_due'];
    totalAmountDue = rawTotal is int
        ? rawTotal
        : int.tryParse(rawTotal?.toString() ?? '');

    currency = json['currency']?.toString();
    status = json['status']?.toString();
    paymentDate = json['payment_date'];
    dueDate = json['due_date']?.toString();
    walletTransactionId = json['wallet_transaction_id'];
    notes = json['notes']?.toString();

    final propertyJson = json['property'];
    if (propertyJson is Map<String, dynamic>) {
      property = home_models.Property.fromJson(propertyJson);
    }

    final unitJson = json['property_unit'];
    if (unitJson is Map<String, dynamic>) {
      propertyUnit = home_models.Units.fromJson(unitJson);
    }

    final tenantJson = json['tenant'];
    if (tenantJson is Map<String, dynamic>) {
      tenant = RentListUser.fromJson(tenantJson);
    }

    final landlordJson = json['landlord'];
    if (landlordJson is Map<String, dynamic>) {
      landlord = RentListUser.fromJson(landlordJson);
    }

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['tenant_id'] = tenantId;
    json['landlord_id'] = landlordId;
    json['property_id'] = propertyId;
    json['property_unit_id'] = propertyUnitId;
    json['lease_agreement_id'] = leaseAgreementId;
    json['amount'] = amount;
    json['total_amount_due'] = totalAmountDue;
    json['currency'] = currency;
    json['status'] = status;
    json['payment_date'] = paymentDate;
    json['due_date'] = dueDate;
    json['wallet_transaction_id'] = walletTransactionId;
    json['notes'] = notes;
    if (property != null) {
      json['property'] = property!.toJson();
    }
    if (propertyUnit != null) {
      json['property_unit'] = propertyUnit!.toJson();
    }
    if (tenant != null) {
      json['tenant'] = tenant!.toJson();
    }
    if (landlord != null) {
      json['landlord'] = landlord!.toJson();
    }
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class RentListUser {
  int? id;
  String? name;
  String? email;

  RentListUser({this.id, this.name, this.email});

  RentListUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?.toString();
    email = json['email']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    return json;
  }
}

class RentListLinks {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  RentListLinks({this.first, this.last, this.prev, this.next});

  RentListLinks.fromJson(Map<String, dynamic> json) {
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

class RentListMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<RentListMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  RentListMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  RentListMeta.fromJson(Map<String, dynamic> json) {
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
          .map((v) => RentListMetaLink.fromJson(v))
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

class RentListMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  RentListMetaLink({this.url, this.label, this.page, this.active});

  RentListMetaLink.fromJson(Map<String, dynamic> json) {
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
