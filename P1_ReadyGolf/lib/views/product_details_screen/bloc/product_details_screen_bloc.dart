import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
part 'product_details_screen_event.dart';
part 'product_details_screen_state.dart';

class ProductDetailsScreenBloc
    extends Bloc<ProductDetailsScreenEvent, ProductDetailsScreenState> {
  final String ids;

  ProductDetailsScreenBloc(this.ids) : super(ProductDetailsScreenInitial()) {
    // on<onPriceUpdateClick>((event, emit) {});

    LoadData(ids).then((value) {
      LoadRelatedProductsData(ids);
    });

    // on<OnAddToCartButtonClick>((event, emit) {
    //   CheckCartStatus(event.variantId); //event.cart);
    // });
  }

  ProductVariant? _selectedVariant;

  Product? _product;
  List<Product>? relatedProductList = [];
  late int _qantity = 1;
  int get qantity => _qantity;

  Product get product => _product!;

  ProductVariant get selectedVariant => _selectedVariant!;

  void UpdateProductVariant(ProductVariant pv) {
    _selectedVariant = pv;
    product.tempPrice = pv.price;
    product.priceCompareUpdate = pv.compareAtPrice;
    emit(ProductVariantUpdate(pv));
    emit(ProductDetailsDataLoaded(
        product, relatedProductList, _selectedVariant!));
  }

  Future<void> LoadData(String id) async {
    print("LoadData ProductDetailsScreen product ids : ${id}");
    bool isId = true;
    emit(ProductDetailsScreenLoading());
    ApiResponse apiResponse;
    if (id.contains("gid")) {
      id = id.replaceAll("gid://shopify/Product/", "");
      apiResponse = await ApiRepository.getAPI(
          ApiConst.getProductById.replaceAll("{id}", id));
    } else {
      isId = false;
      apiResponse = await ApiRepository.getAPI(
          ApiConst.getProductByHandle.replaceAll("{product_handle}", id));
    }
    if (apiResponse.status) {
      // debugPrint(
      //     "-------------getProductById response${apiResponse.data["result"]["body"]["data"]["nodes"]}");
      debugPrint(
          "----------------------------------LoadProductsData (getProductById) bloc success");
      Product product;
      if (isId) {
        product = Product.fromJson(
            apiResponse.data["result"]["body"]["data"]["nodes"][0]);
      } else {
        product = Product.fromJson(
            apiResponse.data["result"]["body"]["data"]["productByHandle"]);
      }
      _product = product;
      print("product considering is ${_product!.id.toString()}");
      // print("product variants ${_product!.productVariants}");
      _selectedVariant = product.productVariants![0];

      emit(ProductDetailsDataLoaded(
          product, relatedProductList, _selectedVariant!));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(ProductDetailAPIFailureState(apiResponse.message));
    }
  }

  void LoadRelatedProductsData(String productId) async {
    print(
        "LoadRelatedProductsData ProductDetailsScreen product ids : ${productId}");
    var formData = {"id": productId};
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.getRelatedProductsList, formData);
    if (apiResponse.status) {
      // debugPrint(
      //     "-------------LoadRelate response${apiResponse.data["result"]["body"]["data"]["productRecommendations"]}");

      dynamic relatedProductsDataList =
          apiResponse.data["result"]["body"]["data"]["productRecommendations"];
      debugPrint(
          "----------------------------------LoadRelatedProductsData bloc success");
      if (relatedProductsDataList != null) {
        relatedProductsDataList!.forEach((product) {
          relatedProductList!.add(Product.fromJson(product));
        });
      }

      print("--------------relatedProductList $relatedProductList----");

      emit(ProductDetailsDataLoaded(
          _product!, relatedProductList, _selectedVariant!));
    } else {
      debugPrint("----------------------------------api failure bloc ");
      // emit(ProductDetailAPIFailureState(apiResponse.message));
    }
  }

  void UpdateQty(int updatedCount) {
    _qantity = updatedCount;
  }
}
