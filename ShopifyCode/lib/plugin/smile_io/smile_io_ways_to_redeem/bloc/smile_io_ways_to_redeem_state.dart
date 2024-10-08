class SmileIoWaysToRedeemState {}

class SmileIoWaysToRedeemInitialState extends SmileIoWaysToRedeemState {}

class SmileIoWaysToRedeemLoadingState extends SmileIoWaysToRedeemState {}

class SmileIoWaysToRedeemDataLoaded extends SmileIoWaysToRedeemState {}

class SmileIoWaysToRedeemAPIFailureState extends SmileIoWaysToRedeemState {
  String message;
  SmileIoWaysToRedeemAPIFailureState(this.message);
}

class SmileIoWaysToRedeemSuccessState extends SmileIoWaysToRedeemState {
  List<dynamic>? waysToRedeemData;
  SmileIoWaysToRedeemSuccessState(this.waysToRedeemData);
}

class SmileIoWaysToRedeemPointsSuccessState extends SmileIoWaysToRedeemState {
  dynamic redeemPointsData;
  int pointsToSpend;
  SmileIoWaysToRedeemPointsSuccessState(this.redeemPointsData, this.pointsToSpend);
}

class SmileIoPointsRedeemingState extends SmileIoWaysToRedeemState {}
