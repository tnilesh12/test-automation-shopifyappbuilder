import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

part 'favorite_list_screen_event.dart';

part 'favorite_list_screen_state.dart';

class FavoriteListScreenBloc
    extends Bloc<FavoriteListScreenEvent, FavoriteListScreenState> {
  bool islogin = false;

  FavoriteListScreenBloc() : super(FavoriteListScreenInitial()) {
    on<FavoriteListScreenEvent>((event, emit) {});

    on<OnFavoriteButtonAddClick>((event, emit) async {
      //EventAddToFavorite
      if (islogin) {
        addToFavoriteApi(event.productId);
      } else {
        emit(FavoriteListScreenAPIFailureState("Please login your account"));
      }
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.ADD_FAVORITE.name);
      ////////////////////////////
    });

    on<OnFavoriteRefresh>((event, emit) {
      emit(ItemAddedRemoveUpdate(event.productListFav));
    });

    on<OnFavoriteButtonRemoveClick>((event, emit) async {
      //EventRemoveFavorite
      if (islogin) {
        removeFromFavoriteApi(event.productId);
      } else {
        emit(FavoriteListScreenAPIFailureState("Please login your account"));
      }
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.REMOVE_FAVORITE.name);
      ////////////////////////////
    });
    LoadSession();
  }

  LoadSession() async {
    islogin = await Session().IsLogin();
  }

  addToFavoriteApi(String productIds) async {
    emit(FavoriteListScreenLoading());
    ShopifyUser? shopifyUser = await Session().getLoginData();
    String customerId = shopifyUser!.id!;
    var formData = {
      "customerId": customerId,
      "productIds": [productIds]
      //"gid://shopify/Product/7846072221939","gid://shopify/Product/8168615215347"]
    };
    print("form data ${formData}");
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.addToFavorite, formData);
    if (apiResponse.status) {
      debugPrint("-------------response${apiResponse.data["result"]}");
      debugPrint(
          "----------------------------------addToFavoriteApi bloc success ");
      GetFavList();
    } else {
      debugPrint(
          "--------------------addToFavoriteApi--------------api failure bloc ");
      emit(ItemAddRemoveAPIFailureState(apiResponse.message));
    }
  }

  removeFromFavoriteApi(String productId) async {
    emit(FavoriteListScreenLoading());
    ShopifyUser? shopifyUser = await Session().getLoginData();
    String customerId = shopifyUser!.id!;
    var formData = {
      "customerId": customerId,
      "productId": productId //"4"
    };
    print("--------------..................>>>>${formData}");
    ApiResponse apiResponse =
        await ApiRepository.putAPI(ApiConst.removeFromFavorite, formData);
    if (apiResponse.status) {
      debugPrint("remove -------------response${apiResponse.data["result"]}");
      debugPrint(
          "----------------------------------removeFromFavoriteApi bloc success ");
      GetFavList();
    } else {
      debugPrint(
          "--------------------removeFromFavoriteApi--------------api failure bloc ");
      emit(ItemAddRemoveAPIFailureState(apiResponse.message));
    }
  }

  List<Product>? productListFav = [];

  GetFavList() async {
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.LIST_FAVORITE.name);
    ////////////////////////////
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
        emit(ItemAddedRemoveUpdate(productListFav));
      } catch (e) {}
    } else {}
  }
/*
  void LoadData() async {
    try {
      List<String> favoriteProducts =
          await DataBaseUtil.getFavoriteListProductsIds();
      print("favoriteProducts: ${favoriteProducts.length}");

      if (await globals.postRepository.isConnected()) {
        //  await Future.delayed(Duration.secondsPerMinute());
        _productList!.clear();
        // if (_productList!.isEmpty) {
        emit(FavoriteListScreenLoading());
        List<Product>? p =
            await ShopifyStore.instance.getProductsByIds(favoriteProducts);

        _productList!.addAll(p!);
        if (_productList == null || _productList!.length == 0) {
          emit(FavoriteListScreenNoData());
        } else {
          emit(FavoriteListScreenLoaded(_productList, false));
        }
      } else {
        emit(FavoriteListScreenNoInternet());
      }
    } catch (e) {}
  }
*/
}
