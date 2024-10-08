import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/bloc/smile_io_ways_to_redeem_event.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/bloc/smile_io_ways_to_redeem_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class SmileIoWaysToRedeemBloc
    extends Bloc<SmileIoWaysToRedeemEvent, SmileIoWaysToRedeemState> {
  SmileIoWaysToRedeemBloc() : super(SmileIoWaysToRedeemInitialState()) {
    loadWaysToRedeemData();
    
    on<onLoadRedeemPointsDataEvent>((event, emit) {
      loadRedeemPointsData(event.pointsToSpend, event.pointsProductsId, event.customerId);
    });
  }

  String token =  "Bearer " + globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;

  List<dynamic>? waysToRedeemData;
  loadWaysToRedeemData() async {
    emit(SmileIoWaysToRedeemLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoWaysToRedeem,
        token: token);
    if (apiResponse.status) {
      waysToRedeemData = apiResponse.data["points_products"];
      debugPrint(
          "----------------------------------bloc success---------waysToRedeemData---$waysToRedeemData------");
      emit(SmileIoWaysToRedeemSuccessState(waysToRedeemData));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoWaysToRedeemAPIFailureState(apiResponse.message));
    }
  }

  
  dynamic? redeemPointsData;
  loadRedeemPointsData(int pointsToSpend, int pointsProductsId, int customerId) async {
    emit(SmileIoPointsRedeemingState());
    var formData = {
      "customer_id": customerId,
      "points_to_spend": pointsToSpend
    };
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.postAPI(
        ApiConst.getSmileIoRedeemPoints
            .replaceAll("{points_products_id}", pointsProductsId.toString()),
        formData,
        token: token);
    if (apiResponse.status) {
      redeemPointsData = apiResponse.data["points_purchase"];
      debugPrint(
          "----------------------------------bloc success---------loadredeemPointsData---$redeemPointsData------");
      emit(SmileIoWaysToRedeemPointsSuccessState(redeemPointsData, pointsToSpend));
      loadWaysToRedeemData();
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoWaysToRedeemAPIFailureState(apiResponse.message));
    }
  }
}
