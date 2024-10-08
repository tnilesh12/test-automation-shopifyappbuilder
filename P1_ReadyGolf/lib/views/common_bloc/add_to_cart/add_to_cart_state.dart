class AddToCartState {}

class AddToCartInitialState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  String url;
  AddToCartSuccessState(this.url);
}

class AddToCartProgressState extends AddToCartState {}

class AddToCartAPIFailureState extends AddToCartState {}