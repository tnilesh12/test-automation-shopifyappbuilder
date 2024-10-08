// class FavoriteModel {
//   bool? status;
//   String? message;
//   Result? result;

//   FavoriteModel({this.status, this.message, this.result});

//   FavoriteModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     result =
//         json['result'] != null ? new Result.fromJson(json['result']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();
//     }
//     return data;
//   }
// }

// class Result {
//   Body? body;
//   Headers? headers;

//   Result({this.body, this.headers});

//   Result.fromJson(Map<String, dynamic> json) {
//     body = json['body'] != null ? new Body.fromJson(json['body']) : null;
//     headers =
//         json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.body != null) {
//       data['body'] = this.body!.toJson();
//     }
//     if (this.headers != null) {
//       data['headers'] = this.headers!.toJson();
//     }
//     return data;
//   }
// }

// class Body {
//   Data? data;

//   Body({this.data});

//   Body.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Nodes>? nodes;

//   Data({this.nodes});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['nodes'] != null) {
//       nodes = <Nodes>[];
//       json['nodes'].forEach((v) {
//         nodes!.add(new Nodes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.nodes != null) {
//       data['nodes'] = this.nodes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Nodes {
//   List<Options>? options;
//   String? id;
//   String? handle;
//   Collections? collections;
//   String? title;
//   bool? availableForSale;
//   String? createdAt;
//   String? description;
//   String? descriptionHtml;
//   Collections? images;
//   Collections? variants;
//   Null? onlineStoreUrl;
//   String? productType;
//   String? publishedAt;
//   List<Null>? tags;
//   String? updatedAt;
//   String? vendor;

//   Nodes(
//       {this.options,
//       this.id,
//       this.handle,
//       this.collections,
//       this.title,
//       this.availableForSale,
//       this.createdAt,
//       this.description,
//       this.descriptionHtml,
//       this.images,
//       this.variants,
//       this.onlineStoreUrl,
//       this.productType,
//       this.publishedAt,
//       this.tags,
//       this.updatedAt,
//       this.vendor});

//   Nodes.fromJson(Map<String, dynamic> json) {
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options!.add(new Options.fromJson(v));
//       });
//     }
//     id = json['id'];
//     handle = json['handle'];
//     collections = json['collections'] != null
//         ? new Collections.fromJson(json['collections'])
//         : null;
//     title = json['title'];
//     availableForSale = json['availableForSale'];
//     createdAt = json['createdAt'];
//     description = json['description'];
//     descriptionHtml = json['descriptionHtml'];
//     images = json['images'] != null
//         ? new Collections.fromJson(json['images'])
//         : null;
//     variants = json['variants'] != null
//         ? new Collections.fromJson(json['variants'])
//         : null;
//     onlineStoreUrl = json['onlineStoreUrl'];
//     productType = json['productType'];
//     publishedAt = json['publishedAt'];
//     if (json['tags'] != null) {
//       tags = <Null>[];
//       json['tags'].forEach((v) {
//         tags!.add(new Null.fromJson(v));
//       });
//     }
//     updatedAt = json['updatedAt'];
//     vendor = json['vendor'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['handle'] = this.handle;
//     if (this.collections != null) {
//       data['collections'] = this.collections!.toJson();
//     }
//     data['title'] = this.title;
//     data['availableForSale'] = this.availableForSale;
//     data['createdAt'] = this.createdAt;
//     data['description'] = this.description;
//     data['descriptionHtml'] = this.descriptionHtml;
//     if (this.images != null) {
//       data['images'] = this.images!.toJson();
//     }
//     if (this.variants != null) {
//       data['variants'] = this.variants!.toJson();
//     }
//     data['onlineStoreUrl'] = this.onlineStoreUrl;
//     data['productType'] = this.productType;
//     data['publishedAt'] = this.publishedAt;
//     if (this.tags != null) {
//       data['tags'] = this.tags!.map((v) => v.toJson()).toList();
//     }
//     data['updatedAt'] = this.updatedAt;
//     data['vendor'] = this.vendor;
//     return data;
//   }
// }

// class Options {
//   String? id;
//   String? name;
//   List<String>? values;

//   Options({this.id, this.name, this.values});

//   Options.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     values = json['values'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['values'] = this.values;
//     return data;
//   }
// }

// class Collections {
//   List<Edges>? edges;

//   Collections({this.edges});

//   Collections.fromJson(Map<String, dynamic> json) {
//     if (json['edges'] != null) {
//       edges = <Edges>[];
//       json['edges'].forEach((v) {
//         edges!.add(new Edges.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.edges != null) {
//       data['edges'] = this.edges!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Edges {
//   Node? node;

//   Edges({this.node});

//   Edges.fromJson(Map<String, dynamic> json) {
//     node = json['node'] != null ? new Node.fromJson(json['node']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.node != null) {
//       data['node'] = this.node!.toJson();
//     }
//     return data;
//   }
// }

// class Node {
//   String? description;
//   String? descriptionHtml;
//   String? handle;
//   String? id;
//   String? updatedAt;
//   String? title;

//   Node(
//       {this.description,
//       this.descriptionHtml,
//       this.handle,
//       this.id,
//       this.updatedAt,
//       this.title});

//   Node.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//     descriptionHtml = json['descriptionHtml'];
//     handle = json['handle'];
//     id = json['id'];
//     updatedAt = json['updatedAt'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['description'] = this.description;
//     data['descriptionHtml'] = this.descriptionHtml;
//     data['handle'] = this.handle;
//     data['id'] = this.id;
//     data['updatedAt'] = this.updatedAt;
//     data['title'] = this.title;
//     return data;
//   }
// }

// class Node {
//   Null? altText;
//   String? id;
//   String? originalSrc;

//   Node({this.altText, this.id, this.originalSrc});

//   Node.fromJson(Map<String, dynamic> json) {
//     altText = json['altText'];
//     id = json['id'];
//     originalSrc = json['originalSrc'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['altText'] = this.altText;
//     data['id'] = this.id;
//     data['originalSrc'] = this.originalSrc;
//     return data;
//   }
// }

// class Node {
//   PriceV2? priceV2;
//   String? title;
//   Node? image;
//   Null? compareAtPriceV2;
//   String? weightUnit;
//   int? weight;
//   bool? availableForSale;
//   String? sku;
//   bool? requiresShipping;
//   List<SelectedOptions>? selectedOptions;
//   String? id;
//   int? quantityAvailable;

//   Node(
//       {this.priceV2,
//       this.title,
//       this.image,
//       this.compareAtPriceV2,
//       this.weightUnit,
//       this.weight,
//       this.availableForSale,
//       this.sku,
//       this.requiresShipping,
//       this.selectedOptions,
//       this.id,
//       this.quantityAvailable});

//   Node.fromJson(Map<String, dynamic> json) {
//     priceV2 =
//         json['priceV2'] != null ? new PriceV2.fromJson(json['priceV2']) : null;
//     title = json['title'];
//     image = json['image'] != null ? new Node.fromJson(json['image']) : null;
//     compareAtPriceV2 = json['compareAtPriceV2'];
//     weightUnit = json['weightUnit'];
//     weight = json['weight'];
//     availableForSale = json['availableForSale'];
//     sku = json['sku'];
//     requiresShipping = json['requiresShipping'];
//     if (json['selectedOptions'] != null) {
//       selectedOptions = <SelectedOptions>[];
//       json['selectedOptions'].forEach((v) {
//         selectedOptions!.add(new SelectedOptions.fromJson(v));
//       });
//     }
//     id = json['id'];
//     quantityAvailable = json['quantityAvailable'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.priceV2 != null) {
//       data['priceV2'] = this.priceV2!.toJson();
//     }
//     data['title'] = this.title;
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     data['compareAtPriceV2'] = this.compareAtPriceV2;
//     data['weightUnit'] = this.weightUnit;
//     data['weight'] = this.weight;
//     data['availableForSale'] = this.availableForSale;
//     data['sku'] = this.sku;
//     data['requiresShipping'] = this.requiresShipping;
//     if (this.selectedOptions != null) {
//       data['selectedOptions'] =
//           this.selectedOptions!.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['quantityAvailable'] = this.quantityAvailable;
//     return data;
//   }
// }

// class PriceV2 {
//   String? amount;
//   String? currencyCode;

//   PriceV2({this.amount, this.currencyCode});

//   PriceV2.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'];
//     currencyCode = json['currencyCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['currencyCode'] = this.currencyCode;
//     return data;
//   }
// }

// class SelectedOptions {
//   String? name;
//   String? value;

//   SelectedOptions({this.name, this.value});

//   SelectedOptions.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     value = json['value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['value'] = this.value;
//     return data;
//   }
// }

// class Headers {
//   List<String>? accessControlAllowOrigin;
//   List<String>? altSvc;
//   List<String>? cfCacheStatus;
//   List<String>? cfRay;
//   List<String>? connection;
//   List<String>? contentEncoding;
//   List<String>? contentLanguage;
//   List<String>? contentSecurityPolicy;
//   List<String>? contentType;
//   List<String>? date;
//   List<String>? nel;
//   List<String>? poweredBy;
//   List<String>? reportTo;
//   List<String>? server;
//   List<String>? serverTiming;
//   List<String>? transferEncoding;
//   List<String>? vary;
//   List<String>? xContentTypeOptions;
//   List<String>? xDc;
//   List<String>? xDownloadOptions;
//   List<String>? xEnvoyUpstreamServiceTime;
//   List<String>? xFrameOptions;
//   List<String>? xPermittedCrossDomainPolicies;
//   List<String>? xRequestId;
//   List<String>? xShardid;
//   List<String>? xShopid;
//   List<String>? xShopifyApiDeprecatedReason;
//   List<String>? xShopifyApiVersion;
//   List<String>? xShopifyStage;
//   List<String>? xSortingHatPodid;
//   List<String>? xSortingHatShopid;
//   List<String>? xStorefrontRendererRendered;
//   List<String>? xXssProtection;

//   Headers(
//       {this.accessControlAllowOrigin,
//       this.altSvc,
//       this.cfCacheStatus,
//       this.cfRay,
//       this.connection,
//       this.contentEncoding,
//       this.contentLanguage,
//       this.contentSecurityPolicy,
//       this.contentType,
//       this.date,
//       this.nel,
//       this.poweredBy,
//       this.reportTo,
//       this.server,
//       this.serverTiming,
//       this.transferEncoding,
//       this.vary,
//       this.xContentTypeOptions,
//       this.xDc,
//       this.xDownloadOptions,
//       this.xEnvoyUpstreamServiceTime,
//       this.xFrameOptions,
//       this.xPermittedCrossDomainPolicies,
//       this.xRequestId,
//       this.xShardid,
//       this.xShopid,
//       this.xShopifyApiDeprecatedReason,
//       this.xShopifyApiVersion,
//       this.xShopifyStage,
//       this.xSortingHatPodid,
//       this.xSortingHatShopid,
//       this.xStorefrontRendererRendered,
//       this.xXssProtection});

//   Headers.fromJson(Map<String, dynamic> json) {
//     accessControlAllowOrigin =
//         json['Access-Control-Allow-Origin'].cast<String>();
//     altSvc = json['Alt-Svc'].cast<String>();
//     cfCacheStatus = json['Cf-Cache-Status'].cast<String>();
//     cfRay = json['Cf-Ray'].cast<String>();
//     connection = json['Connection'].cast<String>();
//     contentEncoding = json['Content-Encoding'].cast<String>();
//     contentLanguage = json['Content-Language'].cast<String>();
//     contentSecurityPolicy = json['Content-Security-Policy'].cast<String>();
//     contentType = json['Content-Type'].cast<String>();
//     date = json['Date'].cast<String>();
//     nel = json['Nel'].cast<String>();
//     poweredBy = json['Powered-By'].cast<String>();
//     reportTo = json['Report-To'].cast<String>();
//     server = json['Server'].cast<String>();
//     serverTiming = json['Server-Timing'].cast<String>();
//     transferEncoding = json['Transfer-Encoding'].cast<String>();
//     vary = json['Vary'].cast<String>();
//     xContentTypeOptions = json['X-Content-Type-Options'].cast<String>();
//     xDc = json['X-Dc'].cast<String>();
//     xDownloadOptions = json['X-Download-Options'].cast<String>();
//     xEnvoyUpstreamServiceTime =
//         json['X-Envoy-Upstream-Service-Time'].cast<String>();
//     xFrameOptions = json['X-Frame-Options'].cast<String>();
//     xPermittedCrossDomainPolicies =
//         json['X-Permitted-Cross-Domain-Policies'].cast<String>();
//     xRequestId = json['X-Request-Id'].cast<String>();
//     xShardid = json['X-Shardid'].cast<String>();
//     xShopid = json['X-Shopid'].cast<String>();
//     xShopifyApiDeprecatedReason =
//         json['X-Shopify-Api-Deprecated-Reason'].cast<String>();
//     xShopifyApiVersion = json['X-Shopify-Api-Version'].cast<String>();
//     xShopifyStage = json['X-Shopify-Stage'].cast<String>();
//     xSortingHatPodid = json['X-Sorting-Hat-Podid'].cast<String>();
//     xSortingHatShopid = json['X-Sorting-Hat-Shopid'].cast<String>();
//     xStorefrontRendererRendered =
//         json['X-Storefront-Renderer-Rendered'].cast<String>();
//     xXssProtection = json['X-Xss-Protection'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Access-Control-Allow-Origin'] = this.accessControlAllowOrigin;
//     data['Alt-Svc'] = this.altSvc;
//     data['Cf-Cache-Status'] = this.cfCacheStatus;
//     data['Cf-Ray'] = this.cfRay;
//     data['Connection'] = this.connection;
//     data['Content-Encoding'] = this.contentEncoding;
//     data['Content-Language'] = this.contentLanguage;
//     data['Content-Security-Policy'] = this.contentSecurityPolicy;
//     data['Content-Type'] = this.contentType;
//     data['Date'] = this.date;
//     data['Nel'] = this.nel;
//     data['Powered-By'] = this.poweredBy;
//     data['Report-To'] = this.reportTo;
//     data['Server'] = this.server;
//     data['Server-Timing'] = this.serverTiming;
//     data['Transfer-Encoding'] = this.transferEncoding;
//     data['Vary'] = this.vary;
//     data['X-Content-Type-Options'] = this.xContentTypeOptions;
//     data['X-Dc'] = this.xDc;
//     data['X-Download-Options'] = this.xDownloadOptions;
//     data['X-Envoy-Upstream-Service-Time'] = this.xEnvoyUpstreamServiceTime;
//     data['X-Frame-Options'] = this.xFrameOptions;
//     data['X-Permitted-Cross-Domain-Policies'] =
//         this.xPermittedCrossDomainPolicies;
//     data['X-Request-Id'] = this.xRequestId;
//     data['X-Shardid'] = this.xShardid;
//     data['X-Shopid'] = this.xShopid;
//     data['X-Shopify-Api-Deprecated-Reason'] = this.xShopifyApiDeprecatedReason;
//     data['X-Shopify-Api-Version'] = this.xShopifyApiVersion;
//     data['X-Shopify-Stage'] = this.xShopifyStage;
//     data['X-Sorting-Hat-Podid'] = this.xSortingHatPodid;
//     data['X-Sorting-Hat-Shopid'] = this.xSortingHatShopid;
//     data['X-Storefront-Renderer-Rendered'] = this.xStorefrontRendererRendered;
//     data['X-Xss-Protection'] = this.xXssProtection;
//     return data;
//   }
// }

