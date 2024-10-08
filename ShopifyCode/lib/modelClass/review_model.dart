class ReviewModel {
  bool? status;
  String? message;
  Result? result;

  ReviewModel({this.status, this.message, this.result});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? currentPage;
  int? perPage;
  List<Reviews>? reviews;

  Result({this.currentPage, this.perPage, this.reviews});

  Result.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  String? title;
  String? body;
  int? rating;
  int? productExternalId;
  Reviewer? reviewer;
  String? source;
  String? curated;
  bool? published;
  bool? hidden;
  String? verified;
  bool? featured;
  String? createdAt;
  String? updatedAt;
  bool? hasPublishedPictures;
  bool? hasPublishedVideos;
  List<Pictures>? pictures;
  String? ipAddress;
  String? productTitle;
  String? productHandle;

  Reviews(
      {this.id,
      this.title,
      this.body,
      this.rating,
      this.productExternalId,
      this.reviewer,
      this.source,
      this.curated,
      this.published,
      this.hidden,
      this.verified,
      this.featured,
      this.createdAt,
      this.updatedAt,
      this.hasPublishedPictures,
      this.hasPublishedVideos,
      this.pictures,
      this.ipAddress,
      this.productTitle,
      this.productHandle});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    rating = json['rating'];
    productExternalId = json['product_external_id'];
    reviewer = json['reviewer'] != null
        ? new Reviewer.fromJson(json['reviewer'])
        : null;
    source = json['source'];
    curated = json['curated'];
    published = json['published'];
    hidden = json['hidden'];
    verified = json['verified'];
    featured = json['featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasPublishedPictures = json['has_published_pictures'];
    hasPublishedVideos = json['has_published_videos'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(new Pictures.fromJson(v));
      });
    }
    ipAddress = json['ip_address'];
    productTitle = json['product_title'];
    productHandle = json['product_handle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['rating'] = this.rating;
    data['product_external_id'] = this.productExternalId;
    if (this.reviewer != null) {
      data['reviewer'] = this.reviewer!.toJson();
    }
    data['source'] = this.source;
    data['curated'] = this.curated;
    data['published'] = this.published;
    data['hidden'] = this.hidden;
    data['verified'] = this.verified;
    data['featured'] = this.featured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['has_published_pictures'] = this.hasPublishedPictures;
    data['has_published_videos'] = this.hasPublishedVideos;
    if (this.pictures != null) {
      data['pictures'] = this.pictures!.map((v) => v.toJson()).toList();
    }
    data['ip_address'] = this.ipAddress;
    data['product_title'] = this.productTitle;
    data['product_handle'] = this.productHandle;
    return data;
  }
}

class Reviewer {
  int? id;
  int? externalId;
  String? email;
  String? name;
  String? phone;
  bool? acceptsMarketing;
  String? unsubscribedAt;
  List<String>? tags;

  Reviewer(
      {this.id,
      this.externalId,
      this.email,
      this.name,
      this.phone,
      this.acceptsMarketing,
      this.unsubscribedAt,
      this.tags});

  Reviewer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    externalId = json['external_id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    acceptsMarketing = json['accepts_marketing'];
    unsubscribedAt = json['unsubscribed_at'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['external_id'] = this.externalId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['accepts_marketing'] = this.acceptsMarketing;
    data['unsubscribed_at'] = this.unsubscribedAt;
    data['tags'] = this.tags;
    return data;
  }
}

class Pictures {
  Urls? urls;
  bool? hidden;

  Pictures({this.urls, this.hidden});

  Pictures.fromJson(Map<String, dynamic> json) {
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    hidden = json['hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    data['hidden'] = this.hidden;
    return data;
  }
}

class Urls {
  String? original;
  String? small;
  String? compact;
  String? huge;

  Urls({this.original, this.small, this.compact, this.huge});

  Urls.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    small = json['small'];
    compact = json['compact'];
    huge = json['huge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['small'] = this.small;
    data['compact'] = this.compact;
    data['huge'] = this.huge;
    return data;
  }
}
