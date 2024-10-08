class SignupEvent{}

class OnSignupButtonClick extends SignupEvent {
  String email;
  String firstName;
  String lastName;
  String mobile;
  String password;
  String cPassword;
  String phoneCode;
  bool acceptsMarketing;
  OnSignupButtonClick( this.firstName, this.lastName, this.email, this.mobile, this.password, this.cPassword,this.phoneCode,this.acceptsMarketing);
}