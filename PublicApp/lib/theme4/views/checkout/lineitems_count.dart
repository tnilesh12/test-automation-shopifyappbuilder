import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/cart/cart.dart';
import 'package:shopify_code/modelClass/src/checkout/checkout.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../product_details_screen/widgets/product_item_count_view.dart';

class ItemCountView {
  Widget getItemCountView(BuildContext context, Cart cart) {
    // Checkout checkout) {
    if (cart.cartItems!.cartItemList!.length == 0) {
      //lineItems == null) {
      return SizedBox.shrink();
    }

    return Container(
        // color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        // height: cart.cartItems!.cartItemList!.length * 135.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(LanguageManager.translations()['Items']!,
                  // AppLocalizations.of(context)!.items,
                  style: CustomTextTheme.getTextStyle(
                      MyTextStyle.CheckoutLineItems, context)
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .bodyLarge!
                  //     .copyWith(color: Colors.black,fontFamily: 'Cinzel'),
                  ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart.cartItems!.cartItemList!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            child: WidgetImage(
                              cart.cartItems!.cartItemList![index].merchandise!
                                  .image!.url!,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                            )
                            // .variant!.image!.originalSrc!)
                            // FadeInImage.assetNetwork(placeholder: "assets/images/placeholder-image.jpg", image: checkout.lineItems![index]
                            //         .variant!.image!.originalSrc
                            //         .toString()),
                            ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  cart.cartItems!.cartItemList![index]
                                      .merchandise!.product!.title
                                      .toString(),
                                  style: CustomTextTheme.getTextStyle(
                                      MyTextStyle.CheckoutLineItemsDefault,
                                      context),
                                  // style: Theme.of(context)
                                  //     .textTheme
                                  //     .bodySmall!
                                  //     .copyWith(color: Colors.black,fontFamily: 'Cinzel'),
                                  maxLines: 2,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                    cart.cartItems!.cartItemList![index]
                                        .merchandise!.title
                                        .toString(),
                                    style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.CheckoutLineItemsDefault,
                                        context)
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .bodySmall!
                                    //     .copyWith(color: Colors.black,fontFamily: 'Cinzel'),
                                    ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          cart
                                              .cartItems!
                                              .cartItemList![index]
                                              .merchandise!
                                              .priceV2!
                                              .formattedPrice
                                              .toString(),

                                          style: CustomTextTheme.getTextStyle(
                                              MyTextStyle
                                                  .CheckoutLineItemsDefault,
                                              context),
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .bodySmall!
                                          //     .copyWith(
                                          //         color: Colors.black,fontFamily: 'Cinzel'),
                                          maxLines: 3,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          LanguageManager.translations()['X']! +
                                              cart.cartItems!
                                                  .cartItemList![index].quantity
                                                  .toString(),
                                          style: CustomTextTheme.getTextStyle(
                                              MyTextStyle
                                                  .CheckoutLineItemsDefault,
                                              context),
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .bodySmall!
                                          //     .copyWith(
                                          //         color: Colors.black,fontFamily: 'Cinzel'),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          cart
                                              .cartItems!
                                              .cartItemList![index]
                                              .merchandise!
                                              .priceV2!
                                              .formattedPrice
                                              .toString(),
                                          style: CustomTextTheme.getTextStyle(
                                              MyTextStyle
                                                  .CheckoutLineItemsDefault,
                                              context),
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .bodySmall!
                                          //     .copyWith(
                                          //         color: Colors.black,fontFamily: 'Cinzel'),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )),
                      ],
                    ),
                    cart.cartItems!.cartItemList!.length != index + 1
                        ? Divider(
                            thickness: 1,
                          )
                        : Container(),
                  ],
                );
              },
            )
          ],
        ));
  }
}
