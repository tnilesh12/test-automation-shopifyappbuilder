class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  String msg;
  ChangePasswordSuccessState(this.msg);
}

class ChangePasswordSubmittingState extends ChangePasswordState {}

class ChangePasswordMessageState extends ChangePasswordState {
  String? msg;
  ChangePasswordMessageState(this.msg);
}

class ChangePasswordDataNotFoundState extends ChangePasswordState {}

class ChangePasswordAPIFailureState extends ChangePasswordState {
  String message;
  ChangePasswordAPIFailureState(this.message);
}

class ChangePasswordErrorState extends ChangePasswordState {
  String error;
  ChangePasswordErrorState(this.error);
}
