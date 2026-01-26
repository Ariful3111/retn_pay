class PropertyAddressModel {
  bool? error;
  int? code;
  String? message;
  List<PropertyAddress>? data;

  PropertyAddressModel({this.error, this.code, this.message, this.data});

  PropertyAddressModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PropertyAddress>[];
      json['data'].forEach((v) {
        data!.add(PropertyAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropertyAddress {
  int? id;
  String? address;
  String? fullAddress;
  String? city;
  String? state;
  String? postalCode;

  PropertyAddress({
    this.id,
    this.address,
    this.fullAddress,
    this.city,
    this.state,
    this.postalCode,
  });

  PropertyAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    fullAddress = json['full_address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['full_address'] = fullAddress;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    return data;
  }
}
