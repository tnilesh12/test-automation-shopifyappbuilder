part of 'product_list_screen_bloc.dart';

abstract class ProductListScreenEvent {
  const ProductListScreenEvent();
}
class OnFilterButtonClick extends ProductListScreenEvent {
  OnFilterButtonClick();
}

class OnItemClick extends ProductListScreenEvent {
  OnItemClick();
}
