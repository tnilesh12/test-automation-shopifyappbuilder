import '../product/products/products.dart';
import '../product/shopify_image/shopify_image.dart';
import '../../../theme/app_assets.dart';

class Collection {
  String? title;
  String? id;
  Products? products;
  String? cursor;
  String? description;
  String? descriptionHtml;
  String? handle;
  String? updatedAt;
  ShopifyImage? image;

  Collection({
    this.title,
    this.id,
    this.products,
    this.cursor,
    this.description,
    this.descriptionHtml,
    this.handle,
    this.updatedAt,
    this.image,
  });

  String? get imageUrl =>
      image == null ? AppAssets.no_image : image!.originalSrc;

  static Collection fromGraphJson(Map<String, dynamic> json) {
    Map<String, dynamic> nodeJson = json['node'] ?? const {};
    if (json.containsKey('nodes')) {
      nodeJson = json['nodes'][0] ?? const {};
    }

    var _products = Products.fromGraphJson(nodeJson['products'] ?? const {});

    return Collection(
      title: nodeJson['title'],
      description: nodeJson['description'],
      descriptionHtml: nodeJson['descriptionHtml'],
      handle: nodeJson['handle'],
      id: nodeJson['id'],
      updatedAt: nodeJson['updatedAt'],
      image: nodeJson['image'] != null
          ? ShopifyImage.fromJson(
              (json['node'] ?? const {})['image'] ?? const {})
          : null,
      products: _products,
      cursor: json['cursor'],
    );
  }

  Collection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    products = json.containsKey('products')
        ? Products.fromJson(json['products'])
        : null;
    cursor = json.containsKey('cursor') ? json['cursor'] : null;
    description = json['description'];
    descriptionHtml = json['descriptionHtml'];
    handle = json['handle'];
    updatedAt = json['title'];
    image = json['image'] != null ? ShopifyImage.fromJson(json['image']) : null;
  }
  Map<String, dynamic> toJson() => {
        'title': '$title',
        'id': '$id',
        'products': '$products',
        'cursor': '$cursor',
        'description': '$description',
        'descriptionHtml': '$descriptionHtml',
        'handle': '$handle',
        'updatedAt': '$updatedAt',
        'image': '$image'
      };
}
