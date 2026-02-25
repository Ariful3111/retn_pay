class ServiceDetailsModel {
  bool? error;
  int? code;
  String? message;
  ServiceDetailsData? data;
  dynamic errors;

  ServiceDetailsModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? ServiceDetailsData.fromJson(json['data'])
        : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['error'] = error;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    map['errors'] = errors;
    return map;
  }
}

class ServiceDetailsData {
  List<ServiceItem>? data;
  ServicePaginationLinks? links;
  ServiceMeta? meta;

  ServiceDetailsData({this.data, this.links, this.meta});

  ServiceDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServiceItem>[];
      json['data'].forEach((v) {
        data!.add(ServiceItem.fromJson(v));
      });
    }
    links = json['links'] != null
        ? ServicePaginationLinks.fromJson(json['links'])
        : null;
    meta = json['meta'] != null ? ServiceMeta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links!.toJson();
    }
    if (meta != null) {
      map['meta'] = meta!.toJson();
    }
    return map;
  }
}

class ServiceItem {
  int? id;
  int? vendorId;
  int? serviceTypeId;
  String? title;
  String? subtext;
  String? description;
  String? bannerImage;
  String? logo;
  ServiceRating? rating;
  String? experience;
  String? supportTime;
  List<WhyChooseUs>? whyChooseUs;
  List<ServiceOffered>? servicesOffered;
  List<PastWorkShowcase>? pastWorkShowcase;
  String? status;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  ServiceVendor? vendor;
  ServiceType? serviceType;

  ServiceItem({
    this.id,
    this.vendorId,
    this.serviceTypeId,
    this.title,
    this.subtext,
    this.description,
    this.bannerImage,
    this.logo,
    this.rating,
    this.experience,
    this.supportTime,
    this.whyChooseUs,
    this.servicesOffered,
    this.pastWorkShowcase,
    this.status,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.serviceType,
  });

  ServiceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    serviceTypeId = json['service_type_id'];
    title = json['title'];
    subtext = json['subtext'];
    description = json['description'];
    bannerImage = json['banner_image'];
    logo = json['logo'];
    rating = json['rating'] != null
        ? ServiceRating.fromJson(json['rating'])
        : null;
    experience = json['experience'];
    supportTime = json['support_time'];
    if (json['why_choose_us'] != null) {
      whyChooseUs = <WhyChooseUs>[];
      json['why_choose_us'].forEach((v) {
        whyChooseUs!.add(WhyChooseUs.fromJson(v));
      });
    }
    if (json['services_offered'] != null) {
      servicesOffered = <ServiceOffered>[];
      json['services_offered'].forEach((v) {
        servicesOffered!.add(ServiceOffered.fromJson(v));
      });
    }
    if (json['past_work_showcase'] != null) {
      pastWorkShowcase = <PastWorkShowcase>[];
      json['past_work_showcase'].forEach((v) {
        pastWorkShowcase!.add(PastWorkShowcase.fromJson(v));
      });
    }
    status = json['status'];
    approvedAt = json['approved_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vendor = json['vendor'] != null
        ? ServiceVendor.fromJson(json['vendor'])
        : null;
    serviceType = json['service_type'] != null
        ? ServiceType.fromJson(json['service_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['service_type_id'] = serviceTypeId;
    map['title'] = title;
    map['subtext'] = subtext;
    map['description'] = description;
    map['banner_image'] = bannerImage;
    map['logo'] = logo;
    if (rating != null) {
      map['rating'] = rating!.toJson();
    }
    map['experience'] = experience;
    map['support_time'] = supportTime;
    if (whyChooseUs != null) {
      map['why_choose_us'] = whyChooseUs!.map((v) => v.toJson()).toList();
    }
    if (servicesOffered != null) {
      map['services_offered'] = servicesOffered!
          .map((v) => v.toJson())
          .toList();
    }
    if (pastWorkShowcase != null) {
      map['past_work_showcase'] = pastWorkShowcase!
          .map((v) => v.toJson())
          .toList();
    }
    map['status'] = status;
    map['approved_at'] = approvedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (vendor != null) {
      map['vendor'] = vendor!.toJson();
    }
    if (serviceType != null) {
      map['service_type'] = serviceType!.toJson();
    }
    return map;
  }
}

class ServiceRating {
  num? averageRating;
  int? totalReviews;

  ServiceRating({this.averageRating, this.totalReviews});

  ServiceRating.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['average_rating'] = averageRating;
    map['total_reviews'] = totalReviews;
    return map;
  }
}

class WhyChooseUs {
  String? icon;
  String? title;
  String? shortDescription;

  WhyChooseUs({this.icon, this.title, this.shortDescription});

  WhyChooseUs.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    shortDescription = json['short_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    map['short_description'] = shortDescription;
    return map;
  }
}

class ServiceOffered {
  String? icon;
  String? title;
  String? shortDescription;

  ServiceOffered({this.icon, this.title, this.shortDescription});

  ServiceOffered.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    shortDescription = json['short_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    map['short_description'] = shortDescription;
    return map;
  }
}

class PastWorkShowcase {
  String? image;
  String? imageDescription;

  PastWorkShowcase({this.image, this.imageDescription});

  PastWorkShowcase.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    imageDescription = json['image_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['image'] = image;
    map['image_description'] = imageDescription;
    return map;
  }
}

class ServiceVendor {
  int? id;
  int? userId;
  String? businessName;
  String? businessType;
  String? abn;
  String? description;
  bool? isVerified;
  String? status;
  String? rejectionReason;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  dynamic subscription;

  ServiceVendor({
    this.id,
    this.userId,
    this.businessName,
    this.businessType,
    this.abn,
    this.description,
    this.isVerified,
    this.status,
    this.rejectionReason,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
    this.subscription,
  });

  ServiceVendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessName = json['business_name'];
    businessType = json['business_type'];
    abn = json['abn'];
    description = json['description'];
    isVerified = json['is_verified'];
    status = json['status'];
    rejectionReason = json['rejection_reason'];
    approvedAt = json['approved_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['business_name'] = businessName;
    map['business_type'] = businessType;
    map['abn'] = abn;
    map['description'] = description;
    map['is_verified'] = isVerified;
    map['status'] = status;
    map['rejection_reason'] = rejectionReason;
    map['approved_at'] = approvedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['subscription'] = subscription;
    return map;
  }
}

class ServiceType {
  int? id;
  String? name;
  String? slug;

  ServiceType({this.id, this.name, this.slug});

  ServiceType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }
}

class ServicePaginationLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  ServicePaginationLinks({this.first, this.last, this.prev, this.next});

  ServicePaginationLinks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

class ServiceMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<ServiceMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  ServiceMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  ServiceMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <ServiceMetaLink>[];
      json['links'].forEach((v) {
        links!.add(ServiceMetaLink.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links!.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

class ServiceMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  ServiceMetaLink({this.url, this.label, this.page, this.active});

  ServiceMetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    page = json['page'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['page'] = page;
    map['active'] = active;
    return map;
  }
}
