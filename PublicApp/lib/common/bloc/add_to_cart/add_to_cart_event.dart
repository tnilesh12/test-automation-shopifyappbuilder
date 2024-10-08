class AddToCartEvent {}

class OnAddToCartButtonClick extends AddToCartEvent {
  String variantId;
  String? sellingPlanId;
  List<Map<String, dynamic>>? hulkProductList;
  OnAddToCartButtonClick(this.variantId,
      {this.sellingPlanId, this.hulkProductList});
}

class OnBuyNowButtonClick extends AddToCartEvent {
  String variantId;
  String? sellingPlanId;
  List<Map<String, dynamic>>? hulkProductList;
  OnBuyNowButtonClick(this.variantId, {this.sellingPlanId, this.hulkProductList});
}
