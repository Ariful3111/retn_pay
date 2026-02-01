class PropertyReviewModel {
  bool? error;
  int? code;
  String? message;
  ReviewsData? data;
  dynamic errors;

  PropertyReviewModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  PropertyReviewModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? ReviewsData.fromJson(json['data']) : null;
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

class ReviewsData {
  Property? property;
  List<Reviews>? reviews;
  Links? links;
  Meta? meta;
  Summary? summary;

  ReviewsData({
    this.property,
    this.reviews,
    this.links,
    this.meta,
    this.summary,
  });

  ReviewsData.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? Property.fromJson(json['property'])
        : null;
    final dynamic reviewsValue = json['reviews'];
    if (reviewsValue is Map<String, dynamic>) {
      if (reviewsValue['data'] != null && reviewsValue['data'] is List) {
        reviews = <Reviews>[];
        reviewsValue['data'].forEach((v) {
          reviews!.add(Reviews.fromJson(v));
        });
      }
      links = reviewsValue['links'] != null
          ? Links.fromJson(reviewsValue['links'])
          : null;
      meta = reviewsValue['meta'] != null
          ? Meta.fromJson(reviewsValue['meta'])
          : null;
    } else if (reviewsValue is List) {
      reviews = <Reviews>[];
      for (final v in reviewsValue) {
        if (v is Map<String, dynamic>) {
          reviews!.add(Reviews.fromJson(v));
        }
      }
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
    if (reviews != null || links != null || meta != null) {
      final Map<String, dynamic> reviewsJson = <String, dynamic>{};
      if (reviews != null) {
        reviewsJson['data'] = reviews!.map((v) => v.toJson()).toList();
      }
      if (links != null) {
        reviewsJson['links'] = links!.toJson();
      }
      if (meta != null) {
        reviewsJson['meta'] = meta!.toJson();
      }
      data['reviews'] = reviewsJson;
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
  dynamic myReview;

  Property({this.id, this.title, this.myReview});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    myReview = json['my_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['my_review'] = myReview;

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
    adminNotes = json['admin_notes']?.toString();
    approvedBy = json['approved_by'];
    approvedAt = json['approved_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
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
  String? image;

  User({this.id, this.name, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
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

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev']?.toString();
    next = json['next']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<MetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null && json['links'] is List) {
      links = <MetaLink>[];
      json['links'].forEach((v) {
        if (v is Map<String, dynamic>) {
          links!.add(MetaLink.fromJson(v));
        }
      });
    }
    path = json['path']?.toString();
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class MetaLink {
  String? url;
  String? label;
  String? page;
  bool? active;

  MetaLink({this.url, this.label, this.page, this.active});

  MetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    page = json['page']?.toString();
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['page'] = page;
    data['active'] = active;
    return data;
  }
}
