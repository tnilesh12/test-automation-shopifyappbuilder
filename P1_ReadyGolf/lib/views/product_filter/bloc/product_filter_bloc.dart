import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:shopify_code/modelClass/src/product_filter_class/product_filter.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import '../../../views/product_filter/bloc/product_filter_event.dart';
import '../../../views/product_filter/bloc/product_filter_state.dart';

class ProductFilterScreenBloc
    extends Bloc<ProductFilterScreenEvent, ProductFilterScreenState> {
  String handle = "";
  ProductFilterScreenBloc(String h) : super(ProductFilterScreenStateInitial()) {
    handle = h;
    on<ProductFilterScreenEvent>((event, emit) => {});
    on<ProductFilterIndexClickEvent>((event, emit) async {
      emit(ProductFilterScreenStateInitial());
      emit(ProductFilterScreenStateLoaded(
          data, data.values.elementAt(event.index)));
    });
    LoadData();
  }

  late Map<String, ProductFilterData> data;

  loadProductFilterData(String handle, String cursors) async {
    bool hasnext = true;
    String? cursor = cursors;

    Map<String, ProductFilterData> productFilterData = HashMap();
    do {
      var formData;
      print("---------------cursor---$cursor-------");
      cursor == null || cursor == ""
          ? formData = {"handle": handle}
          : formData = {"handle": handle, "cursor": cursor};
      ApiResponse apiResponse = await ApiRepository.postAPI(
          ApiConst.productFilterByCollectionHandle, formData);

      debugPrint(
          "----------------------------------LoadData bloc called ${apiResponse.status}");
      if (apiResponse.status) {
        debugPrint(
            "-------------response${apiResponse.data["result"]["body"]["data"]["collection"]["products"]}");
        debugPrint("----------------------------------LoadData bloc success ");

        // Collection collection = Collection.fromGraphJson(
        //     apiResponse.data["result"]["body"]["data"]);
      } else {
        debugPrint(
            "--------------------LoadData--------------api failure bloc ");
        // emit(ProductListScreenAPIFailureState(apiResponse.message));
      }

      FilterProduct data =
          FilterProduct.fromJson((apiResponse.data["result"]["body"]["data"]));
      if (data.collection == null) {
        break;
      }
      for (var temp in (data).collection!.products!.filters!) {
        ProductFilterData? pfd = productFilterData[temp.label.toString()];
        for (var d in temp.values!) {
          if (pfd == null) {
            pfd = ProductFilterData(
                temp.label.toString(), [], [], temp.type.toString());
          }
          if (pfd!.keys.contains(d.label.toString()) == false) {
            pfd!.keys.add(d.label.toString());
            pfd!.values.add(d.input.toString());
          }
        }
        productFilterData[temp.label.toString()] = pfd!;
      }
      cursor = data.collection!.products!.pageInfo!.endCursor;
      hasnext = data.collection!.products!.pageInfo!.hasNextPage!;
    } while (hasnext);

    productFilterData.forEach((key, value) {});
    return productFilterData;
  }

  LoadData() async {
    emit(ProductFilterScreenStateInitial());
    String cursor = "";
    data = await loadProductFilterData(handle, cursor);
    if (data.values.isNotEmpty)
      emit(ProductFilterScreenStateLoaded(data, data.values.elementAt(0)));
  }
}
