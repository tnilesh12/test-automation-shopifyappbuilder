import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/views/jsontoview/recent_order_view/bloc/recent_order_event.dart';
import 'package:shopify_code/views/jsontoview/recent_order_view/bloc/recent_order_state.dart';

class RecentOrderBloc extends Bloc<RecentOrderEvent, RecentOrderState> {
  RecentOrderBloc() : super(RecentOrderInitialState()) {
    getRecentOrderData();
  }

  getRecentOrderData() async {
    ShopifyUser? customerId = await Session().getLoginData();
    print("Recent start====>");
    ApiResponse res = await ApiRepository.getAPI(
        // "customer/recent-order-details?customerId=gid://shopify/Customer/6642595332165&shop=danitges-testingstore01.myshopify.com"
        ApiConst.recentOrderApi
            .replaceAll('{id}', customerId!.shopifyId.toString())
            );

   // print("Recent running====>${res.data["result"]}");
    if (res.status) {
      print("Recent Order success====>${res.data}");
      emit(RecentOrderSuccessState(res.data["result"]));
    } else {
      print("Recent Order failed====>${res.data}");
      emit(RecentOrderErrorState());
    }
  }
}
