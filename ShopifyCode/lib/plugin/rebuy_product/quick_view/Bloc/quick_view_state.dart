class QuickViewState {}

class QuickViewInitialState extends QuickViewState {}

class QuickViewSuccessState extends QuickViewState {
  dynamic quickViewDataModel;
  QuickViewSuccessState(this.quickViewDataModel);
}

class QuickViewErrorState extends QuickViewState {
  String msg;
  QuickViewErrorState(this.msg);
}

class QuickViewMessageState extends QuickViewState {
  String msg;
  QuickViewMessageState(this.msg);
}
