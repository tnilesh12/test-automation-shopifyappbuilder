import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/views/shopify_media_image/bloc/shopify_media_image_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_config/app_config.dart';

class ShopifyMediaImage extends StatelessWidget {
  String mediaImageId;
  BoxFit? fit;
  double height, width;
  ShopifyMediaImage(this.mediaImageId, {this.fit = AppConfig.imageFit, this.width = 0, this.height = 0});
  @override
  Widget build(BuildContext context) {
    // if (width != 0 || height != 0) {
    //   imageUrl = imageUrl + "&width=${width.toInt()}&height=${height.toInt()}";
    // }
    return BlocProvider(
      create: (context) => ShopifyMediaImageBloc(mediaImageId),
      child: BlocBuilder<ShopifyMediaImageBloc, ShopifyMediaImageState>(
        builder: (context, state) {
          if (state is ShopifyMediaImageLoadedState) {
            return Container(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                      child: state.mediaImage.isEmpty
                          ? Image.asset(
                              AppAssets.noImage,
                              width: double.infinity,
                              // package: 'jsontoview',
                              fit: fit,
                            )
                          : Image.network(state.mediaImage,)
                          // CachedNetworkImage(
                          //     fit: fit,
                          //     width: double.infinity,
                          //     imageUrl: state.mediaImage,
                          //     placeholder: (context, url) => Image.asset(
                          //           // 'assets/images/placeholder-image.jpg',
                          //           AppAssets.placeholder,
                          //           // package: 'jsontoview',
                          //           fit: fit,
                          //         ),
                          //     errorWidget: (context, url, error) => Image.asset(
                          //           // 'assets/images/placeholder-image.jpg',
                          //           AppAssets.noImage,
                          //           // package: 'jsontoview',
                          //           fit: fit,
                          //         ))
                          ),
                ),
              ),
            );
          }
          return Image.asset(
            AppAssets.noImage,
            width: double.infinity,
            // package: 'jsontoview',
            fit: fit,
          );
        },
      ),
    );
  }
}
