import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/cart_screen_bloc/cart_screen_bloc.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import '../../utils/theme_size.dart';
import '/theme5/views/auth/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '/theme5/views/shimmer/order_screen_shimmer_view.dart';
import '/theme5/views/widgets/common/custom_button.dart';
import '/theme5/views/widgets/no_data_view.dart';
import 'cart_row.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          LanguageManager.translations()['Cart']!,
        ),
        leading: IconButton(
            icon: Container(
              width: 35, //MediaQuery.of(context).size.width * 0.09,
              height: 35, //MediaQuery.of(context).size.height * 0.09,
              padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
              child: SvgPicture.asset("assets/images/arrow-back.svg",
                  colorFilter: ColorFilter.mode(
                      AppTheme.appBarTextColor!, BlendMode.srcIn)),
            ),
            onPressed: () {
              context.pop();
            }),
      ),
      body: CartBody(),
    );
  }
}

class CartBody extends StatelessWidget {
  CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenBloc(),
      child: Container(
          color: Theme.of(context).colorScheme.background,
          child: BlocListener<CartScreenBloc, CartScreenState>(
              listener: (context, state) async {},
              child: BlocBuilder<CartScreenBloc, CartScreenState>(
                builder: (context, state) {
                  if (state is CartScreenLoaded) {
                    context.read<CartBloc>().updateCartCount(
                        context.read<CartScreenBloc>().cartItemList.length);
                  } else if (state is CartScreenNoData) {
                    context.read<CartBloc>().updateCartCount(0);
                  }

                  return Container(
                      child: Column(children: [
                    state is CartScreenLoading
                        ? Container(
                            height: MediaQuery.of(context).size.height - 180,
                            child: OrderListScreenShimmerEffect()
                                .oderlistscreenshimmereffect(context, false),
                          )
                        : state is CartScreenNoData
                            ?
                            // context.read<CartBloc>().updateCount(0);
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                alignment: Alignment.center,
                                child: NoDataView(
                                  AppAssets.cart,
                                  LanguageManager.translations()['cartEmpty'],
                                  buttonTitle: LanguageManager.translations()[
                                      'ContinueShopping'],
                                  onTap: () {
                                    context.push("/${Routes.categoryScreen}",
                                        extra: true);
                                  },
                                ),
                              )
                            : Expanded(
                                child: ListView.separated(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: context
                                    .read<CartScreenBloc>()
                                    .cartItemList
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CartRow(
                                      context
                                          .read<CartScreenBloc>()
                                          .cartItemList[index], () async {
                                    DialogAction action =
                                        await Dialogs.customAbortDialog(
                                            context,
                                            LanguageManager.translations()[
                                                'Delete']!,
                                            LanguageManager.translations()[
                                                'Do you want to delete']!
                                            // AppLocalizations.of(context)!.delete,
                                            // AppLocalizations.of(context)!
                                            // .doyou_want_to_delete_item
                                            );
                                    if (action == DialogAction.YES) {
                                      context.read<CartScreenBloc>().add(
                                          DeleteCartItem(context
                                              .read<CartScreenBloc>()
                                              .cartItemList[index]));
                                    }
                                  }, (count) {
                                    if (count == 0) {
                                      context.read<CartScreenBloc>().add(
                                          DeleteCartItem(context
                                              .read<CartScreenBloc>()
                                              .cartItemList[index]));
                                    } else {
                                      context.read<CartScreenBloc>().add(
                                          UpdateCartItem(
                                              context
                                                  .read<CartScreenBloc>()
                                                  .cartItemList[index],
                                              count));
                                    }
                                  });
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    // thickness: 3,
                                    height: 10,
                                    // color: AppTheme.borderColor!.withAlpha(80),
                                  );
                                },
                              )),
                    state is CartScreenPriceLoading
                        ? Container(
                            child: Shimmer.fromColors(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme
                                          .primaryColor, //highlightColor,
                                      border: Border.all(
                                          color: AppTheme.primaryColor!),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              ThemeSize.themeBorderRadius),
                                          topRight: Radius.circular(
                                              ThemeSize.themeBorderRadius))),
                                  height: 80,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                ),
                                baseColor: AppTheme.primaryColor!, // baseColor,
                                highlightColor: AppTheme.highlightColor),
                          )
                        : state is CartScreenLoaded
                            ? Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    border: Border.all(
                                        color: AppTheme.primaryColor!),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            ThemeSize.themeBorderRadius),
                                        topRight: Radius.circular(
                                            ThemeSize.themeBorderRadius))),
                                height: 100,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            LanguageManager.translations()[
                                                'Total']!,
                                            style: CustomTextTheme.getTextStyle(
                                                MyTextStyle
                                                    .CartScreenNumberOfItems,
                                                context)
                                            // style: Theme.of(context)
                                            //     .textTheme
                                            //     .titleSmall!
                                            //     .copyWith(color: AppTheme.primaryButtonText,fontFamily: 'Cinzel'),
                                            ),
                                        Text(
                                            context
                                                .read<CartScreenBloc>()
                                                .cart
                                                .cost!
                                                .subtotalAmount!
                                                .formattedPrice,
                                            // context
                                            //     .read<CartScreenBloc>()
                                            //     .formatedPrice
                                            //     .toString(),
                                            style: CustomTextTheme.getTextStyle(
                                                MyTextStyle.CartScreenTotal,
                                                context)
                                            // style: Theme.of(context)
                                            //     .textTheme
                                            //     .titleLarge!
                                            //     .copyWith(color: AppTheme.primaryButtonText,fontFamily: 'Cinzel'),
                                            )
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      // width: MediaQuery.of(context).size.width /
                                      //     2.3,
                                      child: CustomButton(
                                        text: LanguageManager.translations()[
                                            'Checkout']!,
                                        // AppLocalizations.of(context)!.addtocart,
                                        onPressed: () async {
                                          if (globals.Settings.containsKey(
                                              SettingsEnum
                                                  .Disable_Checkout.name)) {
                                            Dialogs.ErrorAlertInOut(
                                                context: context,
                                                message: LanguageManager
                                                        .translations()[
                                                    'checkoutDisable']);
                                          } else {
                                            if ((globals.Settings.containsKey(
                                                    SettingsEnum
                                                        .Minimum_Cart_Value
                                                        .name) &&
                                                context
                                                        .read<CartScreenBloc>()
                                                        .cart
                                                        .cost!
                                                        .subtotalAmount!
                                                        .amount! <
                                                    double.parse(globals
                                                        .Settings[SettingsEnum
                                                            .Minimum_Cart_Value
                                                            .name]
                                                        .minimumValue))) {
                                              Dialogs.ErrorAlertInOut(
                                                  context: context,
                                                  message: LanguageManager
                                                              .translations()[
                                                          'minimumCart'] +
                                                      " ${globals.Settings[SettingsEnum.Minimum_Cart_Value.name].minimumValue}");
                                              return;
                                            }
                                            bool islogin =
                                                await Session().IsLogin();
                                            if (islogin) {
                                              //// FIREBASE EVENT /////////
                                              globals.analytics.logEvent(
                                                  name: FireBaseEvent
                                                      .CLICK_CHECKOUT.name);
                                              ////////////////////////////
                                              // context.push(
                                              //     "/${Routes.checkoutScreen}",
                                              //     extra: context.read<CartScreenBloc>().cart);

                                              bool value = await (context.pushNamed(
                                                  "${Routes.webCheckoutScreen}",
                                                  pathParameters: {
                                                    "url": context
                                                        .read<CartScreenBloc>()
                                                        .cart
                                                        .checkoutUrl
                                                        .toString()
                                                  },
                                                  extra: null)) as bool;

                                              if (value) {
                                                Session().setCartId("");
                                                context.pushReplacement(
                                                    "/${Routes.thanksScreen}",
                                                    extra: ["", ""]);

                                              } else {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message: LanguageManager
                                                            .translations()[
                                                        'errorinplaceorderplaceordertryagain']!);
                                              }
                                              // bool value = await (context.pushNamed(
                                              //     "${Routes.webCheckoutScreen}",
                                              //     pathParameters: {"url": context.read<CartScreenBloc>().cart.checkoutUrl.toString()},
                                              //     extra: null)) as bool;
                                            } else {
                                              if (globals.Settings.containsKey(
                                                  SettingsEnum
                                                      .Guest_Checkout.name)) {
                                                //// FIREBASE EVENT /////////
                                                globals.analytics.logEvent(
                                                    name: FireBaseEvent
                                                        .CLICK_CHECKOUT.name);
                                                ////////////////////////////

                                                bool value =
                                                    await (context.pushNamed(
                                                        "${Routes.webCheckoutScreen}",
                                                        pathParameters: {
                                                          "url": context
                                                              .read<
                                                                  CartScreenBloc>()
                                                              .cart
                                                              .checkoutUrl
                                                              .toString()
                                                        },
                                                        extra: null)) as bool;

                                                if (value) {
                                                  context.pushReplacement(
                                                      "/${Routes.thanksScreen}",
                                                      extra: ["", ""]);
                                                } else {
                                                  Dialogs.ErrorAlertInOut(
                                                      context: context,
                                                      message: LanguageManager
                                                              .translations()[
                                                          'errorinplaceorderplaceordertryagain']!);
                                                }
                                              } else {
                                                bool? refresh =
                                                    await (context.pushNamed(
                                                        "${Routes.loginScreen}",
                                                        pathParameters: {
                                                          "goBack":
                                                              true.toString()
                                                        },
                                                        extra: null)) as bool;

                                                if (refresh != null) {
                                                  if (refresh as bool) {
                                                    //// FIREBASE EVENT /////////
                                                    globals.analytics.logEvent(
                                                        name: FireBaseEvent
                                                            .CLICK_CHECKOUT
                                                            .name);
                                                    ////////////////////////////
                                                    bool value = await (context
                                                        .pushNamed(
                                                            "${Routes.webCheckoutScreen}",
                                                            pathParameters: {
                                                              "url": context
                                                                  .read<
                                                                      CartScreenBloc>()
                                                                  .cart
                                                                  .checkoutUrl
                                                                  .toString()
                                                            },
                                                            extra:
                                                                null)) as bool;

                                                    if (value) {
                                                      context.pushReplacement(
                                                          "/${Routes.thanksScreen}",
                                                          extra: ["", ""]);
                                                    } else {
                                                      Dialogs.ErrorAlertInOut(
                                                          context: context,
                                                          message: LanguageManager
                                                                  .translations()[
                                                              'errorinplaceorderplaceordertryagain']!);
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                            : Container(),
                  ]));
                },
              ))),
    );
  }
}
