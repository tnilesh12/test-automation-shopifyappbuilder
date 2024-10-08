part of 'partner_login_bloc.dart';

@immutable
abstract class PartnerLoginState {}

class PartnerLoginInitial extends PartnerLoginState {}

class PartnerLoginErrorState extends PartnerLoginState {
  String error;
  PartnerLoginErrorState(this.error);
}

class PartnerLoginSuccessState extends PartnerLoginState {}

class PartnerLoginDialogSuccessState extends PartnerLoginState {
  dynamic partnerShopList;
  PartnerLoginDialogSuccessState(this.partnerShopList);
}

class PartnerLoginAPIFailureState extends PartnerLoginState {
  String message;
  PartnerLoginAPIFailureState(this.message);
}

class PartnerLoginSubmittingState extends PartnerLoginState {}

class PartnerBarcodeLoginSubmittingState extends PartnerLoginState {}

class PartnerLoginScreenShopNotValidState extends PartnerLoginState {}

class PartnerAlreadyLoggedInState extends PartnerLoginState {}
