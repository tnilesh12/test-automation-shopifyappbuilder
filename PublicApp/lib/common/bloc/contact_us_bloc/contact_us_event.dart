class ContactUsEvent {}

class OnSubmitEvent extends ContactUsEvent {
  String name;
  String email;
  String number;
  String message;
  OnSubmitEvent(this.name, this.email, this.number, this.message);
}
