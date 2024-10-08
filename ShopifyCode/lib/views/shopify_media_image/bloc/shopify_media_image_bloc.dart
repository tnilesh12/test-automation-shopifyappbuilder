import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
part 'shopify_media_image_event.dart';
part 'shopify_media_image_state.dart';

class ShopifyMediaImageBloc
    extends Bloc<ShopifyMediaImageEvent, ShopifyMediaImageState> {
  String mediaImageId;
  ShopifyMediaImageBloc(this.mediaImageId) : super(ShopifyMediaImageInitial()) {
    loadMediaImage();
  }

  loadMediaImage() async {
    emit(ShopifyMediaImageLoadingState());
    mediaImageId = mediaImageId.replaceAll("gid://shopify/MediaImage/", "");

    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.mediaImageById.replaceAll("{media_image_id}", mediaImageId));

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadMediaImage bloc success ");
      if (apiResponse.data["result"]["body"]["data"]["node"] == null ||
          apiResponse.data["result"]["body"]["data"]["node"]["image"] == null ||
          apiResponse.data["result"]["body"]["data"]["node"]["image"]["url"] ==
              null) {
        emit(ShopifyMediaImageNoDataOrErrorState());
      } else {
        dynamic mediaImage =
            apiResponse.data["result"]["body"]["data"]["node"]["image"]["url"];
        emit(ShopifyMediaImageLoadedState(mediaImage));
      }
    } else {
      emit(ShopifyMediaImageNoDataOrErrorState());
    }
  }
}
