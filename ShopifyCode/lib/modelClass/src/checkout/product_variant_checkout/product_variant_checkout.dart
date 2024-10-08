

import '../../product/price_v_2/price_v_2.dart';
import '../../product/product.dart';
import '../../product/shopify_image/shopify_image.dart';


class ProductVariantCheckout {
 
  PriceV2? priceV2;
  String? title;
  bool? availableForSale;
  String? sku;
  bool? requiresShipping;
  String? id;
  ShopifyImage? image;
  PriceV2? compareAtPrice;
  double? weight;
  String? weightUnit;
  int? quantityAvailable;
  

  ProductVariantCheckout({
    this.priceV2,
    this.title,
    this.availableForSale,
    this.sku,
    this.requiresShipping,
    this.id,
    this.image,
    this.compareAtPrice,
    this.weight,
    this.weightUnit,
    this.quantityAvailable,
    
  });

  ProductVariantCheckout.fromJson(Map<String, dynamic> json) {
    priceV2 = PriceV2.fromJson(json['priceV2']);
    title = json['title'];
    availableForSale = json['availableForSale'];
    sku = json['sku'];
    requiresShipping = json['prirequiresShippingceV2'];
    id = json['id'];
    image = ShopifyImage.fromJson(json['image']);
    compareAtPrice = json['compareAtPrice'];
    weight = double.parse( json['weight'].toString());
    weightUnit = json['weightUnit'];
    quantityAvailable = json['quantityAvailable'];
    
  }

  Map<String, dynamic> toJson() => {
        'priceV2': '$priceV2',
        'title': '$title',
        'availableForSale': '$availableForSale',
        'sku': '$sku',
        'requiresShipping': '$requiresShipping',
        'id': '$id',
        'image': '$image',
        'compareAtPrice': '$compareAtPrice',
        'weight': '$weight',
        'weightUnit': '$weightUnit',
        'quantityAvailable': '$quantityAvailable',
   
      };


}
