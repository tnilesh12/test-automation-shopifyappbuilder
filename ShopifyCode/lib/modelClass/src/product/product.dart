import 'price_v_2/price_v_2.dart';
import 'product_variant/product_variant.dart';
import 'shopify_image/shopify_image.dart';
import '../../json_helper.dart';
import 'associated_collections/associated_collections.dart';
import 'metafield/metafield.dart';
import 'option/option.dart';
import '../../../theme/app_assets.dart';

// @JsonSerializable()
class Product {
  String? title;
  String? id;
  bool? availableForSale;
  String? createdAt;
  List<ProductVariant>? productVariants;
  String? productType;
  String? publishedAt;
  List<String>? tags;
  String? updatedAt;
  List<ShopifyImage>? images;
  List<Option>? option;
  String? vendor;
  List<Metafield>? metafields;
  List<AssociatedCollections>? collectionList;
  String? cursor;
  String? onlineStoreUrl;
  String? description;
  String? descriptionHtml;
  String? handle;
  PriceV2? tempPrice;
  PriceV2? priceCompareUpdate;
  List<SellingPlanGroups>? sellingPlanGroups;
  
  Product(
      {this.title,
      this.id,
      this.availableForSale,
      this.createdAt,
      this.productVariants,
      this.productType,
      this.publishedAt,
      this.tags,
      this.updatedAt,
      this.images,
      this.option,
      this.vendor,
      this.metafields,
      this.collectionList,
      this.cursor,
      this.onlineStoreUrl,
      this.description,
      this.descriptionHtml,
      this.handle,
      this.sellingPlanGroups});

  double get price =>
      productVariants!.length == 0 ? 0 : productVariants!.first.price!.amount!;

  String get formattedPrice => productVariants!.length == 0
      ? ''
      : productVariants!.first.price!.formattedPrice;

  String get formattedPriceCompare => productVariants!.length == 0
      ? ''
      : productVariants!.first.compareAtPrice == null
          ? ""
          : productVariants!.first.compareAtPrice!.formattedPrice;

  bool get hasComparablePrice => compareAtPrice > price;

  double get compareAtPrice => productVariants!.length == 0
      ? 0
      : (productVariants!.first.compareAtPrice == null
          ? 0
          : productVariants!.first.compareAtPrice!.amount!);

  String get compareAtPriceFormatted => productVariants!.length == 0
      ? ''
      : (productVariants!.first.compareAtPrice == null
          ? ''
          : productVariants!.first.compareAtPrice!.formattedPrice);

  String? get image =>
      images!.length == 0 ? AppAssets.no_image : images!.first.originalSrc;

  String get currencyCode => productVariants!.length == 0
      ? ''
      : productVariants!.first.price!.currencyCode!;

  /// Checks if the product is available for sale by checking its variants availability and quantity
  bool get isAvailableForSale {
    final temp =
        productVariants!.where((e) => e.title == 'Default Title').toList();
    if (temp.isNotEmpty) {
      return temp.first.availableForSale! && temp.first.quantityAvailable! > 0;
    } else {
      bool isAvailable = false;
      final variants =
          productVariants!.where((e) => e.title != 'Default Title').toList();
      for (int i = 0; i < variants.length; i++) {
        if (variants[i].availableForSale! &&
            variants[i].quantityAvailable! > 0) {
          isAvailable = true;
          break;
        }
      }
      return isAvailable;
    }
  }

  get priceMin {
    double minPrice = 0;
    double maxPrice = 0;
    for (int i = 0; i < productVariants!.length; i++) {
      if (minPrice == 0 && maxPrice == 0) {
        minPrice = productVariants![i].price!.amount!;
        maxPrice = productVariants![i].price!.amount!;
      }

      if (productVariants![i].price!.amount! > maxPrice) {
        maxPrice = productVariants![i].price!.amount!;
      }
      if (productVariants![i].price!.amount! < minPrice) {
        minPrice = productVariants![i].price!.amount!;
      }
    }

    return JsonHelper.chooseRightOrderOnCurrencySymbol(
      minPrice,
      currencyCode,
    );
  }

  get priceMax {
    double minPrice = 0;
    double maxPrice = 0;
    for (int i = 0; i < productVariants!.length; i++) {
      if (minPrice == 0 && maxPrice == 0) {
        minPrice = productVariants![i].price!.amount!;
        maxPrice = productVariants![i].price!.amount!;
      }

      if (productVariants![i].price!.amount! > maxPrice) {
        maxPrice = productVariants![i].price!.amount!;
      }
      if (productVariants![i].price!.amount! < minPrice) {
        minPrice = productVariants![i].price!.amount!;
      }
    }

    return JsonHelper.chooseRightOrderOnCurrencySymbol(
      maxPrice,
      currencyCode,
    );
  }

  get copyWith => null;

  static Product fromGraphJson(Map<String, dynamic> json) {
    return Product(
        collectionList: _getCollectionList(json),
        id: json['node']?['id'] ?? '',
        title: json['node']?['title'] ?? '',
        availableForSale: json['node']?['availableForSale'],
        createdAt: json['node']?['createdAt'],
        description: json['node']?['description'] ?? '',
        productVariants: _getProductVariants(json),
        descriptionHtml: json['node']?['descriptionHtml'] ?? '',
        handle: json['node']?['handle'] ?? '',
        onlineStoreUrl: json['node']?['onlineStoreUrl'] ?? '',
        productType: json['node']?['productType'] ?? '',
        publishedAt: json['node']?['publishedAt'],
        tags: _getTags(json),
        updatedAt: json['node']?['updatedAt'],
        images: _getImageList(json['node']?['images'] ?? const {}),
        cursor: json['cursor'],
        option: _getOptionList(json['node'] ?? const {}),
        vendor: json['node']?['vendor'],
        metafields: _getMetafieldList(json['node']?['metafields'] ?? const {}),
        sellingPlanGroups: _getSellingPlanGroupList(
            json['node']?["sellingPlanGroups"] ?? const {}));
  }

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    availableForSale = bool.parse(json['availableForSale'].toString());
    createdAt = json['createdAt'];
    productVariants = _getProductVariantsFromJson(json);
    productType = json['productType'];
    publishedAt = json['publishedAt'];
    tags = _getTags(json);
    updatedAt = json['updatedAt'];
    images = _getImageList(json['images']);
    option = _getOptionList(json);
    vendor = json['vendor'];
    metafields = _getMetafieldList(json);
    collectionList = _getCollectionList(json);
    cursor = json['cursor'];
    onlineStoreUrl = json['onlineStoreUrl'] ?? " ";
    description = json['description'];
    descriptionHtml = json['descriptionHtml'];
    handle = json['handle'];
    sellingPlanGroups =
        _getSellingPlanGroupList(json["sellingPlanGroups"] ?? {});
  }

  Map<String, dynamic> toJson() => {
        'collectionList': collectionList!.map((element) {
          return element.toJson();
        }).toList(),
        'id': '$id',
        'title': '$title',
        'availableForSale': '$availableForSale',
        'createdAt': '$createdAt',
        'description': '$description',
        'productVariants': productVariants!.map((element) {
          return element.toJson();
        }).toList(),
        'descriptionHtml': '$descriptionHtml',
        'handle': '$handle',
        'onlineStoreUrl': '$onlineStoreUrl',
        'productType': '$productType',
        'publishedAt': '$publishedAt',
        'tags': tags!.map((element) {
          return element;
        }).toList(),
        'updatedAt': '$updatedAt',
        'images': images!.map((element) {
          return element.toJson();
        }).toList(),
        'cursor': '$cursor',
        'option': option!.map((element) {
          return element.toJson();
        }).toList(),
        'vendor': '$vendor',
        'metafields': metafields!.map((element) {
          return element.toJson();
        }).toList(),
        'sellingPlanGroups': sellingPlanGroups!.map((e) {
          return e.toJson();
        }).toList(),
      };

  factory Product.toJson(Map<String, dynamic> json) {
    return Product(
      collectionList: _getCollectionList(json),
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      availableForSale: json['availableForSale'],
      createdAt: json['createdAt'],
      description: json['description'] ?? '',
      productVariants: _getProductVariants(json),
      descriptionHtml: json['descriptionHtml'] ?? '',
      handle: json['handle'] ?? '',
      onlineStoreUrl: json['onlineStoreUrl'] ?? '',
      productType: json['productType'] ?? '',
      publishedAt: json['publishedAt'],
      tags: _getTags(json),
      updatedAt: json['updatedAt'],
      images: _getImageList(json['images'] ?? const {}),
      cursor: json['cursor'],
      option: _getOptionList(json),
      vendor: json['vendor'],
      metafields: _getMetafieldList(json['metafields'] ?? const {}),
    );
  }

  static List<ProductVariant> _getProductVariants(Map<String, dynamic> json) {
    if (json['node']?['variants'] == null) return [];
    return ((json['node']?['variants']?['edges'] ?? []) as List)
        // if (json['variants'] == null) return [];
        // return ((json['variants']?['edges'] ?? []) as List)
        .map((v) => ProductVariant.fromGraphJson(v ?? const {}))
        .toList();
  }

  static List<ProductVariant> _getProductVariantsFromJson(
      Map<String, dynamic> json) {
    if (json['variants'] == null) return [];
    return ((json['variants']?['edges'] ?? []) as List)
        .map((v) => ProductVariant.fromGraphJson(v ?? const {}))
        .toList();
  }

  static List<Option> _getOptionList(Map<String, dynamic> json) {
    List<Option> optionList = [];
    if (json['options'] == null) return optionList;
    json['options']?.forEach((v) {
      if (v != null) optionList.add(Option.fromJson(v ?? const {}));
    });
    return optionList;
  }

  static List<SellingPlanGroups> _getSellingPlanGroupList(
      Map<String, dynamic> json) {
    List<SellingPlanGroups> sellingList = [];
    if (json['nodes'] == null) return sellingList;
    json['nodes']?.forEach((v) {
      if (v != null) sellingList.add(SellingPlanGroups.fromJson(v ?? const {}));
    });
    return sellingList;
  }

  static List<String> _getTags(Map<String, dynamic> json) {
    List<String> tags = [];
    if (json['node']?['tags'] == null) return tags;
    json['node']?['tags']?.forEach((e) => tags.add(e ?? const {}));
    return tags;
  }

  static List<AssociatedCollections> _getCollectionList(
      Map<String, dynamic> json) {
    if (json['node']?['collections'] == null) return [];

    return ((json['node']?['collections']?['edges'] ?? []) as List)
        .map((v) => AssociatedCollections.fromGraphJson(v ?? const {}))
        .toList();
  }

  static _getImageList(Map<String, dynamic> json) {
    List<ShopifyImage> imageList = [];

    if (json['edges'] != null) {
      json['edges'].forEach((image) =>
          imageList.add(ShopifyImage.fromJson(image['node'] ?? const {})));
    }
    return imageList;
  }

  static _getMetafieldList(Map<String, dynamic> json) {
    List<Metafield> metafieldList = [];
    if (json['metafields'] == null) return metafieldList;
    json['edges']?.forEach((metafield) =>
        metafieldList.add(Metafield.fromGraphJson(metafield ?? const {})));
    return metafieldList;
  }
}

class SellingPlanGroups {
  String? appName;
  String? name;
  List<Option>? options;
  List<SellingPlan>? sellingPlans;

  SellingPlanGroups({this.appName, this.name, this.options, this.sellingPlans});

  SellingPlanGroups.fromJson(Map<String, dynamic> json) {
    appName = json['appName'] == null ? " " : json['appName'];
    name = json['name'] == null ? " " : json['name'];
    if (json['options'] != null) {
      options = Product._getOptionList(json);
      //  <Option>[];
      // json['options'].forEach((v) {
      //   options!.add( Option.fromJson(v));
      // });
    }
    sellingPlans = _getSellingPlanList(json['sellingPlans']);
  }
  static List<SellingPlan> _getSellingPlanList(Map<String, dynamic> json) {
    List<SellingPlan> sellingPlanList = [];
    if (json['nodes'] == null) return sellingPlanList;
    json['nodes']?.forEach((v) {
      if (v != null) sellingPlanList.add(SellingPlan.fromJson(v ?? const {}));
    });
    return sellingPlanList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['name'] = this.name;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.sellingPlans != null) {
      data['sellingPlans'] = this.sellingPlans!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class SellingPlanListNodes {
  CheckoutCharge? checkoutCharge;
  String? description;
  String? id;
  String? name;
  List<Option>? options;
  List<PriceAdjustments>? priceAdjustments;
  bool? recurringDeliveries;

  SellingPlanListNodes(
      {this.checkoutCharge,
      this.description,
      this.id,
      this.name,
      this.options,
      this.priceAdjustments,
      this.recurringDeliveries});

  SellingPlanListNodes.fromJson(Map<String, dynamic> json) {
    checkoutCharge = json['checkoutCharge'] != null
        ? CheckoutCharge.fromJson(json['checkoutCharge'])
        : null;
    description = json['description'] ?? "";
    id = json['id'];
    name = json['name'];
    if (json['options'] != null) {
      options = Product._getOptionList(json);
      // <Option>[];
      // json['options'].forEach((v) {
      //   options!.add( Option.fromJson(v));
      // });
    }
    if (json['priceAdjustments'] != null) {
      priceAdjustments = <PriceAdjustments>[];
      json['priceAdjustments'].forEach((v) {
        priceAdjustments!.add(PriceAdjustments.fromJson(v));
      });
    }
    recurringDeliveries = json['recurringDeliveries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checkoutCharge != null) {
      data['nodes']['checkoutCharge'] = this.checkoutCharge!.toJson();
    }
    data['nodes']['description'] = this.description;
    data['nodes']['id'] = this.id;
    data['nodes']['name'] = this.name;
    if (this.options != null) {
      data['nodes']['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.priceAdjustments != null) {
      data['nodes']['priceAdjustments'] =
          this.priceAdjustments!.map((v) => v.toJson()).toList();
    }
    data['nodes']['recurringDeliveries'] = this.recurringDeliveries;
    return data;
  }
}

class CheckoutCharge {
  String? type;
  Value? value;

  CheckoutCharge({this.type, this.value});

  CheckoutCharge.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? sTypename;

  Value({this.sTypename});

  Value.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    return data;
  }
}

class PriceAdjustments {
  AdjustmentValue? adjustmentValue;
  String? orderCount;

  PriceAdjustments({this.adjustmentValue, this.orderCount});

  PriceAdjustments.fromJson(Map<String, dynamic> json) {
    adjustmentValue = json['adjustmentValue'] != null
        ? AdjustmentValue.fromJson(json['adjustmentValue'])
        : null;
    orderCount = json['orderCount'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adjustmentValue != null) {
      data['adjustmentValue'] = this.adjustmentValue!.toJson();
    }
    data['orderCount'] = this.orderCount;
    return data;
  }
}

class AdjustmentValue {
  String? sTypename;
  int? adjustmentPercentage;

  AdjustmentValue({this.sTypename, this.adjustmentPercentage});

  AdjustmentValue.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    adjustmentPercentage = json['adjustmentPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['adjustmentPercentage'] = this.adjustmentPercentage;
    return data;
  }
}

class SellingPlan {
  SellingPlanListNodes? sellingPlanListNodes;
  SellingPlan({this.sellingPlanListNodes});

  SellingPlan.fromJson(Map<String, dynamic> json) {
    sellingPlanListNodes =
        json != null ? SellingPlanListNodes.fromJson(json) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sellingPlanListNodes != null) {
      data['nodes'] = this.sellingPlanListNodes!.toJson();
    }
    return data;
  }
}
