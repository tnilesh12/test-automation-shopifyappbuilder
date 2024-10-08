// class ProductNew {
//   Data? data;

//   ProductNew({this.data});

//   ProductNew.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Nodes>? nodes;

//   Data({this.nodes});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['nodes'] != null) {
//       nodes = <Nodes>[];
//       json['nodes'].forEach((v) {
//         nodes!.add(new Nodes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.nodes != null) {
//       data['nodes'] = this.nodes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Nodes {
//   Data? sellingPlanGroups;

//   Nodes({this.sellingPlanGroups});

//   Nodes.fromJson(Map<String, dynamic> json) {
//     sellingPlanGroups = json['sellingPlanGroups'] != null
//         ? new Data.fromJson(json['sellingPlanGroups'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.sellingPlanGroups != null) {
//       data['sellingPlanGroups'] = this.sellingPlanGroups!.toJson();
//     }
//     return data;
//   }
// }

// class Nodess {
//   Null? appName;
//   String? name;
//   List<Options>? options;
//   Data? sellingPlans;

//   Nodess({this.appName, this.name, this.options, this.sellingPlans});

//   Nodess.fromJson(Map<String, dynamic> json) {
//     appName = json['appName'];
//     name = json['name'];
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options!.add(new Options.fromJson(v));
//       });
//     }
//     sellingPlans = json['sellingPlans'] != null
//         ? new Data.fromJson(json['sellingPlans'])
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

// class Options {
//   String? name;
//   List<String>? values;

//   Options({this.name, this.values});

//   Options.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     values = json['values'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['values'] = this.values;
//     return data;
//   }
// }

// class Nodesss {
//   CheckoutCharge? checkoutCharge;
//   Null? description;
//   String? id;
//   String? name;
//   List<Options>? options;
//   List<PriceAdjustments>? priceAdjustments;
//   bool? recurringDeliveries;

//   Nodesss(
//       {this.checkoutCharge,
//       this.description,
//       this.id,
//       this.name,
//       this.options,
//       this.priceAdjustments,
//       this.recurringDeliveries});

//   Nodesss.fromJson(Map<String, dynamic> json) {
//     checkoutCharge = json['checkoutCharge'] != null
//         ? new CheckoutCharge.fromJson(json['checkoutCharge'])
//         : null;
//     description = json['description'];
//     id = json['id'];
//     name = json['name'];
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options!.add(new Options.fromJson(v));
//       });
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

// class Optionss {
//   String? name;
//   String? value;

//   Optionss({this.name, this.value});

//   Optionss.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     value = json['value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['value'] = this.value;
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
