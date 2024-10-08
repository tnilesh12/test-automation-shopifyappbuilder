import 'package:shopify_code/modelClass/cart/cart_item.dart';
import 'package:shopify_code/modelClass/cart/cart_item_list.dart';

class Cart {
  String? id;
  String? checkoutUrl;
  String? createdAt;
  String? updatedAt;
  String? note;
  List<DiscountAllocations>? discountAllocations;
  List<DiscountCodes>? discountCodes;
  CartItems? cartItems;
  List<Attributess>? attributes;
  Cost? cost;
  BuyerIdentity? buyerIdentity;

  Cart(
      {this.id,
      this.checkoutUrl,
      this.createdAt,
      this.updatedAt,
      this.discountAllocations,
      this.discountCodes,
      this.cartItems,
      this.attributes,
      this.cost,
      this.buyerIdentity,
      this.note});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id']??" ";
    checkoutUrl = json['checkoutUrl']??" ";
    note = json['note'];
    createdAt = json['createdAt']??" ";
    updatedAt = json['updatedAt']??" ";
    if (json['discountAllocations'] != null) {
      discountAllocations = <DiscountAllocations>[];
      json['discountAllocations'].forEach((v) {
        discountAllocations!.add(new DiscountAllocations.fromJson(v));
      });
    }
    if (json['discountCodes'] != null) {
      discountCodes = <DiscountCodes>[];
      json['discountCodes'].forEach((v) {
        discountCodes!.add(new DiscountCodes.fromJson(v));
      });
    }
    cartItems =
        json['lines'] != null ? CartItems.fromJson(json['lines']) : null;
    if (json['attributes'] != null) {
      attributes = <Attributess>[];
      json['attributes'].forEach((v) {
        attributes!.add(v);
      });
    }
    else{
      attributes=null;
    }
    cost = json['cost'] != null ? new Cost.fromJson(json['cost']) : null;
    buyerIdentity = json['buyerIdentity'] != null
        ? new BuyerIdentity.fromJson(json['buyerIdentity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['checkoutUrl'] = this.checkoutUrl;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.discountAllocations != null) {
      data['discountAllocations'] =
          this.discountAllocations!.map((v) => v.toJson()).toList();
    }
    if (this.discountCodes != null) {
      data['discountCodes'] =
          this.discountCodes!.map((v) => v.toJson()).toList();
    }
    if (this.cartItems != null) {
      data['lines'] = this.cartItems!.toString();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toString()).toList();
    }
    if (this.cost != null) {
      data['cost'] = this.cost!.toJson();
    }
    if (this.buyerIdentity != null) {
      data['buyerIdentity'] = this.buyerIdentity!.toJson();
    }
    return data;
  }
}
class Attributess {
   String key;
   String value;

  Attributess({required this.key, required this.value});

  factory Attributess.fromJson(Map<String, dynamic> map) {
    return Attributess(
      key: map['key']??" ",
      value: map['value']??" ",
    );
  }
}
/*
class Lines {
  List<Edges>? edges;

  Lines({this.edges});

  Lines.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node? node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    return data;
  }
}

class Node {
  String? id;
  int? quantity;
  Merchandise? merchandise;
  List<Null>? attributes;

  Node({this.id, this.quantity, this.merchandise, this.attributes});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    merchandise = json['merchandise'] != null
        ? new Merchandise.fromJson(json['merchandise'])
        : null;
    if (json['attributes'] != null) {
      attributes = <Null>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.merchandise != null) {
      data['merchandise'] = this.merchandise!.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Merchandise {
  String? id;
  SellingPlanAllocations? sellingPlanAllocations;

  Merchandise({this.id, this.sellingPlanAllocations});

  Merchandise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellingPlanAllocations = json['sellingPlanAllocations'] != null
        ? new SellingPlanAllocations.fromJson(json['sellingPlanAllocations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sellingPlanAllocations != null) {
      data['sellingPlanAllocations'] = this.sellingPlanAllocations!.toJson();
    }
    return data;
  }
}

class SellingPlanAllocations {
  List<Null>? nodes;

  SellingPlanAllocations({this.nodes});

  SellingPlanAllocations.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = <Null>[];
      json['nodes'].forEach((v) {
        nodes!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodes != null) {
      data['nodes'] = this.nodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cost {
  TotalAmount? totalAmount;
  TotalAmount? subtotalAmount;
  Null? totalTaxAmount;
  Null? totalDutyAmount;

  Cost(
      {this.totalAmount,
      this.subtotalAmount,
      this.totalTaxAmount,
      this.totalDutyAmount});

  Cost.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'] != null
        ? new TotalAmount.fromJson(json['totalAmount'])
        : null;
    subtotalAmount = json['subtotalAmount'] != null
        ? new TotalAmount.fromJson(json['subtotalAmount'])
        : null;
    totalTaxAmount = json['totalTaxAmount'];
    totalDutyAmount = json['totalDutyAmount'];
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

class TotalAmount {
  String? amount;
  String? currencyCode;

  TotalAmount({this.amount, this.currencyCode});

  TotalAmount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}

class BuyerIdentity {
  Null? email;
  Null? phone;
  Customer? customer;
  Null? countryCode;
  List<Null>? deliveryAddressPreferences;

  BuyerIdentity(
      {this.email,
      this.phone,
      this.customer,
      this.countryCode,
      this.deliveryAddressPreferences});

  BuyerIdentity.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    countryCode = json['countryCode'];
    if (json['deliveryAddressPreferences'] != null) {
      deliveryAddressPreferences = <Null>[];
      json['deliveryAddressPreferences'].forEach((v) {
        deliveryAddressPreferences!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['countryCode'] = this.countryCode;
    if (this.deliveryAddressPreferences != null) {
      data['deliveryAddressPreferences'] =
          this.deliveryAddressPreferences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? id;

  Customer({this.id});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}


*/
