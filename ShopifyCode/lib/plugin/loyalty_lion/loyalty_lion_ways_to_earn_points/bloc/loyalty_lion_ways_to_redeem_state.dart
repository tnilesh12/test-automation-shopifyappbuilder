class LoyaltyLionWaysToRedeemState {}

class LoyaltyLionWaysToRedeemInitialState extends LoyaltyLionWaysToRedeemState {}

class LoyaltyLionWaysToRedeemLoadingState extends LoyaltyLionWaysToRedeemState {}

class LoyaltyLionWaysToRedeemDataLoaded extends LoyaltyLionWaysToRedeemState {}

class LoyaltyLionWaysToRedeemAPIFailureState extends LoyaltyLionWaysToRedeemState {
  String message;
  LoyaltyLionWaysToRedeemAPIFailureState(this.message);
}

class LoyaltyLionWaysToRedeemSuccessState extends LoyaltyLionWaysToRedeemState {
  List<dynamic>? waysToRedeemData;
  LoyaltyLionWaysToRedeemSuccessState(this.waysToRedeemData);
}

class LoyaltyLionWaysToRedeemPointsSuccessState extends LoyaltyLionWaysToRedeemState {
  dynamic redeemPointsData;
  int pointsToSpend;
  LoyaltyLionWaysToRedeemPointsSuccessState(this.redeemPointsData, this.pointsToSpend);
}

class LoyaltyLionPointsRedeemingState extends LoyaltyLionWaysToRedeemState {}
