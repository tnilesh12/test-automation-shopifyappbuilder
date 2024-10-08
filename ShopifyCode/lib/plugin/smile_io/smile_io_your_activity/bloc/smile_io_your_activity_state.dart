class SmileIoYourActivityState {}

class SmileIoYourActivityInitialState extends SmileIoYourActivityState {}

class SmileIoYourActivityLoadingState extends SmileIoYourActivityState {}

class SmileIoYourActivityDataLoaded extends SmileIoYourActivityState {}

class SmileIoYourActivityAPIFailureState extends SmileIoYourActivityState {
  String message;
  SmileIoYourActivityAPIFailureState(this.message);
}

class SmileIoYourActivitySuccessState extends SmileIoYourActivityState {
  List<dynamic>? yourActivityData;
  SmileIoYourActivitySuccessState(this.yourActivityData);
}
