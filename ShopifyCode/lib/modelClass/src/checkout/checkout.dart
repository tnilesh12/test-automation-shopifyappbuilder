// ignore_for_file: invalid_annotation_target



import '../../json_helper.dart';
import '../order/discount_allocations/discount_allocations.dart';
import '../order/order.dart';
import '../product/price_v_2/price_v_2.dart';
import 'applied_gift_cards/applied_gift_cards.dart';
import 'available_shipping_rates/available_shipping_rates.dart';
import 'line_item/line_item.dart';
import 'mailing_address/mailing_address.dart';
import 'shipping_rates/shipping_rates.dart';


class Checkout {
  String? id;
  bool? ready;
  AvailableShippingRates? availableShippingRates;
  String? createdAt;
  String? currencyCode;
  PriceV2? totalTaxV2;
  PriceV2? totalPriceV2;
  bool? taxesIncluded;
  bool? taxExempt;
  PriceV2? subtotalPriceV2;
  bool? requiresShipping;
  List<AppliedGiftCards>? appliedGiftCards;
  List<LineItem>? lineItems;
  Order? order;
  String? orderStatusUrl;
  String? shopifyPaymentsAccountId;
  MailingAddress? shippingAddress;
  ShippingRates? shippingLine;
  String? email;
  String? completedAt;
  String? note;
  String? webUrl;
  String? updatedAt;







  Checkout({
    this.id,
    this.ready,
    this.availableShippingRates,
    this.createdAt,
    this.currencyCode,
    this.totalTaxV2,
    this.totalPriceV2,
    this.taxesIncluded,
    this.taxExempt,
    this.subtotalPriceV2,
    this.requiresShipping,
    this.appliedGiftCards,
    this.lineItems,
    this.order,
    this.orderStatusUrl,
    this.shopifyPaymentsAccountId,
    this.shippingAddress,
    this.shippingLine,
    this.email,
    this.completedAt,
    this.note,
    this.webUrl,
    this.updatedAt,
  });

  Checkout.fromJson(Map<String, dynamic> json) {
    print(json["discountApplications"]);
    id = json['id'];
    ready = json['ready'];
    availableShippingRates = json['availableShippingRates'];
    createdAt = json['createdAt'];
    currencyCode = json['currencyCode'];
    totalTaxV2 = PriceV2.fromJson(json['totalTaxV2']);
    totalPriceV2 = PriceV2.fromJson(json['totalPriceV2']);
    taxesIncluded = json['taxesIncluded'];
    taxExempt = json['taxExempt'];
    subtotalPriceV2 = PriceV2.fromJson(json['subtotalPriceV2']);
    requiresShipping = json['requiresShipping'];
    appliedGiftCards = _getappliedGiftCardsList(json);
    lineItems = JsonHelper.lineItems(json['lineItems']);
    order =  Order.fromJson( json['order']??{});
    orderStatusUrl = json['orderStatusUrl'];
    shopifyPaymentsAccountId = json['shopifyPaymentsAccountId'];
    shippingAddress = MailingAddress.fromJson(json['shippingAddress']== null?{}:json['shippingAddress']);
    shippingLine = json['shippingLine'];
    email = json['email'];
    completedAt = json['completedAt'];
    note = json['note'];
    webUrl = json['webUrl'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() => {
        'id': '$id',
        'ready': '$ready',
        'availableShippingRates': '$availableShippingRates',
        'createdAt': '$createdAt',
        'currencyCode': '$currencyCode',
        'totalTaxV2': '$totalTaxV2',
        'totalPriceV2': '$totalPriceV2',
        'taxesIncluded': '$taxesIncluded',
        'taxExempt': '$taxExempt',
        'subtotalPriceV2': '$subtotalPriceV2',
        'requiresShipping': '$requiresShipping',
        'appliedGiftCards': '$_getappliedGiftCardsList',
        'lineItems': lineItems!.map((e) => e.toJson()).toList(),
        'order': '$order',
        'orderStatusUrl': '$orderStatusUrl',
        'shopifyPaymentsAccountId': '$shopifyPaymentsAccountId',
        'shippingAddress': '$shippingAddress',
        'shippingLine': '$shippingLine',
        'email': '$email',
        'completedAt': '$completedAt',
        'note': '$note',
        'webUrl': '$webUrl',
        'updatedAt': '$updatedAt',
      };

  static _getappliedGiftCardsList(Map<String, dynamic> json) {
    List<AppliedGiftCards> appliedGiftCardsList = [];
    json['appliedGiftCards']?.forEach((tag) => appliedGiftCardsList.add(tag));
    return appliedGiftCardsList;
  }

}
