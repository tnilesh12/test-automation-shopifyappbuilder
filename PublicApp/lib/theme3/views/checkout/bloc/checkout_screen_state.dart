part of 'checkout_screen_bloc.dart';

abstract class CheckoutScreenState {
  const CheckoutScreenState();
}

class CheckoutScreenInitial extends CheckoutScreenState {}

class CheckoutScreenAddressFound extends CheckoutScreenState {
  Address? addressShipping;
  Address? addressBilling;
  // Checkout checkout;
  Cart cart;
  String message;
  bool isSuccess;
  CheckoutScreenAddressFound(
      this.addressShipping, this.addressBilling, this.cart, this.message, this.isSuccess);
}

class CheckoutScreenShippinAddressNotFound extends CheckoutScreenState {}

class CheckoutScreenBillingAddressNotFound extends CheckoutScreenState {}

class CheckoutScreenLoading extends CheckoutScreenState {}

class CheckoutScreenNoDataFound extends CheckoutScreenState {}

class CheckoutScreenLoaded extends CheckoutScreenState {
  List<Order> list;
  CheckoutScreenLoaded(this.list);
}

class CheckoutError extends CheckoutScreenState {
  String message;
  CheckoutError(this.message);
}

class CheckoutScreenAPIFailureState extends CheckoutScreenState {
  String message;
  CheckoutScreenAPIFailureState(this.message);
}

class CheckoutScreenLoadingDialog extends CheckoutScreenState {}


// class CheckoutNoteAddedSuccessfullyState extends CheckoutScreenState {
//   String message;
//   CheckoutNoteAddedSuccessfullyState(this.message);
// }

// class CheckoutNoteNotAddedState extends CheckoutScreenState {
//   String message;
//   CheckoutNoteNotAddedState(this.message);
// }