import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/src/product/shopify_image/shopify_image.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ProductImageSlider extends StatelessWidget {
  final ShopifyImage images;

  const ProductImageSlider(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: AppTheme.white,
        width: MediaQuery.of(context).size.width,
        child: WidgetImage(
        
          images.originalSrc!,
          fit: AppConfig.imageFit,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        )
        // CachedNetworkImage(
        //     imageUrl:  images.originalSrc.toString(),
        //     placeholder: (context, url) =>
        //         Image.asset("", fit: BoxFit.cover),
        //     errorWidget: (context, url, error) =>
        //         Image.asset(
        //           // "assets/images/placeholder-image.jpg",
        //           AppAssets.placeholder,
        //            fit: BoxFit.cover),
        //     fit: BoxFit.cover)

        );
  }
}
