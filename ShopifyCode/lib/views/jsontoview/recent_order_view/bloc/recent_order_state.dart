import 'package:shopify_code/modelClass/data_model.dart';

class RecentOrderState {}

class RecentOrderInitialState extends RecentOrderState {}

class RecentOrderSuccessState extends RecentOrderState {
  dynamic data;
  RecentOrderSuccessState(this.data);
}

class RecentOrderErrorState extends RecentOrderState {}
