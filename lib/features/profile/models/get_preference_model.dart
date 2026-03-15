class PreferenceModel {
  bool? error;
  int? code;
  String? message;
  Preferences? data;

  PreferenceModel({this.error, this.code, this.message, this.data});

  PreferenceModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Preferences.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Preferences {
  int? id;
  int? userId;
  String? budgetMin;
  String? budgetMax;
  String? currency;
  List<String>? preferredSuburbs;
  String? moveInDate;
  bool? petsAllowed;
  int? minBedrooms;
  int? maxBedrooms;
  int? minBathrooms;
  int? maxBathrooms;
  List<String>? propertyTypes;
  String? additionalRequirements;
  String? createdAt;
  String? updatedAt;

  Preferences({
    this.id,
    this.userId,
    this.budgetMin,
    this.budgetMax,
    this.currency,
    this.preferredSuburbs,
    this.moveInDate,
    this.petsAllowed,
    this.minBedrooms,
    this.maxBedrooms,
    this.minBathrooms,
    this.maxBathrooms,
    this.propertyTypes,
    this.additionalRequirements,
    this.createdAt,
    this.updatedAt,
  });

  Preferences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    budgetMin = json['budget_min'];
    budgetMax = json['budget_max'];
    currency = json['currency'];
    if (json['preferred_suburbs'] != null) {
      preferredSuburbs = (json['preferred_suburbs'] as List)
          .map((e) => e.toString())
          .toList();
    }
    moveInDate = json['move_in_date'];
    petsAllowed = json['pets_allowed'];
    minBedrooms = json['min_bedrooms'];
    maxBedrooms = json['max_bedrooms'];
    minBathrooms = json['min_bathrooms'];
    maxBathrooms = json['max_bathrooms'];
    if (json['property_types'] != null) {
      propertyTypes = (json['property_types'] as List)
          .map((e) => e.toString())
          .toList();
    }
    additionalRequirements = json['additional_requirements'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['budget_min'] = budgetMin;
    data['budget_max'] = budgetMax;
    data['currency'] = currency;
    data['preferred_suburbs'] = preferredSuburbs;
    data['move_in_date'] = moveInDate;
    data['pets_allowed'] = petsAllowed;
    data['min_bedrooms'] = minBedrooms;
    data['max_bedrooms'] = maxBedrooms;
    data['min_bathrooms'] = minBathrooms;
    data['max_bathrooms'] = maxBathrooms;
    data['property_types'] = propertyTypes;
    data['additional_requirements'] = additionalRequirements;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
