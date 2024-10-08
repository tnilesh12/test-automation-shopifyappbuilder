class LoyaltyLionYourRewardsState {}

class LoyaltyLionYourRewardsInitialState extends LoyaltyLionYourRewardsState {}

class LoyaltyLionYourRewardsLoadingState extends LoyaltyLionYourRewardsState {}

class LoyaltyLionYourRewardsDataLoaded extends LoyaltyLionYourRewardsState {}

class LoyaltyLionYourRewardsAPIFailureState extends LoyaltyLionYourRewardsState {
  String message;
  LoyaltyLionYourRewardsAPIFailureState(this.message);
}

class LoyaltyLionYourRewardsSuccessState extends LoyaltyLionYourRewardsState {
  List<dynamic>? yourRewardsData;
  LoyaltyLionYourRewardsSuccessState(this.yourRewardsData);
}
