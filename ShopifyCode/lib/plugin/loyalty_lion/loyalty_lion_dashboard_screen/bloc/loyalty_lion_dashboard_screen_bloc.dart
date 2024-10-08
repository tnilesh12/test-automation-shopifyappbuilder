import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_dashboard_screen/bloc/loyalty_lion_dashboard_screen_event.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_dashboard_screen/bloc/loyalty_lion_dashboard_screen_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class LoyaltyLionDashboardScreenBloc
    extends Bloc<LoyaltyLionDashboardScreenEvent, LoyaltyLionDashboardScreenState> {
  String email;
  LoyaltyLionDashboardScreenBloc(this.email)
      : super(LoyaltyLionDashboardScreenInitialState()) {
    getCustomerId();
  }

  // String token = globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;
  // String secret = "";
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('381aef579dbdd712467a65b155ff5dc5:fd6ba898f10a37854f8812f28741c99d'));
  String? loyaltyLionCustomerMerchantId;
  Map<String, dynamic>? customerData;

  getCustomerId() async {
    print("LoadData LoyaltyLionScreen email  : $email");
    emit(LoyaltyLionDashboardScreenLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getLoyaltyLionCustomerByEmailData.replaceAll("{email}", email),
        token: basicAuth);
    if (apiResponse.status) {
      debugPrint("----------------------------------bloc success");
      loyaltyLionCustomerMerchantId = apiResponse.data["customers"][0]["merchant_id"];
      customerData = apiResponse.data["customers"][0];
      // loadData(loyaltyLionMerchantId!);
      emit(LoyaltyLionDashboardScreenDataLoaded());
      // loadYourRewardsData();
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(LoyaltyLionDashboardScreenAPIFailureState(apiResponse.message));
    }
  }

  // loadData(int id) async {
  //   print("LoadData LoyaltyLionScreen id  : $id");
  //   emit(LoyaltyLionDashboardScreenLoadingState());
  //   ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
  //       ApiConst.getLoyaltyLionCustomerByIdData
  //           .replaceAll("{customer_id}", id.toString()),
  //       token: token);
  //   if (apiResponse.status) {
  //     debugPrint("----------------------------------bloc success");
  //     customerData = apiResponse.data["customer"];

  //     emit(LoyaltyLionDashboardScreenDataLoaded());
  //     loadYourRewardsData();
  //   } else {
  //     debugPrint("----------------------------------api failure bloc ");
  //     emit(LoyaltyLionDashboardScreenAPIFailureState(apiResponse.message));
  //   }
  // }

  int referralCount = 0;
  int rewardCount = 0;

  // loadYourRewardsData() async {
  //   List<dynamic>? yourRewardsData;
  //   ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
  //       ApiConst.getLoyaltyLionYourRewards
  //           .replaceAll("{customer_id}", loyaltyLionCustomerMerchantId.toString())
  //           .replaceAll("&page_size={page_size}", ""),
  //       token: token);
  //   if (apiResponse.status) {
  //     yourRewardsData = apiResponse.data["reward_fulfillments"];
  //     debugPrint(
  //         "----------------------------------bloc success---------yourRewardsData---$yourRewardsData------");
  //     rewardCount = yourRewardsData!.length;
  //     yourRewardsData!.forEach((item) {
  //       print(
  //           "--------------dfhdsfh----------------$item---------dsfds----------");
  //       if (item["source_description"].contains("Referred") &&
  //           !item["source_description"].contains("Referred by")) {
  //         referralCount++;
  //       }
  //     });
  //     emit(LoyaltyLionDashboardScreenDataLoaded());
  //   } else {
  //     debugPrint("----------------------------------api failure bloc ");
  //     emit(LoyaltyLionDashboardScreenDataLoaded());
  //   }
  // }
}
