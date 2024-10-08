import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/bloc/loyalty_lion_your_activity_event.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/bloc/loyalty_lion_your_activity_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';

class LoyaltyLionYourActivityBloc
    extends Bloc<LoyaltyLionYourActivityEvent, LoyaltyLionYourActivityState> {
  String customerMerchantId;
  LoyaltyLionYourActivityBloc(this.customerMerchantId)
      : super(LoyaltyLionYourActivityInitialState()) {
    loadYourActivityData();
  }

  // String token = "int_ocPgPJzsvrSy2WS-8XJQ";
  String basicAuth = 'Basic ' +
      base64.encode(utf8.encode(
          '381aef579dbdd712467a65b155ff5dc5:fd6ba898f10a37854f8812f28741c99d'));

  List<dynamic>? yourActivityData;
  loadYourActivityData() async {
    emit(LoyaltyLionYourActivityLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getLoyaltyLionYourActivity
            .replaceAll("{merchant_id}", customerMerchantId.toString()),
        token: basicAuth);
    if (apiResponse.status) {
      yourActivityData = apiResponse.data["transactions"];
      debugPrint(
          "----------------------------------bloc success---------loadyourActivityData---$yourActivityData------");
      emit(LoyaltyLionYourActivitySuccessState(yourActivityData));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(LoyaltyLionYourActivityAPIFailureState(apiResponse.message));
    }
  }
}
