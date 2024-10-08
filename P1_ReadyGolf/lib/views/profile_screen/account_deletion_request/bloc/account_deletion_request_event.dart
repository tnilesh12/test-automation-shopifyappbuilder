class AccountDeletionRequestEvent {}

class OnAccountDeletionRequestSubmitEvent extends AccountDeletionRequestEvent {
  String name;
  String email;
  String number;
  String message;
  OnAccountDeletionRequestSubmitEvent(
      this.name, this.email, this.number, this.message);
}
