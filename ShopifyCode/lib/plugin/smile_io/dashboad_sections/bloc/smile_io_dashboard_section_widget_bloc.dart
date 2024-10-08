import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';
part 'smile_io_dashboard_section_widget_event.dart';
part 'smile_io_dashboard_section_widget_state.dart';

class SmileIoDashboardSectionWidgetBloc extends Bloc<
    SmileIoDashboardSectionWidgetEvent, SmileIoDashboardSectionWidgetState> {
  SmileIoDashboardSectionWidgetBloc()
      : super(SmileIoDashboardSectionWidgetInitialState()) {
    on<SmileIoDashboardSectionWidgetEvent>((event, emit) {});
    getView();
  }

  String token =  "Bearer " + globals.plugins[PluginsEnum.SMILEIO.name].secrets.accessToken;
  int? smileIoCustomerId;
  Map<String, dynamic>? customerData;

  void getView() async {
    bool isLogin = await Session().IsLogin();
    if (isLogin) {
      emit(SmileIoDashboardSectionWidgetLoadingState());
      getCustomerId();
    } else {
      emit(SmileIoDashboardSectionWidgetNoLoginState());
    }
  }

  getCustomerId() async {
    ShopifyUser? user = await Session().getLoginData();
    String email = user!.email!;
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoCustomerByEmailData.replaceAll("{email}", email),
        token: token);
    if (apiResponse.status) {
      debugPrint("----------------------------------bloc success");
      smileIoCustomerId = apiResponse.data["customers"][0]["id"];
      loadData(smileIoCustomerId!);
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoDashboardSectionWidgetAPIFailureState(apiResponse.message));
    }
  }

  loadData(int id) async {
    print("LoadData SmileIoScreen id  : $id");
    emit(SmileIoDashboardSectionWidgetLoadingState());
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(
        ApiConst.getSmileIoCustomerByIdData
            .replaceAll("{customer_id}", id.toString()),
        token: token);
    if (apiResponse.status) {
      debugPrint("----------------------------------bloc success");
      customerData = apiResponse.data["customer"];

      emit(SmileIoDashboardSectionWidgetDataLoadedState());
      // loadYourRewardsData();
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(SmileIoDashboardSectionWidgetAPIFailureState(apiResponse.message));
    }
  }
}
