class PropertyCategoryModel {
  bool? error;
  int? code;
  String? message;
  List<PropertyCategory>? data;

  PropertyCategoryModel({this.error, this.code, this.message, this.data});

  PropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PropertyCategory>[];
      json['data'].forEach((v) {
        data!.add(PropertyCategory.fromJson(v));
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

class PropertyCategory {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;

  PropertyCategory({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PropertyCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
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
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
