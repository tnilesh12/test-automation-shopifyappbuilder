import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shopify_code/modelClass/src/collection/collection.dart";
import "package:shopify_code/modelClass/src/product/product.dart";
import "package:shopify_code/repository/ApiConst.dart";
import "package:shopify_code/repository/ApiRepository.dart";
import "package:shopify_code/repository/ApiResponse.dart";
import "package:shopify_code/views/jsontoview/product_collection_tab_view/bloc/product_collection_tab_view_event.dart";
import "package:shopify_code/views/jsontoview/product_collection_tab_view/bloc/product_collection_tab_view_state.dart";

class ProductCollectionTabViewBloc
    extends Bloc<ProductCollectionTabViewEvent, ProductCollectionTabViewState> {
  int index;
  String? collection_id;
  int limit;
  int column;
  ProductCollectionTabViewBloc(
      this.index, this.collection_id, this.limit, this.column)
      : super(ProductCollectionTabViewInitialState()) {
    LoadProductListAPI(index, collection_id!, limit, column);
  }

  List<Product>? _productList = [];
  int selectedIndex = 0;

  LoadProductListAPI(
      int index, String collection_id, int showItems, int column) async {
    try {
      var formData = {
        "limit": showItems,
        "sortKey": "BEST_SELLING", //sortKey,
        "reverse": false, //reverse,
        "filters": null, //filters.toString(),
        "cursor": "" //cursor
      };
      // if (_productList!.length == 0) {
      emit(ProductCollectionTabViewLoadingState());
      // }
      ApiResponse apiResponse = await ApiRepository.postAPI(
          ApiConst.getProductList.replaceAll("{c_id}",
              collection_id.replaceAll("gid://shopify/Collection/", "")),
          formData);
      debugPrint(
          "----------------------------------LoadProductListAPi bloc called ${apiResponse.status}");
      if (apiResponse.status) {
        selectedIndex = index;
        _productList!.clear();
        // debugPrint(
        //     "-------------response${apiResponse.data["result"]["body"]["data"]["node"]}");

        debugPrint(
            "----------------------------------LoadProductListAPi bloc success ");
        // if (page == 1) {
        //   _productList!.clear();
        // }
        // if (clearCursor) {
        //   cursor = null;
        // }

        Collection collection = Collection.fromGraphJson(
            apiResponse.data["result"]["body"]["data"]);
        debugPrint(
            "----------------------------------LoadProductListAPi bloc success 2");

        // _productList!.clear();

        _productList!.addAll(collection.products!.productList!);

        int length = (_productList!.length > showItems
            ? showItems
            : _productList!.length);

        int gridCount =
            length % column == 0 ? length : length - (length % column);
        int rowCount = length % column == 0 ? 0 : (length % column);

        // cursor = _productList!.length > 0 ? _productList!.last.cursor : null;
        if (_productList!.length == 0) {
          emit(ProductCollectionTabViewNoDataState());
        } else {
          emit(ProductCollectionTabViewLoadedState(
              _productList, false, gridCount, rowCount));
        }
      } else {
        debugPrint(
            "--------------------LoadProductListAPi--------------api failure bloc ");
        emit(ProductCollectionTabViewAPIFailureState(apiResponse.message));
      }
    } catch (e) {
      debugPrint(
          "----------------------------------LoadProductListAPi bloc exception ${e}");
    }
  }
}
