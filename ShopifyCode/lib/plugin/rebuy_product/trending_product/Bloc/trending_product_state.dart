class TrendingProductState {}

class TrendingProductInitialState extends TrendingProductState {}

class TrendingProductSuccessState extends TrendingProductState {
  dynamic quickViewDataModel;
  TrendingProductSuccessState(this.quickViewDataModel);
}

class TrendingProductErrorState extends TrendingProductState {
  String msg;
  TrendingProductErrorState(this.msg);
}

class TrendingProductMessageState extends TrendingProductState {
  String msg;
  TrendingProductMessageState(this.msg);
}
