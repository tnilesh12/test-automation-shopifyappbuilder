

import '../order.dart';


class Orders  {
   List<Order>? orderList;
    bool? hasNextPage;
   Orders({this.orderList, this.hasNextPage});
 

   Orders.fromJson(Map<String, dynamic> json)
   {
    orderList=_getOrderList(json);
    hasNextPage=json['hasNextPage'];
   }
   Map<String,dynamic> toJson()=>
   {
'orderList':'$_getOrderList',
'hasNextPage':'$hasNextPage'
   };


  static Orders fromGraphJson(Map<String, dynamic> json) {
    return Orders(
      orderList: _getOrderList(json),
      hasNextPage: json['pageInfo']?['hasNextPage'] ?? false,
    );
  }

  static List<Order> _getOrderList(Map<String, dynamic> json) {
    List<Order> orderList = [];
    if (json.containsKey('edges')) {
      json['edges']
          .forEach((e) => orderList.add(Order.fromGraphJson(e ?? const {})));
    }
    return orderList;
  }
}
