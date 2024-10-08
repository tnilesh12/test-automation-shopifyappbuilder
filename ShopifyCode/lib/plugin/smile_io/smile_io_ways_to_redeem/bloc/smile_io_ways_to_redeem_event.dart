class SmileIoWaysToRedeemEvent {}


class onLoadRedeemPointsDataEvent extends SmileIoWaysToRedeemEvent {
  int pointsToSpend;
  int pointsProductsId;
  int customerId;
  onLoadRedeemPointsDataEvent(this.pointsToSpend, this.pointsProductsId, this.customerId);
}