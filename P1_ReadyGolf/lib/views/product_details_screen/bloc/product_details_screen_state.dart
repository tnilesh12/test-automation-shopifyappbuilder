part of 'product_details_screen_bloc.dart';

abstract class ProductDetailsScreenState {
  const ProductDetailsScreenState();
}

class ProductDetailsScreenInitial extends ProductDetailsScreenState {}

class ProductDetailsScreenLoading extends ProductDetailsScreenState {}

class ProductDetailsDataLoaded extends ProductDetailsScreenState {
  final Product product;
  final List<Product>? relatedProduct;
  final ProductVariant variant;
  ProductDetailsDataLoaded(this.product, this.relatedProduct, this.variant);
}

class ProductVariantUpdate extends ProductDetailsScreenState {
  final ProductVariant product;
  ProductVariantUpdate(this.product);
}

class ProductDetailAPIFailureState extends ProductDetailsScreenState {
  String message;
  ProductDetailAPIFailureState(this.message);
}

// class OnAddToCartButtonSuccessState extends ProductDetailsScreenState {
//   OnAddToCartButtonSuccessState();
// }
