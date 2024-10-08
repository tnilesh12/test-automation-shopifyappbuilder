abstract class LoginState {}

class LoginInitialState extends LoginState {}

// class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  String error;
  LoginErrorState(this.error);
}

class LoginSuccessState extends LoginState {}

class LoginAPIFailureState extends LoginState {
  String message;
  LoginAPIFailureState(this.message);
}

class LoginSubmittingState extends LoginState {}
