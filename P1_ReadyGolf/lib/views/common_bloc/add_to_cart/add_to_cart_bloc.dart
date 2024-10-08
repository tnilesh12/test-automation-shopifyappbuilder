import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import '/views/common_bloc/add_to_cart/add_to_cart_event.dart';
import '/views/common_bloc/add_to_cart/add_to_cart_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitialState()) {
    on<OnAddToCartButtonClick>((event, emit) {
      CheckCartStatus(event.variantId, event.sellingPlanId);
    });
    on<OnBuyNowButtonClick>((event, emit) {
      emit(AddToCartProgressState());
      CreateCartApi(event.variantId, event.sellingPlanId, true);
    });
  }

  CheckCartStatus(String variantId, String? sellingPlanId) async {
    emit(AddToCartProgressState());
    String? cartId = await Session().getCartId();
    print("------------Add to Cart Bloc--------------- cartId$cartId");
    if (cartId == "null" || cartId == "") {
      CreateCartApi(variantId, sellingPlanId, false);
    } else {
      AddToCartApi(cartId!, variantId, sellingPlanId);
    }
  }

  // CheckCartStatusNew(String variantId, String sellingPlanId) async {
  //   emit(AddToCartProgressState());
  //   String? cartId = await Session().getCartId();
  //   print("------------Add to Cart Bloc--------------- cartId$cartId");
  //   if (cartId == "null") {
  //     CreateCartApi(variantId);
  //   } else {
  //     AddToCartApi(cartId!, variantId);
  //   }
  // }

  CreateCartApi(String variantId, String? sellingPlanId, bool isbynow) async {
    String accessToken = await Session().getAccessToken();
    ShopifyUser? user = await Session().getLoginData();
    var formData;
    if (sellingPlanId == null) {
      if (accessToken == "") {
        formData = {
          "lines": [
            {"quantity": 1, "merchandiseId": variantId}
          ]
        };
      } else {
        formData = {
          "lines": [
            {"quantity": 1, "merchandiseId": variantId}
          ],
          "buyerIdentity": {
            "customerAccessToken": accessToken.toString(),
          }
        };
      }
      print("without selling plan id form data is ${formData}");
    } else {
      if (accessToken == "") {
        formData = {
          "lines": [
            {
              "quantity": 1,
              "merchandiseId": variantId,
              "sellingPlanId": sellingPlanId
            },
          ]
        };
      } else {
        formData = {
          "lines": [
            {
              "quantity": 1,
              "merchandiseId": variantId,
              "sellingPlanId": sellingPlanId
            },
          ],
          "buyerIdentity": {"customerAccessToken": accessToken.toString()}
        };
      }
      print("with selling plan id form data is ${formData}");
    }
    ApiResponse apiResponse;
    debugPrint("------------------accessToken : $accessToken---------------");
    // if (accessToken == "null") {
    //   apiResponse = await ApiRepository.postAPI(
    //       ApiConst.createCart.replaceAll("&accessToken={accessToken}", ""),
    //       formData);
    //       print("cart create if  checkout url is ${apiResponse.data.toString()}");
    // } else {
    apiResponse = await ApiRepository.postAPI(
        ApiConst.createCart.replaceAll("{accessToken}", ""), formData);
    print("cart create else checkout url is ${apiResponse.data.toString()}");
    // }
    if (apiResponse.status) {
      debugPrint(
          "-------------response${apiResponse.data["result"]["body"]["data"]["cartCreate"]["cart"]}");
      String cartId = apiResponse.data["result"]["body"]["data"]["cartCreate"]
          ["cart"]["id"];
      debugPrint("-----------------CreateCartApi---------${cartId}");
      if (isbynow == false) Session().setCartId(cartId);
      debugPrint(
          "----------------------------------CreateCartApi bloc success ");
      String url = apiResponse.data["result"]["body"]["data"]["cartCreate"]
          ["cart"]["checkoutUrl"];
      debugPrint("-----------------CreateCartApi---------${url}");

      emit(AddToCartSuccessState(isbynow ? url : ""));
    } else {
      debugPrint(
          "--------------------CreateCartApi--------------api failure bloc ");
      emit(AddToCartAPIFailureState());
    }
  }

  AddToCartApi(String cartId, String variantId, String? sellingPlanId) async {
    String accessToken = await Session().getAccessToken();

    //// FIREBASE EVENT /////////
    globals.analytics
        .logEvent(name: FireBaseEvent.CLICK_ADD_TO_CART.toString());
    ////////////////////////////

    var formData;
    if (sellingPlanId == null) {
      formData = {
        "lines": [
          {
            "quantity": 1,
            "merchandiseId":
                variantId, //"gid://shopify/ProductVariant/44754147016947",
          }
        ],
      };
    } else {
      formData = {
        "lines": [
          {
            "quantity": 1,
            "merchandiseId":
                variantId, //"gid://shopify/ProductVariant/44754147016947",
            "sellingPlanId": sellingPlanId
          }
        ]
      };
    }
    print("add to cart print ${formData}");

    ApiResponse apiResponse = await ApiRepository.postAPI(
        ApiConst.addToCart
            .replaceAll("{id}", cartId)
            .replaceAll("{accessToken}", accessToken),
        formData);
    if (apiResponse.status) {
      debugPrint(
          "-------------response${apiResponse.data["result"]["body"]["data"]["cartLinesAdd"]["cart"]}");
      debugPrint(
          "----------------------------------AddToCartApi bloc success ");
      emit(AddToCartSuccessState(""));
    } else {
      debugPrint(
          "--------------------AddToCartApi--------------api failure bloc ");
      emit(AddToCartAPIFailureState());
    }
  }
}
