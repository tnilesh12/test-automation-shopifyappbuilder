part of 'checkout_screen_bloc.dart';

abstract class CheckoutScreenEvent {
  const CheckoutScreenEvent();
}

class CheckoutScreenApplyOfferEvent extends CheckoutScreenEvent {
  String code;
  CheckoutScreenApplyOfferEvent(this.code);
}

class CheckoutScreenRemoveOfferEvent extends CheckoutScreenEvent {
  String code;
  CheckoutScreenRemoveOfferEvent(this.code);
}

class CheckoutScreenAddressChangeEvent extends CheckoutScreenEvent {
  Address address;
  CheckoutScreenAddressChangeEvent(this.address);
}

class CheckoutScreenAddressChangeBillingEvent extends CheckoutScreenEvent {
  Address address;
  CheckoutScreenAddressChangeBillingEvent(this.address);
}

class CheckoutScreenSameAddressEvent extends CheckoutScreenEvent {}

class CheckoutScreenAddNoteEvent extends CheckoutScreenEvent {
  String note;
  CheckoutScreenAddNoteEvent(this.note);
}