



import '../../../json_helper.dart';
import '../../checkout/line_item/line_item.dart';
import '../../product/price_v_2/price_v_2.dart';


class LastIncompleteCheckout {
  String? completedAt;
  String? createdAt;
  String? email;
  String? id;
  String? currencyCode;
  String? webUrl;
  PriceV2? totalPriceV2;
  PriceV2? lineItemsSubtotalPrice;
  // @JsonKey(fromJson: JsonHelper.lineItems)
  List<LineItem>? lineItems;

  LastIncompleteCheckout(
      {this.completedAt,
      this.createdAt,
      this.email,
      this.id,
      this.currencyCode,
      this.webUrl,
      this.totalPriceV2,
      this.lineItemsSubtotalPrice,
      this.lineItems});


  LastIncompleteCheckout.fromJson(Map<String, dynamic> json) {
    completedAt = json['completedAt'];
    createdAt = json['createdAt'];
    email = json['email'];
    id = json['id'];
    currencyCode = json['currencyCode'];
    webUrl = json['webUrl'];
       lineItems = JsonHelper.lineItems(json);
  }

 
  Map<String, dynamic> toJson() => {
        'completedAt': '$completedAt',
        'createdAt': '$createdAt',
        'email': '$email',
        'id': '$id',
        'currencyCode': '$currencyCode',
        'webUrl': '$webUrl',
        'totalPriceV2': '$totalPriceV2',
        'lineItemsSubtotalPrice': '$lineItemsSubtotalPrice',
        'lineItems': '${JsonHelper.lineItems}'
      };
}
