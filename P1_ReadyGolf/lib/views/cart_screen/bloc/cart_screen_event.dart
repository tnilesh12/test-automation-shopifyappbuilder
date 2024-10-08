part of 'cart_screen_bloc.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();
}


class DeleteCartItem extends CartScreenEvent {
  final CartItem cartItem;

  DeleteCartItem(this.cartItem);

  @override
  // TODO: implement props
  List<Object?> get props => [cartItem];
}

class UpdateCartItem extends CartScreenEvent {
  final CartItem cartItem;
  final int count;

  UpdateCartItem(this.cartItem, this.count);

  @override
  // TODO: implement props
  List<Object?> get props => [cartItem, count];
}
