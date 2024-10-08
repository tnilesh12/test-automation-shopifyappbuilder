

import '../../product/price_v_2/price_v_2.dart';


class DiscountAllocations {
  PriceV2? allocatedAmount;


  DiscountAllocations({this.allocatedAmount});


  DiscountAllocations.fromJson(Map<String, dynamic> json) {
    allocatedAmount = PriceV2.fromJson(json['allocatedAmount']);
  }

  Map<String, dynamic> toJson() => {'allocatedAmount': '$allocatedAmount'};

}
