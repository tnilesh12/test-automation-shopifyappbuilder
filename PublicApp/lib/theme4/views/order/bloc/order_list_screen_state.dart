import 'package:shopify_code/modelClass/src/order/order.dart';

abstract class OderListScreenState {
  OderListScreenState();
}

class OderListScreenInitial extends OderListScreenState {
  List<Object?> get props => [];
}

class OderListScreenLoading extends OderListScreenState {
  List<Object?> get props => [];
}

class OderListScreenLoaded extends OderListScreenState {
  List<Order> list;
  OderListScreenLoaded(this.list);

  List<Object?> get props => [];
}

class OderListScreenNoDataFound extends OderListScreenState {
  List<Object?> get props => [];
}

class oderErrorState extends OderListScreenState {
  String error;
  oderErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OrderApiFailureState extends OderListScreenState {
  String msg;
  OrderApiFailureState(this.msg);
}
