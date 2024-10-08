class ChangePasswordEvent {}

class onSubmitEvent extends ChangePasswordEvent {
  String password;
  String confirmPassword;
  onSubmitEvent(this.password, this.confirmPassword);
}
