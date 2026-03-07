class BookingListModel {
  bool? error;
  int? code;
  String? message;
  BookingListData? data;
  dynamic errors;

  BookingListModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  BookingListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? BookingListData.fromJson(json['data']) : null;
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

class BookingListData {
  List<BookingItem>? data;
  BookingPaginationLinks? links;
  BookingMeta? meta;

  BookingListData({this.data, this.links, this.meta});

  BookingListData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BookingItem>[];
      json['data'].forEach((v) {
        data!.add(BookingItem.fromJson(v));
      });
    }
    links = json['links'] != null
        ? BookingPaginationLinks.fromJson(json['links'])
        : null;
    meta = json['meta'] != null ? BookingMeta.fromJson(json['meta']) : null;
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

class BookingItem {
  int? id;
  int? userId;
  int? vendorId;
  int? serviceId;
  int? propertyId;
  String? status;
  String? adminNotes;
  String? scheduledAt;
  String? createdAt;
  String? updatedAt;
  BookingUser? user;
  BookingVendor? vendor;
  BookingService? service;
  dynamic property;

  BookingItem({
    this.id,
    this.userId,
    this.vendorId,
    this.serviceId,
    this.propertyId,
    this.status,
    this.adminNotes,
    this.scheduledAt,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.vendor,
    this.service,
    this.property,
  });

  BookingItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    serviceId = json['service_id'];
    propertyId = json['property_id'];
    status = json['status'];
    adminNotes = json['admin_notes'];
    scheduledAt = json['scheduled_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? BookingUser.fromJson(json['user']) : null;
    vendor = json['vendor'] != null
        ? BookingVendor.fromJson(json['vendor'])
        : null;
    service = json['service'] != null
        ? BookingService.fromJson(json['service'])
        : null;
    property = json['property'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['vendor_id'] = vendorId;
    map['service_id'] = serviceId;
    map['property_id'] = propertyId;
    map['status'] = status;
    map['admin_notes'] = adminNotes;
    map['scheduled_at'] = scheduledAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (vendor != null) {
      map['vendor'] = vendor!.toJson();
    }
    if (service != null) {
      map['service'] = service!.toJson();
    }
    map['property'] = property;
    return map;
  }
}

class BookingUser {
  int? id;
  String? name;
  String? email;

  BookingUser({this.id, this.name, this.email});

  BookingUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}

class BookingVendor {
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

  BookingVendor({
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

  BookingVendor.fromJson(Map<String, dynamic> json) {
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

class BookingService {
  int? id;
  int? vendorId;
  int? serviceTypeId;
  String? title;
  String? subtext;
  String? description;
  String? bannerImage;
  String? logo;
  BookingServiceRating? rating;
  String? experience;
  String? supportTime;
  List<BookingServiceWhyChooseUs>? whyChooseUs;
  List<BookingServiceOffered>? servicesOffered;
  List<BookingPastWorkShowcase>? pastWorkShowcase;
  String? status;
  String? approvedAt;
  String? createdAt;
  String? updatedAt;
  BookingServiceType? serviceType;

  BookingService({
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
    this.serviceType,
  });

  BookingService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    serviceTypeId = json['service_type_id'];
    title = json['title'];
    subtext = json['subtext'];
    description = json['description'];
    bannerImage = json['banner_image'];
    logo = json['logo'];
    rating = json['rating'] != null
        ? BookingServiceRating.fromJson(json['rating'])
        : null;
    experience = json['experience'];
    supportTime = json['support_time'];
    if (json['why_choose_us'] != null) {
      whyChooseUs = <BookingServiceWhyChooseUs>[];
      json['why_choose_us'].forEach((v) {
        whyChooseUs!.add(BookingServiceWhyChooseUs.fromJson(v));
      });
    }
    if (json['services_offered'] != null) {
      servicesOffered = <BookingServiceOffered>[];
      json['services_offered'].forEach((v) {
        servicesOffered!.add(BookingServiceOffered.fromJson(v));
      });
    }
    if (json['past_work_showcase'] != null) {
      pastWorkShowcase = <BookingPastWorkShowcase>[];
      json['past_work_showcase'].forEach((v) {
        pastWorkShowcase!.add(BookingPastWorkShowcase.fromJson(v));
      });
    }
    status = json['status'];
    approvedAt = json['approved_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceType = json['service_type'] != null
        ? BookingServiceType.fromJson(json['service_type'])
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
    if (serviceType != null) {
      map['service_type'] = serviceType!.toJson();
    }
    return map;
  }
}

class BookingServiceRating {
  num? averageRating;
  int? totalReviews;

  BookingServiceRating({this.averageRating, this.totalReviews});

  BookingServiceRating.fromJson(Map<String, dynamic> json) {
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

class BookingServiceWhyChooseUs {
  String? icon;
  String? title;
  String? shortDescription;

  BookingServiceWhyChooseUs({this.icon, this.title, this.shortDescription});

  BookingServiceWhyChooseUs.fromJson(Map<String, dynamic> json) {
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

class BookingServiceOffered {
  String? icon;
  String? title;
  String? shortDescription;

  BookingServiceOffered({this.icon, this.title, this.shortDescription});

  BookingServiceOffered.fromJson(Map<String, dynamic> json) {
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

class BookingPastWorkShowcase {
  String? image;
  String? imageDescription;

  BookingPastWorkShowcase({this.image, this.imageDescription});

  BookingPastWorkShowcase.fromJson(Map<String, dynamic> json) {
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

class BookingServiceType {
  int? id;
  String? name;
  String? slug;

  BookingServiceType({this.id, this.name, this.slug});

  BookingServiceType.fromJson(Map<String, dynamic> json) {
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

class BookingPaginationLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  BookingPaginationLinks({this.first, this.last, this.prev, this.next});

  BookingPaginationLinks.fromJson(Map<String, dynamic> json) {
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

class BookingMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<BookingMetaLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  BookingMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  BookingMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <BookingMetaLink>[];
      json['links'].forEach((v) {
        links!.add(BookingMetaLink.fromJson(v));
      });
    }
    path = json['path'];
    perPage = int.tryParse(json['per_page'].toString());
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

class BookingMetaLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  BookingMetaLink({this.url, this.label, this.page, this.active});

  BookingMetaLink.fromJson(Map<String, dynamic> json) {
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
