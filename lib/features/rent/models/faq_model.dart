class FAQModel {
  bool? error;
  int? code;
  String? message;
  List<Data>? data;

  FAQModel({this.error, this.code, this.message, this.data});

  FAQModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? type;
  String? typeLabel;
  String? question;
  String? answer;
  int? order;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.type,
    this.typeLabel,
    this.question,
    this.answer,
    this.order,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    typeLabel = json['type_label'];
    question = json['question'];
    answer = json['answer'];
    order = json['order'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['type_label'] = typeLabel;
    data['question'] = question;
    data['answer'] = answer;
    data['order'] = order;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
