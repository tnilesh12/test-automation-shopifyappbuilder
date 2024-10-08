part of 'search_screen_bloc.dart';

class SearchScreenState  {
   SearchScreenState();
}

class SearchScreenInitial extends SearchScreenState {
  @override
  List<Object> get props => [];
}

class SearchScreenLoading extends SearchScreenState {
  @override
  List<Object> get props => [];
}

// class SearchScreenSuccessState extends SearchScreenState {
//   final List<ProductModel> list;

//   SearchScreenSuccessState(this.list) {}

//   // @override
//   // List<Object> get props => [list];
// }

class PredictiveSearchScreenSuccessState extends SearchScreenState {
  final PredictiveSearchModel predictiveSearch;

  PredictiveSearchScreenSuccessState(this.predictiveSearch) 
  {}
  // List<Object> get props =>[predictiveSearch];
}

class SearchScreenNoDataFound extends SearchScreenState {
  @override
  List<Object> get props => [];
}

// class SearchScreenNoInternet extends SearchScreenState {
//   @override
//   List<Object> get props => [];
// }

class PredictiveSearchAPIFailureState extends SearchScreenState {
  String message;
  PredictiveSearchAPIFailureState(this.message);
}



class SearchScreenCollectionSuccessState extends SearchScreenState {
  SearchScreenCollectionSuccessState() {}
  @override
  List<Object> get props => [];
}

