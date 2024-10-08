import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import '/views/auth/signup/bloc/signup_event.dart';
import '/views/auth/signup/bloc/signup_state.dart';
import 'package:shopify_code/globels.dart' as globals;

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<OnSignupButtonClick>((event, emit) async {
      loadAPI(event);
    });

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.SIGNUP_PAGE.name);
    ////////////////////////////
  }

  loadAPI(OnSignupButtonClick event) async {
    emit(SignupSubmittingState());
    // ShopifyUser? shopifyUser = await Session().getShopifyUserData();
    ShopifyUser? shopifyUser = await Session().getLoginData();

    var formData = {
      "firstName": event.firstName,
      "lastName": event.lastName,
      "email": event.email,
      "password": event.password,
      "phone": event.phoneCode + event.mobile,
      "acceptsMarketing": event.acceptsMarketing
    };

    ApiResponse response = await ApiRepository.putAPI(
        ApiConst.registerCustomer.replaceAll("{id}", shopifyUser!.id!),
        formData);
    if (response.status) {
      debugPrint("-------------response${response.data["result"]}");
      shopifyUser = ShopifyUser.fromJson(response.data["result"]);
      debugPrint("-------shopifyUser --------${shopifyUser.toJson()}");
      String accessToken = response.data["result"]["accessToken"];
      debugPrint("-------accessToken --------${accessToken}");
      if (globals.plugins.containsKey(PluginsEnum.WHATSAPP.name)) {
        whatsappAPI(event.mobile);
      }
      Session().setLoginData(shopifyUser!);
      Session().setAccessToken(accessToken);
      Session().setIsLogin(true);
      debugPrint("----------------------------------signup bloc success ");
      emit(SignupSuccessState());
    } else {
      // debugPrint("-------------response${response.data["result"]}");
      debugPrint(
          "----------------------------------api failure bloc---------${response.message} ");
      emit(SignupErrorState(response.message));
    }
  }

  whatsappAPI(String mobile) async {
    var formData = {
      "messaging_product": "whatsapp",
      "to": "91$mobile",
      "type": "template",
      "template": {
        "name": "mobilify_welcome",
        "language": {"code": "en_US"}
      }
    };
    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.whatsappApi, formData);
    if (response.status) {
      debugPrint(
          "--------------whatsappAPI bloc success ------------response${response.data["result"]}");
    } else {
      debugPrint(
          "----------------------------------whatsappAPI failure bloc ${response.message}}");
    }
  }
}
