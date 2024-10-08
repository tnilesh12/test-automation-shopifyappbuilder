

import '../../product/price_v_2/price_v_2.dart';


class AppliedGiftCards {
   PriceV2? amountUsedV2;
       PriceV2? balanceV2;
       String? id;
  

   AppliedGiftCards(
      {this.amountUsedV2,
      this.balanceV2,
      this.id}) ;

   AppliedGiftCards.fromJson(Map<String, dynamic> json) 
   {
     amountUsedV2=json['amountUsedV2'];
       balanceV2=json['balanceV2'];
       id=json['id'];
   }
   Map<String,dynamic> toJson()=>
   {
'amountUsedV2':'$amountUsedV2',
'balanceV2':'$balanceV2',
'id':'$id'
   };

}
