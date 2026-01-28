class PropertyReviewModel {
  bool? error;
  int? code;
  String? message;
  ReviewsData? data;

  PropertyReviewModel({this.error, this.code, this.message, this.data});

  PropertyReviewModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? ReviewsData.fromJson(json['data']) : null;
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

class ReviewsData {
  Property? property;
  List<Reviews>? reviews;
  Summary? summary;

  ReviewsData({this.property, this.reviews, this.summary});

  ReviewsData.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? Property.fromJson(json['property'])
        : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    summary = json['summary'] != null
        ? Summary.fromJson(json['summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (property != null) {
      data['property'] = property!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

class Property {
  int? id;
  String? title;

  Property({this.id, this.title});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;

    return data;
  }
}

class Reviews {
  int? id;
  int? propertyId;
  int? userId;
  User? user;
  int? rating;
  String? title;
  String? comment;
  String? status;
  String? adminNotes;
  int? approvedBy;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;

  Reviews({
    this.id,
    this.propertyId,
    this.userId,
    this.user,
    this.rating,
    this.title,
    this.comment,
    this.status,
    this.adminNotes,
    this.approvedBy,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    title = json['title'];
    comment = json['comment'];
    status = json['status'];
    adminNotes = json['admin_notes'].toString();
    approvedBy = json['approved_by'];
    approvedAt = json['approved_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['user_id'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['rating'] = rating;
    data['title'] = title;
    data['comment'] = comment;
    data['status'] = status;
    data['admin_notes'] = adminNotes;
    data['approved_by'] = approvedBy;
    data['approved_at'] = approvedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Summary {
  int? totalReviews;
  String? averageRating;
  RatingDistribution? ratingDistribution;

  Summary({this.totalReviews, this.averageRating, this.ratingDistribution});

  Summary.fromJson(Map<String, dynamic> json) {
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    ratingDistribution = json['rating_distribution'] != null
        ? RatingDistribution.fromJson(json['rating_distribution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    if (ratingDistribution != null) {
      data['rating_distribution'] = ratingDistribution!.toJson();
    }
    return data;
  }
}

class RatingDistribution {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;

  RatingDistribution({this.i1, this.i2, this.i3, this.i4, this.i5});

  RatingDistribution.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    return data;
  }
}
