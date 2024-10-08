class AddToCartEvent {}


class OnAddToCartButtonClick extends AddToCartEvent {
  String variantId;
  String? sellingPlanId;
  OnAddToCartButtonClick(this.variantId,{this.sellingPlanId});


}

class OnBuyNowButtonClick extends AddToCartEvent {
  String variantId;
  String? sellingPlanId;
  OnBuyNowButtonClick(this.variantId,{this.sellingPlanId});


}