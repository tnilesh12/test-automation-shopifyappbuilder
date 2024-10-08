

import '../../product/price_v_2/price_v_2.dart';


class ShippingRates  {
  String? handle;
       String? title;
       PriceV2? priceV2;
 
   ShippingRates(
      {this.handle,
        this.title,
        this.priceV2}) ;

   ShippingRates.fromJson(Map<String, dynamic> json)
   {
    handle=json['handle'];
    title=json['title'];
    priceV2=json['priceV2'];
   }
   Map<String,dynamic> toJson()=>
   {
'handle':'$handle',
'title':'$title',
'priceV2':'$priceV2'
   };

}
