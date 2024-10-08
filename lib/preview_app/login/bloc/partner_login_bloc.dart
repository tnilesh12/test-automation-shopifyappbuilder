import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/encrypt_decrypt.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
part 'partner_login_event.dart';
part 'partner_login_state.dart';

class PartnerLoginBloc extends Bloc<PartnerLoginEvent, PartnerLoginState> {
  PartnerLoginBloc() : super(PartnerLoginInitial()) {
    CheckLogin();
    on<OnLoginButtonClick>((event, emit) async {
      if (event.shopName != "") {
        loginAPIViaShop(event);
      } else {
        loginAPI(event);
      }
    });

    on<OnBarcodeButtonClick>((event, emit) async {
      await scanBarcode();
    });
  }

  bool isPartnerlogin = false;
  Future<void> CheckLogin() async {
    isPartnerlogin = await Session().IsPartnerLogin();
    if (isPartnerlogin) {
      emit(PartnerAlreadyLoggedInState());
    }
  }

  dynamic? partnerShopList;
  loginAPI(OnLoginButtonClick event) async {
    emit(PartnerLoginSubmittingState());
    var formData = {"email": event.email, "password": event.password};

    ApiResponse response = await ApiRepositoryWithoutBaseUrl.postAPI(
        ApiConst.partnerlogin, formData);
    if (response.status) {
      debugPrint("-------------response${response.data["result"]}");
      partnerShopList = response.data["result"];
      debugPrint(
          "--------------------------------partner--login bloc success ");

      if (partnerShopList.length == 1) {
        // AppConfig.APP_DOMAIN = response.data["result"][0]
        //     ["domain"]; //"itgeeks-mobilify.myshopify.com";
        // await Session().setShopName(response.data["result"][0]["domain"]);
        AppConfig.APP_DOMAIN = response.data["result"][0]
            ["myshopify_domain"]; //"itgeeks-mobilify.myshopify.com";
        await Session().setShopName(response.data["result"][0]["myshopify_domain"]);

        await Session().setPartnerLoginData(response.data["result"][0]);
        await Session().setPartnerIsLogin(true);
        debugPrint(
            "--------------------------------partner--loginAPIViaShop bloc success ");
        emit(PartnerLoginSuccessState());
        return;
      }

      emit(PartnerLoginDialogSuccessState(partnerShopList));
    } else {
      debugPrint(
          "----------api failure bloc--response----${response.message}------------------");
      emit(PartnerLoginErrorState(response.message));
    }
  }

  loginAPIViaShop(OnLoginButtonClick event) async {
    emit(PartnerLoginSubmittingState());
    var formData = {
      "email": event.email,
      "password": event.password,
      "shop": event.shopName
    };

    ApiResponse response = await ApiRepositoryWithoutBaseUrl.postAPI(
        ApiConst.partnerlogin, formData);
    if (response.status) {
      debugPrint("-------------response${response.data["result"]}");
      partnerShopList = response.data["result"][0];

      await Session().setPartnerLoginData(response.data["result"][0]);
      await Session().setPartnerIsLogin(true);
      debugPrint(
          "--------------------------------partner--loginAPIViaShop bloc success ");
      emit(PartnerLoginSuccessState());
    } else {
      debugPrint(
          "----------api failure bloc--response----${response.message}------------------");
      emit(PartnerLoginErrorState(response.message));
    }
  }

  Future<void> scanBarcode() async {
    emit(PartnerBarcodeLoginSubmittingState());
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ffffff", "Exit", false, ScanMode.QR);
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }
    // if (!mounted) return;

    debugPrint(
        "-------------------Scaning result... ${scanResult}-------------------");
    if (scanResult == "-1") {
      emit(PartnerLoginErrorState("Error in scanning barcode"));
      return;
    }
    scanResult = await SdecryptShopname(scanResult);
    debugPrint(
        "-------------------Scaning result... ${scanResult}-------------------");
    AppConfig.APP_DOMAIN = scanResult; //"itgeeks-mobilify.myshopify.com";
    await Session().setShopName(scanResult);
    debugPrint(
        "-------------------AppConfig.APP_DOMAIN... ${ApiConst.getPartnerInfo}-------------------");
    debugPrint(
        "-------------------AppConfig.APP_DOMAIN... ${AppConfig.APP_DOMAIN}-------------------");
    debugPrint(
        "-------------------AppConfig.APP_DOMAIN... ${ApiConst.getPartnerInfo}-------------------");
    // scanResult == "Theme1"
    //     ? {
    //         print("theme1"),
    //         Navigator.pushReplacement(context, MaterialPageRoute(
    //           builder: (context) {
    //             return ThemePreviewScreen();
    //           },
    //         ))
    //       }
    //     : scanResult == "Theme2"
    //         ? Navigator.pushReplacement(context, MaterialPageRoute(
    //             builder: (context) {
    //               return ThemePreviewScreen();
    //             },
    //           ))
    //         : scanResult == "Theme3"
    //             ? Navigator.pushReplacement(context, MaterialPageRoute(
    //                 builder: (context) {
    //                   return ThemePreviewScreen();
    //                 },
    //               ))
    //             : Navigator.pushReplacement(context, MaterialPageRoute(
    //                 builder: (context) {
    //                   return ThemePreviewScreen();
    //                 },
    //               ));
    //   await loadPartnerInfo();
    // }
    // Future<void> loadPartnerInfo() async {
    //   emit(PartnerBarcodeLoginSubmittingState());
    ApiResponse apiResponse =
        await ApiRepository.getAPI(ApiConst.getPartnerInfo);
    if (apiResponse.message == "Shop Not Valid.") {
      // runApp(NoInternetApp(message: apiResponse1.message));
      emit(PartnerLoginScreenShopNotValidState());
      return;
    }
    await Session().setPartnerLoginData(apiResponse.data["result"]);
    await Session().setPartnerIsLogin(true);
    debugPrint(
        "--------------------------------partner--barcode login bloc success--------${apiResponse.data["result"]}------------ ");
    emit(PartnerLoginSuccessState());
  }
}
