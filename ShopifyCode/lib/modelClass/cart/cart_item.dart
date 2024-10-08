import 'dart:core';
import 'package:shopify_code/modelClass/json_helper.dart';
import 'package:shopify_code/modelClass/src/checkout/attribute/attribute.dart';
import 'package:shopify_code/modelClass/src/product/price_v_2/price_v_2.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/shopify_image/shopify_image.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';

import '../src/product/product_variant/product_variant.dart';

class CartItem {
  String? id;
  int? quantity;
  Merchandise? merchandise;
  List<Attributes>? attributes;
  SellingPlansAllocation? sellingPlanAlloc;
  CartItem(
      {this.id,
      this.quantity,
      this.merchandise,
      this.attributes,
      this.sellingPlanAlloc});

  CartItem.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    id = (json['node'] ?? const {})['id'];
    quantity = (json['node'] ?? const {})['quantity'];
    merchandise = json['node']['merchandise'] != null
        ? new Merchandise.fromJson(json['node']['merchandise'])
        : null;
   if (json['node']['attributes'] != null) {
  attributes = <Attributes>[];
  json['node']['attributes'].forEach((v) {
    attributes!.add(Attributes.fromJson(v));
  });
}
    sellingPlanAlloc = json['node']['sellingPlanAllocation'] != null
        ? SellingPlansAllocation.fromJson(json['node']['sellingPlanAllocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.merchandise != null) {
      data['merchandise'] = this.merchandise!.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v).toList();
    }
    if (this.sellingPlanAlloc != null) {
      data['sellingPlanAllocation'] = this.sellingPlanAlloc!.toJson();
    }
    return data;
  }
}
class Attributes {
   String key;
   String value;

  Attributes({required this.key, required this.value});

  factory Attributes.fromJson(Map<String, dynamic> map) {
    return Attributes(
      key: map['key']??" ",
      value: map['value']??" ",
    );
  }
}
// class Attributes{
//   String? key;
//   String? value;
//   Attributes(
//       {this.key,this.value});

//       Attributes.fromJson(Map<String, dynamic> json) {
//     key = json['key'] ??" ";
//     value = json['value'] ?? " ";
    
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['value'] = this.value;
  
//     return data;
//   }

// }

class SellingPlansAllocation {
  PriceV2? checkoutChargeAmount;
  List<PriceAdjustment>? priceAdjustments;
  PriceV2? remainingBalanceChargeAmount;
  SellingPlan? sellingPlan;

  SellingPlansAllocation(
      {this.checkoutChargeAmount,
      this.priceAdjustments,
      this.remainingBalanceChargeAmount,
      this.sellingPlan});

  SellingPlansAllocation.fromJson(Map<String, dynamic> json) {
    checkoutChargeAmount = json['checkoutChargeAmount'] != null
        ? new PriceV2.fromJson(json['checkoutChargeAmount'])
        : null;
    if (json['priceAdjustments'] != null) {
      priceAdjustments = <PriceAdjustment>[];
      json['priceAdjustments'].forEach((v) {
        priceAdjustments!.add(PriceAdjustment.fromJson(v));
      });
    }
    remainingBalanceChargeAmount = json['remainingBalanceChargeAmount'] != null
        ? PriceV2.fromJson(json['remainingBalanceChargeAmount'])
        : null;
    sellingPlan = json['sellingPlan'] != null
        ? SellingPlan.fromJson(json['sellingPlan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checkoutChargeAmount != null) {
      data['checkoutChargeAmount'] = this.checkoutChargeAmount!.toJson();
    }
    if (this.priceAdjustments != null) {
      data['priceAdjustments'] =
          this.priceAdjustments!.map((v) => v.toJson()).toList();
    }
    if (this.remainingBalanceChargeAmount != null) {
      data['remainingBalanceChargeAmount'] =
          this.remainingBalanceChargeAmount!.toJson();
    }
    if (this.sellingPlan != null) {
      data['sellingPlan'] = this.sellingPlan!.toJson();
    }
    return data;
  }
}

class Merchandise {
  String? id;
  String? title;
  PriceV2? priceV2;
  CartProduct? product;
  ShopifyImage? image;

  String? sku;
  double? weight;
  bool? availableForSale;
  int? quantityAvailable;
  bool? requiresShipping;
  PriceV2? compareAtPrice;

  List<SellingsPlansAllocation>? sellingPlanAllocations;

  Merchandise(
      {this.id,
      this.title,
      this.priceV2,
      this.product,
      this.image,
      this.sellingPlanAllocations});

  Merchandise.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    title = json['title'] ?? "";

    sku = json['sku'] == null ? " " : json['sku'];
    weight =
        json['weight'] == 0.0 ? 0.0 : double.parse(json['weight'].toString());
    availableForSale = json['availableForSale'];
    quantityAvailable =
        json['quantityAvailable'] == 0 ? 0 : json['quantityAvailable'];
    requiresShipping = json['requiresShipping'];
    compareAtPrice = json['compareAtPrice'] != null
        ? PriceV2.fromJson(json['compareAtPrice'])
        : null;

    priceV2 =
        json['priceV2'] != null ? new PriceV2.fromJson(json['priceV2']) : null;
    product = json['product'] != null
        ? new CartProduct.fromJson(json['product'])
        : null;
    image =
        json['image'] != null ? new ShopifyImage.fromJson(json['image']) : null;
    sellingPlanAllocations =
        _getSellingPlanAllocationList(json['sellingPlanAllocations']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.priceV2 != null) {
      data['priceV2'] = this.priceV2!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.sellingPlanAllocations != null) {
      data['sellingPlanAllocations'] = sellingPlanAllocations!.map((e) {
        return e.toJson();
      }).toList();
    }
    return data;
  }

  static List<SellingsPlansAllocation> _getSellingPlanAllocationList(
      Map<String, dynamic> json) {
    List<SellingsPlansAllocation> sellingsPlansAllocation = [];
    if (json['nodes'] == null) return sellingsPlansAllocation;
    json['nodes']?.forEach((v) {
      if (v != null)
        sellingsPlansAllocation
            .add(SellingsPlansAllocation.fromJson(v ?? const {}));
    });
    return sellingsPlansAllocation;
  }
}

class CartProduct {
  String? id;
  String? title;

  CartProduct({this.id, this.title});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? " ";
    title = json['title'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class Image {
  String? id;
  String? url;

  Image({this.id, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? " ";
    url = json['url'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

// class SellingPlanAllocations {
//   List<Null>? nodes;

//   SellingPlanAllocations({this.nodes});

//   SellingPlanAllocations.fromJson(Map<String, dynamic> json) {
//     if (json['nodes'] != null) {
//       nodes = <Null>[];
//       json['nodes'].forEach((v) {
//         nodes!.add((v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.nodes != null) {
//       data['nodes'] = this.nodes!.map((v) => v.toString()).toList();
//     }
//     return data;
//   }
// }

class Cost {
  PriceV2? totalAmount;
  PriceV2? subtotalAmount;
  PriceV2? totalTaxAmount;
  PriceV2? totalDutyAmount;

  Cost(
      {this.totalAmount,
      this.subtotalAmount,
      this.totalTaxAmount,
      this.totalDutyAmount});

  Cost.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'] != null
        ? new PriceV2.fromJson(json['totalAmount'])
        : null;
    subtotalAmount = json['subtotalAmount'] != null
        ? new PriceV2.fromJson(json['subtotalAmount'])
        : null;
    totalTaxAmount = json['totalTaxAmount'] != null
        ? new PriceV2.fromJson(json['totalTaxAmount'])
        : null;
    totalDutyAmount =
        json['totalDutyAmount'] != null ? new PriceV2.fromJson(json['']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalAmount != null) {
      data['totalAmount'] = this.totalAmount!.toJson();
    }
    if (this.subtotalAmount != null) {
      data['subtotalAmount'] = this.subtotalAmount!.toJson();
    }
    data['totalTaxAmount'] = this.totalTaxAmount;
    data['totalDutyAmount'] = this.totalDutyAmount;
    return data;
  }
}

// class TotalAmount {
//   double? amount;
//   String? currencyCode;

//   TotalAmount({this.amount, this.currencyCode});

//   TotalAmount.fromJson(Map<String, dynamic> json) {
//     amount =  JsonHelper.amountFromJson(json);
//     currencyCode = json['currencyCode']??" ";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['currencyCode'] = this.currencyCode;
//     return data;
//   }
// }

class DiscountCodes {
  String? code;
  bool? applicable;

  DiscountCodes({this.code, this.applicable});

  DiscountCodes.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? " ";
    applicable = json['applicable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['applicable'] = this.applicable;
    return data;
  }
}

class DiscountAllocations {
  DiscountedAmount? discountedAmount;

  DiscountAllocations({this.discountedAmount});

  DiscountAllocations.fromJson(Map<String, dynamic> json) {
    discountedAmount = json['discountedAmount'] != null
        ? new DiscountedAmount.fromJson(json['discountedAmount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.discountedAmount != null) {
      data['discountedAmount'] = this.discountedAmount!.toJson();
    }
    return data;
  }
}

class DiscountedAmount {
  double? amount;
  String? currencyCode;

  DiscountedAmount({this.amount, this.currencyCode});

  DiscountedAmount.fromJson(Map<String, dynamic> json) {
    amount = JsonHelper.amountFromJson(json);
    currencyCode = json['currencyCode'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}

class BuyerIdentity {
  String? email;
  String? phone;
  Customer? customer;
  String? countryCode;
  List<Address>? deliveryAddressPreferences;

  BuyerIdentity({
    this.email,
    this.phone,
    this.customer,
    this.countryCode,

    // this.deliveryAddressPreferences
  });

  BuyerIdentity.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? " ";
    phone = json['phone'] ?? " ";
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['deliveryAddressPreferences'] != null) {
      deliveryAddressPreferences = <Address>[];
      json['deliveryAddressPreferences'].forEach((v) {
        deliveryAddressPreferences!.add(new Address.fromJson(v));
      });
    }
    countryCode = json['countryCode'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['countryCode'] = this.countryCode;
    // if (this.deliveryAddressPreferences != null) {
    //   data['deliveryAddressPreferences'] =
    //       this.deliveryAddressPreferences!.map((v) => v.toString()).toList();
    // }
    return data;
  }
}

class Customer {
  String? id;
   String? email;
  Customer(this.email,{this.id});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? " ";
    email=json['email']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email']=this.email;
    return data;
  }
  
}
