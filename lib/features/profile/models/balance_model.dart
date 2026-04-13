class BalanceModel {
  bool? error;
  int? code;
  String? message;
  Data? data;
  dynamic errors;

  BalanceModel({this.error, this.code, this.message, this.data, this.errors});

  BalanceModel.fromJson(Map<String, dynamic> json) {
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
  String? balance;
  String? balanceFormatted;
  String? fiatBalance;
  String? fiatBalanceAud;
  double? displayBalance;
  DisplayCurrency? displayCurrency;

  Data({
    this.balance,
    this.balanceFormatted,
    this.fiatBalance,
    this.fiatBalanceAud,
    this.displayBalance,
    this.displayCurrency,
  });

  Data.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    balanceFormatted = json['balance_formatted'];
    fiatBalance = json['fiat_balance'];
    fiatBalanceAud = json['fiat_balance_aud'];
    displayBalance = json['display_balance']?.toDouble();
    displayCurrency = json['display_currency'] != null
        ? DisplayCurrency.fromJson(json['display_currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['balance_formatted'] = balanceFormatted;
    data['fiat_balance'] = fiatBalance;
    data['fiat_balance_aud'] = fiatBalanceAud;
    data['display_balance'] = displayBalance;
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
