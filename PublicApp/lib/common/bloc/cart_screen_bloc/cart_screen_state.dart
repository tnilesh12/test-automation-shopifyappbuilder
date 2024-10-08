part of 'cart_screen_bloc.dart';

abstract class CartScreenState {
  const CartScreenState();
}

class CartScreenInitial extends CartScreenState {}

class CartScreenLoading extends CartScreenState {}

class CartScreenPriceLoading extends CartScreenState {}

class CartScreenLoaded extends CartScreenState {
  final List<CartItem> cartItemList;
  final Cart cart;
  const CartScreenLoaded(this.cart, this.cartItemList);
}

class CartScreenNoData extends CartScreenState {}

class CartScreenAPIFailureState extends CartScreenState {
  String message;
  CartScreenAPIFailureState(this.message);
}
