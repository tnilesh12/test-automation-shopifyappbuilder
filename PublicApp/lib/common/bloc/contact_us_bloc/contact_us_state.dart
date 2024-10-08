abstract class ContactUsState {}

class ContactUsInitialState extends ContactUsState {}

class ContactUsErrorState extends ContactUsState {
  String error;
  ContactUsErrorState(this.error);
}

class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {}

class ContactUsAPIFailureState extends ContactUsState {
  String message;
  ContactUsAPIFailureState(this.message);
}

class ContactUsSubmittingState extends ContactUsState {}

class ContactUsSuccessSubmitState extends ContactUsState {
  String message;
  ContactUsSuccessSubmitState(this.message);
}
