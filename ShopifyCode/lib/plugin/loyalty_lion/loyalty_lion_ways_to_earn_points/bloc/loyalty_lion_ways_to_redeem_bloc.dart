import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/bloc/loyalty_lion_ways_to_redeem_event.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/bloc/loyalty_lion_ways_to_redeem_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';

class LoyaltyLionWaysToRedeemBloc
    extends Bloc<LoyaltyLionWaysToRedeemEvent, LoyaltyLionWaysToRedeemState> {
      String customerMerchantId;
  LoyaltyLionWaysToRedeemBloc(this.customerMerchantId) : super(LoyaltyLionWaysToRedeemInitialState()) {
    loadWaysToRedeemData();

    on<onLoadRedeemPointsDataEvent>((event, emit) {
      loadRedeemPointsData(
          event.pointsToSpend, event.rewardId, event.customerMerchantId);
    });
  }

  String basicAuth = 'Basic ' +
      base64.encode(utf8.encode(
          '381aef579dbdd712467a65b155ff5dc5:fd6ba898f10a37854f8812f28741c99d'));

  List<dynamic>? waysToRedeemData;
  loadWaysToRedeemData() async {
    emit(LoyaltyLionWaysToRedeemLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getLoyaltyLionWaysToEarnPoints.replaceAll("{merchant_id}", customerMerchantId),
        token: basicAuth);
    if (apiResponse.status) {
      waysToRedeemData = apiResponse.data["rewards"];
      debugPrint(
          "----------------------------------bloc success---------waysToRedeemData---$waysToRedeemData------");
      emit(LoyaltyLionWaysToRedeemSuccessState(waysToRedeemData));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(LoyaltyLionWaysToRedeemAPIFailureState(apiResponse.message));
    }
  }

  dynamic? redeemPointsData;
  loadRedeemPointsData(
      int pointsToSpend, int rewardId, String customerMerchantId) async {
    emit(LoyaltyLionPointsRedeemingState());
    var formData = {
      "reward_id": rewardId
    };
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.postAPI(
        ApiConst.getLoyaltyLionRedeemPoints
            .replaceAll("{merchant_id}", customerMerchantId.toString()),
        formData,
        token: basicAuth);
    if (apiResponse.status) {
      redeemPointsData = apiResponse.data["claimed_reward"];
      debugPrint(
          "----------------------------------bloc success---------loadredeemPointsData---$redeemPointsData------");
      emit(LoyaltyLionWaysToRedeemPointsSuccessState(
          redeemPointsData, pointsToSpend));
      loadWaysToRedeemData();
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(LoyaltyLionWaysToRedeemAPIFailureState(apiResponse.message));
    }
  }
}
