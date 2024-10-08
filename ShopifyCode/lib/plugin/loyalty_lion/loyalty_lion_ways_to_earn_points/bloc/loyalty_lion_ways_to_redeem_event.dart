class LoyaltyLionWaysToRedeemEvent {}


class onLoadRedeemPointsDataEvent extends LoyaltyLionWaysToRedeemEvent {
  int pointsToSpend;
  int rewardId;
  String customerMerchantId;
  onLoadRedeemPointsDataEvent(this.pointsToSpend, this.rewardId, this.customerMerchantId);
}