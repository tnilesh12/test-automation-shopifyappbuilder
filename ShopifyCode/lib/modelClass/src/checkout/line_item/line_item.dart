

import '../../order/discount_allocations/discount_allocations.dart';
import '../attribute/attribute.dart';
import '../product_variant_checkout/product_variant_checkout.dart';

class LineItem {
  String? title;
  int? quantity;
  List<DiscountAllocations>? discountAllocations;
  List<Attribute>? customAttributes;
  String? variantId;
  String? id;
  ProductVariantCheckout? variant;

  LineItem({
    this.title,
    this.quantity,
    this.discountAllocations,
    this.customAttributes,
    this.variantId,
    this.id,
    this.variant,
  });

  static LineItem fromGraphJson(Map<String, dynamic> json) {
    Map<String, dynamic> nodeJson = json['node'] ?? {};

    return LineItem(
      id: nodeJson['id']??"",
      quantity: nodeJson['quantity']??"",
      variant: nodeJson['variant'] != null
          ? ProductVariantCheckout.fromJson(nodeJson['variant'])
          : null,
      title: nodeJson['title'],
      discountAllocations: nodeJson['discountAllocations'] == null
          ? []
          : (nodeJson['discountAllocations'] as List)
              .map((e) => DiscountAllocations.fromJson(e))
              .toList(),
      variantId: nodeJson['variant'] != null
          ? ProductVariantCheckout.fromJson(nodeJson['variant']).id
          : null,
    );
  }

  LineItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    quantity = json['quantity'];
    discountAllocations = _getDiscountAllocationsList(json);
    customAttributes = _getAttributeList(json);
    variantId = json['variantId'];
    id = json['id'];
    variant = json['variant'];
  }

  Map<String, dynamic> toJson() => {
        'title': '$title',
        'quantity': '$quantity',
        'discountAllocations': '$_getDiscountAllocationsList',
        'customAttributes': '$_getAttributeList',
        'variantId': '$variantId',
        'id': '$id',
        'variant': '$variant'
      };

  static _getDiscountAllocationsList(Map<String, dynamic> json) {
    List<DiscountAllocations> discountAllocationsList = [];
    json['discountAllocations']
        ?.forEach((tag) => discountAllocationsList.add(tag));
    return discountAllocationsList;
  }

  static _getAttributeList(Map<String, dynamic> json) {
    List<Attribute> customAttributesList = [];
    json['customAttributes']?.forEach((tag) => customAttributesList.add(tag));
    return customAttributesList;
  }
}
