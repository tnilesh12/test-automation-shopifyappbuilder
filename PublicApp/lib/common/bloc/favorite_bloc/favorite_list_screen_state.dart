part of 'favorite_list_screen_bloc.dart';

abstract class FavoriteListScreenState  {
  const FavoriteListScreenState();
}

class FavoriteListScreenInitial extends FavoriteListScreenState {}

class FavoriteListScreenLoading extends FavoriteListScreenState {}

class FavoriteListScreenLoaded extends FavoriteListScreenState {
  List<Product>? list;
  // bool loading ;
  FavoriteListScreenLoaded(this.list);
}

class FavoriteListScreenAPIFailureState extends FavoriteListScreenState {
  String message;
  FavoriteListScreenAPIFailureState(this.message);
}

class FavoriteListScreenNoData extends FavoriteListScreenState {}


// class ItemAddedToFavorite extends FavoriteListScreenState {}
class ItemAddedRemoveUpdate extends FavoriteListScreenState {
  List<Product>? productListFav = [];
  ItemAddedRemoveUpdate(this.productListFav);
}

// class ItemRemovedFromFavorite extends FavoriteListScreenState {}

class ItemAddRemoveAPIFailureState extends FavoriteListScreenState{
  String message;
  ItemAddRemoveAPIFailureState(this.message);
}
