import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
part 'product_list_screen_event.dart';
part 'product_list_screen_state.dart';

class ProductListScreenBloc
    extends Bloc<ProductListScreenEvent, ProductListScreenState> {
  String? collection_id;
  int page;
  String sortKey;
  bool reverse;
  ProductListScreenBloc(
      this.collection_id, this.page, this.sortKey, this.reverse)
      : super(ProductListScreenInitial()) {
    on<ProductListScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    if (isNumeric(collection_id!)) {
      LoadProductListAPI(collection_id!, page, sortKey, reverse);
    } else {
      getCollectionIdFromHandle();
    }
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.PRODUCT_CELL_OPEN.name);
    ////////////////////////////
  }

  List<Product>? _productList = [];
  String? cursor = "";
  // String? collection_handle;

  cursorClear() {
    cursor = null;
    _productList!.clear();
  }

  bool isNumeric(String str) {
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(str);
  }

  getCollectionIdFromHandle() async {
    try {
      if (_productList!.length == 0) {
        emit(ProductListScreenLoading());
      }
      var formData;
      ApiResponse apiResponse;

      formData = {"handle": collection_id};
      apiResponse = await ApiRepository.postAPI(
          ApiConst.getProductListByHandle, formData);

      debugPrint(
          "----------------------------------getCollectionIdFromHandle bloc called ${apiResponse.status}");
      if (apiResponse.status) {
        Collection collection = Collection.fromJson(
            apiResponse.data["result"]["body"]["data"]["collectionByHandle"]);

        // _productList!.addAll(collection.products!.productList!);
        collection_id =
            collection.id!.replaceAll("gid://shopify/Collection/", "");
        debugPrint(
            "----------------------------------getCollectionIdFromHandle bloc success----collection_id---$collection_id----");
        // if (_productList!.length == 0) {
        //   emit(ProductListScreenNoData());
        // } else {
        LoadProductListAPI(collection_id!, page, sortKey, reverse);
        // }
      } else {
        debugPrint(
            "--------------------getCollectionIdFromHandle--------------api failure bloc ");
        emit(ProductListScreenAPIFailureState(apiResponse.message));
      }
    } catch (e) {
      debugPrint(
          "----------------------------------getCollectionIdFromHandle bloc exception ${e}");
    }
  }

  LoadProductListAPI(
      String collection_id_old, int page, String sortKey, bool reverse,
      {Map<String, dynamic>? filters, bool clearCursor = false}) async {
    try {
      var formData;
      filters == null &&
              globals.Settings.containsKey(
                  SettingsEnum.Hide_Out_Of_Stock_Products)
          ? formData = {
              "limit": 10,
              "sortKey": sortKey,
              "reverse": reverse,
              "filters": {"available": true}.toString(),
              "cursor": cursor
            }
          : formData = {
              "limit": 10,
              "sortKey": sortKey,
              "reverse": reverse,
              "filters": filters.toString(),
              "cursor": cursor
            };
      if (_productList!.length == 0) {
        emit(ProductListScreenLoading());
      }
      ApiResponse apiResponse = await ApiRepository.postAPI(
          ApiConst.getProductList.replaceAll("{c_id}",
              collection_id!.replaceAll("gid://shopify/Collection/", "")),
          formData);
      debugPrint(
          "----------------------------------LoadProductListAPi bloc called ${apiResponse.status}");
      if (apiResponse.status) {
        // debugPrint(
        //     "-------------response${apiResponse.data["result"]["body"]["data"]["node"]}");

        debugPrint(
            "----------------------------------LoadProductListAPi bloc success ");
        if (page == 1) {
          _productList!.clear();
        }
        if (clearCursor) {
          cursor = null;
        }

        Collection collection = Collection.fromGraphJson(
            apiResponse.data["result"]["body"]["data"]);
        debugPrint(
            "----------------------------------LoadProductListAPi bloc success 2");

        globals.FilterHandle = collection.handle!;

        // _productList!.clear();
        _productList!.addAll(collection.products!.productList!);

        cursor = _productList!.length > 0 ? _productList!.last.cursor : null;
        if (_productList!.length == 0) {
          emit(ProductListScreenNoData());
        } else {
          emit(ProductListScreenLoaded(_productList, false));
        }
      } else {
        debugPrint(
            "--------------------LoadProductListAPi--------------api failure bloc ");
        emit(ProductListScreenAPIFailureState(apiResponse.message));
      }
    } catch (e) {
      debugPrint(
          "----------------------------------LoadProductListAPi bloc exception ${e}");
    }
  }
}
