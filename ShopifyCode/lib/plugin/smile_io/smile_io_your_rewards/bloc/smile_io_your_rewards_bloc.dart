import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_rewards/bloc/smile_io_your_rewards_event.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_rewards/bloc/smile_io_your_rewards_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class SmileIoYourRewardsBloc extends Bloc<SmileIoYourRewardsEvent, SmileIoYourRewardsState> {
  int customerId;
  SmileIoYourRewardsBloc(this.customerId) : super(SmileIoYourRewardsInitialState()) {
      loadYourRewardsData();
    
  }

  String token =  "Bearer " + globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;
  String pageSize = "15";


  List<dynamic>? yourRewardsData;
  loadYourRewardsData() async {
    emit(SmileIoYourRewardsLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoYourRewards
            .replaceAll("{customer_id}", customerId.toString())
            .replaceAll("{page_size}", pageSize),
        token: token);
    if (apiResponse.status) {
      yourRewardsData = apiResponse.data["reward_fulfillments"];
      debugPrint(
          "----------------------------------bloc success---------yourRewardsData---$yourRewardsData------");
      emit(SmileIoYourRewardsSuccessState(yourRewardsData));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoYourRewardsAPIFailureState(apiResponse.message));
    }
  }
}
