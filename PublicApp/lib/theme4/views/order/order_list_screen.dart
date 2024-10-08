import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:shopify_code/util/routes.dart';
import '/theme4/views/order/order_details_screen.dart';
import '/theme4/views/widgets/no_data_view.dart';
import '../../utils/theme_size.dart';
import '../../views/order/bloc/order_list_screen_bloc.dart';
import '../../views/order/bloc/order_list_screen_state.dart';
import '../widgets/no_data_view12.dart';
import '../shimmer/order_screen_shimmer_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen();

// var dateTime=Session.getDateTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: Text(LanguageManager.translations()["Order List"]
              // AppLocalizations.of(context)!.allorder
              ),
        ),
        body: BlocProvider(
            create: (context) => OderListScreenBloc(),
            child: BlocListener<OderListScreenBloc, OderListScreenState>(
                listener: (context, state) {},
                child: BlocBuilder<OderListScreenBloc, OderListScreenState>(
                    builder: (context, state) {
                  if (state is OderListScreenLoading) {
                    return OrderListScreenShimmerEffect()
                        .oderlistscreenshimmereffect(context, true);
                  } else if (state is OderListScreenLoaded) {
                    return Stack(
                      children: [
                        Container(
                            child: ListView.builder(
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return InkResponse(
                                onTap: () {
                                  OrderDetailsScreen orderDetailsScreen =
                                      OrderDetailsScreen(state.list[index]);
                                  context.push("/${Routes.orderDetailsScreen}",
                                      extra: orderDetailsScreen);
                                  // arguments:
                                  // {
                                  //   state.list[index];
                                  // }
                                  //// FIREBASE EVENT /////////
                                  globals.analytics.logEvent(
                                      name: FireBaseEvent
                                          .OPEN_ORDER_DETAILS.name);
                                  ////////////////////////////
                                },
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              state.list[index].name.toString(),
                                              style: TextStyle(
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .fontSize,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              LanguageManager.translations()[
                                                      "TotalItems"] +
                                                  " ${state.list[index].lineItems!.lineItemOrderList!.length.toString()}" +
                                                  " " +
                                                  LanguageManager
                                                      .translations()["Items"],
                                              style: TextStyle(
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .fontSize,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              LanguageManager.translations()[
                                                      "total"] +
                                                  state
                                                      .list[index]
                                                      .totalPriceV2!
                                                      .formattedPrice
                                                      .toString(),
                                              style: CustomTextTheme.getTextStyle(
                                                  MyTextStyle
                                                      .OrderListCardTotalAmount,
                                                  context)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              LanguageManager.translations()[
                                                      "status"] +
                                                  state.list[index]
                                                      .fulfillmentStatus
                                                      .toString(),
                                              style:
                                                  CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .OrderListCardStatus,
                                                      context)

                                              // style: TextStyle(
                                              //     fontSize: 14,
                                              //     fontWeight:
                                              //         FontWeight.w500,
                                              //     color: AppTheme.black
                                              //         .withAlpha(120))
                                              ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              LanguageManager.translations()[
                                                      "orderAt"] +
                                                  " : " +
                                                  DateTimeUtils.getDateTime(
                                                      state.list[index]
                                                          .processedAt
                                                          .toString()),
                                              // style: TextStyle(
                                              //     fontSize: 14,
                                              //     fontWeight:
                                              //         FontWeight.w500,
                                              //     )
                                              style:
                                                  CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .OrderListCardDate,
                                                      context)),
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: AppTheme.borderColor!
                                              .withAlpha(50),
                                        ),
                                      ],
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            left: ThemeSize.marginLeft,
                                            right: ThemeSize.marginRight,
                                          ),
                                          child: Text(
                                              LanguageManager.translations()[
                                                  "Viewdetails"],
                                              style:
                                                  CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .OrderListCardDate,
                                                      context)

                                              // style: TextStyle(
                                              //     fontSize: 14,
                                              //     fontWeight:
                                              //         FontWeight.w500,
                                              //     color: AppTheme.black
                                              //         .withAlpha(120))
                                              ),
                                        )),
                                  ],
                                ));
                          },
                        ))
                      ],
                    );
                  } else {
                    return NoDataView(
                      AppAssets.cart,
                      LanguageManager.translations()['orderNotPlaced'],
                      buttonTitle:
                          LanguageManager.translations()['ContinueShopping'],
                      onTap: () {
                        context.push("/${Routes.categoryScreen}", extra: true);
                      },
                    );
                  }
                }))));
  }
}
