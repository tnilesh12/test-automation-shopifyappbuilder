abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupSubmittingState extends SignupState {}

class SignupErrorState extends SignupState {
  String error;
  SignupErrorState(this.error);
}

class SignupSuccessState extends SignupState {}

class SignupAPIFailureState extends SignupState {
  String message;
  SignupAPIFailureState(this.message);
}
