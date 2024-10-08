import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<OnLoginButtonClick>((event, emit) async {
      loginAPI(event);
    });

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.LOGIN_PAGE.name);
    ////////////////////////////
  }

  loginAPI(OnLoginButtonClick event) async {
    emit(LoginSubmittingState());
    ShopifyUser? user = await Session().getLoginData();

    var formData = {
      "email": event.email,
      "password": event.password,
      "_id": user!.id
    };
    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.loginCustomer, formData);
    if (response.status) {
      debugPrint("-------------response${response.data["result"]}");
      // CustomerData customerData =CustomerData.fromJson(response.data["result"]);
      ShopifyUser shopifyUser = ShopifyUser.fromGraphJson(
          response.data["result"]["body"]["data"]["customer"]);
      String accessToken = response.data["result"]["accessToken"];

      debugPrint("-------shopifyUser --------${shopifyUser!.toJson()}");
      debugPrint("------------------accessToken : $accessToken---------------");

      Session().setLoginData(shopifyUser!);
      Session().setAccessToken(accessToken!);
      Session().setIsLogin(true);
      debugPrint("----------------------------------login bloc success ");
      emit(LoginSuccessState());
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(LoginErrorState(response.message));
    }
  }
}
