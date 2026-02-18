import 'package:get/get.dart';

class PropertiesModel {
  bool? error;
  int? code;
  String? message;
  PropertyPaginationData? data;
  dynamic errors;

  PropertiesModel({
    this.error,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? PropertyPaginationData.fromJson(json['data'])
        : null;
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

class PropertyPaginationData {
  List<Property>? data;
  Links? links;
  Meta? meta;

  PropertyPaginationData({this.data, this.links, this.meta});

  PropertyPaginationData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Property>[];
      json['data'].forEach((v) {
        data!.add(Property.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Property {
  int? id;
  int? landlordId;
  int? agentId;
  int? propertyTypeId;
  String? title;
  String? name;
  String? description;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? latitude;
  String? longitude;
  PropertyType? propertyType;
  int? bedrooms;
  int? bathrooms;
  int? parkingSpaces;
  String? landSize;
  String? buildingSize;
  int? yearBuilt;
  String? status;
  String? subscriptionTier;
  bool? isVerified;
  bool? isInPersonInspectionAvailable;
  bool? isVirtualInspectionAvailable;
  bool? hasArTour;
  RxBool isFavourite = false.obs;
  List<String>? features;
  String? rating;
  int? ratingCount;
  Landlord? landlord;
  Landlord? agent;
  List<AssignedAgent>? assignedAgents;
  List<Units>? units;
  List<Images>? images;
  List<Amenities>? amenities;
  ReviewSummary? reviewSummary;
  String? createdAt;
  String? updatedAt;

  Property({
    this.id,
    this.landlordId,
    this.agentId,
    this.propertyTypeId,
    this.title,
    this.name,
    this.description,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.latitude,
    this.longitude,
    this.propertyType,
    this.bedrooms,
    this.bathrooms,
    this.parkingSpaces,
    this.landSize,
    this.buildingSize,
    this.yearBuilt,
    this.status,
    this.subscriptionTier,
    this.isVerified,
    this.isInPersonInspectionAvailable,
    this.isVirtualInspectionAvailable,
    this.hasArTour,
    bool? isFavourite,
    this.features,
    this.rating,
    this.ratingCount,
    this.landlord,
    this.agent,
    this.assignedAgents,
    this.units,
    this.images,
    this.amenities,
    this.reviewSummary,
    this.createdAt,
    this.updatedAt,
  }) {
    this.isFavourite.value = isFavourite ?? false;
  }

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landlordId = json['landlord_id'];
    agentId = json['agent_id'];
    propertyTypeId = json['property_type_id'];
    title = json['title'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyType = json['property_type'] != null
        ? PropertyType.fromJson(json['property_type'])
        : null;
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parkingSpaces = json['parking_spaces'];
    landSize = json['land_size'];
    buildingSize = json['building_size'];
    yearBuilt = json['year_built'];
    status = json['status'];
    subscriptionTier = json['subscription_tier'];
    isVerified = json['is_verified'];
    isInPersonInspectionAvailable = json['is_in_person_inspection_available'];
    isVirtualInspectionAvailable = json['is_virtual_inspection_available'];
    hasArTour = json['has_ar_tour'];
    isFavourite.value = json['is_favourite'] ?? false;
    if (json['features'] != null && json['features'] is List) {
      features = json['features'].cast<String>();
    }
    rating = json['rating'];
    ratingCount = json['rating_count'];
    landlord = json['landlord'] != null
        ? Landlord.fromJson(json['landlord'])
        : null;
    agent = json['agent'] != null ? Landlord.fromJson(json['agent']) : null;
    if (json['assigned_agents'] != null && json['assigned_agents'] is List) {
      assignedAgents = <AssignedAgent>[];
      json['assigned_agents'].forEach((v) {
        assignedAgents!.add(AssignedAgent.fromJson(v));
      });
    }
    if (json['units'] != null && json['units'] is List) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(Units.fromJson(v));
      });
    }
    if (json['images'] != null && json['images'] is List) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['amenities'] != null && json['amenities'] is List) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    reviewSummary = json['review_summary'] != null
        ? ReviewSummary.fromJson(json['review_summary'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['landlord_id'] = landlordId;
    data['agent_id'] = agentId;
    data['property_type_id'] = propertyTypeId;
    data['title'] = title;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (propertyType != null) {
      data['property_type'] = propertyType!.toJson();
    }
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['parking_spaces'] = parkingSpaces;
    data['land_size'] = landSize;
    data['building_size'] = buildingSize;
    data['year_built'] = yearBuilt;
    data['status'] = status;
    data['subscription_tier'] = subscriptionTier;
    data['is_verified'] = isVerified;
    data['is_in_person_inspection_available'] = isInPersonInspectionAvailable;
    data['is_virtual_inspection_available'] = isVirtualInspectionAvailable;
    data['has_ar_tour'] = hasArTour;
    data['is_favourite'] = isFavourite.value;
    data['features'] = features;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    if (landlord != null) {
      data['landlord'] = landlord!.toJson();
    }
    if (agent != null) {
      data['agent'] = agent!.toJson();
    }
    if (assignedAgents != null) {
      data['assigned_agents'] = assignedAgents!.map((v) => v.toJson()).toList();
    }
    if (units != null) {
      data['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    if (reviewSummary != null) {
      data['review_summary'] = reviewSummary!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PropertyType {
  int? id;
  String? name;
  String? slug;
  String? image;

  PropertyType({this.id, this.name, this.slug, this.image});

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}

class Landlord {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  Landlord({this.id, this.name, this.email, this.phone, this.image});

  Landlord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone']?.toString();
    image = json['image']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}

class AssignedAgent {
  int? id;
  int? userId;
  String? name;
  String? email;

  AssignedAgent({this.id, this.userId, this.name, this.email});

  AssignedAgent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Units {
  int? id;
  int? propertyId;
  String? unitNumber;
  String? unitName;
  String? rentAmount;
  RentType? rentType;
  Currency? currencyObj;
  int? displayRentAmount;
  Currency? displayCurrency;
  String? currency;
  String? status;
  int? bedrooms;
  int? bathrooms;
  String? size;
  String? description;
  String? createdAt;
  String? updatedAt;

  Units({
    this.id,
    this.propertyId,
    this.unitNumber,
    this.unitName,
    this.rentAmount,
    this.rentType,
    this.currencyObj,
    this.displayRentAmount,
    this.displayCurrency,
    this.currency,
    this.status,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    unitNumber = json['unit_number'];
    unitName = json['unit_name'];
    rentAmount = json['rent_amount']?.toString();
    rentType = json['rent_type'] != null
        ? RentType.fromJson(json['rent_type'])
        : null;

    final dynamic currencyValue = json['currency'];
    if (currencyValue is Map<String, dynamic>) {
      currencyObj = Currency.fromJson(currencyValue);
      currency = currencyObj?.code;
    } else if (currencyValue is String) {
      currency = currencyValue;
    }

    final dynamic displayRentValue = json['display_rent_amount'];
    if (displayRentValue is num) {
      displayRentAmount = displayRentValue.toInt();
    } else if (displayRentValue is String) {
      displayRentAmount = int.tryParse(displayRentValue);
    }

    final dynamic displayCurrencyValue = json['display_currency'];
    if (displayCurrencyValue is Map<String, dynamic>) {
      displayCurrency = Currency.fromJson(displayCurrencyValue);
    }
    status = json['status'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    size = json['size'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['unit_number'] = unitNumber;
    data['unit_name'] = unitName;
    data['rent_amount'] = rentAmount;
    if (rentType != null) {
      data['rent_type'] = rentType!.toJson();
    }
    if (currencyObj != null) {
      data['currency'] = currencyObj!.toJson();
    } else {
      data['currency'] = currency;
    }
    data['display_rent_amount'] = displayRentAmount;
    if (displayCurrency != null) {
      data['display_currency'] = displayCurrency!.toJson();
    }
    data['status'] = status;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['size'] = size;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RentType {
  int? id;
  String? name;
  String? slug;
  int? rentDays;

  RentType({this.id, this.name, this.slug, this.rentDays});

  RentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    rentDays = json['rent_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['rent_days'] = rentDays;
    return data;
  }
}

class Currency {
  int? id;
  String? code;
  String? name;
  String? symbol;
  String? logo;
  String? type;

  Currency({this.id, this.code, this.name, this.symbol, this.logo, this.type});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
    logo = json['logo'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    data['logo'] = logo;
    data['type'] = type;
    return data;
  }
}

class Images {
  int? id;
  int? propertyId;
  String? imagePath;
  String? type;
  int? order;
  bool? isPrimary;
  String? caption;
  String? createdAt;
  String? updatedAt;

  Images({
    this.id,
    this.propertyId,
    this.imagePath,
    this.type,
    this.order,
    this.isPrimary,
    this.caption,
    this.createdAt,
    this.updatedAt,
  });

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    imagePath = json['image_path'];
    type = json['type'];
    order = json['order'];
    isPrimary = json['is_primary'];
    caption = json['caption'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['image_path'] = imagePath;
    data['type'] = type;
    data['order'] = order;
    data['is_primary'] = isPrimary;
    data['caption'] = caption;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Amenities {
  int? id;
  int? propertyId;
  int? amenityTypeId;
  AmenityType? amenityType;
  String? createdAt;
  String? updatedAt;

  Amenities({
    this.id,
    this.propertyId,
    this.amenityTypeId,
    this.amenityType,
    this.createdAt,
    this.updatedAt,
  });

  Amenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    amenityTypeId = json['amenity_type_id'];
    amenityType = json['amenity_type'] != null
        ? AmenityType.fromJson(json['amenity_type'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['amenity_type_id'] = amenityTypeId;
    if (amenityType != null) {
      data['amenity_type'] = amenityType!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AmenityType {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? description;

  AmenityType({this.id, this.name, this.slug, this.icon, this.description});

  AmenityType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['description'] = description;
    return data;
  }
}

class ReviewSummary {
  int? totalReviews;
  String? averageRating;

  ReviewSummary({this.totalReviews, this.averageRating});

  ReviewSummary.fromJson(Map<String, dynamic> json) {
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
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
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
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
    if (json['links'] != null) {
      links = <MetaLink>[];
      json['links'].forEach((v) {
        links!.add(MetaLink.fromJson(v));
      });
    }
    path = json['path'];
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
    url = json['url'];
    label = json['label'];
    page = json['page'].toString();
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
