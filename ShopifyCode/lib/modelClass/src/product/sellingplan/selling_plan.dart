// import 'package:shopify_code/modelClass/src/product/option/option.dart';
// import 'package:shopify_code/modelClass/src/product/product.dart';

// class SellingPlanGroupsClass {
//   String? appName;
//   String? name;
//   List<Option>? options;
//   SellingPlan? sellingPlans;

//   SellingPlanGroupsClass({this.appName, this.name, this.options, this.sellingPlans});

//   SellingPlanGroupsClass.fromJson(Map<String, dynamic> json) {
//     appName = json['appName'];
//     name = json['name'];
//     if (json['options'] != null) {
//       options = <Option>[];
//       json['options'].forEach((v) {
//         options!.add( Option.fromJson(v));
//       });
//     }
//     sellingPlans = json['sellingPlans'] != null
//         ?  SellingPlan.fromJson(json['sellingPlans'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['appName'] = this.appName;
//     data['name'] = this.name;
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     if (this.sellingPlans != null) {
//       data['sellingPlans'] = this.sellingPlans!.toJson();
//     }
//     return data;
//   }
// }

// class SellingPlanListNodes {
//   CheckoutCharge? checkoutCharge;
//   String? description;
//   String? id;
//   String? name;
//   List<Option>? options;
//   List<PriceAdjustments>? priceAdjustments;
//   bool? recurringDeliveries;

//   SellingPlanListNodes(
//       {this.checkoutCharge,
//       this.description,
//       this.id,
//       this.name,
//       this.options,
//       this.priceAdjustments,
//       this.recurringDeliveries});

//   SellingPlanListNodes.fromJson(Map<String, dynamic> json) {
//     checkoutCharge = json['checkoutCharge'] != null
//         ? new CheckoutCharge.fromJson(json['checkoutCharge'])
//         : null;
//     description = json['description'];
//     id = json['id'];
//     name = json['name'];
//     if (json['options'] != null) {
//       options = Product.
//       // <Option>[];
//       // json['options'].forEach((v) {
//       //   options!.add( Option.fromJson(v));
//       // });
//     }
//     if (json['priceAdjustments'] != null) {
//       priceAdjustments = <PriceAdjustments>[];
//       json['priceAdjustments'].forEach((v) {
//         priceAdjustments!.add(new PriceAdjustments.fromJson(v));
//       });
//     }
//     recurringDeliveries = json['recurringDeliveries'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.checkoutCharge != null) {
//       data['checkoutCharge'] = this.checkoutCharge!.toJson();
//     }
//     data['description'] = this.description;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     if (this.priceAdjustments != null) {
//       data['priceAdjustments'] =
//           this.priceAdjustments!.map((v) => v.toJson()).toList();
//     }
//     data['recurringDeliveries'] = this.recurringDeliveries;
//     return data;
//   }
// }

// class CheckoutCharge {
//   String? type;
//   Value? value;

//   CheckoutCharge({this.type, this.value});

//   CheckoutCharge.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     value = json['value'] != null ? new Value.fromJson(json['value']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     if (this.value != null) {
//       data['value'] = this.value!.toJson();
//     }
//     return data;
//   }
// }

// class Value {
//   String? sTypename;

//   Value({this.sTypename});

//   Value.fromJson(Map<String, dynamic> json) {
//     sTypename = json['__typename'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['__typename'] = this.sTypename;
//     return data;
//   }
// }

// class PriceAdjustments {
//   Value? adjustmentValue;
//   Null? orderCount;

//   PriceAdjustments({this.adjustmentValue, this.orderCount});

//   PriceAdjustments.fromJson(Map<String, dynamic> json) {
//     adjustmentValue = json['adjustmentValue'] != null
//         ? new Value.fromJson(json['adjustmentValue'])
//         : null;
//     orderCount = json['orderCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.adjustmentValue != null) {
//       data['adjustmentValue'] = this.adjustmentValue!.toJson();
//     }
//     data['orderCount'] = this.orderCount;
//     return data;
//   }
// }

// class SellingPlan{
// SellingPlanListNodes? sellingPlanListNodes;
//   SellingPlan({this.sellingPlanListNodes});
  
//   SellingPlan.fromJson(Map<String, dynamic> json) {
//     sellingPlanListNodes = json['nodes'] != null
//         ?  SellingPlanListNodes.fromJson(json['nodes'])
//         : null;

//   }
//    Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.sellingPlanListNodes != null) {
//       data['nodes'] = this.sellingPlanListNodes!.toJson();
//     }
//     return data;
  
//    }
// }