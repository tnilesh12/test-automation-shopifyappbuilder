import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_event.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:publicapp/common/bloc/kiwi_sizing_bloc/kiwi_sizing_bloc.dart';
import 'package:publicapp/common/bloc/kiwi_sizing_bloc/kiwi_sizing_state.dart';
import 'package:publicapp/common/bloc/product_details_screen_bloc/product_details_screen_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_main.dart';
import 'package:shopify_code/util/utils.dart';
import '../../views/rating_review/conditional_rating_and_review.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/session/session.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '../../../common/bloc/cart_count_bloc/cart_state.dart';
import '/theme4/views/common_screens/api_failure.dart';
import '/theme4/views/product_details_screen/widgets/easy_subscription_view.dart';
import '/theme4/views/shimmer/product_detail_shimmer_view.dart';
import '/theme4/views/webview_pages/webview_pages_screen.dart';
import '/theme4/views/widgets/related_product_widget.dart';
import '../auth/login/login_screen.dart';
import 'widgets/product_page_slider.dart';
import '../rating_review/rating_review_widget.dart';
import 'widgets/product_variant_view_for_details.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import '../../utils/theme_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String ids;
  bool showappbar;

  ProductDetailsScreen(this.ids, {this.showappbar = true, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isOutOfStock = false;

  @override
  void initState() {
    super.initState();
  }

  AddItemInCart(BuildContext context, String selectedVal, bool isByNow,
      List<Map<String, dynamic>>? hulkProductList) async {
    String variantId =
        await context.read<ProductDetailsScreenBloc>().selectedVariant.id!;
    String? sellingPlanId = globals.plugins
                .containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) ||
            globals.plugins.containsKey(PluginsEnum.RECHARGE)
        ? sellingPlan != null
            ? sellingPlan!.id.toString()
            : null
        : null;
    if (isByNow) {
      sellingPlanId != null && hulkProductList != null
          ? context.read<AddToCartBloc>().add(OnBuyNowButtonClick(variantId,
              sellingPlanId: sellingPlanId, hulkProductList: hulkProductList))
          : context
              .read<AddToCartBloc>()
              .add(OnBuyNowButtonClick(variantId.toString()));
    } else {
      sellingPlanId != null && hulkProductList != null
          ? context.read<AddToCartBloc>().add(OnAddToCartButtonClick(variantId,
              sellingPlanId: sellingPlanId, hulkProductList: hulkProductList))
          : sellingPlanId == null && hulkProductList != null
              ? context.read<AddToCartBloc>().add(OnAddToCartButtonClick(
                  variantId,
                  hulkProductList: hulkProductList))
              : sellingPlanId != null && hulkProductList == null
                  ? context.read<AddToCartBloc>().add(OnAddToCartButtonClick(
                      variantId,
                      sellingPlanId: sellingPlanId))
                  : context
                      .read<AddToCartBloc>()
                      .add(OnAddToCartButtonClick(variantId.toString()));
    }
  }

  // int selectedOption = 1;
  // String? dropdownvalue;
  SellingPlanListNodes? sellingPlan;

  AddToCallFunction(BuildContext context1, bool isByNow) {
    (context1.read<ProductDetailsScreenBloc>().product.sellingPlanGroups !=
                        null &&
                    globals.plugins.containsKey(
                        PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) ||
                globals.plugins.containsKey(PluginsEnum.RECHARGE)) ||
            globals.plugins.containsKey(PluginsEnum.HULK_PRODUCT_OPTION.name)
        ? showModalBottomSheet(
            context: context1,
            isScrollControlled: true,
            builder: (context) => EasySubscriptionView(
                    context1.read<ProductDetailsScreenBloc>().product,
                    context1.read<ProductDetailsScreenBloc>().selectedVariant,
                    (selectedOption, selectedVal, hulkData) {
                  context.pop(true);
                  sellingPlan = selectedVal;

                  selectedOption == 1
                      ? AddItemInCart(context1, "", isByNow, hulkData)
                      : AddItemInCart(
                          context1, sellingPlan!.id!, isByNow, hulkData);
                }))
        : AddItemInCart(context1, "", isByNow, []);
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          icon: Container(
            width: 45, //MediaQuery.of(context).size.width * 0.09,
            height: 45, //MediaQuery.of(context).size.height * 0.09,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
            child: SvgPicture.asset("assets/images/arrow-back.svg",
                colorFilter: ColorFilter.mode(
                    AppTheme.appBarTextColor!, BlendMode.srcIn)),
          ),
          onPressed: () {
            context.pop();
          }),
      actions: [
        BlocBuilder<ProductDetailsScreenBloc, ProductDetailsScreenState>(
            builder: (context1, state) {
          print(
              "productcurl is ${context1.read<ProductDetailsScreenBloc>().product.onlineStoreUrl}");
          return
              //  context1
              //             .read<ProductDetailsScreenBloc>()
              //             .product
              //             .onlineStoreUrl!
              //             .isEmpty ||
              //         context1
              //                 .read<ProductDetailsScreenBloc>()
              //                 .product
              //                 .onlineStoreUrl ==
              //             null ||
              //         context1
              //                 .read<ProductDetailsScreenBloc>()
              //                 .product
              //                 .onlineStoreUrl ==
              //             " "
              //     ? SizedBox(
              //         width: 5,
              //       )
              //     :
              Row(
            children: [
              Container(
                width: 40, //MediaQuery.of(context).size.width * 0.09,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    icon: Container(
                      width: 35, //MediaQuery.of(context).size.width * 0.09,
                      height: 35, //MediaQuery.of(context).size.height * 0.09,
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 5),
                      child: SvgPicture.asset("assets/images/share.svg",
                          colorFilter: ColorFilter.mode(
                              AppTheme.appBarTextColor!, BlendMode.srcIn)),
                    ),
                    onPressed: () {
                      Product p =
                          context1.read<ProductDetailsScreenBloc>().product;
                      // String url = "https://"+globals.partnerInfoModel.domain.toString() +
                      //     "/" +
                      //     "products"+
                      //     "/" +
                      //     p.title!.toLowerCase().replaceAll(" ", "-");
                      Share.share(p.onlineStoreUrl!);
                      // Share.share("https://itgeeks-mobilify.myshopify.com/products/beige-silk-beauty-summer-date-elegance?_pos=1&_psq=be&_ss=e&_v=1.0");
                    }),
              ),
              SizedBox(
                width: 15,
              )
            ],
          );
        }),
        Container(
          width: 40, //MediaQuery.of(context).size.width * 0.09,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              IconButton(
                  icon: Container(
                    width: 25, //MediaQuery.of(context).size.width * 0.09,
                    height: 25, //MediaQuery.of(context).size.height * 0.09,
                    // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                    child: SvgPicture.asset("assets/images/cart.svg",
                        colorFilter: ColorFilter.mode(
                            AppTheme.appBarTextColor!, BlendMode.srcIn)),
                  ),
                  onPressed: () {
                    context.push("/${Routes.cartScreen}");
                  }),
              Positioned(
                  top: 6,
                  right: 2,
                  child: CircleAvatar(
                    maxRadius: 8,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Text(
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                                context.read<CartBloc>().countCart.toString(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductDetailsScreenBloc>(
            create: (BuildContext context) =>
                ProductDetailsScreenBloc(widget.ids),
          ),
          BlocProvider(
            create: (context) => AddToCartBloc(),
          ),
          BlocProvider<KiwiSizingBloc>(
            create: (context) => KiwiSizingBloc(widget.ids),
          )
        ],
        child:
            // Text("Product Detail Page View Commented"
            BlocListener<ProductDetailsScreenBloc, ProductDetailsScreenState>(
                listener: (context1, state) {
          // if (state is ProductDetailsDataLoaded) {
          //        Dialogs.ErrorAlertInOut(context: context, message: state.message);
          // }
        }, child: BlocBuilder<ProductDetailsScreenBloc,
                    ProductDetailsScreenState>(builder: (context1, state) {
          if (state is ProductDetailAPIFailureState) {
            return Scaffold(
                extendBody: true,
                body: APIFailureScreens(
                    showButton: widget.showappbar, state.message));
          } else if (state is ProductDetailsScreenLoading) {
            return Scaffold(
              extendBody: true,
              body: ProductDetailShimmerEffects()
                  .productdetailsscreenshimmereffect(context),
            );
          } else if (state is ProductDetailsDataLoaded) {
            isOutOfStock = state.variant.availableForSale ?? false;
            ProductVariant variant =
                context1.read<ProductDetailsScreenBloc>().selectedVariant;
            return Scaffold(
                extendBodyBehindAppBar: true,
                extendBody: true,
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.only(bottom: 60.0, left: 25, right: 25),
                  height: MediaQuery.of(context).padding.bottom +
                      kBottomNavigationBarHeight,
                  child: isOutOfStock == false
                      ? Container(
                          // margin: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.appBarTextColor!
                                      .withOpacity(0.5),
                                  blurRadius: 1,
                                ),
                              ],
                              color: AppTheme.primaryButtonBackground,
                              // border: Border.all(color: AppTheme.primaryColor!),

                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      ThemeSize.themeBorderRadius),
                                  topRight: Radius.circular(
                                      ThemeSize.themeBorderRadius))),
                          // height:
                          //     MediaQuery.of(context).size.height * .07, //50 //70
                          width: MediaQuery.of(context).size.width,
                          // padding: EdgeInsets.only(
                          //     left: ThemeSize.paddingLeft,
                          //     right: ThemeSize.paddingRight,
                          //     top: 10,
                          //     bottom: 10),
                          child: Text(
                              LanguageManager.translations()[
                                  "OutofStock"], //AppLocalizations.of(context)!.outofstock,
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.ProductDetailAddToCart, context)
                              // style: TextStyle(
                              //     fontFamily: 'Cinzel',
                              //     fontSize: Theme.of(context)
                              //         .textTheme
                              //         .titleLarge!
                              //         .fontSize,
                              //     color: AppTheme.appBarTextColor)
                              ),
                        )
                      : Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 0.1),
                          //   borderRadius: BorderRadius.circular(40),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color:
                          //           AppTheme.appBarTextColor!.withOpacity(0.5),
                          //       blurRadius: 1,
                          //     ),
                          //   ],
                          //   color: AppTheme.primaryColor,
                          // ),
                          width: MediaQuery.of(context).size.width,
                          child: BlocListener<AddToCartBloc, AddToCartState>(
                            listener: (context, state) async {
                              if (state is AddToCartSuccessState) {
                                if (state.url.isEmpty) {
                                  context.read<CartBloc>().CartCountUpdate();
                                  if (globals.Settings.containsKey(SettingsEnum
                                      .Auto_Navigate_To_Cart_Page.name)) {
                                    context.push("/${Routes.cartScreen}");
                                  } else {
                                    Dialogs.SuccessAlertInOut(
                                        context: context,
                                        message: LanguageManager.translations()[
                                            "Itemaddedincart"]);
                                  }
                                } else {
                                  bool value = await (context.pushNamed(
                                      "${Routes.webCheckoutScreen}",
                                      pathParameters: {"url": state.url},
                                      extra: null)) as bool;

                                  if (value) {
                                    context.pushReplacement(
                                        "/${Routes.thanksScreen}",
                                        extra: ["", ""]);
                                  } else {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: LanguageManager.translations()[
                                            'errorinplaceorderplaceordertryagain']!);
                                  }
                                }
                              }
                            },
                            child: BlocBuilder<AddToCartBloc, AddToCartState>(
                              builder: (context, state) {
                                if (state is AddToCartProgressState)
                                  return Container(
                                    child: Center(
                                      child: Text(LanguageManager
                                          .translations()["Adding"]),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    color: AppTheme.primaryColor,
                                  );
                                else
                                  return Container(
                                    height: 80,
                                    alignment: Alignment.bottomRight,
                                    // margin: EdgeInsets.all(8.0),
                                    // decoration: BoxDecoration(
                                    //   color: AppTheme
                                    //       .secondaryButtonBackground,
                                    //   borderRadius:
                                    //       BorderRadius.circular(50),
                                    // ),
                                    child: InkWell(
                                      onTap: () {
                                        AddToCallFunction(context1, false);
                                      },
                                      child: CircleAvatar(
                                          maxRadius: 40,
                                          backgroundColor: AppTheme
                                              .productGridBuyNowBackgroundColor, // Colors.green,
                                          //Utils.getColorFromHex(buyNowBackgroundColor),
                                          child: Icon(
                                            size: 35,
                                            Icons.add,
                                            color: AppTheme
                                                .productGridBuyNowForegroundColor,
                                          ) //Utils.getColorFromHex( buyNowForegroundColor)),
                                          ),
                                    ),

                                    // IconButton(
                                    //   icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                                    //   onPressed: () async {
                                    //     AddToCallFunction(context1, false);
                                    //   },
                                    // ),
                                  );
                                //  Container(
                                //   decoration: BoxDecoration(
                                //       color:
                                //           AppTheme.primaryButtonBackground!,
                                //       borderRadius: BorderRadius.circular(40)
                                //       // border: Border.all(
                                //       //   color: AppTheme.borderColor!.withAlpha(50),
                                //       // ),
                                //       ),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.center,
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     children: [
                                //       Expanded(
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //               color: AppTheme
                                //                   .primaryButtonBackground!,
                                //               borderRadius:
                                //                   BorderRadius.circular(40)
                                //               // border: Border.all(
                                //               //   color: AppTheme.borderColor!.withAlpha(50),
                                //               // ),
                                //               ),
                                //           margin: EdgeInsets.all(8.0),
                                //           child: TextButton(
                                //             onPressed: () async {
                                //               if (await Session().IsLogin()) {
                                //                 AddToCallFunction(
                                //                     context1, true);
                                //               } else {
                                //                 bool? refresh =
                                //                     await (context.pushNamed(
                                //                         "${Routes.loginScreen}",
                                //                         pathParameters: {
                                //                           "goBack":
                                //                               true.toString()
                                //                         },
                                //                         extra: null)) as bool;

                                //                 if (refresh != null) {
                                //                   if (refresh as bool) {
                                //                     AddToCallFunction(
                                //                         context1, true);
                                //                   }
                                //                 }
                                //               }
                                //             },
                                //             child: Text(
                                //               LanguageManager.translations()[
                                //                   "buyNow"],
                                //               style: TextStyle(
                                //                 fontSize: Theme.of(context)
                                //                     .textTheme
                                //                     .titleMedium!
                                //                     .fontSize,
                                //                 color: AppTheme
                                //                     .primaryButtonText,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       // Spacer(),
                                //       Container(
                                //         alignment: Alignment.center,
                                //         margin: EdgeInsets.all(8.0),
                                //         // decoration: BoxDecoration(
                                //         //   color: AppTheme
                                //         //       .secondaryButtonBackground,
                                //         //   borderRadius:
                                //         //       BorderRadius.circular(50),
                                //         // ),
                                //         child: InkWell(
                                //           onTap: () {
                                //             AddToCallFunction(
                                //                 context1, false);
                                //           },
                                //           child: CircleAvatar(
                                //               maxRadius: 20,
                                //               backgroundColor: AppTheme
                                //                   .productGridBuyNowBackgroundColor, // Colors.green,
                                //               //Utils.getColorFromHex(buyNowBackgroundColor),
                                //               child: Icon(
                                //                 size: 15,
                                //                 Icons.add,
                                //                 color: AppTheme
                                //                     .productGridBuyNowForegroundColor,
                                //               ) //Utils.getColorFromHex( buyNowForegroundColor)),
                                //               ),
                                //         ),

                                //         // IconButton(
                                //         //   icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                                //         //   onPressed: () async {
                                //         //     AddToCallFunction(context1, false);
                                //         //   },
                                //         // ),
                                //       ),
                                //     ],
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ),
                  //       Container(
                  //           decoration: BoxDecoration(
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color:
                  //                     AppTheme.appBarTextColor!.withOpacity(0.5),
                  //                 blurRadius: 1,
                  //               ),
                  //             ],
                  //             color: AppTheme.primaryColor,
                  //             // border: Border.all(color: AppTheme.primaryColor!),
                  //             // borderRadius: BorderRadius.only(
                  //             //     topLeft: Radius.circular(
                  //             //         ThemeSize.themeBorderRadius),
                  //             //     topRight: Radius.circular(
                  //             //         ThemeSize.themeBorderRadius))
                  //           ),
                  //           width: MediaQuery.of(context).size.width,
                  //           // height:
                  //           //     MediaQuery.of(context).size.height * 7/100, //50 //70
                  //           // padding: EdgeInsets.only(
                  //           //     left: ThemeSize.paddingLeft,
                  //           //     right: ThemeSize.paddingRight,
                  //           //     top: 10,
                  //           //     bottom: 10),
                  //           child: BlocListener<AddToCartBloc, AddToCartState>(
                  //             listener: (context, state) async {
                  //               if (state is AddToCartSuccessState) {
                  //                 if (state.url.isEmpty) {
                  //                   context.read<CartBloc>().CartCountUpdate();
                  //                   if (globals.Settings.containsKey(SettingsEnum
                  //                       .Auto_Navigate_To_Cart_Page.name)) {
                  //                     context.push("/${Routes.cartScreen}");
                  //                   } else {
                  //                     Dialogs.SuccessAlertInOut(
                  //                         context: context,
                  //                         message: LanguageManager.translations()[
                  //                             "Itemaddedincart"]);
                  //                     // AppLocalizations.of(context)!.itemaddedincart);
                  //                   }
                  //                 } else {
                  //                   bool value = await (context.pushNamed(
                  //                       "${Routes.webCheckoutScreen}",
                  //                       pathParameters: {"url": state.url},
                  //                       extra: null)) as bool;

                  //                   if (value) {
                  //                     context.pushReplacement(
                  //                         "/${Routes.thanksScreen}",
                  //                         extra: ["", ""]);
                  //                   } else {
                  //                     Dialogs.ErrorAlertInOut(
                  //                         context: context,
                  //                         message: LanguageManager.translations()[
                  //                             'errorinplaceorderplaceordertryagain']!);
                  //                   }
                  //                 }
                  //               }
                  //             },
                  //             child: BlocBuilder<AddToCartBloc, AddToCartState>(
                  //                 builder: (context, state) {
                  //               if (state is AddToCartProgressState)
                  //                 return Container(
                  //                   child: Center(
                  //                     child: Text(LanguageManager.translations()[
                  //                         "Adding"]),
                  //                   ),
                  //                   // height: MediaQuery.of(context).size.width / 8.2, //50
                  //                   width: MediaQuery.of(context).size.width,
                  //                   color: AppTheme.primaryColor,
                  //                 );
                  //               else {
                  //                 return Container(
                  //                   // height: MediaQuery.of(context).size.width / 8.2, //50
                  //                   child: Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       // ProductItemCountView(true, (updatedCount) {
                  //                       //   context
                  //                       //       .read<ProductDetailsScreenBloc>()
                  //                       //       .UpdateQty(updatedCount);
                  //                       // }, 1, 0),
                  //                       Expanded(
                  //                         child: Container(
                  //                           // height: MediaQuery.of(context).size.width / 8.2, //50
                  //                           decoration: BoxDecoration(
                  //                             color: AppTheme
                  //                                 .secondaryButtonBackground!,
                  //                             // border: Border.all(
                  //                             //   color: AppTheme.borderColor!.withAlpha(50),
                  //                             // ),
                  //                           ),
                  //                           child: TextButton(
                  //                               onPressed: () async {
                  //                                 AddToCallFunction(
                  //                                     context1, false);
                  //                               },
                  //                               child: Text(
                  //                                 LanguageManager.translations()[
                  //                                     "add"],
                  //                                 // AppLocalizations.of(context)!.close,
                  //                                 style: TextStyle(
                  //                                   fontSize: Theme.of(context)
                  //                                       .textTheme
                  //                                       .titleMedium!
                  //                                       .fontSize,
                  //                                   // color: AppTheme.black
                  //                                 ).copyWith(
                  //                                     color: AppTheme
                  //                                         .secondaryButtonText),
                  //                               )),
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                         child: Container(
                  //                           // height: MediaQuery.of(context).size.width / 8.2, //50
                  //                           decoration: BoxDecoration(
                  //                             color: AppTheme
                  //                                 .primaryButtonBackground,
                  //                             // border: Border.all(
                  //                             //   color: AppTheme.borderColor!.withAlpha(50),
                  //                             // ),
                  //                           ),
                  //                           child: TextButton(
                  //                               onPressed: () async {
                  //                                 if (await Session().IsLogin()) {
                  //                                   AddToCallFunction(
                  //                                       context1, true);
                  //                                 } else {
                  //                                   bool? refresh =
                  //                                       await (context.pushNamed(
                  //                                           "${Routes.loginScreen}",
                  //                                           pathParameters: {
                  //                                             "goBack":
                  //                                                 true.toString()
                  //                                           },
                  //                                           extra: null)) as bool;

                  //                                   if (refresh != null) {
                  //                                     if (refresh as bool) {
                  //                                       AddToCallFunction(
                  //                                           context1, true);
                  //                                     }
                  //                                   }
                  //                                 }
                  //                               },
                  //                               child: Text(
                  //                                 LanguageManager.translations()[
                  //                                     "buyNow"],
                  //                                 style: TextStyle(
                  //                                   // fontFamily: 'Cinzel',
                  //                                   fontSize: Theme.of(context)
                  //                                       .textTheme
                  //                                       .titleMedium!
                  //                                       .fontSize,
                  //                                 ).copyWith(
                  //                                     color: AppTheme
                  //                                         .primaryButtonText),
                  //                               )),
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 );
                  //               }
                  //             }),
                  //           )),
                ),
                appBar: widget.showappbar ? appBar : null,
                body: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: Container(
                        // decoration: BoxDecoration(
                        //     color: AppTheme.productGridCellColor),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductPageSlider(state.product),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    globals.Settings.containsKey(SettingsEnum
                                            .Display_Vendor_Or_Brand.name)
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: ThemeSize.paddingLeft,
                                                right: ThemeSize.paddingRight,
                                                top: 20),
                                            child: Text(
                                              state.product.vendor.toString(),
                                              style:
                                                  CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .ProductDetailVendor,
                                                      context),
                                              // style: TextStyle(
                                              //     fontFamily: 'Cinzel',
                                              //     fontSize: Theme.of(context)
                                              //         .textTheme
                                              //         .labelMedium!
                                              //         .fontSize,
                                              //     color: AppTheme.black),
                                              textAlign: TextAlign.start,
                                            ),
                                          )
                                        : Container(),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: ThemeSize.paddingLeft,
                                          right: ThemeSize.paddingRight,
                                          top: 2),
                                      child: Text(
                                          state.product.title.toString(),
                                          style: CustomTextTheme.getTextStyle(
                                                  MyTextStyle
                                                      .ProductDetailTitle,
                                                  context)
                                              .copyWith(fontSize: 14)
                                          // style: TextStyle(
                                          //     fontFamily: 'Cinzel',
                                          //     fontSize: Theme.of(context)
                                          //         .textTheme
                                          //         .titleLarge!
                                          //         .fontSize,
                                          //     color: AppTheme.black),
                                          ),
                                    ),
                                    globals.Settings.containsKey(SettingsEnum
                                                .Display_SKU.name) &&
                                            state.variant.sku!.isNotEmpty
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: ThemeSize.paddingLeft,
                                                right: ThemeSize.paddingRight,
                                                top: 2),
                                            child: Text(
                                              "SKU ${state.variant.sku!}",
                                              style: TextStyle(fontSize: 14),
                                              // style: TextStyle(
                                              //     fontFamily: 'Cinzel',
                                              //     fontSize: Theme.of(context)
                                              //         .textTheme
                                              //         .labelMedium!
                                              //         .fontSize,
                                              //     color: AppTheme.black),
                                              textAlign: TextAlign.start,
                                            ),
                                          )
                                        : Container(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    globals.Settings.containsKey(SettingsEnum
                                            .Display_Price_One_Below_The_Other
                                            .name)
                                        ? Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                  left: ThemeSize.paddingLeft,
                                                  right: ThemeSize.paddingRight,
                                                ),
                                                child: Text(
                                                    state.product.tempPrice ==
                                                            null
                                                        ? state.product
                                                            .formattedPrice
                                                            .toString()
                                                        : state
                                                            .product
                                                            .tempPrice!
                                                            .formattedPrice
                                                            .toString(),
                                                    style: CustomTextTheme
                                                        .getTextStyle(
                                                            MyTextStyle
                                                                .ProductDetailPrice,
                                                            context)),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: ThemeSize.paddingLeft,
                                                    right:
                                                        ThemeSize.paddingRight,
                                                    bottom: 8),
                                                child: Text(
                                                    state.product
                                                                .priceCompareUpdate ==
                                                            null
                                                        ? state.product
                                                            .formattedPriceCompare
                                                            .toString()
                                                        : state
                                                            .product
                                                            .priceCompareUpdate!
                                                            .formattedPrice,
                                                    style: CustomTextTheme
                                                            .getTextStyle(
                                                                MyTextStyle
                                                                    .ProductDetailDefault,
                                                                context)
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            decorationColor:
                                                                AppTheme
                                                                    .priceTagColor)),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: ThemeSize.paddingLeft,
                                                    right:
                                                        ThemeSize.paddingRight,
                                                    bottom: 5),
                                                child: Text(
                                                    state.product.tempPrice ==
                                                            null
                                                        ? state.product
                                                            .formattedPrice
                                                            .toString()
                                                        : state
                                                            .product
                                                            .tempPrice!
                                                            .formattedPrice
                                                            .toString(),
                                                    style: CustomTextTheme
                                                        .getTextStyle(
                                                            MyTextStyle
                                                                .ProductDetailPrice,
                                                            context)),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10, bottom: 5),
                                                child: Text(
                                                    state.product
                                                                .priceCompareUpdate ==
                                                            null
                                                        ? state.product
                                                            .formattedPriceCompare
                                                            .toString()
                                                        : state
                                                            .product
                                                            .priceCompareUpdate!
                                                            .formattedPrice,
                                                    style: CustomTextTheme
                                                            .getTextStyle(
                                                                MyTextStyle
                                                                    .ProductDetailDefault,
                                                                context)
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            decorationColor:
                                                                AppTheme
                                                                    .priceTagColor)),
                                              ),
                                            ],
                                          ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: ThemeSize.paddingLeft,
                                          right: ThemeSize.paddingRight,
                                          top: 1),
                                      child: PluginStarWidgetMain(
                                          state.product.id!
                                              .replaceAll(
                                                  "gid://shopify/Product/", "")
                                              .toString(),
                                          (url) {}),
                                    ),
                                    globals.plugins.containsKey(
                                            PluginsEnum.KIWI_SIZING.name)
                                        ? BlocListener<KiwiSizingBloc,
                                            KiwiSizingState>(
                                            listener: (context, state) {},
                                            child: BlocBuilder<KiwiSizingBloc,
                                                KiwiSizingState>(
                                              builder: (context, state) {
                                                return context
                                                        .read<KiwiSizingBloc>()
                                                        .isSizeChartVisible
                                                    ? Column(
                                                        children: [
                                                          Container(
                                                            height: 2,
                                                            color: AppTheme
                                                                .borderColor!
                                                                .withAlpha(40),
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: ThemeSize
                                                                  .paddingLeft,
                                                              right: ThemeSize
                                                                  .paddingRight,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Size Chart : ",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            ThemeSize.themeBorderRadius),
                                                                    // color: AppTheme
                                                                    //     .primaryButtonBackground!
                                                                    //     .withAlpha(
                                                                    //         100),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: AppTheme
                                                                          .borderColor!
                                                                          .withAlpha(
                                                                              50),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      WebViewPagesScreen webViewPagesScreen = WebViewPagesScreen(
                                                                          titleMain: "Kiwi Size Chart",
                                                                          urlToLoad: ApiConst.getSizeChart.replaceAll("{p_id}", widget.ids.replaceAll("gid://shopify/Product/", "")),
                                                                          // "https://app.kiwisizing.com/size?shop=${AppConfig.APP_DOMAIN}&product=${(state.product.id)!.substring(22, 35)}&source=testing_only",
                                                                          bodyTags: "");

                                                                      context.push(
                                                                          "/${Routes.webUrlScreen}",
                                                                          extra:
                                                                              webViewPagesScreen);
                                                                      //  WebViewPagesScreen(titleMain: "Kiwi Size Chart", urlToLoad: "https://app.kiwisizing.com/size?shop=aakash-development.myshopify.com&product=7794708414625&source=testing_only", bodyTags: "");
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              6,
                                                                              4,
                                                                              6,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        "Chart",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 2,
                                                            color: AppTheme
                                                                .borderColor!
                                                                .withAlpha(40),
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                          ),
                                                        ],
                                                      )
                                                    : Container();
                                              },
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              state.product.productVariants!.length > 1
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                          left: ThemeSize.paddingLeft,
                                          right: ThemeSize.paddingRight,
                                          top: 5),
                                      child: ProductVariantDetailsView(
                                          state.product, variant,
                                          (item, AddToCartButton) {
                                        context1
                                            .read<ProductDetailsScreenBloc>()
                                            .UpdateProductVariant(item);
                                        // context
                                        //     .read<ProductDetailsScreenBloc>()
                                        //     .add(onPriceUpdateClick(item));
                                        if (item.availableForSale == false) {
                                          isOutOfStock = true;
                                        } else {
                                          isOutOfStock = false;
                                        }
                                        if (AddToCartButton) {
                                          /// add item in cart+++++++
                                          AddItemInCart(context, "", false, []);
                                        }
                                        setState(() {});
                                      }, false),
                                    )
                                  : SizedBox.shrink(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      ThemeSize.paddingLeft,
                                      20,
                                      ThemeSize.paddingRight,
                                      20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LanguageManager.translations()[
                                            "AboutthisItem"],
                                        // AppLocalizations.of(context)!.aboutthisitem,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                        // style: TextStyle(
                                        //     fontFamily: 'Cinzel',
                                        //     fontSize: Theme.of(context)
                                        //         .textTheme
                                        //         .titleSmall!
                                        //         .fontSize,
                                        //     color: Colors.black) //AppTheme.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      HtmlWidget(
                                          state.product.descriptionHtml
                                              .toString(),
                                          // all other parameters are optional, a few notable params:

                                          // // specify custom styling for an element
                                          // // see supported inline styling below
                                          // customStylesBuilder: (element) {
                                          //   //if (element.id.contains('top')) {
                                          //   return {'color': 'gray'};
                                          //   //}
                                          //   //return null;
                                          // },
                                          customWidgetBuilder: (element) {
                                        return null;
                                      },
                                          // this callback will be triggered when user taps a link
                                          onTapUrl: (p0) {
                                        return false;
                                      },
                                          // select the render mode for HTML body
                                          // by default, a simple `Column` is rendered
                                          // consider using `ListView` or `SliverList` for better performance
                                          // renderMode: RenderMode.column,

                                          // set the default styling for text
                                          textStyle:
                                              CustomTextTheme.getTextStyle(
                                                  MyTextStyle
                                                      .ProductDetailDescription,
                                                  context)
                                          // textStyle: TextStyle(
                                          //     fontSize: 14,),// fontFamily: 'Cinzel'),
                                          )
                                    ],
                                  )),
                              Container(
                                height: 4,
                                color: AppTheme.borderColor!.withAlpha(40),
                                margin: EdgeInsets.symmetric(vertical: 10),
                              ),
                              Container(
                                child: ConditionalRatingAndReview(
                                    context, state.product),
                              ),
                              context1
                                          .read<ProductDetailsScreenBloc>()
                                          .relatedProductList!
                                          .isNotEmpty &&
                                      globals.Settings.containsKey(SettingsEnum
                                          .Product_Recommendations.name)
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          top: ThemeSize.paddingTop,
                                          left: ThemeSize.paddingLeft),
                                      child: RelatedProductViewWidget(
                                          LanguageManager.translations()[
                                              "relatedProduct"],
                                          // LanguageManager.translations()["RelatedProducts"],
                                          () {},
                                          context1
                                              .read<ProductDetailsScreenBloc>()
                                              .relatedProductList!,
                                          ""),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
          } else {
            return SafeArea(
              child: Scaffold(
                  extendBody: true,
                  body: Text(LanguageManager.translations()["Loading"])),
            );
          }
        })));
  }
}
