class PropertyAmenitiesModel {
  bool? error;
  int? code;
  String? message;
  List<AmenityType>? data;

  PropertyAmenitiesModel({this.error, this.code, this.message, this.data});

  PropertyAmenitiesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AmenityType>[];
      json['data'].forEach((v) {
        data!.add(AmenityType.fromJson(v));
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
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    iconUrl = json['icon_url'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['icon_url'] = iconUrl;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
