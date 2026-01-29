class BlogDetailsModel {
  bool? error;
  int? code;
  String? message;
  Data? data;

  BlogDetailsModel({this.error, this.code, this.message, this.data});

  BlogDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
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

  Data({
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

  Data.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? email;

  Author({this.id, this.name, this.email});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    email = json['email'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
