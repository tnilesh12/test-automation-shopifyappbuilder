import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/product_details_screen_bloc/product_details_screen_bloc.dart';
import 'package:publicapp/theme5/utils/theme_size.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/shopify_image/shopify_image.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme5/views/favorite/favorite_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../views/product_details_screen/widgets/product_image_slider.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';

class ProductPageSlider extends StatefulWidget {
  final Product product;

  ProductPageSlider(this.product, {super.key});

  @override
  State<ProductPageSlider> createState() => _ProductPageSliderState();
}

class _ProductPageSliderState extends State<ProductPageSlider> {
  PageController controllerImage = PageController(initialPage: 0, viewportFraction: 0.8);

  int currentIndex = 0;
  // Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
  // Color indicatorUnSelectedColor =
  //     AppTheme.primaryLightTextColor!.withAlpha(80);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];
    final List<ShopifyImage> productImg = widget.product.images!;
    String productId = widget.product.id!;
    for (ShopifyImage si in productImg) {
      pages.add(ProductImageSlider(si));
    }

    final double discountPercentage = double.parse(
        Utils.getCalculateDiscountPercentage(
                context
                            .read<ProductDetailsScreenBloc>()
                            .selectedVariant
                            .compareAtPrice ==
                        null
                    ? 0
                    : context
                        .read<ProductDetailsScreenBloc>()
                        .selectedVariant
                        .compareAtPrice!
                        .amount!,
                context
                    .read<ProductDetailsScreenBloc>()
                    .selectedVariant
                    .price!
                    .amount!)
            .toString());

    return BlocListener<ProductDetailsScreenBloc, ProductDetailsScreenState>(
      listener: (context, state) {
        if (state is ProductDetailsDataLoaded) {
          int i = 0;
          try {
            if (globals.Settings.containsKey(
                    SettingsEnum.Variant_Specific_Images.name) &&
                state.product.productVariants!.length > 1) {
              for (ShopifyImage si in productImg) {
                if (si.id == state.variant.image!.id) {
                  // controllerImage = PageController(
                  // initialPage: i, keepPage: true, viewportFraction: 1);
                  controllerImage.jumpToPage(i);
                  break;
                }
                i++;
              }
            }
          } catch (e) {}
        }
      },
      child: BlocBuilder<ProductDetailsScreenBloc, ProductDetailsScreenState>(
        builder: (context, state) {
          return Container(
              height: ThemeSize.imageHeightForProductDetailsPage(context),
              child: Stack(
                children: [
                  productImg.length != 0
                      ? Container(
                        child : ListView.builder(
                          scrollDirection: Axis.horizontal,
                        // children: pages,
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: index==0 ? 10:5, top: 5, bottom: 3),
                            width: MediaQuery.of(context).size.width * 0.80,
                          child: pages[index],
                          );
                        }
                      ))
                      //  PageView(
                      //     controller: controllerImage,
                      //     children: pages,
                      //     onPageChanged: (value) {
                      //       setState(() {
                      //         currentIndex = value;
                      //       });
                      //     },
                      //   )
                      : WidgetImage(
                          widget.product.image!,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                        ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child:FavoriteView(productId, 28, (productId) {})),
                  globals.Settings.containsKey(
                              SettingsEnum.Show_Discount_Percentage.name) &&
                          discountPercentage > 0
                      ? Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.red!,
                                border: Border.all(
                                  color: AppTheme.borderColor!.withAlpha(50),
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    discountPercentage.round().toString() + "%",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "OFF",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.white),
                                  ),
                                ],
                              )),
                        )
                      : Container(),
                  // pages.length > 1
                  //     ? Positioned(
                  //         bottom: 7,
                  //         left: MediaQuery.of(context).size.width / 2 -
                  //             (pages.length / 2 * 14),
                  //         right: MediaQuery.of(context).size.width / 2 -
                  //             (pages.length / 2 * 14),
                  //         height: 15,
                  //         child: Container(
                  //           // width: (pages.length * 15),
                  //           height: 12,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(12),
                  //             color:
                  //                 AppTheme.primaryLightTextColor!.withAlpha(30),
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: pages.asMap().entries.map((entry) {
                  //               return GestureDetector(
                  //                 onTap: () {
                  //                   controllerImage.jumpToPage(entry.key);
                  //                   // carouselController.animateToPage(entry.key),
                  //                 },
                  //                 child: Container(
                  //                   width: currentIndex == entry.key ? 7 : 7,
                  //                   height: 7,
                  //                   margin: const EdgeInsets.symmetric(
                  //                       horizontal: 3.0),
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(10),
                  //                       color: currentIndex == entry.key
                  //                           ? indicatorSelectedColor
                  //                           : indicatorUnSelectedColor),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //           ),
                  //         ))
                  //     : Container(),
                ],
              ));
        },
      ),
    );
  }
}
