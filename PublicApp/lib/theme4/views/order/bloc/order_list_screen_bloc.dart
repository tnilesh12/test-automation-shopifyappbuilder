import 'package:bloc/bloc.dart';
import 'package:shopify_code/modelClass/src/order/orders/orders.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'order_list_screen_event.dart';
import 'order_list_screen_state.dart';

class OderListScreenBloc
    extends Bloc<OderListScreenEvent, OderListScreenState> {
  OderListScreenBloc() : super(OderListScreenInitial()) {
    on<OderListScreenEvent>((event, emit) async {});
    loadListData();
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_ORDER_LIST.name);
    ////////////////////////////
  }

  loadListData() async {
    emit(OderListScreenLoading());
    String accessToken = await Session().getAccessToken();
    ApiResponse response = await ApiRepository.postAPI(
        ApiConst.orderListApi.replaceAll("{accessToken}", accessToken), {});
    Orders order = Orders.fromGraphJson(
        response.data["result"]["body"]["data"]["customer"]["orders"]);
    print("--------No of orders------>" + order.orderList!.length.toString());
    if (response.status) {
      if (order.orderList!.length == 0) {
        emit(OderListScreenNoDataFound());
      } else {
        emit(OderListScreenLoaded(order.orderList!));
      }
    } else {
      emit(OrderApiFailureState(response.message));
    }
    // var token = await Session().getAccessToken();

    // List<Order>? orders = await ShopifyCheckout.instance.getAllOrders(
    //   token,
    // );

    // if (orders!.length == 0) {
    //   emit(OderListScreenNoDataFound());
    // } else {
    //   emit(OderListScreenLoaded(orders));
    // }
  }

  // void Data(Data) async {
  //   // if (await globals.postRepository.isConnected()) {
  //   //   emit(OderListScreenLoading());
  //   //   // var Product = await globals.shopifyStore.searchProducts(Data);
  //   //   List<Product> data = await globals.shopifyStore.getAllProducts();
  //   //   if (data == Null) {
  //   //     emit(OderListScreenNoDataFound());
  //   //   } else {
  //   //     emit(OderListScreenLoaded(data));
  //   //   }
  //   // } else {
  //   //   emit(OderListScreenNoInternet());
  //   // }
  // }
}
