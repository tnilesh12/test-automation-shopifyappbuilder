

import '../../checkout/product_variant_checkout/product_variant_checkout.dart';
import '../../product/price_v_2/price_v_2.dart';
import '../discount_allocations/discount_allocations.dart';


class LineItemOrder  {
 
int? currentQuantity;
     PriceV2? discountedTotalPrice;
     PriceV2? originalTotalPrice;
     int? quantity;
     String? title;
     List<DiscountAllocations>? discountAllocations;
    ProductVariantCheckout? variant;
     List<CustomAttributes>? customAttributes;
   LineItemOrder({
    this.currentQuantity,
   this.discountedTotalPrice,
    this.originalTotalPrice,
   this.quantity,
    this.title,
    this.discountAllocations,
   this.variant,
     this.customAttributes
  });

   LineItemOrder.fromJson(Map<String, dynamic> json)
   {
    currentQuantity=json['currencyQuantity'];
    discountedTotalPrice=json['discountedTotalPrice'];
    originalTotalPrice=json['originalTotalPrice'];
    quantity=json['quantity'];
    title=json['title'];
    discountAllocations=_getDiscountAllocationsList(json);
    variant=json['variant'];
     customAttributes = _getCustomAttributesList(json);
   }
   Map<String,dynamic> toJson()=>
   {
'currentQuantity':'$currentQuantity',
'discountedTotalPrice':'$discountedTotalPrice',
'originalTotalPrice':'$originalTotalPrice',
'quantity':'$quantity',
'title':'$title',
'discountAllocations':'$_getDiscountAllocationsList',
'variant':'$variant',
'customAttributes':'$customAttributes'
   };
 

  static LineItemOrder fromGraphJson(Map<String, dynamic> json) {
    return LineItemOrder(
      currentQuantity: (json['node'] ?? const {})['currentQuantity'],
      discountAllocations: _getDiscountAllocationsList(json),
      discountedTotalPrice:
          PriceV2.fromJson((json['node'] ?? const {})['discountedTotalPrice']),
      originalTotalPrice:
          PriceV2.fromJson((json['node'] ?? const {})['originalTotalPrice']),
      quantity: (json['node'] ?? const {})['quantity'],
      title: (json['node'] ?? const {})['title'],
      variant: json['node']['variant'] == null
          ? null
          : ProductVariantCheckout.fromJson(json['node']['variant']),
     customAttributes: _getCustomAttributesList(json)
    );
  }

  static _getDiscountAllocationsList(Map<String, dynamic> json) {
    List<DiscountAllocations> discountList = [];
    (json['node'] ?? const {})['discountAllocations']?.forEach(
        (discount) => discountList.add(DiscountAllocations.fromJson(discount)));
    return discountList;
  }
  static _getCustomAttributesList(Map<String, dynamic> json) {
    List<CustomAttributes> customList = [];
    (json['node'] ?? const {})['customAttributes']?.forEach(
        (custom) => customList.add(CustomAttributes.fromJson(custom)));
    return customList;
  }
}


  class Properties {
   String? name;
   String? value;

  Properties({required this.name, required this.value});

  factory Properties.fromJson(Map<String, dynamic> map) {
    return Properties(
      name: map['name']??" ",
      value: map['value']??" ",
    );
  }
}
class CustomAttributes {
   String key;
   String value;

  CustomAttributes({required this.key, required this.value});

  factory CustomAttributes.fromJson(Map<String, dynamic> map) {
    return CustomAttributes(
      key: map['key']??" ",
      value: map['value']??" ",
    );
  }
}