
import 'successful_fulfillment/successful_fullfilment.dart';

import '../product/price_v_2/price_v_2.dart';
import 'line_items_order/line_items_order.dart';
import 'shipping_address/shipping_address.dart';


class Order  {
     String? id;
     String? email;
     String? currencyCode;
     String? customerUrl;
     LineItemsOrder? lineItems;
     String? name;
     int? orderNumber;
     String? processedAt;
     ShippingAddress? shippingAddress;
     ShippingAddress? billingAddress;
     String? statusUrl;
     PriceV2? subtotalPriceV2;
     PriceV2? totalPriceV2;
     PriceV2? totalShippingPriceV2;
     PriceV2? totalTaxV2;
     String? financialStatus;
     String? fulfillmentStatus;
    PriceV2? totalRefundedV2;
    String? phone;
    String? cursor;
    List<SuccessfulFullfilment>? successfulFulfillments;
   

   Order({
    this.id,
    this.email,
   this.currencyCode,
    this.customerUrl,
   this.lineItems,
   this.name,
  this.orderNumber,
   this.processedAt,
    this.shippingAddress,
    this.billingAddress,
    this.statusUrl,
    this.subtotalPriceV2,
    this.totalPriceV2,
    this.totalShippingPriceV2,
  this.totalTaxV2,
    this.financialStatus,
   this.fulfillmentStatus,
   this.totalRefundedV2,
   this.phone,
    this.cursor,
   this.successfulFulfillments
  });

  static Order fromGraphJson(Map<String, dynamic> json) {
    return Order(
      id: json['node']['id'],
      email: json['node']['email'],
      currencyCode: json['node']['currencyCode'],
      customerUrl: json['node']['customerUrl'],
      lineItems: LineItemsOrder.fromGraphJson(json['node']['lineItems']),
      name: json['node']['name'],
      orderNumber: json['node']['orderNumber'] ?? 0,
      phone: json['node']['phone'],
      processedAt: json['node']['processedAt'],
      financialStatus: json['node']['financialStatus'],
      fulfillmentStatus: json['node']['fulfillmentStatus'],
      shippingAddress:
          ShippingAddress.fromJson(json['node']['shippingAddress']?? const {}),
      billingAddress: ShippingAddress.fromJson(json['node']['billingAddress']?? const {}),
      statusUrl: json['node']['statusUrl'],
      subtotalPriceV2: PriceV2.fromJson(json['node']['subtotalPriceV2']),
      totalPriceV2: PriceV2.fromJson(json['node']['totalPriceV2']),
      totalRefundedV2: PriceV2.fromJson(json['node']['totalRefundedV2']),
      totalShippingPriceV2:
          PriceV2.fromJson(json['node']['totalShippingPriceV2']),
      totalTaxV2: PriceV2.fromJson(json['node']['totalTaxV2']),
      cursor: json['cursor'],
      successfulFulfillments: _getSuccessfulFulfilments(
          json['node']['successfulFulfillments'] ?? []),
    );
  }

   Order.fromJson(Map<String, dynamic> json)
   {
    id=json['id'];
     email=json['email'];
      currencyCode=json['currencyCode'];
       customerUrl=json['customerUrl'];
        lineItems=json['lineItems'];
         name=json['name'];
          orderNumber=json['orderNumber'];
           phone=json['phone'];
            processedAt=json['processedAt'];
             financialStatus=json['financialStatus'];
              fulfillmentStatus=json['fulfillmentStatus'];
               shippingAddress=json['shippingAddress'];
                billingAddress=json['billingAddress'];
                 statusUrl=json['statusUrl'];
                  subtotalPriceV2=json['subtotalPriceV2'];
                   totalPriceV2=json['totalPriceV2'];
                    totalRefundedV2=json['totalRefundedV2'];
                     totalShippingPriceV2=json['totalShippingPriceV2'];
                       totalTaxV2=json['totalTaxV2'];
                         cursor=json['cursor'];
                           successfulFulfillments=_getSuccessfulFulfilments(json["successfulFulfillments"]??[]);
                         
                            
                     
   }
 

   static List<SuccessfulFullfilment> _getSuccessfulFulfilments(List<dynamic> json) {
    List<SuccessfulFullfilment> successfulFulfillmentList = [];
    if (json.isNotEmpty) {
      json
          .forEach((e) => successfulFulfillmentList.add(SuccessfulFullfilment.fromGraphJson(e ?? const {})));
    }
    return successfulFulfillmentList;
  }

}
