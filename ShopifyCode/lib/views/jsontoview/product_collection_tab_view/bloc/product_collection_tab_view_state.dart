import 'package:shopify_code/modelClass/src/product/product.dart';

class ProductCollectionTabViewState {}

class ProductCollectionTabViewInitialState
    extends ProductCollectionTabViewState {}

class ProductCollectionTabViewLoadingState
    extends ProductCollectionTabViewState {}

class ProductCollectionTabViewLoadedState
    extends ProductCollectionTabViewState {
  List<Product>? productList;
  bool loading;
  int gridCount;
  int rowCount;
  ProductCollectionTabViewLoadedState(
      this.productList, this.loading, this.gridCount, this.rowCount);
}

class ProductCollectionTabViewNoDataState
    extends ProductCollectionTabViewState {}

class ProductCollectionTabViewAPIFailureState
    extends ProductCollectionTabViewState {
  String message;
  ProductCollectionTabViewAPIFailureState(this.message);
}
