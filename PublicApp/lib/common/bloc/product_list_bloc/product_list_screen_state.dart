part of 'product_list_screen_bloc.dart';

abstract class ProductListScreenState  {
  const ProductListScreenState();
}

class ProductListScreenInitial extends ProductListScreenState {
}

class ProductListScreenLoading extends ProductListScreenState {
}



class ProductListScreenLoaded extends ProductListScreenState {
  List<Product>? list;
  bool loading ;
  ProductListScreenLoaded(this.list, this.loading);
}

class ProductListScreenAPIFailureState extends ProductListScreenState {
  String message;
  ProductListScreenAPIFailureState(this.message);
}

class ProductListScreenNoData extends ProductListScreenState {}
