import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_rewards/bloc/loyalty_lion_your_rewards_event.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_rewards/bloc/loyalty_lion_your_rewards_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';

class LoyaltyLionYourRewardsBloc extends Bloc<LoyaltyLionYourRewardsEvent, LoyaltyLionYourRewardsState> {
  String customerMerchantId;
  LoyaltyLionYourRewardsBloc(this.customerMerchantId) : super(LoyaltyLionYourRewardsInitialState()) {
      // loadYourRewardsData();
    
  }

  // String token = "int_ocPgPJzsvrSy2WS-8XJQ";
  // String pageSize = "15";


  List<dynamic>? yourRewardsData;
  // loadYourRewardsData() async {
  //   emit(LoyaltyLionYourRewardsLoadingState());
  //   ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
  //       ApiConst.getLoyaltyLionYourRewards
  //           .replaceAll("{customer_id}", customerMerchantId)
  //           .replaceAll("{page_size}", pageSize),
  //       token: token);
  //   if (apiResponse.status) {
  //     yourRewardsData = apiResponse.data["reward_fulfillments"];
  //     debugPrint(
  //         "----------------------------------bloc success---------yourRewardsData---$yourRewardsData------");
  //     emit(LoyaltyLionYourRewardsSuccessState(yourRewardsData));
  //   } else {
  //     debugPrint("----------------------------------api failure bloc ");
  //     emit(LoyaltyLionYourRewardsAPIFailureState(apiResponse.message));
  //   }
  // }
}
