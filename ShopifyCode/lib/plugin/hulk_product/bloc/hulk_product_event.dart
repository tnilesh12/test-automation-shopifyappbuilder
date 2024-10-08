part of 'hulk_product_bloc.dart';

@immutable
sealed class HulkProductEvent {}

class onSubmitData extends HulkProductEvent {
  List<dynamic>? data;
  onSubmitData(this.data);
}
