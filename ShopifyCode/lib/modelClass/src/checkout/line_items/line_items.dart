

import '../line_item/line_item.dart';


class LineItems  {
  List<LineItem>? lineItemList;
   LineItems({this.lineItemList}) ;

   LineItems.fromJson(Map<String, dynamic> json)
   {
    lineItemList=_getlineItemList(json);
   }
   Map<String,dynamic> toJson()=>
   {
'lineItemList':'$_getlineItemList'
   };

   static _getlineItemList(Map<String, dynamic> json) {
    List<LineItem> lineItemList = [];
    json['lineItemList']?.forEach((tag) => lineItemList.add(tag));
    return lineItemList;
  }
}
