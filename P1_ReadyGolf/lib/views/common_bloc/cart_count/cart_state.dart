class CartState {}

class CartInitialState extends CartState {}


class CartCountUpdateState extends CartState {
  int count;
  CartCountUpdateState(this.count);
  @override
  List<Object> get props => [];
}



class CartCountUpdateInitialState extends CartState {
  CartCountUpdateInitialState();
  @override
  List<Object> get props => [];
}

// class CartAPIFailureState extends CartState {
//   String message;
//   CartAPIFailureState(this.message);
// }

