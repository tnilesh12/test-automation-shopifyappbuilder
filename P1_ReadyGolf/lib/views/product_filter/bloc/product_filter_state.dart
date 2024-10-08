import 'package:shopify_code/modelClass/product_filter_data.dart';

abstract class ProductFilterScreenState {}

class ProductFilterScreenStateInitial extends ProductFilterScreenState {}

class ProductFilterScreenStateLoading extends ProductFilterScreenState {}

class ProductFilterScreenStateLoaded extends ProductFilterScreenState {
  Map<String, ProductFilterData> obj;
  ProductFilterData obje;
  ProductFilterScreenStateLoaded(this.obj, this.obje);
}

class ProductFilterScreenStateNoDataFound extends ProductFilterScreenState {}

class ProductFilterScreenAPIFailureState extends ProductFilterScreenState {
  String error;
  ProductFilterScreenAPIFailureState(this.error);
}
