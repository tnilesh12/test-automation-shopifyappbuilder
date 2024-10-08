class SmileIoYourRewardsState {}

class SmileIoYourRewardsInitialState extends SmileIoYourRewardsState {}

class SmileIoYourRewardsLoadingState extends SmileIoYourRewardsState {}

class SmileIoYourRewardsDataLoaded extends SmileIoYourRewardsState {}

class SmileIoYourRewardsAPIFailureState extends SmileIoYourRewardsState {
  String message;
  SmileIoYourRewardsAPIFailureState(this.message);
}

class SmileIoYourRewardsSuccessState extends SmileIoYourRewardsState {
  List<dynamic>? yourRewardsData;
  SmileIoYourRewardsSuccessState(this.yourRewardsData);
}
