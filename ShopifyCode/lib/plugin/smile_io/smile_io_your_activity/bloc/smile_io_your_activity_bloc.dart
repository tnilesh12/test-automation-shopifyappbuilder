import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_activity/bloc/smile_io_your_activity_event.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_activity/bloc/smile_io_your_activity_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class SmileIoYourActivityBloc extends Bloc<SmileIoYourActivityEvent, SmileIoYourActivityState> {
  int customerId;
  SmileIoYourActivityBloc(this.customerId) : super(SmileIoYourActivityInitialState()) {
      loadYourActivityData();
  }

  String token =  "Bearer " + globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;

  List<dynamic>? yourActivityData;
  loadYourActivityData() async {
    emit(SmileIoYourActivityLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoYourActivity
            .replaceAll("{customer_id}", customerId.toString()),
        token: token);
    if (apiResponse.status) {
      yourActivityData = apiResponse.data["points_transactions"];
      debugPrint(
          "----------------------------------bloc success---------loadyourActivityData---$yourActivityData------");
      emit(SmileIoYourActivitySuccessState(yourActivityData));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoYourActivityAPIFailureState(apiResponse.message));
    }
  }
}
