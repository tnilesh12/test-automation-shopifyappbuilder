import 'package:shopify_code/modelClass/src/product/option/option.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import '../price_v_2/price_v_2.dart';
import '../selected_option/selected_option.dart';
import '../shopify_image/shopify_image.dart';
import '../unit_price_measurement/unit_price_measurement.dart';

class ProductVariant {
  PriceV2? price;
  String? title;
  double? weight;
  String? weightUnit;
  bool? availableForSale;
  String? sku;
  bool? requiresShipping;
  String? id;
  int? quantityAvailable;
  PriceV2? unitPrice;
  UnitPriceMeasurement? unitPriceMeasurement;
  List<SelectedOption>? selectedOptions;
  PriceV2? compareAtPrice;
  ShopifyImage? image;
  List<SellingsPlansAllocation>? sellingsPlansAllocation;

  ProductVariant(
      {this.price,
      this.title,
      this.weight,
      this.weightUnit,
      this.availableForSale,
      this.sku,
      this.requiresShipping,
      this.id,
      this.quantityAvailable,
      this.unitPrice,
      this.unitPriceMeasurement,
      this.selectedOptions,
      this.compareAtPrice,
      this.image,
      this.sellingsPlansAllocation});

  get copyWith {
    ProductVariant(
        price: price,
        title: title,
        weight: weight,
        weightUnit: weightUnit,
        availableForSale: availableForSale,
        sku: sku,
        requiresShipping: requiresShipping,
        id: id,
        quantityAvailable: quantityAvailable);
  }

  static ProductVariant fromGraphJson(Map<String, dynamic> json) {
    Map<String, dynamic> nodeJson = json['node'] ?? const {};

    return ProductVariant(
        price: PriceV2.fromJson(nodeJson['priceV2']),
        title: nodeJson['title'],
        image: nodeJson['image'] != null
            ? ShopifyImage.fromJson(nodeJson['image'])
            : null,
        compareAtPrice: nodeJson['compareAtPriceV2'] != null
            ? PriceV2.fromJson(nodeJson['compareAtPriceV2'])
            : null,
        weight: double.parse(nodeJson['weight'].toString()),
        weightUnit: nodeJson['weightUnit'],
        availableForSale: nodeJson['availableForSale'],
        sku: nodeJson['sku'] ?? '',
        requiresShipping: nodeJson['requiresShipping'],
        id: nodeJson['id'],
        quantityAvailable: nodeJson['quantityAvailable'],
        unitPrice: nodeJson['unitPrice'] != null
            ? PriceV2.fromJson(nodeJson['unitPrice'])
            : null,
        unitPriceMeasurement: nodeJson['unitPriceMeasurement'] != null
            ? UnitPriceMeasurement.fromJson(nodeJson['unitPriceMeasurement'])
            : null,
        selectedOptions: _getOptionList((nodeJson)),
        sellingsPlansAllocation: _getSellingPlanAllocationList(
            nodeJson['sellingPlanAllocations'] ?? {}));
  }

  ProductVariant.fromJson(Map<String, dynamic> json) {
    price = PriceV2.fromJson(json['price']);
    title = json['title'];
    weight = double.parse(json['weight']);
    weightUnit = json['weightUnit'];
    availableForSale = bool.parse(json['availableForSale']);
    sku = json['sku'];
    requiresShipping = bool.parse(json['requiresShipping']);
    id = json['id'];
    quantityAvailable = int.parse(json['quantityAvailable']);
    unitPrice =
        json['unitPrice'] != null ? PriceV2.fromJson(json['unitPrice']) : null;
    unitPriceMeasurement = json['unitPriceMeasurement'] != null
        ? UnitPriceMeasurement.fromJson(json['unitPriceMeasurement'])
        : null;
    selectedOptions = _getOptionList(json);
    compareAtPrice = json['compareAtPrice'] != null
        ? PriceV2.fromJson(json['compareAtPrice'])
        : null;
    image = ShopifyImage.fromJson(json['image']);
    sellingsPlansAllocation =
        _getSellingPlanAllocationList(json['sellingPlanAllocations'] ?? {});
  }

  Map<String, dynamic> toJson() => {
        'price': price!.toJson(),
        'title': '$title',
        'weight': '$weight',
        'weightUnit': '$weightUnit',
        'availableForSale': '$availableForSale',
        'sku': '$sku',
        'requiresShipping': '$requiresShipping',
        'id': '$id',
        'quantityAvailable': '$quantityAvailable',
        'unitPrice': unitPrice != null ? unitPrice!.toJson() : null,
        'unitPriceMeasurement': unitPriceMeasurement != null
            ? unitPriceMeasurement!.toJson()
            : null,
        'selectedOptions': (selectedOptions!.map((e) => e.toJson()).toList()),
        'compareAtPrice':
            compareAtPrice != null ? compareAtPrice!.toJson() : null,
        'image': image!.toJson(),
        'sellingPlanAllocations': (sellingsPlansAllocation!.map((e) {
          return e.toJson();
        }).toList())
      };
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

  static List<SelectedOption> _getOptionList(Map<String, dynamic> json) {
    List<SelectedOption> optionList = [];
    json['selectedOptions']?.forEach((v) {
      if (v != null) optionList.add(SelectedOption.fromJson(v ?? const {}));
    });
    return optionList;
  }
}

class SellingsPlansAllocation {
  List<PriceAdjustment>? priceAdjustments;
  PriceV2? remainingBalanceChargeAmount;
  SellPlanCart? sellCart;

  SellingsPlansAllocation(
      {this.priceAdjustments,
      this.remainingBalanceChargeAmount,
      this.sellCart});

  SellingsPlansAllocation.fromJson(Map<String, dynamic> json) {
    if (json['priceAdjustments'] != null) {
      priceAdjustments = <PriceAdjustment>[];
      json['priceAdjustments'].forEach((v) {
        priceAdjustments!.add(PriceAdjustment.fromJson(v));
      });
    }
    remainingBalanceChargeAmount = json['remainingBalanceChargeAmount'] != null
        ? new PriceV2.fromJson(json['remainingBalanceChargeAmount'])
        : null;
    sellCart = json['sellingPlan'] != null
        ? SellPlanCart.fromJson(json['sellingPlan'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.priceAdjustments != null) {
      data['priceAdjustments'] =
          this.priceAdjustments!.map((v) => v.toJson()).toList();
    }
    if (this.remainingBalanceChargeAmount != null) {
      data['remainingBalanceChargeAmount'] =
          this.remainingBalanceChargeAmount!.toJson();
    }
    if (this.sellCart != null) {
      data['sellingPlan'] = this.sellCart!.toJson();
    }
    return data;
  }
}

class SellPlanCart {
  String? description;
  String? id;
  String? name;
  bool? recurringDeliveries;
  List<Option>? options;
  List<PriceAdjustments>? priceAdjustments;
  CheckoutCharge? checkoutCharge;

  SellPlanCart(
      {this.description,
      this.id,
      this.name,
      this.recurringDeliveries,
      this.options,
      this.priceAdjustments,
      this.checkoutCharge});

  SellPlanCart.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? " ";
    id = json['id'] ?? " ";
    name = json['name'] ?? " ";
    recurringDeliveries = json['recurringDeliveries'];

    options = _getOptionList(json);

    if (json['priceAdjustments'] != null) {
      priceAdjustments = <PriceAdjustments>[];
      json['priceAdjustments'].forEach((v) {
        priceAdjustments!.add(new PriceAdjustments.fromJson(v));
      });
    }
    checkoutCharge = json['checkoutCharge'] != null
        ? new CheckoutCharge.fromJson(json['checkoutCharge'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    data['recurringDeliveries'] = this.recurringDeliveries;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.priceAdjustments != null) {
      data['priceAdjustments'] =
          this.priceAdjustments!.map((v) => v.toJson()).toList();
    }
    if (this.checkoutCharge != null) {
      data['checkoutCharge'] = this.checkoutCharge!.toJson();
    }
    return data;
  }

  static List<Option> _getOptionList(Map<String, dynamic> json) {
    List<Option> optionList = [];
    if (json['options'] == null) return optionList;
    json['options']?.forEach((v) {
      if (v != null) optionList.add(Option.fromJson(v ?? const {}));
    });
    return optionList;
  }
}

class PriceAdjustment {
  PriceV2? compareAtPrice;
  PriceV2? perDeliveryPrice;
  PriceV2? price;
  String? unitPrice;

  PriceAdjustment(
      {this.compareAtPrice, this.perDeliveryPrice, this.price, this.unitPrice});

  PriceAdjustment.fromJson(Map<String, dynamic> json) {
    compareAtPrice = json['compareAtPrice'] != null
        ? new PriceV2.fromJson(json['compareAtPrice'])
        : null;
    perDeliveryPrice = json['perDeliveryPrice'] != null
        ? new PriceV2.fromJson(json['perDeliveryPrice'])
        : null;
    price = json['price'] != null ? new PriceV2.fromJson(json['price']) : null;
    unitPrice = json['unitPrice'] == null ? " " : json['unitPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.compareAtPrice != null) {
      data['compareAtPrice'] = this.compareAtPrice!.toJson();
    }
    if (this.perDeliveryPrice != null) {
      data['perDeliveryPrice'] = this.perDeliveryPrice!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['unitPrice'] = this.unitPrice;
    return data;
  }
}

// class CompareAtPrice {
//   String? amount;
//   String? currencyCode;

//   CompareAtPrice({this.amount, this.currencyCode});

//   CompareAtPrice.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'];
//     currencyCode = json['currencyCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['currencyCode'] = this.currencyCode;
//     return data;
//   }
// }
