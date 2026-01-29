class BlogsModel {
  bool? error;
  int? code;
  String? message;
  BlogPaginationData? data;
  dynamic errors;

  BlogsModel({this.error, this.code, this.message, this.data, this.errors});

  BlogsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? BlogPaginationData.fromJson(json['data'])
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

class BlogPaginationData {
  List<BlogPost>? data;
  PaginationLinks? links;
  Meta? meta;

  BlogPaginationData({this.data, this.links, this.meta});

  BlogPaginationData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BlogPost>[];
      json['data'].forEach((v) {
        data!.add(BlogPost.fromJson(v));
      });
    }
    links = json['links'] != null
        ? PaginationLinks.fromJson(json['links'])
        : null;
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

class BlogPost {
  int? id;
  String? title;
  String? slug;
  String? excerpt;
  String? content;
  String? featuredImage;
  Category? category;
  Author? author;
  int? order;
  int? readingTimeMinutes;
  String? readingTimeLabel;
  bool? isPublished;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? url;

  BlogPost({
    this.id,
    this.title,
    this.slug,
    this.excerpt,
    this.content,
    this.featuredImage,
    this.category,
    this.author,
    this.order,
    this.readingTimeMinutes,
    this.readingTimeLabel,
    this.isPublished,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  BlogPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    excerpt = json['excerpt'];
    content = json['content'];
    featuredImage = json['featured_image'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    order = json['order'];
    readingTimeMinutes = json['reading_time_minutes'];
    readingTimeLabel = json['reading_time_label'];
    isPublished = json['is_published'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['excerpt'] = excerpt;
    data['content'] = content;
    data['featured_image'] = featuredImage;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['order'] = order;
    data['reading_time_minutes'] = readingTimeMinutes;
    data['reading_time_label'] = readingTimeLabel;
    data['is_published'] = isPublished;
    data['published_at'] = publishedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['url'] = url;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Author {
  int? id;
  String? name;
  String? email;

  Author({this.id, this.name, this.email});

  Author.fromJson(Map<String, dynamic> json) {
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

class PaginationLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  PaginationLinks({this.first, this.last, this.prev, this.next});

  PaginationLinks.fromJson(Map<String, dynamic> json) {
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
  bool? active;

  MetaLink({this.url, this.label, this.active});

  MetaLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
