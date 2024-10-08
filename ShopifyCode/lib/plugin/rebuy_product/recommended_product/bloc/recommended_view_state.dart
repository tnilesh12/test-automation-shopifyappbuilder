class RecommendedViewState {}

class RecommendedViewInitialState extends RecommendedViewState {}

class RecommendedViewSuccessState extends RecommendedViewState {
  dynamic quickViewDataModel;
  RecommendedViewSuccessState(this.quickViewDataModel);
}

class RecommendedViewErrorState extends RecommendedViewState {
  String msg;
  RecommendedViewErrorState(this.msg);
}

class RecommendedViewMessageState extends RecommendedViewState {
  String msg;
  RecommendedViewMessageState(this.msg);
}
