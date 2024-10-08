class EmailSubscriptionState {}

class EmailSubscriptionInitialState extends EmailSubscriptionState {}

class EmailSubscriptionLoadState extends EmailSubscriptionState {}

class EmailSubscriptionSuccessState extends EmailSubscriptionState {
  String successMessage;
  EmailSubscriptionSuccessState(this.successMessage);
}

class EmailSubscriptionFailedState extends EmailSubscriptionState {
  String failedMessage;
  EmailSubscriptionFailedState(this.failedMessage);
}

class EmailInvalidState extends EmailSubscriptionState {
  EmailInvalidState();
}

class EmailEmptyState extends EmailSubscriptionState {
  EmailEmptyState();
}
