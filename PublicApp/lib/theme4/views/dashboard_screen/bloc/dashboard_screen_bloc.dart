import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/util/firebase_cloud_message_util.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
part 'dashboard_screen_event.dart';
part 'dashboard_screen_state.dart';

class DashboardScreenBloc
    extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  MenuDataModel? menuDataModel;
  DashboardDataItems? dashboardDataItems;
  String? myId,
      myShopifyId,
      partnerId,
      welcomeNotificationTitle = "",
      welcomeNotificationBody = "";
  ShopifyUser? shopifyUser;

  getLoginDataSession() async {
    shopifyUser = await Session().getLoginData();
    partnerId = shopifyUser!.partnerId!;
    // Future.delayed(Duration(milliseconds: 2000));
    print(
        "------------shopifyUser Dashboard screen---------------${shopifyUser!.toJson()}");
    myId = shopifyUser!.id!;
    myShopifyId = shopifyUser!.shopifyId;
    partnerId = shopifyUser!.partnerId!;
  }

  DashboardScreenBloc() : super(DashboardScreenInitialState()) {
    getLoginDataSession();
    getData();
    if (globals.partnerInfoModel.planName!.toUpperCase() != "ESSENTIALS") {
      getWelcomeMessage();
    }
    getCustomerById();

    /////////////////////
    globals.analytics.logEvent(name: FireBaseEvent.DASHBOARD.name);
    //////////////////////
  }

  getWelcomeMessage() async {
    bool isWelcomeNotificationSent =
        await Session().isWelcomeNotificationSent();
    debugPrint(
        "----------------------------------getWelcomeMessage isWelcomeNotificationSent $isWelcomeNotificationSent------- ");

    if (!isWelcomeNotificationSent) {
      var formData = {"limit": 10, "offset": 0};
      ApiResponse apiResponse =
          await ApiRepository.postAPI(ApiConst.welcomeNotification, formData);
      debugPrint(
          "----------------------------------getWelcomeMessage bloc success ");
      if (apiResponse.status) {
        debugPrint(
            "----------------------------------getWelcomeMessage ---------- ${apiResponse.data["result"]}---------- ");
        apiResponse.data["result"].forEach((notifiation) {
          if (notifiation["notificationType"] == "Welcome Notification") {
            welcomeNotificationTitle = notifiation["title"];
            welcomeNotificationBody = notifiation["body"];
            debugPrint(
                "----------------------------------getWelcomeMessage ----------welcomeNotificationTitle ${welcomeNotificationTitle} welcomeNotificationBody $welcomeNotificationBody---------- ");
            debugPrint(
                "----------------------------------getWelcomeMessage Welcome Notification data fetched------------ ");
            FirebaseCloudMessageUtil.showBigTextNotification(
                welcomeNotificationTitle!,
                welcomeNotificationBody!,
                flutterLocalNotificationsPlugin,
                "");
            Session().setWelcomeNotificationSent(true);
          }
        });
      }
    }
  }

  getData() async {
    DashboardDataModel? dashboardDataModel =
        await Session().getAppDashboardData();
    Future.delayed(Duration(milliseconds: 2000));
    dashboardDataModel!.dashboardDataItems!.map((e) {
      if (e.blockName == "Header_Block") {
        dashboardDataItems = e;
      }
    }).toList();

    print(
        "------------dashboardScreen---------------${dashboardDataModel!.toJson()}");
    menuDataModel = await Session().getAppMenuData();

    emit(DashboardScreenSuccessState(menuDataModel, dashboardDataItems));
  }

  getCustomerById() async {
    shopifyUser = await Session().getLoginData();
    String id = shopifyUser!.id!;
    debugPrint("-------getCustomerById----$id----------");
    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.getCustomerById.replaceAll("{id}", id));

    if (apiResponse.message == "Data not found." ||
        apiResponse.statusCode == "400") {
      debugPrint("-------------Data not found-------------");
      emit(DashboardScreenCustomerNotFoundState());
    }
  }
}
