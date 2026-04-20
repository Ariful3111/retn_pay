class StartDepositModel {
  bool? error;
  int? code;
  String? message;
  Data? data;
  dynamic errors;

  StartDepositModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  StartDepositModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

class Data {
  Transaction? transaction;
  String? formActionUrl;

  Data({this.transaction, this.formActionUrl});

  Data.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    formActionUrl = json['form_action_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    data['form_action_url'] = formActionUrl;
    return data;
  }
}

class Transaction {
  int? id;
  int? userId;
  String? type;
  String? amount;
  String? currency;
  dynamic rentchipAmount;
  String? status;
  String? gateway;
  String? gatewayTransactionId;
  dynamic notes;
  String? createdAt;
  String? updatedAt;

  Transaction({
    this.id,
    this.userId,
    this.type,
    this.amount,
    this.currency,
    this.rentchipAmount,
    this.status,
    this.gateway,
    this.gatewayTransactionId,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    amount = json['amount'];
    currency = json['currency'];
    rentchipAmount = json['rentchip_amount'];
    status = json['status'];
    gateway = json['gateway'];
    gatewayTransactionId = json['gateway_transaction_id'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type'] = type;
    data['amount'] = amount;
    data['currency'] = currency;
    data['rentchip_amount'] = rentchipAmount;
    data['status'] = status;
    data['gateway'] = gateway;
    data['gateway_transaction_id'] = gatewayTransactionId;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
