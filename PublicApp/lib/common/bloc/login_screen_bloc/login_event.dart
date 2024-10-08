class LoginEvent{}

class OnLoginButtonClick extends LoginEvent {
  String email;
  String password;
  OnLoginButtonClick(this.email, this.password);
}