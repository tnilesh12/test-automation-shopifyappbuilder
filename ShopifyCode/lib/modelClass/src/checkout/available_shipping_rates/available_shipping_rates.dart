

import '../shipping_rates/shipping_rates.dart';

class AvailableShippingRates  {
   bool? ready;
       List<ShippingRates>? shippingRates;


   AvailableShippingRates(
      {this.ready,
      this.shippingRates}) ;

   AvailableShippingRates.fromJson(Map<String, dynamic> json)
   {
    ready=json['ready'];
    shippingRates=_getShippingList(json);
   }
   Map<String,dynamic> toJson()=>
   {
'ready':'$ready',
'shippingRates':'$_getShippingList'
   };
 static _getShippingList(Map<String, dynamic> json) {
    List<ShippingRates> shippingList = [];
    json['shippingRates']?.forEach((tag) => shippingList.add(tag));
    return shippingList;
  }

}
