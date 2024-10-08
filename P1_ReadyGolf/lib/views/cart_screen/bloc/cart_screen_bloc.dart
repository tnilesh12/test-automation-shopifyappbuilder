import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/cart/cart.dart';
import 'package:shopify_code/modelClass/cart/cart_item.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<CartScreenEvent>((event, emit) {});

    on<DeleteCartItem>((event, emit) async {
      // await DataBaseUtil.deleteCart(event.cart);
      // totalAmount = 0;
      // LoadCartListData();
      removeCartItem(event.cartItem.id!, event.cartItem!.merchandise!.id!);
      //// FIREBASE EVENT /////////
      globals.analytics
          .logEvent(name: FireBaseEvent.REMOVE_ITEM_FROM_CART.name);
      ////////////////////////////
    });

    on<UpdateCartItem>((event, emit) async {
      // await DataBaseUtil.updateCart(event.cart);
      updateCartVariantQuantity(
          event.count, event.cartItem.id!, event.cartItem!.merchandise!.id!);
      //// FIREBASE EVENT /////////
      globals.analytics
          .logEvent(name: FireBaseEvent.UPDATE_ITEM_FROM_CART.name);
      ////////////////////////////
    });

    loadCartListData();

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_CART_SCREEN.name);
    ////////////////////////////
  }

  double totalAmount = 0;
  String formatedPrice = "";
  Cart cart = Cart();
  List<CartItem> cartItemList = [];

  updateCartVariantQuantity(
      int count, String cartLineId, String variantId) async {
    emit(CartScreenPriceLoading());
    String? cartId = await Session().getCartId();
    String accessToken = await Session().getAccessToken();
    debugPrint(
        "--------------updateCartVariantQuantity------------cartId$cartId  accessToken  $accessToken");
    var formData = {
      "lines": [
        {"id": cartLineId, "quantity": count, "merchandiseId": variantId}
      ]
    };
    ApiResponse apiResponse = await ApiRepository.putAPI(
        ApiConst.updateCartVariantQuantity
            .replaceAll("{id}", cartId!)
            .replaceAll("{accessToken}", accessToken),
        formData);
    if (apiResponse.status) {
      totalAmount = 0;
      loadCartListData();
      debugPrint(
          "----------------------------------updateCartVariantQuantity bloc success ");
    } else {
      debugPrint(
          "--------------------updateCartVariantQuantity--------------api failure bloc ");
      emit(CartScreenAPIFailureState(apiResponse.message));
    }
  }

  removeCartItem(String cartLineId, String variantId) async {
    emit(CartScreenPriceLoading());
    String? cartId = await Session().getCartId();
    String accessToken = await Session().getAccessToken();
    debugPrint(
        "--------------removeCartItem------------cartId$cartId  accessToken  $accessToken");
    var formData = {"lines": cartLineId};
    ApiResponse apiResponse = await ApiRepository.putAPI(
        ApiConst.removeCartItem
            .replaceAll("{id}", cartId!)
            .replaceAll("{accessToken}", accessToken),
        formData);
    if (apiResponse.status) {
      totalAmount = 0;
      loadCartListData();
      debugPrint(
          "----------------------------------removeCartItem bloc success ");
    } else {
      debugPrint(
          "--------------------removeCartItem--------------api failure bloc ");
      emit(CartScreenAPIFailureState(apiResponse.message));
    }
  }

  loadCartListData() async {
    if (cartItemList.length == 0) {
      emit(CartScreenLoading());
    }
    // countCart = await DataBaseUtil.getCartCount();
    String? cartId = await Session().getCartId();
    if (cartId == null || cartId == "null" || cartId == "") {
      emit(CartScreenNoData());
      return;
    }

    String accessToken = await Session().getAccessToken();
    debugPrint(
        "--------------LoadCartListData------------cartId$cartId  accessToken  $accessToken");
    ApiResponse apiResponse = await ApiRepository.getAPI(ApiConst
        .getCartDetailsById
        .replaceAll("{id}", cartId!)
        .replaceAll("{accessToken}", accessToken));
    if (apiResponse.status) {
      debugPrint(
          "-------LoadCartListData success------response${apiResponse.data["result"]["body"]["data"]["cart"]}");
      if (apiResponse.data["result"]["body"]["data"]["cart"] != null) {
        cart =
            Cart.fromJson(apiResponse.data["result"]["body"]["data"]["cart"]);
        if (cart.cartItems!.cartItemList!.isNotEmpty) {
          totalAmount = cart.cost!.subtotalAmount!.amount!;

          // Shop shop = Shop();
          formatedPrice = totalAmount.toString();
          // shop.moneyFormat!
          //     .replaceAll("{{amount}}", totalAmount.toStringAsFixed(2))
          //     .toString();

          cartItemList = cart.cartItems!.cartItemList!;
          emit(CartScreenLoaded(cart, cartItemList)); //list));
        } else {
          emit(CartScreenNoData());
        }
      } else {
        emit(CartScreenNoData());
      }
    } else {
      debugPrint(
          "--------------------LoadCartListData--------------api failure bloc ");
      emit(CartScreenAPIFailureState(apiResponse.message));
    }
  }
}
