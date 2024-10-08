import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/cart/cart_item.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme2/utils/theme_size.dart';
import '/theme2/views/product_details_screen/product_details_screen.dart';
import 'package:go_router/go_router.dart';
import '../product_details_screen/widgets/product_item_count_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartRow extends StatelessWidget {
  CartItem cartItem;
  final Function onDelete;
  final Function(int) onUpdateQuantity;

  CartRow(this.cartItem, this.onDelete, this.onUpdateQuantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      // height: 155,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    ProductDetailsScreen productDetailsScreen =
                        ProductDetailsScreen(
                            cartItem.merchandise!.product!.id!);
                    context.push("/${Routes.productDetailsScreen}",
                        extra: productDetailsScreen);
                  },
                  child: Container(
                      // width: 100,
                      // height: 100,
                      height:
                          // ThemeSize.productListHeight(context)/3,
                          DashboardFontSize.imageHeightForProductCell(context) /
                              2,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: WidgetImage(
                        cartItem.merchandise!.image != null
                            ? cartItem.merchandise!.image!.url!
                            : AppAssets.no_image,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      )
                      //  FadeInImage.assetNetwork(
                      //   placeholder: "assets/images/placeholder-image.jpg",//AppAssets.placeholder,
                      //   // image: cart.GetVariant().image!.originalSrc.toString(),
                      //   image: cart["images"],
                      //   filterQuality: FilterQuality.high,
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                )),
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(cartItem.merchandise!.product!.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.CartRowTitle, context)
                            // style: Theme.of(context)
                            //     .textTheme
                            //     .titleSmall!
                            //     .copyWith(color: Colors.black,fontFamily: 'Cinzel')
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                              cartItem.merchandise!
                                  .title!, //.GetVariant().title.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.CartRowVariant,
                                  context) // .withAlpha(120)
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .bodySmall!
                              //     .copyWith(color: Colors.black.withAlpha(120), fontSize: 10,fontFamily: 'Cinzel')
                              ),
                        ),
                      ),
                      cartItem.sellingPlanAlloc != null
                          ? Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text(
                                        cartItem.sellingPlanAlloc!
                                                .priceAdjustments!.isEmpty
                                            ? cartItem.merchandise!.priceV2!
                                                .formattedPrice
                                                .toString()
                                            : cartItem
                                                .sellingPlanAlloc!
                                                .priceAdjustments!
                                                .first
                                                .compareAtPrice!
                                                .formattedPrice
                                                // .amount
                                                .toString(),
                                        // .GetVariant()
                                        //     .price!
                                        //     .formattedPrice
                                        //     .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: CustomTextTheme.getTextStyle(
                                                MyTextStyle.CartRowPrice,
                                                context)
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    AppTheme.priceTagColor)
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodyLarge
                                        //     ?.copyWith(
                                        //         color: Colors.black,
                                        //         fontWeight: FontWeight.bold,fontFamily: 'Cinzel')
                                        ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    cartItem
                                                .merchandise!
                                                .sellingPlanAllocations!
                                                .length >
                                            0
                                        ? Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: AppTheme.black,
                                                borderRadius: BorderRadius
                                                    .circular(ThemeSize
                                                        .themeBorderRadius)),
                                            child: Text(
                                              LanguageManager.translations()[
                                                      'save'] +
                                                  (cartItem
                                                          .sellingPlanAlloc!
                                                          .sellingPlan!
                                                          .sellingPlanListNodes!
                                                          .priceAdjustments!
                                                          .isEmpty
                                                      ? "100"
                                                      : cartItem
                                                          .sellingPlanAlloc!
                                                          .sellingPlan!
                                                          .sellingPlanListNodes!
                                                          .priceAdjustments!
                                                          .first
                                                          .adjustmentValue!
                                                          .adjustmentPercentage
                                                          .toString()) +
                                                  "%",
                                              style: TextStyle(
                                                  color: AppTheme.white,
                                                  fontSize: 10),
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        cartItem.sellingPlanAlloc!
                                                .priceAdjustments!.isEmpty
                                            ? cartItem
                                                .sellingPlanAlloc!
                                                .remainingBalanceChargeAmount!
                                                .formattedPrice
                                            : cartItem
                                                .sellingPlanAlloc!
                                                .priceAdjustments!
                                                .first
                                                .perDeliveryPrice!
                                                .formattedPrice
                                                .toString(),
                                        style: TextStyle(
                                            color: AppTheme.priceTagColor,
                                            fontWeight: FontWeight.w800))
                                  ],
                                ),
                              ),
                            )
                          : Text(
                              cartItem.merchandise!.priceV2!.formattedPrice
                                  .toString(),
                              // .GetVariant()
                              //     .price!
                              //     .formattedPrice
                              //     .toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.CartRowPrice, context)
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .bodyLarge
                              //     ?.copyWith(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.bold,fontFamily: 'Cinzel')
                              ),
                      cartItem.sellingPlanAlloc != null
                          ? Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                    cartItem.sellingPlanAlloc!.sellingPlan!
                                        .sellingPlanListNodes!.name
                                        .toString(), //.GetVariant().title.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.CartRowVariant,
                                        context) // .withAlpha(120)
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .bodySmall!
                                    //     .copyWith(color: Colors.black.withAlpha(120), fontSize: 10,fontFamily: 'Cinzel')
                                    ),
                              ),
                            )
                          : SizedBox(),
                      //  cartItem.attributes!.isNotEmpty
                      // ?
                      ListView.builder(
                          itemCount: cartItem.attributes!.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                               
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                        cartItem.attributes![index]
                                            .key, //.GetVariant().title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.CartRowVariant,
                                            context) // .withAlpha(120)
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodySmall!
                                        //     .copyWith(color: Colors.black.withAlpha(120), fontSize: 10,fontFamily: 'Cinzel')
                                        ),
                                  ),
                                   SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: Text(":"),
                                  ),
                                  Container(
                                    width: 180,
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                        cartItem.attributes![index]
                                            .value, //.GetVariant().title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        softWrap: true,

                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.CartRowVariant,
                                            context) // .withAlpha(120)
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodySmall!
                                        //     .copyWith(color: Colors.black.withAlpha(120), fontSize: 10,fontFamily: 'Cinzel')
                                        ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      // :SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                  width: 110, //70,
                                  child: ProductItemCountView(false,
                                      (updatedCount) {
                                    onUpdateQuantity.call(updatedCount);
                                  }, cartItem.quantity!, 1)),
                            ),
                            Flexible(
                              // child: IconButton(
                              //   onPressed: () async {
                              //     onDelete.call();
                              //   },
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //   ),
                              // ),
                              child: IconButton(
                                  icon: Container(
                                      width: 20,
                                      height: 20,
                                      // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                      child: SvgPicture.asset(
                                        "assets/images/delete.svg",
                                        colorFilter: ColorFilter.mode(
                                            Colors.red!, BlendMode.srcIn),
                                      )),
                                  onPressed: () {
                                    onDelete.call();
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ]),
    );
  }

  double calculatePercentage(double value, double total) {
    value = double.parse(cartItem.merchandise!.sellingPlanAllocations!.first
        .sellCart!.priceAdjustments!.first.adjustmentValue!.adjustmentPercentage
        .toString());
    total = cartItem.merchandise!.priceV2!.amount!;
    if (total == 0) {
      return 0; // To avoid division by zero
    }
    return total - ((value / 100) * total);
  }
}
