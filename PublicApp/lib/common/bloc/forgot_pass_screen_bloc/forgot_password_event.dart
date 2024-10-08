class ForgotPasswordEvent{}

class onForgotPasswordButtonClick extends ForgotPasswordEvent {
  String email;
  onForgotPasswordButtonClick(this.email);
}