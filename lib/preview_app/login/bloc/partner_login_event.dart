part of 'partner_login_bloc.dart';

abstract class PartnerLoginEvent {}

class OnLoginButtonClick extends PartnerLoginEvent {
  String email;
  String password;
  String shopName;
  OnLoginButtonClick(this.email, this.password, this.shopName);
}

class OnBarcodeButtonClick extends PartnerLoginEvent {}
