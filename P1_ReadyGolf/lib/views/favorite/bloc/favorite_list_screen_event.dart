part of 'favorite_list_screen_bloc.dart';

abstract class FavoriteListScreenEvent {}

class OnFavoriteButtonAddClick extends FavoriteListScreenEvent {
  final String productId;
  OnFavoriteButtonAddClick(this.productId);
}
class OnFavoriteRefresh extends FavoriteListScreenEvent {
  List<Product>? productListFav = [];

  OnFavoriteRefresh(this.productListFav);
}

class OnFavoriteButtonRemoveClick extends FavoriteListScreenEvent {
  final String productId;
  OnFavoriteButtonRemoveClick(this.productId);
}
