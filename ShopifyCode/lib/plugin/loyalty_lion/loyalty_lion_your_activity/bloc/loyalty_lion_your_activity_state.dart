class LoyaltyLionYourActivityState {}

class LoyaltyLionYourActivityInitialState extends LoyaltyLionYourActivityState {}

class LoyaltyLionYourActivityLoadingState extends LoyaltyLionYourActivityState {}

class LoyaltyLionYourActivityDataLoaded extends LoyaltyLionYourActivityState {}

class LoyaltyLionYourActivityAPIFailureState extends LoyaltyLionYourActivityState {
  String message;
  LoyaltyLionYourActivityAPIFailureState(this.message);
}

class LoyaltyLionYourActivitySuccessState extends LoyaltyLionYourActivityState {
  List<dynamic>? yourActivityData;
  LoyaltyLionYourActivitySuccessState(this.yourActivityData);
}
