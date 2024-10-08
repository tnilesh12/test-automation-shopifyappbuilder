import 'package:shopify_code/modelClass/src/product/shopify_image/shopify_image.dart';

class BoostAISearch {
  bool? allEmpty;
  int? totalProduct;
  List<BoostAIProducts>? products;
  List<String>? suggestions;
  List<BoostAICollections>? collections;
  List<BoostAIPages>? pages;
  String? query;
  Meta? meta;

  BoostAISearch(
      {this.allEmpty,
      this.totalProduct,
      this.products,
      this.suggestions,
      this.collections,
      this.pages,
      this.query,
      this.meta});

  BoostAISearch.fromJson(Map<String, dynamic> json) {
    allEmpty = json['all_empty'];
    totalProduct = json['total_product'];
    if (json['products'] != null) {
      products = <BoostAIProducts>[];
      json['products'].forEach((v) {
        products!.add(new BoostAIProducts.fromJson(v));
      });
    }
    suggestions = json['suggestions'].cast<String>();
    if (json['collections'] != null) {
      collections = <BoostAICollections>[];
      json['collections'].forEach((v) {
        collections!.add(new BoostAICollections.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <BoostAIPages>[];
      json['pages'].forEach((v) {
        pages!.add(new BoostAIPages.fromJson(v));
      });
    }
    query = json['query'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_empty'] = this.allEmpty;
    data['total_product'] = this.totalProduct;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['suggestions'] = this.suggestions;
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    data['query'] = this.query;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class BoostAIProducts {
  String? bodyHtml;
  List<String>? skus;
  bool? available;
  int? reviewCount;
  String? createdAt;
  List<BoostAIVariants>? variants;
  // List<Null>? media;
  double? priceMin;
  String? title;
  List<BoostAIImagesInfo>? imagesInfo;
  int? reviewRatings;
  double? priceMaxYer;
  String? templateSuffix;
  String? updatedAt;
  List<BoostAICollections>? collections;
  String? vendor;
  int? bestSellingRank;
  int? percentSaleMin;
  BoostAIHtml? html;
  int? id;
  String? publishedAt;
  BoostAITsCustomFields? tsCustomFields;
  BoostAIImages? images;
  double? priceMinYer;
  List<BoostAIOptionsWithValues>? optionsWithValues;
  int? weightMin;
  double? compareAtPriceMaxYer;
  String? handle;
  int? percentSaleMinYer;
  double? compareAtPriceMin;
  // List<Null>? barcodes;
  List<String>? tags;
  String? publishedScope;
  double? compareAtPriceMinYer;
  // List<Null>? metafields;
  String? productType;
  int? weightMax;
  // List<Null>? locations;
  String? position;
  double? compareAtPriceMax;
  double? priceMax;
  String? productCategory;

  BoostAIProducts(
      {this.bodyHtml,
      this.skus,
      this.available,
      this.reviewCount,
      this.createdAt,
      this.variants,
      this.priceMin,
      this.title,
      this.imagesInfo,
      this.reviewRatings,
      this.priceMaxYer,
      this.templateSuffix,
      this.updatedAt,
      this.collections,
      this.vendor,
      this.bestSellingRank,
      this.percentSaleMin,
      this.html,
      this.id,
      this.publishedAt,
      this.tsCustomFields,
      this.images,
      this.priceMinYer,
      this.optionsWithValues,
      this.weightMin,
      this.compareAtPriceMaxYer,
      this.handle,
      this.percentSaleMinYer,
      this.compareAtPriceMin,
      this.tags,
      this.publishedScope,
      this.compareAtPriceMinYer,
      this.productType,
      this.weightMax,
      this.position,
      this.compareAtPriceMax,
      this.priceMax,
      this.productCategory});

  BoostAIProducts.fromJson(Map<String, dynamic> json) {
    bodyHtml = json['body_html'] ?? " ";
    skus = json['skus'].cast<String>();
    available = json['available'];
    reviewCount = json['review_count'];
    createdAt = json['created_at'] ?? " ";
    if (json['variants'] != null) {
      variants = <BoostAIVariants>[];
      json['variants'].forEach((v) {
        variants!.add(new BoostAIVariants.fromJson(v));
      });
    }
    // if (json['media'] != null) {
    // 	media = <Null>[];
    // 	json['media'].forEach((v) { media!.add(new Null.fromJson(v)); });
    // }
    priceMin = (json['price_min']).toDouble();
    title = json['title'];
    if (json['images_info'] != null) {
      imagesInfo = <BoostAIImagesInfo>[];
      json['images_info'].forEach((v) {
        imagesInfo!.add(new BoostAIImagesInfo.fromJson(v));
      });
    }
    reviewRatings = json['review_ratings'];
    priceMaxYer = json['price_max_yer'];
    templateSuffix =
        json['template_suffix'] == null ? " " : json['template_suffix'];
    updatedAt = json['updated_at'];
    if (json['collections'] != null) {
      collections = <BoostAICollections>[];
      json['collections'].forEach((v) {
        collections!.add(new BoostAICollections.fromJson(v));
      });
    }
    vendor = json['vendor'];
    bestSellingRank = json['best_selling_rank'];
    percentSaleMin = json['percent_sale_min'];
    html = json['html'] != null ? new BoostAIHtml.fromJson(json['html']) : null;
    id = json['id'];
    publishedAt = json['published_at'];
    tsCustomFields = json['ts_custom_fields'] != null
        ? BoostAITsCustomFields.fromJson(json['ts_custom_fields'])
        : null;
    images = json['images'] != null
        ? new BoostAIImages.fromJson(json['images'])
        : null;
    priceMinYer = json['price_min_yer'];
    if (json['options_with_values'] != null) {
      optionsWithValues = <BoostAIOptionsWithValues>[];
      json['options_with_values'].forEach((v) {
        optionsWithValues!.add(new BoostAIOptionsWithValues.fromJson(v));
      });
    }
    weightMin = json['weight_min'];
    compareAtPriceMaxYer = json['compare_at_price_max_yer'];
    handle = json['handle'];
    percentSaleMinYer = json['percent_sale_min_yer'];
    compareAtPriceMin = json['compare_at_price_min'] != null
        ? (json['compare_at_price_min']).toDouble()
        : 0.0;
    // if (json['barcodes'] != null) {
    // 	barcodes = <Null>[];
    // 	json['barcodes'].forEach((v) { barcodes!.add(new Null.fromJson(v)); });
    // }
    tags = json['tags'].cast<String>();
    publishedScope = json['published_scope'];
    compareAtPriceMinYer = json['compare_at_price_min_yer'];
    // if (json['metafields'] != null) {
    // 	metafields = <Null>[];
    // 	json['metafields'].forEach((v) { metafields!.add(new Null.fromJson(v)); });
    // }
    productType = json['product_type'];
    weightMax = json['weight_max'];
    // if (json['locations'] != null) {
    // 	locations = <Null>[];
    // 	json['locations'].forEach((v) { locations!.add(new Null.fromJson(v)); });
    // }
    position = json['position'];
    compareAtPriceMax = json['compare_at_price_max'] != null
        ? (json['compare_at_price_max']).toDouble()
        : 0.0;
    priceMax = (json['price_max']).toDouble();
    productCategory = json['product_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body_html'] = this.bodyHtml;
    data['skus'] = this.skus;
    data['available'] = this.available;
    data['review_count'] = this.reviewCount;
    data['created_at'] = this.createdAt;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    // if (this.media != null) {
    //   data['media'] = this.media!.map((v) => v.toJson()).toList();
    // }
    data['price_min'] = this.priceMin;
    data['title'] = this.title;
    if (this.imagesInfo != null) {
      data['images_info'] = this.imagesInfo!.map((v) => v.toJson()).toList();
    }
    data['review_ratings'] = this.reviewRatings;
    data['price_max_yer'] = this.priceMaxYer;
    data['template_suffix'] = this.templateSuffix;
    data['updated_at'] = this.updatedAt;
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    data['vendor'] = this.vendor;
    data['best_selling_rank'] = this.bestSellingRank;
    data['percent_sale_min'] = this.percentSaleMin;
    if (this.html != null) {
      data['html'] = this.html!.toJson();
    }
    data['id'] = this.id;
    data['published_at'] = this.publishedAt;
    if (this.tsCustomFields != null) {
      data['ts_custom_fields'] = this.tsCustomFields!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['price_min_yer'] = this.priceMinYer;
    if (this.optionsWithValues != null) {
      data['options_with_values'] =
          this.optionsWithValues!.map((v) => v.toJson()).toList();
    }
    data['weight_min'] = this.weightMin;
    data['compare_at_price_max_yer'] = this.compareAtPriceMaxYer;
    data['handle'] = this.handle;
    data['percent_sale_min_yer'] = this.percentSaleMinYer;
    data['compare_at_price_min'] = this.compareAtPriceMin;
    // if (this.barcodes != null) {
    //   data['barcodes'] = this.barcodes!.map((v) => v.toJson()).toList();
    // }
    data['tags'] = this.tags;
    data['published_scope'] = this.publishedScope;
    data['compare_at_price_min_yer'] = this.compareAtPriceMinYer;
    // if (this.metafields != null) {
    //   data['metafields'] = this.metafields!.map((v) => v.toJson()).toList();
    // }
    data['product_type'] = this.productType;
    data['weight_max'] = this.weightMax;
    // if (this.locations != null) {
    //   data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    // }
    data['position'] = this.position;
    data['compare_at_price_max'] = this.compareAtPriceMax;
    data['price_max'] = this.priceMax;
    data['product_category'] = this.productCategory;
    return data;
  }
}

class BoostAIVariants {
  List<String>? mergedOptions;
  int? inventoryQuantity;
  String? priceYer;
  String? image;
  List<String>? originalMergedOptions;
  String? compareAtPrice;
  String? inventoryManagement;
  String? fulfillmentService;
  bool? available;
  double? weight;
  String? title;
  String? inventoryPolicy;
  String? weightUnit;
  String? price;
  int? id;
  String? sku;
  String? barcode;
  String? compareAtPriceYer;

  BoostAIVariants(
      {this.mergedOptions,
      this.inventoryQuantity,
      this.priceYer,
      this.image,
      this.originalMergedOptions,
      this.compareAtPrice,
      this.inventoryManagement,
      this.fulfillmentService,
      this.available,
      this.weight,
      this.title,
      this.inventoryPolicy,
      this.weightUnit,
      this.price,
      this.id,
      this.sku,
      this.barcode,
      this.compareAtPriceYer});

  BoostAIVariants.fromJson(Map<String, dynamic> json) {
    mergedOptions = json['merged_options'].cast<String>();
    inventoryQuantity = json['inventory_quantity'];
    priceYer = json['price_yer'];
    image = json['image']==null?" ":json['image'];
    originalMergedOptions = json['original_merged_options'].cast<String>();
    compareAtPrice = json['compare_at_price'];
    inventoryManagement = json['inventory_management'];
    fulfillmentService = json['fulfillment_service'];
    available = json['available'];
    weight = double.parse(json['weight'].toString() ?? "0");
    title = json['title'];
    inventoryPolicy = json['inventory_policy'];
    weightUnit = json['weight_unit'];
    price = json['price'];
    id = json['id'];
    sku = json['sku'];
    barcode = json['barcode'];
    compareAtPriceYer = json['compare_at_price_yer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merged_options'] = this.mergedOptions;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['price_yer'] = this.priceYer;
    data['image'] = this.image;
    data['original_merged_options'] = this.originalMergedOptions;
    data['compare_at_price'] = this.compareAtPrice;
    data['inventory_management'] = this.inventoryManagement;
    data['fulfillment_service'] = this.fulfillmentService;
    data['available'] = this.available;
    data['weight'] = this.weight;
    data['title'] = this.title;
    data['inventory_policy'] = this.inventoryPolicy;
    data['weight_unit'] = this.weightUnit;
    data['price'] = this.price;
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['compare_at_price_yer'] = this.compareAtPriceYer;
    return data;
  }
}

class BoostAIImagesInfo {
  String? src;
  int? width;
  String? alt;
  int? id;
  int? position;
  int? height;

  BoostAIImagesInfo(
      {this.src, this.width, this.alt, this.id, this.position, this.height});

  BoostAIImagesInfo.fromJson(Map<String, dynamic> json) {
    src = json['src']??" ";
    width = json['width'];
    alt = json['alt'] ?? " ";
    id = json['id'];
    position = json['position'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['width'] = this.width;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['position'] = this.position;
    data['height'] = this.height;
    return data;
  }
}

class BoostAICollections {
  String? templateSuffix;
  String? handle;
  int? id;
  String? sortValue;
  String? title;
  ShopifyImage? image;
  BoostAICollections(
      {this.templateSuffix,
      this.handle,
      this.id,
      this.sortValue,
      this.title,
      this.image});

  BoostAICollections.fromJson(Map<String, dynamic> json) {
    templateSuffix = json['template_suffix'] ?? " ";
    handle = json['handle'] ?? " ";
    id = json['id'];
    sortValue = json['sort_value'] ?? " ";
    title = json['title'] ?? " ";
    // image= json['image']??" ";
    image = json['image'] == null ? null : ShopifyImage.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['template_suffix'] = this.templateSuffix;
    data['handle'] = this.handle;
    data['id'] = this.id;
    data['sort_value'] = this.sortValue;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

class BoostAIHtml {
  int? themeId;
  String? value;

  BoostAIHtml({this.themeId, this.value});

  BoostAIHtml.fromJson(Map<String, dynamic> json) {
    themeId = json['theme_id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['theme_id'] = this.themeId;
    data['value'] = this.value;
    return data;
  }
}

class BoostAITsCustomFields {
  BoostAITsCustomFields();

  BoostAITsCustomFields.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class BoostAIImages {
  String? s1;
  String? s2;

  BoostAIImages({this.s1, this.s2});

  BoostAIImages.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
}

class BoostAIOptionsWithValues {
  String? originalName;
  List<BoostAIValues>? values;
  String? name;
  String? label;
  int? position;

  BoostAIOptionsWithValues(
      {this.originalName, this.values, this.name, this.label, this.position});

  BoostAIOptionsWithValues.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    if (json['values'] != null) {
      values = <BoostAIValues>[];
      json['values'].forEach((v) {
        values!.add(new BoostAIValues.fromJson(v));
      });
    }
    name = json['name'];
    label = json['label'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['label'] = this.label;
    data['position'] = this.position;
    return data;
  }
}

class BoostAIValues {
  int? image;
  String? title;

  BoostAIValues({this.image, this.title});

  BoostAIValues.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}

class BoostAICollection {
  Null? image;
  Null? bodyHtml;
  Null? templateSuffix;
  String? handle;
  int? id;
  String? title;

  BoostAICollection(
      {this.image,
      this.bodyHtml,
      this.templateSuffix,
      this.handle,
      this.id,
      this.title});

  BoostAICollection.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    bodyHtml = json['body_html'];
    templateSuffix = json['template_suffix'];
    handle = json['handle'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['body_html'] = this.bodyHtml;
    data['template_suffix'] = this.templateSuffix;
    data['handle'] = this.handle;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class BoostAIPages {
  String? bodyHtml;
  String? templateSuffix;
  String? handle;
  int? id;
  String? title;
  String? url;
  BoostAIImage? image;
  String? summaryHtml;
  // List<Null>? tags;

  BoostAIPages({
    this.bodyHtml,
    this.templateSuffix,
    this.handle,
    this.id,
    this.title,
    this.url,
    this.image,
    this.summaryHtml,
  });

  BoostAIPages.fromJson(Map<String, dynamic> json) {
    bodyHtml = json['body_html'] ?? " ";
    templateSuffix = json['template_suffix'] ?? " ";
    handle = json['handle'] ?? " ";
    id = json['id'];
    title = json['title'] ?? " ";
    url = json['url'] ?? " ";
    image =
        json['image'] != null ? new BoostAIImage.fromJson(json['image']) : null;
    summaryHtml = json['summary_html'] ?? " ";
    // if (json['tags'] != null) {
    // 	tags = <Null>[];
    // 	json['tags'].forEach((v) { tags!.add(new Null.fromJson(v)); });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body_html'] = this.bodyHtml;
    data['template_suffix'] = this.templateSuffix;
    data['handle'] = this.handle;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['summary_html'] = this.summaryHtml;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class BoostAIImage {
  String? src;
  String? alt;
  int? width;
  String? createdAt;
  int? height;

  BoostAIImage({this.src, this.alt, this.width, this.createdAt, this.height});

  BoostAIImage.fromJson(Map<String, dynamic> json) {
    src = json['src'] ?? " ";
    alt = json['alt'] ?? " ";
    width = json['width'];
    createdAt = json['created_at'] ?? " ";
    height = json['height'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['created_at'] = this.createdAt;
    data['height'] = this.height;
    return data;
  }
}

class Meta {
  String? rid;
  bool? affectedByMerchandising;
  bool? affectedByPerformanceRanking;
  bool? affectedBySearchPersonalization;

  Meta(
      {this.rid,
      this.affectedByMerchandising,
      this.affectedByPerformanceRanking,
      this.affectedBySearchPersonalization});

  Meta.fromJson(Map<String, dynamic> json) {
    rid = json['rid'];
    affectedByMerchandising = json['affected_by_merchandising'];
    affectedByPerformanceRanking = json['affected_by_performance_ranking'];
    affectedBySearchPersonalization =
        json['affected_by_search_personalization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rid'] = this.rid;
    data['affected_by_merchandising'] = this.affectedByMerchandising;
    data['affected_by_performance_ranking'] = this.affectedByPerformanceRanking;
    data['affected_by_search_personalization'] =
        this.affectedBySearchPersonalization;
    return data;
  }
}
