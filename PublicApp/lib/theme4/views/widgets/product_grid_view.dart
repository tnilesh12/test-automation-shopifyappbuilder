import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_event.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/style_data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import '../../utils/theme_size.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '/theme4/views/favorite/favorite_view.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_main.dart';
import '/theme4/views/product_details_screen/widgets/easy_subscription_view.dart';
import '/theme4/views/product_details_screen/widgets/product_variant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:go_router/go_router.dart';

class ProductGridView extends StatefulWidget {
  Product product;
  BuildContext context;

  Function(String) OnClick;
  Function(String)? OnRemove;

  ProductGridView(this.context, this.product, this.OnClick, {this.OnRemove});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddToCartBloc>(
            create: (BuildContext context) => AddToCartBloc(),
          ),
          BlocProvider<StarWidgetBloc>(
            create: (BuildContext context) =>
                StarWidgetBloc(widget.product.id!),
          ),
        ],
        child: Stack(children: [
          Container(
            // width: MediaQuery.of(context).size.width*1,
            // height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: // const Color.fromRGBO(238, 237, 245,1), // Utils.getColorFromHex(cellColor), bs ye comment hata dena or check kr lena ki color kyon nhi aa raha h function check karna h bs tujhe sb jagah logic laga diya h
                  AppTheme.productGridCellColor,
              borderRadius: BorderRadius.circular(12),
            ),
            //width: 165

            // margin: EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: WidgetImage(
                        widget.product.image! ?? 'assets/no_image.png',
                        fit: AppConfig.imageFit,
                        //width: double.infinity,

                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    widget.product.title.toString(), //working
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: DashboardFontSize.subHeadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: // Colors.black
                          AppTheme.productGridCellTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                            Container(
                              // padding: EdgeInsets.only(
                              //     // left: ThemeSize.paddingLeft,
                              //     // right: ThemeSize.paddingRight,
                              //     top: 1),
                              child: PluginStarWidgetMain(
                                  widget.product.id!
                                      .replaceAll("gid://shopify/Product/", "")
                                      .toString(),
                                  (url) {}),
                            ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.black,
                          // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                          padding: EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LanguageManager.translations()['From']!,
                            //AppLocalizations.of(context)!.from,
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.ProductGridViewCardFrom, context),
                          ),
                        ),
                        Container(
                          //  color: Colors.black,
                          padding: EdgeInsets.only(left: 12, bottom: 10),
                          // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                          //  padding: EdgeInsets.all(0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            // widget.product.formattedPrice,
                            AppConfig.showMaxPriceOnProductGrid
                              ? widget.product.priceMax.toString()
                              : widget.product.priceMin
                                .toString(),  
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.ProductGridViewCardPrice, context),
                          ),
                        ),
                      ],
                    ),
                    BlocListener<AddToCartBloc, AddToCartState>(
                      listener: (context, state) {
                        if (state is AddToCartSuccessState) {
                          context.read<CartBloc>().CartCountUpdate();
                          if (globals.Settings.containsKey(
                              SettingsEnum.Auto_Navigate_To_Cart_Page.name)) {
                            context.push("/${Routes.cartScreen}");
                          } else {
                            Dialogs.SuccessAlertInOut(
                                context: context,
                                message: LanguageManager.translations()[
                                    'Itemaddedincart']!); // AppLocalizations.of(context)!.itemaddedincart);
                          }
                        }
                      },
                      child: BlocBuilder<AddToCartBloc, AddToCartState>(
                        builder: (context1, state) {
                          return Container(
                              // margin: EdgeInsets.only(right: 10),
                              // padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  ProductVariantsView(widget.product,
                                          widget.product.productVariants!.first,
                                          (item, AddToCartButton) async {
                                    print(
                                        "---${widget.product.sellingPlanGroups}-----$item-------$AddToCartButton--------------");
                                    // context.read<AddToCartBloc>().add(
                                    //     OnAddToCartButtonClick(
                                    //         item.id!));
                                    //  /*
                                    // print(
                                    //     "widget.product.sellingPlanGroups   ${widget.product.sellingPlanGroups!.length}");
                                    // print(
                                    //     "widget.product.sellingPlanGroups   ${globals.plugins.containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name)}");

                                    widget.product.sellingPlanGroups != null &&
                                            widget.product.sellingPlanGroups!
                                                .isNotEmpty &&
                                            globals.plugins.containsKey(
                                                PluginsEnum
                                                    .ITGEEKS_EASY_SUBSCRIPTION
                                                    .name)
                                        ? showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                EasySubscriptionView(
                                                    widget.product, item,
                                                    (selectedOption,
                                                        sellingPlan,
                                                        attribute) {
                                                  context.pop(true);
                                                  // debugPrint(
                                                  //     "--------------------------------------callback--------selectedOption---${selectedOption}-----selectedValueId---${sellingPlan!.id}----");
                                                  selectedOption == 1 ||
                                                          sellingPlan!.id ==
                                                              null
                                                      ? context1
                                                          .read<AddToCartBloc>()
                                                          .add(
                                                              OnAddToCartButtonClick(
                                                                  item.id!))
                                                      : context1
                                                          .read<AddToCartBloc>()
                                                          .add(OnAddToCartButtonClick(
                                                              item.id!,
                                                              sellingPlanId:
                                                                  sellingPlan
                                                                      .id));
                                                }))
                                        : context1.read<AddToCartBloc>().add(
                                            OnAddToCartButtonClick(item.id!));
                                    // Dialogs.SuccessAlertInOut(
                                    //     context: context,
                                    //     message: "Item added in cart");
                                  }, true)
                                      .ShowBottomSheet(context);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.only(right: 10, bottom: 10),
                                  child: CircleAvatar(
                                      maxRadius: 15,
                                      backgroundColor: // Colors.green, //Utils.getColorFromHex(buyNowBackgroundColor),
                                          AppTheme
                                              .productGridBuyNowBackgroundColor,
                                      child: Icon(
                                        size: 15,
                                        Icons.add,
                                        color: AppTheme
                                            .productGridBuyNowForegroundColor,
                                      ) //Utils.getColorFromHex( buyNowForegroundColor)),
                                      ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //  : Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
          //          color:Colors.amber,
          //       // border: Border.all(
          //       //     width: 0.5, color: AppTheme.borderColor!
          //       //     )
          //     ),
          //     // margin: EdgeInsets.all(2),
          //     // padding: EdgeInsets.all(0),
          //     child: ClipRRect(
          //         borderRadius:
          //             BorderRadius.circular(ThemeSize.themeBorderRadius),
          //         child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Container(
          //                   height:
          //                       ThemeSize.productGridAspectRatio(type: "Image"),
          //                   //  DashboardFontSize.imageHeightForProductCell( context),
          //                   child: ClipRRect(
          //                       borderRadius: BorderRadius.circular(
          //                           ThemeSize.themeBorderRadius),
          //                       child: WidgetImage(
          //                         widget.product.image!,
          //                         fit: AppConfig.imageFit,
          //                         width: MediaQuery.of(context).size.width,
          //                         height: MediaQuery.of(context).size.width,
          //                       ))),
          //               //widget.product.images!.length!=0 ? widget.product.images!.first.originalSrc! : "")),
          //               Expanded(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: [
          //                     Container(
          //                       // padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
          //                       padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          //                       alignment: Alignment.centerLeft,
          //                       child: Text(
          //                         widget.product.title.toString(),
          //                         maxLines: 2,
          //                         style: CustomTextTheme.getTextStyle(
          //                             MyTextStyle.ProductGridViewCardTitle,
          //                             context),
          //                         // style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //                         //     color: Colors.black, )
          //                       ),
          //                     ),
          //                     globals.plugins.containsKey(
          //                                 PluginsEnum.YOTPO_REVIEW.name) ||
          //                             globals.plugins.containsKey(
          //                                 PluginsEnum.ITGEEKS_REVIEW.name) ||
          //                             globals.plugins.containsKey(
          //                                 PluginsEnum.JUDGE_ME_REVIEW.name)
          //                         ? BlocListener<StarWidgetBloc, StarWidgetState>(
          //                             listener: (context, state) {},
          //                             child: BlocBuilder<StarWidgetBloc,
          //                                 StarWidgetState>(
          //                               builder: (context, state) {
          //                                 // context.read<StarWidgetBloc>().loadStarWidgetData(widget.product.id!);
          //                                 if (state is StarWidgetLoadedState) {
          //                                   return Container(
          //                                     margin: EdgeInsets.only(
          //                                         left: 1, right: 0, bottom: 4),
          //                                     child: StarWidget(
          //                                       (p0) {},
          //                                       false,
          //                                       14,
          //                                       initialCount: state.rating!,
          //                                     ),
          //                                   );
          //                                 } else if (state
          //                                     is StarWidgetNoDataState) {
          //                                   print(
          //                                       "----------star widget state is ${state}");
          //                                   return Container(
          //                                     margin: EdgeInsets.only(
          //                                         left: 1, right: 0, bottom: 4),
          //                                     child: StarWidget(
          //                                       (p0) => null,
          //                                       false,
          //                                       14,
          //                                       initialCount: state.rating!,
          //                                     ),
          //                                   );
          //                                 } else {
          //                                   return Container(
          //                                     margin: EdgeInsets.only(
          //                                         left: 1, right: 0, bottom: 4),
          //                                     child: StarWidget(
          //                                       (p0) => null,
          //                                       false,
          //                                       14,
          //                                       initialCount: 0,
          //                                     ),
          //                                   );
          //                                 }
          //                               },
          //                             ),
          //                           )
          //                         : Container(),
          //                     // */
          //                     Row(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Column(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           mainAxisAlignment: MainAxisAlignment.start,
          //                           children: [
          //                             Container(
          //                               // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          //                               padding: EdgeInsets.all(0),
          //                               alignment: Alignment.centerLeft,
          //                               child: Text(
          //                                 LanguageManager.translations()['From']!,
          //                                 //AppLocalizations.of(context)!.from,
          //                                 style: CustomTextTheme.getTextStyle(
          //                                     MyTextStyle.ProductGridViewCardFrom,
          //                                     context),
          //                                 // style: Theme.of(context)
          //                                 //     .textTheme
          //                                 //     .bodySmall!
          //                                 //     .copyWith(
          //                                 //         color: Colors.black.withAlpha(120),
          //                                 //         fontSize: 12,
          //                                 //         )
          //                               ),
          //                             ),
          //                             Container(
          //                               // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          //                               padding: EdgeInsets.all(0),
          //                               alignment: Alignment.centerLeft,
          //                               child: Text(
          //                                 widget.product.formattedPrice,
          //                                 style: CustomTextTheme.getTextStyle(
          //                                     MyTextStyle
          //                                         .ProductGridViewCardPrice,
          //                                     context),
          //                                 // style: Theme.of(context)
          //                                 //     .textTheme
          //                                 //     .bodyMedium!
          //                                 //     .copyWith(
          //                                 //         color: Colors.red,
          //                                 //         fontWeight: FontWeight.bold,
          //                                 //         )
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         BlocListener<AddToCartBloc, AddToCartState>(
          //                           listener: (context, state) {
          //                             if (state is AddToCartSuccessState) {
          //                               context
          //                                   .read<CartBloc>()
          //                                   .CartCountUpdate();
          //                               if (globals.Settings.containsKey(
          //                                   SettingsEnum
          //                                       .Auto_Navigate_To_Cart_Page
          //                                       .name)) {
          //                                 context.push("/${Routes.cartScreen}");
          //                               } else {
          //                                 Dialogs.SuccessAlertInOut(
          //                                     context: context,
          //                                     message: LanguageManager
          //                                             .translations()[
          //                                         'Itemaddedincart']!); // AppLocalizations.of(context)!.itemaddedincart);
          //                               }
          //                             }
          //                           },
          //                           child: BlocBuilder<AddToCartBloc,
          //                               AddToCartState>(
          //                             builder: (context1, state) {
          //                               return Container(
          //                                 // margin: EdgeInsets.only(right: 10),
          //                                 // padding: EdgeInsets.symmetric(horizontal: 10),
          //                                 margin: EdgeInsets.only(right: 4),
          //                                 decoration: BoxDecoration(
          //                                   borderRadius: BorderRadius.circular(
          //                                       ThemeSize.themeBorderRadius),
          //                                   // color: AppTheme
          //                                   //     .primaryButtonBackground!
          //                                   //     .withAlpha(100),
          //                                   border: Border.all(
          //                                     color: AppTheme.borderColor!
          //                                         .withAlpha(50),
          //                                   ),
          //                                 ),
          //                                 alignment: Alignment.centerLeft,
          //                                 child: InkWell(
          //                                   onTap: () {
          //                                     ProductVariantsView(
          //                                             widget.product,
          //                                             widget.product
          //                                                 .productVariants!.first,
          //                                             (item,
          //                                                 AddToCartButton) async {
          //                                       print(
          //                                           "---${widget.product.sellingPlanGroups}-----$item-------$AddToCartButton--------------");
          //                                       // context.read<AddToCartBloc>().add(
          //                                       //     OnAddToCartButtonClick(
          //                                       //         item.id!));
          //                                       //  /*
          //                                       // print(
          //                                       //     "widget.product.sellingPlanGroups   ${widget.product.sellingPlanGroups!.length}");
          //                                       // print(
          //                                       //     "widget.product.sellingPlanGroups   ${globals.plugins.containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name)}");

          //                                       widget.product.sellingPlanGroups !=
          //                                                   null &&
          //                                               widget
          //                                                   .product
          //                                                   .sellingPlanGroups!
          //                                                   .isNotEmpty &&
          //                                               globals.plugins.containsKey(
          //                                                   PluginsEnum
          //                                                       .ITGEEKS_EASY_SUBSCRIPTION
          //                                                       .name)
          //                                           ? showModalBottomSheet(
          //                                               context: context,
          //                                               isScrollControlled: true,
          //                                               builder: (context) =>
          //                                                   EasySubscriptionView(
          //                                                       widget.product, item,
          //                                                       (selectedOption,
          //                                                           sellingPlan, attribute) {
          //                                                     context.pop(true);
          //                                                     // debugPrint(
          //                                                     //     "--------------------------------------callback--------selectedOption---${selectedOption}-----selectedValueId---${sellingPlan!.id}----");
          //                                                     selectedOption ==
          //                                                                 1 ||
          //                                                             sellingPlan!
          //                                                                     .id ==
          //                                                                 null
          //                                                         ? context1
          //                                                             .read<
          //                                                                 AddToCartBloc>()
          //                                                             .add(OnAddToCartButtonClick(
          //                                                                 item
          //                                                                     .id!))
          //                                                         : context1
          //                                                             .read<
          //                                                                 AddToCartBloc>()
          //                                                             .add(OnAddToCartButtonClick(
          //                                                                 item
          //                                                                     .id!,
          //                                                                 sellingPlanId:
          //                                                                     sellingPlan.id));
          //                                                   }))
          //                                           : context1
          //                                               .read<AddToCartBloc>()
          //                                               .add(OnAddToCartButtonClick(item.id!));
          //                                       // Dialogs.SuccessAlertInOut(
          //                                       //     context: context,
          //                                       //     message: "Item added in cart");
          //                                     }, true)
          //                                         .ShowBottomSheet(context);
          //                                   },
          //                                   child: Container(
          //                                     padding: EdgeInsets.fromLTRB(
          //                                         15, 4, 15, 4),
          //                                     child: Text(
          //                                       LanguageManager.translations()[
          //                                           'AddtoCart']!,
          //                                       style: CustomTextTheme.getTextStyle(
          //                                               MyTextStyle
          //                                                   .ProductGridViewCardCart,
          //                                               context)
          //                                           .copyWith(
          //                                               // color: AppTheme
          //                                               //     .primaryButtonText
          //                                               ),
          //                                       // style: Theme.of(context)
          //                                       //     .textTheme
          //                                       //     .bodySmall!
          //                                       //     .copyWith(
          //                                       //         color: Colors.white,
          //                                       //         fontWeight: FontWeight.bold,
          //                                       //         fontSize: 10,
          //                                       //         )
          //                                     ),
          //                                   ),
          //                                 ),
          //                               );
          //                             },
          //                           ),
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //               )
          //             ])),
          //   ),

          Positioned(
              top: 6,
              right: 6,
              child: FavoriteView(widget.product.id!, 20, (productId) {
                widget.OnClick(widget.product.id!);
              }, OnRemove: (String p) {
                widget.OnRemove!(p);
              })),
        ]));
  }
}
