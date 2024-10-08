import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/cart/cart.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import '/views/common_bloc/cart_count/cart_event.dart';
import '/views/common_bloc/cart_count/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    CartCountUpdate();
    GetFavList();
  }

  int countCart = 0;

  updateCartCount(int count) {
    countCart = count;
    debugPrint(
        "----------------------------------CartCountUpdate bloc success ");
    emit(CartCountUpdateState(countCart));
  }

  CartCountUpdate() async {
    emit(CartCountUpdateInitialState());
    // countCart = await DataBaseUtil.getCartCount();
    String? cartId = await Session().getCartId();
    String accessToken = await Session().getAccessToken();
    if (cartId == "null") {
      emit(CartCountUpdateState(0));
    } else {
      debugPrint(
          "--------------CartCountUpdate------------cartId$cartId  accessToken  $accessToken");
      ApiResponse apiResponse = await ApiRepository.getAPI(ApiConst
          .getCartDetailsById
          .replaceAll("{id}", cartId!)
          .replaceAll("{accessToken}", accessToken));
      if (apiResponse.status) {
        debugPrint(
            "-------------response${apiResponse.data["result"]["body"]["data"]["cart"]}");
        Cart cart =
            Cart.fromJson(apiResponse.data["result"]["body"]["data"]["cart"]);
        countCart = cart.cartItems!.cartItemList!.length;
        debugPrint(
            "----------------------------------CartCountUpdate bloc success ");
        emit(CartCountUpdateState(countCart));
      } else {
        debugPrint(
            "--------------------CartCountUpdate--------------api failure bloc ");
        emit(CartCountUpdateState(0));
      }
    }
  }

  List<Product>? productListFav = [];

  SetFavListUpdated(List<Product>? list) {
    productListFav = list;
  }

  GetFavList() async {
    bool islogin = await Session().IsLogin();
    if (islogin) {
      ShopifyUser? shopifyUser = await Session().getLoginData();
      String customerId = shopifyUser!.id!;
      var formData = {"customerId": customerId};
      debugPrint("--------------GetFavList------------customerId$customerId  ");
      ApiResponse apiResponse =
          await ApiRepository.postAPI(ApiConst.getFavoriteList, formData);

      if (apiResponse.status) {
        try {
          dynamic list = apiResponse.data["result"]["body"]["data"]["nodes"];
          debugPrint(
              "----------------------------------loadFavoriteListData bloc success 2");
          productListFav!.clear();
          list!.forEach((e) {
            productListFav!.add(Product.fromJson(e));
          });
        } catch (e) {}
      } else {}
    }
  }

  Future<bool> IsProductInFav(String pid,
      {List<Product>? productListFav2}) async {
    if (productListFav2 != null) {
      productListFav = productListFav2;
    }
    // print("pid.....${pid}");
    if (productListFav!.length > 0) {
      for (int i = 0; i < productListFav!.length; i++) {
        print("pid2.....${productListFav![i].id}");
        if (productListFav![i].id == pid) {
          return true;
        }
      }
    }
    return false;
  }
}
