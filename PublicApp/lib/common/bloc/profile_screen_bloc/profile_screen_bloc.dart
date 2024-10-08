import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/modelClass/src/shop/privacy_policy/privacy_policy.dart';
import 'package:shopify_code/modelClass/src/shop/refund_policy/refund_policy.dart';
import 'package:shopify_code/modelClass/src/shop/terms_of_service/terms_of_service.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:package_info_plus/package_info_plus.dart';
part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  PrivacyPolicy? privacyPolicy;
  RefundPolicy? refundPolicy;
  TermsOfService? termsOfService;
  // String? name, email;
  bool? isLogin;
  String? version;
  String? apkShareUrl;

  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    getVersion();
    loadData();
    loadShareUrl();

    on<PrivacyPolicyDataLoadEvent>((event, emit) {
      privacyPolicyLoadData(); //privacy-policy data fetch
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.OPEN_PRIVACY_POLICY.name);
      ////////////////////////////
    });

    on<ReplaceReturnPolicyDataLoadEvent>((event, emit) {
      replaceReturnPolicyLoadData(); // return-Policy data fetch
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.OPEN_RETURN_POLICY.name);
      ////////////////////////////
    });

    on<TermsOfServiceDataLoadEvent>((event, emit) {
      termsOfServiceLoadData(); //termsOfService data fetch
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.OPEN_TANDC.name);
      ////////////////////////////
    });
  }

  getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }

  Refresh() async {
    print("call refresh profile page ");
    isLogin = await Session().IsLogin();
    emit(ProfileScreenLoaded());
  }

  // var isLogin;

  loadData() async {
    // ShopifyUser? shopifyUser = await Session().getLoginData();
    // name = shopifyUser!.firstName! + " " + shopifyUser!.lastName!;
    // email = shopifyUser!.email!;
    emit(ProfileScreenLoadingState());
    isLogin = await Session().IsLogin();
    print("is login ${isLogin}");

    ApiResponse apiResponse =
        await ApiRepository.getAPI(ApiConst.getShopPolicies);

    if (apiResponse.status) {
      UpdatePolicyData(apiResponse);
    }
    emit(ProfileScreenLoaded());
  }

  loadShareUrl() async {
    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(ApiConst
        .getAppStatus
        .replaceAll("{partner_id}", globals.partnerInfoModel.sId!));
    debugPrint(
        "------loadShareUrl-------${apiResponse.data["result"]}----------");
    if (apiResponse.status && apiResponse.data["result"] != null) {
      int index = 0;
      if (Platform.isAndroid) {
        index = 0;
      } else if (Platform.isIOS) {
        index = 1;
      }
      apiResponse.data["result"]["appStatus"][index]["status"].forEach((item) {
        if (item["state"] == "Live On Store") {
          apkShareUrl = item["link"];
        }
      });
      debugPrint("----apkShareUrl---$apkShareUrl-----------");
    }
    emit(ProfileScreenLoaded());
  }

  UpdatePolicyData(ApiResponse apiResponse) {
    List<dynamic> list = apiResponse.data["result"];
    for (var data in list) {
      if (data["handle"] == "privacy-policy") {
        privacyPolicy = PrivacyPolicy.fromJson(data);
      }
      if (data["handle"] == "refund-policy") {
        refundPolicy = RefundPolicy.fromJson(data);
      }
      if (data["handle"] == "terms-of-service") {
        termsOfService = TermsOfService.fromJson(data);
      }
    }
  }

//PrivacyPolicy
  privacyPolicyLoadData() async {
    if (privacyPolicy != null) {
      emit(ProfileScreenPrivacyPolicySuccessState(privacyPolicy!));
    } else {
      emit(ProfileScreenLoadingState());
      ApiResponse apiResponse =
          await ApiRepository.getAPI(ApiConst.getShopPolicies);

      if (apiResponse.status) {
        //debugPrint("-------------getPrivacyPoliciesData response${apiResponse.data["result"]}");

        // privacyPolicy = PrivacyPolicy.fromJson(apiResponse.data["result"][1]);
        UpdatePolicyData(apiResponse);
        //debugPrint("-------privacyPolicy --------${privacyPolicy!.toJson()}");

        emit(ProfileScreenPrivacyPolicySuccessState(privacyPolicy!));
      } else {
        //debugPrint("----------------------------------api failure bloc ");
        emit(ProfileScreenAPIFailureState(apiResponse.message));
      }
    }
  }

//termsOfService
  termsOfServiceLoadData() async {
    if (termsOfService != null) {
      emit(ProfileScreenTermsOfServiceSuccessState(termsOfService!));
    } else {
      emit(ProfileScreenLoadingState());
      ApiResponse apiResponse =
          await ApiRepository.getAPI(ApiConst.getShopPolicies);

      if (apiResponse.status) {
        //debugPrint("-------------getTermsOfServiceData response${apiResponse.data["result"]}");
        UpdatePolicyData(apiResponse);
        // termsOfService = TermsOfService.fromJson(apiResponse.data["result"][1]);

        //debugPrint("-------TermsOfService --------${termsOfService!.toJson()}");

        emit(ProfileScreenTermsOfServiceSuccessState(termsOfService!));
      } else {
        //debugPrint("----------------------------------api failure bloc ");
        emit(ProfileScreenAPIFailureState(apiResponse.message));
      }
    }
  }

//replaceReturnPolicy
  replaceReturnPolicyLoadData() async {
    if (refundPolicy != null) {
      emit(ProfileScreenReplaceReturnPolicySuccessState(refundPolicy!));
    } else {
      emit(ProfileScreenLoadingState());
      ApiResponse apiResponse =
          await ApiRepository.getAPI(ApiConst.getShopPolicies);

      if (apiResponse.status) {
        // debugPrint("-------------getreplaceReturnPolicyData response${apiResponse.data["result"]}");
        UpdatePolicyData(apiResponse);
        // refundPolicy = RefundPolicy.fromJson(apiResponse.data["result"][2]);

        //debugPrint("-------replaceReturnPolicy --------${refundPolicy!.toJson()}");

        emit(ProfileScreenReplaceReturnPolicySuccessState(refundPolicy!));
      } else {
        //debugPrint("----------------------------------api failure bloc ");
        emit(ProfileScreenAPIFailureState(apiResponse.message));
      }
    }
  }
}
