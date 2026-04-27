class BalanceModel {
  bool? error;
  int? code;
  String? message;
  Data? data;
  dynamic errors;

  BalanceModel({this.error, this.code, this.message, this.data, this.errors});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] is bool ? json['error'] : null;
    code = json['code'] is int ? json['code'] : null;
    message = json['message']?.toString();
    data = json['data'] is Map<String, dynamic>
        ? Data.fromJson(json['data'])
        : null;
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
  String? balance;
  String? balanceFormatted;
  String? availableBalance;
  String? availableBalanceFormatted;
  double? displayBalance;
  String? onChainBalance;
  String? onChainBalanceFormatted;
  int? onChainDisplayBalance;
  String? onChainSyncedAt;
  DisplayCurrency? displayCurrency;

  Data({
    this.balance,
    this.balanceFormatted,
    this.availableBalance,
    this.availableBalanceFormatted,
    this.displayBalance,
    this.onChainBalance,
    this.onChainBalanceFormatted,
    this.onChainDisplayBalance,
    this.onChainSyncedAt,
    this.displayCurrency,
  });

  Data.fromJson(Map<String, dynamic> json) {
    balance = json['balance']?.toString();
    balanceFormatted = json['balance_formatted']?.toString();
    availableBalance = json['available_balance']?.toString();
    availableBalanceFormatted = json['available_balance_formatted']?.toString();
    displayBalance = json['display_balance'] is num
        ? (json['display_balance'] as num).toDouble()
        : null;
    onChainBalance = json['on_chain_balance']?.toString();
    onChainBalanceFormatted = json['on_chain_balance_formatted']?.toString();
    onChainDisplayBalance = json['on_chain_display_balance'] is num
        ? (json['on_chain_display_balance'] as num).toInt()
        : null;
    onChainSyncedAt = json['on_chain_synced_at']?.toString();
    displayCurrency = json['display_currency'] is Map<String, dynamic>
        ? DisplayCurrency.fromJson(json['display_currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['balance_formatted'] = balanceFormatted;
    data['available_balance'] = availableBalance;
    data['available_balance_formatted'] = availableBalanceFormatted;
    data['display_balance'] = displayBalance;
    data['on_chain_balance'] = onChainBalance;
    data['on_chain_balance_formatted'] = onChainBalanceFormatted;
    data['on_chain_display_balance'] = onChainDisplayBalance;
    data['on_chain_synced_at'] = onChainSyncedAt;
    if (displayCurrency != null) {
      data['display_currency'] = displayCurrency!.toJson();
    }
    return data;
  }
}

class DisplayCurrency {
  int? id;
  String? code;
  String? name;
  String? symbol;
  String? logo;
  String? type;
  int? decimalPlaces;
  double? exchangeRate;
  bool? isActive;
  int? sortOrder;

  DisplayCurrency({
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

  DisplayCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
    logo = json['logo'];
    type = json['type'];
    decimalPlaces = json['decimal_places'];
    exchangeRate = json['exchange_rate']?.toDouble();
    isActive = json['is_active'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    data['logo'] = logo;
    data['type'] = type;
    data['decimal_places'] = decimalPlaces;
    data['exchange_rate'] = exchangeRate;
    data['is_active'] = isActive;
    data['sort_order'] = sortOrder;
    return data;
  }
}
