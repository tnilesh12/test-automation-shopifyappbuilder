part of 'shopify_media_image_bloc.dart';

class ShopifyMediaImageState {}
class ShopifyMediaImageInitial extends ShopifyMediaImageState {}
class ShopifyMediaImageLoadingState extends ShopifyMediaImageState {}
class ShopifyMediaImageNoDataOrErrorState extends ShopifyMediaImageState {}
class ShopifyMediaImageLoadedState extends ShopifyMediaImageState {
  String mediaImage;
  ShopifyMediaImageLoadedState(this.mediaImage);
}

