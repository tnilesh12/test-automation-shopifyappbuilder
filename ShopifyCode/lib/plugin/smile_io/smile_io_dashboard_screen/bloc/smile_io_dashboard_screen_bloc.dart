import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/bloc/smile_io_dashboard_screen_event.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/bloc/smile_io_dashboard_screen_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class SmileIoDashboardScreenBloc
    extends Bloc<SmileIoDashboardScreenEvent, SmileIoDashboardScreenState> {
  String email;
  SmileIoDashboardScreenBloc(this.email)
      : super(SmileIoDashboardScreenInitialState()) {
    getCustomerId();
  }

  String token =  "Bearer " + globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;
  int? smileIoCustomerId;
  Map<String, dynamic>? customerData;

  getCustomerId() async {
    print("LoadData SmileIoScreen email  : $email");
    emit(SmileIoDashboardScreenLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoCustomerByEmailData.replaceAll("{email}", email),
        token: token);
    if (apiResponse.status) {
      debugPrint("----------------------------------bloc success");
      smileIoCustomerId = apiResponse.data["customers"][0]["id"];
      loadData(smileIoCustomerId!);
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoDashboardScreenAPIFailureState(apiResponse.message));
    }
  }

  loadData(int id) async {
    print("LoadData SmileIoScreen id  : $id");
    emit(SmileIoDashboardScreenLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoCustomerByIdData
            .replaceAll("{customer_id}", id.toString()),
        token: token);
    if (apiResponse.status) {
      debugPrint("----------------------------------bloc success");
      customerData = apiResponse.data["customer"];

      emit(SmileIoDashboardScreenDataLoaded());
      loadYourRewardsData();
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoDashboardScreenAPIFailureState(apiResponse.message));
    }
  }

  int referralCount = 0;
  int rewardCount = 0;

  loadYourRewardsData() async {
    List<dynamic>? yourRewardsData;
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoYourRewards
            .replaceAll("{customer_id}", smileIoCustomerId.toString())
            .replaceAll("&page_size={page_size}", ""),
        token: token);
    if (apiResponse.status) {
      yourRewardsData = apiResponse.data["reward_fulfillments"];
      debugPrint(
          "----------------------------------bloc success---------yourRewardsData---$yourRewardsData------");
      rewardCount = yourRewardsData!.length;
      yourRewardsData!.forEach((item) {
        print(
            "--------------dfhdsfh----------------$item---------dsfds----------");
        if (item["source_description"].contains("Referred") &&
            !item["source_description"].contains("Referred by")) {
          referralCount++;
        }
      });
      emit(SmileIoDashboardScreenDataLoaded());
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoDashboardScreenDataLoaded());
    }
  }
}
