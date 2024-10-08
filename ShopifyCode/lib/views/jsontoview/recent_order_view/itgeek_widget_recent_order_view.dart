import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/recent_order_view/bloc/recent_order_bloc.dart';
import 'package:shopify_code/views/jsontoview/recent_order_view/bloc/recent_order_state.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetRecentOrderView extends StatelessWidget {
  RecentOrderThemeThirdData recentOrderThemeThirdData;
  Function() onClick;
  ItgeekWidgetRecentOrderView(this.recentOrderThemeThirdData, this.onClick);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => RecentOrderBloc(),
      child: BlocListener<RecentOrderBloc, RecentOrderState>(
        listener: (context, state) {},
        child: BlocBuilder<RecentOrderBloc, RecentOrderState>(
            builder: (context, state) {
          if (state is RecentOrderSuccessState) {
            return InkWell(
              onTap: onClick,
              child: Container(
                decoration: BoxDecoration(
                    color: Utils.getColorFromHex(
                        recentOrderThemeThirdData.backgroundColor.toString())),
                height: 230,
                padding: EdgeInsets.only(left: DashboardFontSize.paddingLeft),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Orderd ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: DashboardFontSize.headingFontSize,
                                fontWeight: FontWeight.bold,
                                color: Utils.getColorFromHex(
                                    recentOrderThemeThirdData.textColor
                                        .toString())),
                          ),
                          Text(
                            'On ${state.data["body"]["data"]["customer"] == null || state.data["body"]["data"]["customer"]["lastOrder"] == null ? " " : DateFormat("yyyy-MM-dd").format(DateTime.parse(state.data["body"]["data"]["customer"]["lastOrder"]["createdAt"]))}',
                            style: TextStyle(
                                fontSize: DashboardFontSize.subHeadingFontSize,
                                fontWeight: FontWeight.bold,
                                color: Utils.getColorFromHex(
                                    recentOrderThemeThirdData.textColor
                                        .toString())),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: state.data["body"]["data"]
                                            ["customer"] ==
                                        null ||
                                    state.data["body"]["data"]["customer"]
                                            ["lastOrder"] ==
                                        null
                                ? MainAxisAlignment.start
                                : state
                                            .data["body"]["data"]["customer"]
                                                ["lastOrder"]["lineItems"]
                                                ["nodes"]
                                            .length >=
                                        4
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 100,
                              //   child:
                              // state
                              //             .data["body"]["data"]["customer"]
                              //                 ["lastOrder"]["lineItems"]
                              //                 ["nodes"]
                              //             .length ==
                              //         0
                              //     ? Image.asset(
                              //         AppAssets.placeholder,
                              //         height: 90,
                              //         width: 80,
                              //         fit: BoxFit.fill,
                              //         alignment: Alignment.center,
                              //       )
                              //     : WidgetImage(
                              //         height: 90,
                              //         width: 80,
                              //         fit: BoxFit.fill,
                              //         ""
                              // state.data["body"]["data"]
                              //       ["customer"]["lastOrder"]["lineItems"]
                              //   ["nodes"][0]["image"]["url"]
                              //         ),
                              // ),
                              // state
                              //             .data["body"]["data"]["customer"]
                              //                 ["lastOrder"]["lineItems"]["nodes"]
                              //             .length !=
                              //         0
                              //     ?
                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >=
                                          1
                                  ? Container(
                                      //color:AppTheme.white,
                                      width: 75,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              DashboardFontSize
                                                  .customBorderRadius)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            DashboardFontSize
                                                .customBorderRadius),
                                        child: WidgetImage(
                                          state
                                                      .data["body"]["data"]
                                                          ["customer"]
                                                          ["lastOrder"]
                                                          ["lineItems"]["nodes"]
                                                      .length ==
                                                  0
                                              ? AppAssets.noImage
                                              : state.data["body"]["data"]
                                                      ["customer"]["lastOrder"]
                                                      ["lineItems"]["nodes"][0]
                                                      ["image"]["url"]
                                                  .toString(),
                                        ),
                                      ),
                                    )
                                  : Container(),

                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >=
                                          4
                                  ? Container()
                                  : SizedBox(
                                      width: 10,
                                    ),

                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >=
                                          2
                                  ? Container(
                                      //color:AppTheme.white,
                                      width: 75,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              DashboardFontSize
                                                  .customBorderRadius)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            DashboardFontSize
                                                .customBorderRadius),
                                        child: WidgetImage(
                                          state
                                                      .data["body"]["data"]
                                                          ["customer"]
                                                          ["lastOrder"]
                                                          ["lineItems"]["nodes"]
                                                      .length ==
                                                  0
                                              ? AppAssets.noImage
                                              : state.data["body"]["data"]
                                                      ["customer"]["lastOrder"]
                                                      ["lineItems"]["nodes"][0]
                                                      ["image"]["url"]
                                                  .toString(),
                                        ),
                                      ),
                                    )
                                  : Container(),

                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >=
                                          4
                                  ? Container()
                                  : SizedBox(
                                      width: 10,
                                    ),

                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >=
                                          3
                                  ? Container(
                                      //color:AppTheme.white,
                                      width: 75,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              DashboardFontSize
                                                  .customBorderRadius)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            DashboardFontSize
                                                .customBorderRadius),
                                        child: WidgetImage(
                                          state
                                                      .data["body"]["data"]
                                                          ["customer"]
                                                          ["lastOrder"]
                                                          ["lineItems"]["nodes"]
                                                      .length ==
                                                  0
                                              ? AppAssets.noImage
                                              : state.data["body"]["data"]
                                                      ["customer"]["lastOrder"]
                                                      ["lineItems"]["nodes"][0]
                                                      ["image"]["url"]
                                                  .toString(),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              state.data["body"]["data"]["customer"] != null &&
                                      state.data["body"]["data"]["customer"]
                                              ["lastOrder"] !=
                                          null &&
                                      state
                                              .data["body"]["data"]["customer"]
                                                  ["lastOrder"]["lineItems"]
                                                  ["nodes"]
                                              .length >
                                          3
                                  ? Text('+4 More')
                                  : Container(),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 8, right: 8, bottom: 5),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: recentOrderThemeThirdData
                                                    .buttonBackgroundColor ==
                                                null
                                            ? Colors.blue.shade400
                                            : Utils.getColorFromHex(
                                                recentOrderThemeThirdData
                                                    .buttonBackgroundColor
                                                    .toString()),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      recentOrderThemeThirdData.buttonText
                                              .toString()
                                              .isEmpty
                                          ? 'Order Again'
                                          : recentOrderThemeThirdData.buttonText
                                              .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: recentOrderThemeThirdData
                                                  .buttonTextColor!.isEmpty
                                              ? Utils.getColorFromHex(
                                                  recentOrderThemeThirdData
                                                      .textColor
                                                      .toString())
                                              : Utils.getColorFromHex(
                                                  recentOrderThemeThirdData
                                                      .buttonTextColor
                                                      .toString())),
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.data["body"]["data"]["customer"] !=
                                                null &&
                                            state.data["body"]["data"]
                                                    ["customer"]["lastOrder"] !=
                                                null
                                        ? 'Order ID : ${state.data["body"]["data"]["customer"]["lastOrder"]["id"].toString().substring(20, state.data["body"]["data"]["customer"]["lastOrder"]["id"].toString().length)}'
                                        : "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            DashboardFontSize.descFontSize,
                                        color: recentOrderThemeThirdData
                                                    .textColor ==
                                                null
                                            ? Colors.black
                                            : Utils.getColorFromHex(
                                                recentOrderThemeThirdData
                                                    .textColor
                                                    .toString())),
                                  ),
                                  Text(
                                    state.data["body"]["data"]["customer"] !=
                                                null &&
                                            state.data["body"]["data"]
                                                    ["customer"]["lastOrder"] !=
                                                null
                                        ? 'FINAL TOTAL : \$${state.data["body"]["data"]["customer"]["lastOrder"]["totalPriceSet"]["presentmentMoney"]["amount"]}'
                                        : "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            DashboardFontSize.headingFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: recentOrderThemeThirdData
                                                    .textColor ==
                                                null
                                            ? Colors.black
                                            : Utils.getColorFromHex(
                                                recentOrderThemeThirdData
                                                    .textColor
                                                    .toString())),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        width: 450,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: recentOrderThemeThirdData
                                      .bannerBackgroundColor ==
                                  null
                              ? Colors.blue.shade400
                              : Utils.getColorFromHex(recentOrderThemeThirdData
                                  .bannerBackgroundColor
                                  .toString()),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            recentOrderThemeThirdData.bannerText == null
                                ? 'Order Again & Get Flat 10% Off'
                                : recentOrderThemeThirdData.bannerText
                                    .toString(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: DashboardFontSize.headingFontSize,
                              color: recentOrderThemeThirdData
                                          .bannerTextColor ==
                                      null
                                  ? Colors.blue.shade400
                                  : Utils.getColorFromHex(
                                      recentOrderThemeThirdData.bannerTextColor
                                          .toString()),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.black)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CircleAvatar(
                    //   maxRadius: 80,
                    //   backgroundColor: AppTheme.primaryButtonBackground,
                    //   child:
                    SvgPicture.string(
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!.withAlpha(50),
                          BlendMode.srcIn),
                      AppAssets.cart,
                      height: 100,
                    ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Cart is Empty",
                          // LanguageManager.translations()[
                          //     title]!, // AppLocalizations.of(context)!.nodatafoundpleasetryagain,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontSize,
                            // color: AppTheme.lightBorder
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        {
                          context.push("/${Routes.categoryScreen}",
                              extra: true);
                        }
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 11, bottom: 8),
                        decoration: BoxDecoration(
                            color: AppTheme.primaryButtonBackground,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text("Continue Shopping"),
                      ),
                      // text: buttonTitle!,
                      // onPressed: () {
                      //   onTap!();
                      // },
                    )
                  ],
                ));
          }
        }),
      ),
    );

    // Container(
    //   height: 300,
    //   child: Row(
    //     children: [
    //       Expanded(
    //         flex: 3,
    //         child: Column(
    //           children: [Text("Delivered"), Text("On July 2024")],
    //         ),
    //       ),
    //       Container(child: ListView.builder(itemBuilder: (context, index) {
    //         return Container();
    //       }))
    //     ],
    //   ),
    // );
  }
}
