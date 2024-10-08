

import '../line_item_order/line_item_order.dart';

class LineItemsOrder {
   List<LineItemOrder>? lineItemOrderList;
   LineItemsOrder({ this.lineItemOrderList});
 

   LineItemsOrder.fromJson(Map<String, dynamic> json)
   {
    lineItemOrderList=_getLineItemOrderList(json);
   }
   Map<String,dynamic> toJson()=>
   {
'lineItemOrderList':'$_getLineItemOrderList'
   };


  static LineItemsOrder fromGraphJson(Map<String, dynamic> json) {
    return LineItemsOrder(lineItemOrderList: _getLineItemOrderList(json));
  }

  static _getLineItemOrderList(Map<String, dynamic> json) {
    List<LineItemOrder> lineItemListOrder = [];
    if (json.containsKey('edges')) {
      json['edges'].forEach((lineItemOrder) =>
          lineItemListOrder.add(LineItemOrder.fromGraphJson(lineItemOrder)));
    }
    return lineItemListOrder;
  }
}
