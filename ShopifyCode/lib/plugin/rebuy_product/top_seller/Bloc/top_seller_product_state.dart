class TopSellerProductState {}

class TopSellerProductInitialState extends TopSellerProductState {}

class TopSellerProductSuccessState extends TopSellerProductState {
  dynamic quickViewDataModel;
  TopSellerProductSuccessState(this.quickViewDataModel);
}

class TopSellerProductErrorState extends TopSellerProductState {
  String msg;
  TopSellerProductErrorState(this.msg);
}

class TopSellerProductMessageState extends TopSellerProductState {
  String msg;
  TopSellerProductMessageState(this.msg);
}
