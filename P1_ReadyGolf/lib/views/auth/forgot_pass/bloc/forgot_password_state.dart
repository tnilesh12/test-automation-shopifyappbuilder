abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState{}

class ForgotPasswordSubmittingState extends ForgotPasswordState{}

class ForgotPasswordErrorState extends ForgotPasswordState {
  String error;
  ForgotPasswordErrorState(this.error);
}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

class ForgotPasswordAPIFailureState extends ForgotPasswordState {
  String message;
  ForgotPasswordAPIFailureState(this.message);
}