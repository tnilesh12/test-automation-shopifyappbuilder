import 'package:shopify_code/modelClass/boost_ai/boost_ai_model.dart';

class BoostAISearchScreenState {
  BoostAISearchScreenState();
}

class BoostAISearchScreenInitial extends BoostAISearchScreenState {}

class BoostAISearchScreenLoading extends BoostAISearchScreenState {}

// class SearchScreenSuccessState extends SearchScreenState {
//   final List<ProductModel> list;

//   SearchScreenSuccessState(this.list) {}
//   // @override
//   // List<Object> get props => [list];
// }

class BoostAISearchScreenSuccessState extends BoostAISearchScreenState {
  final BoostAISearch boostAISearch;
  BoostAISearchScreenSuccessState(this.boostAISearch);
}

class BoostAISearchScreenNoDataFound extends BoostAISearchScreenState {}

// class SearchScreenNoInternet extends SearchScreenState {
//   @override
//   List<Object> get props => [];
// }

class BoostAISearchAPIFailureState extends BoostAISearchScreenState {
  String message;
  BoostAISearchAPIFailureState(this.message);
}

class SearchScreenCollectionSuccessState extends BoostAISearchScreenState {
  SearchScreenCollectionSuccessState();
}
