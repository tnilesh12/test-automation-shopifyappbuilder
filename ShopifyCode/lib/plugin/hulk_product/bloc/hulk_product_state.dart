part of 'hulk_product_bloc.dart';

@immutable
sealed class HulkProductState {}

final class HulkProductInitialState extends HulkProductState {}

final class HulkProuctLoadingState extends HulkProductState {}

final class HulkProuctAPIFailureState extends HulkProductState {}

final class HulkProuctAPISuccessState extends HulkProductState {
  HulkProductDataModel hulkProductDataModel;
  HulkProuctAPISuccessState(this.hulkProductDataModel);
}
