// ignore_for_file: invalid_annotation_target


import 'package:intl/intl.dart';

import '../../../json_helper.dart';


class PriceV2 {
  NumberFormat? priceFormat;
  // @JsonKey(fromJson: JsonHelper.amountFromJson)
  double? amount;
   String? currencyCode;

  

  PriceV2({this.amount, String? currencyCode, this.priceFormat});

 
  PriceV2.fromJson(Map<String, dynamic> json) {
    amount = JsonHelper.amountFromJson(json);
    currencyCode = json['currencyCode'] ?? "";
    priceFormat = json.containsKey("priceFormat") ? json['priceFormat'] : NumberFormat("0");
  }

  Map<String, dynamic> toJson() => {
        'amount': '$amount',
        'currencyCode': '$currencyCode',
        'priceFormat': null
      };



  String get formattedPrice => JsonHelper.chooseRightOrderOnCurrencySymbol(
        amount,
        currencyCode!,
        priceFormat: priceFormat,
      );
}
