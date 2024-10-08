import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_dashboard_screen/bloc/loyalty_lion_dashboard_screen_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_dashboard_screen/bloc/loyalty_lion_dashboard_screen_state.dart';
import 'package:shopify_code/plugin/loyalty_lion/widgets/loyalty_lion_custom_list_tile.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/loyalty_lion_ways_to_redeem_screen.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/loyalty_lion_your_activity_screen.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_rewards/loyalty_lion_your_rewards_screen.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoyaltyLionDashboardScreen extends StatefulWidget {
  bool showappbar;
  String email;
  LoyaltyLionDashboardScreen(this.showappbar,
      {required this.email, super.key}) {}
  @override
  State<LoyaltyLionDashboardScreen> createState() =>
      _LoyaltyLionDashboardScreenState();
}

class _LoyaltyLionDashboardScreenState
    extends State<LoyaltyLionDashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<LoyaltyLionDashboardScreenBloc>().Refresh();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.showappbar);
    if (widget.showappbar) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  // height: MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                  child: SvgPicture.asset("assets/images/arrow-back.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!, BlendMode.srcIn)),
                ),
                onPressed: () {
                  context.pop();
                }),
            title: Text(""),
          ),
          body: LoyaltyLionDashboardScreenBody(context, widget.email));
    } else {
      return LoyaltyLionDashboardScreenBody(context, widget.email);
    }
  }

  Widget LoyaltyLionDashboardScreenBody(BuildContext context, String email) {
    return BlocProvider(
      create: (context) => LoyaltyLionDashboardScreenBloc(email),
      child: BlocListener<LoyaltyLionDashboardScreenBloc,
          LoyaltyLionDashboardScreenState>(
        listener: (context, state) {},
        child: BlocBuilder<LoyaltyLionDashboardScreenBloc,
            LoyaltyLionDashboardScreenState>(
          builder: (context, state) {
            if (state is LoyaltyLionDashboardScreenLoadingState) {
              return Center(
                child: Text("Loading"),
              ); // LoyaltyLionDashboardScreenShimmerView();
            } else if (state is LoyaltyLionDashboardScreenAPIFailureState) {
              return Center(
                child: Text("Something Went Wrong"),
              ); // LoyaltyLionDashboardScreenShimmerView();
            } else {
              return Container(
                height: double.maxFinite,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: AppTheme.primaryColor!),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 10, right: 10, bottom: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: SingleChildScrollView(
                          physics: RangeMaintainingScrollPhysics(),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 2, 10, 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Welcome, ",
                                              style: CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .CommonThemeSubTitle,
                                                      context)
                                                  .copyWith(fontSize: 16))),
                                      context
                                                      .read<
                                                          LoyaltyLionDashboardScreenBloc>()
                                                      .customerData![
                                                  "properties"]["first_name"] !=
                                              null
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  context
                                                              .read<
                                                                  LoyaltyLionDashboardScreenBloc>()
                                                              .customerData![
                                                          "properties"]
                                                      ["first_name"]!,
                                                  style: CustomTextTheme
                                                      .getTextStyle(
                                                          MyTextStyle
                                                              .CommonThemeTitle,
                                                          context)))
                                          : Container(),
                                      /*
                                      context.read<LoyaltyLionDashboardScreenBloc>().customerData!["vip_tier"]
                                                  ["name"] !=
                                              null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(DashboardFontSize
                                                        .customBorderRadius),
                                                color: context
                                                            .read<
                                                                LoyaltyLionDashboardScreenBloc>()
                                                            .customerData![
                                                                "vip_tier"]
                                                                ["name"]!
                                                            .toLowerCase() ==
                                                        "gold"
                                                    ? Colors.amber
                                                    : context
                                                                .read<
                                                                    LoyaltyLionDashboardScreenBloc>()
                                                                .customerData![
                                                                    "vip_tier"]
                                                                    ["name"]!
                                                                .toLowerCase() ==
                                                            "silver"
                                                        ? Colors.grey
                                                        : const Color.fromARGB(
                                                            100, 184, 115, 51),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 1, 5, 1),
                                              margin: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 2),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  context
                                                          .read<
                                                              LoyaltyLionDashboardScreenBloc>()
                                                          .customerData!["vip_tier"]
                                                      ["name"]!,
                                                  style: CustomTextTheme.getTextStyle(
                                                          MyTextStyle.CommonThemeTitle,
                                                          context)
                                                      .copyWith(fontSize: 12)))
                                          : Container(),
                                          */
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 10, 2),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Balance",
                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.CommonThemeSubTitle,
                                            context))),
                                context
                                            .read<
                                                LoyaltyLionDashboardScreenBloc>()
                                            .customerData!["points_approved"] !=
                                        null
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 2, 2, 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    context
                                                                    .read<
                                                                        LoyaltyLionDashboardScreenBloc>()
                                                                    .customerData![
                                                                "points_pending"] !=
                                                            null
                                                        ? "${context.read<LoyaltyLionDashboardScreenBloc>().customerData!["points_approved"] + context.read<LoyaltyLionDashboardScreenBloc>().customerData!["points_pending"]} Points"
                                                        : "${context.read<LoyaltyLionDashboardScreenBloc>().customerData!["points_approved"]} Points",
                                                    style: CustomTextTheme
                                                        .getTextStyle(
                                                            MyTextStyle
                                                                .CommonThemeTitle,
                                                            context),
                                                  ),
                                                  if (context
                                                              .read<
                                                                  LoyaltyLionDashboardScreenBloc>()
                                                              .customerData![
                                                          "points_pending"] !=
                                                      null)
                                                    Text(
                                                      "(${context.read<LoyaltyLionDashboardScreenBloc>().customerData!["points_pending"]} pending)",
                                                      style: CustomTextTheme
                                                              .getTextStyle(
                                                                  MyTextStyle
                                                                      .CommonThemeSubTitle,
                                                                  context)
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        DashboardFontSize.customBorderRadius),
                                  )),
                                  elevation:
                                      DashboardFontSize.dashboardElevation,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        LoyaltyLionCustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius),
                                                  topRight: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius))),
                                          text:
                                              "Your rewards",// \nYou have ${context.read<LoyaltyLionDashboardScreenBloc>().rewardCount} new rewards",
                                          leadingIcon: "",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            // LoyaltyLionYourRewardsScreen
                                            //     loyaltyLionYourRewardsScreen =
                                            //     LoyaltyLionYourRewardsScreen(context
                                            //         .read<
                                            //             LoyaltyLionDashboardScreenBloc>()
                                            //         .customerData!["merchant_id"]);
                                            // context.push(
                                            //     "/${Routes.loyaltyLionYourRewardsScreen}",
                                            //     extra:
                                            //         loyaltyLionYourRewardsScreen);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        DashboardFontSize.customBorderRadius),
                                  )),
                                  elevation:
                                      DashboardFontSize.dashboardElevation,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        LoyaltyLionCustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius),
                                                  topRight: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius))),
                                          text: "Ways to earn",
                                          leadingIcon: "assets/images/hand.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {},
                                        ),
                                        Divider(
                                          height: 1,
                                        ),
                                        LoyaltyLionCustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius),
                                                  bottomLeft: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius))),
                                          text: "Ways to redeem",
                                          leadingIcon: "assets/images/gift.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            LoyaltyLionWaysToRedeemScreen
                                                loyaltyLionWaysToRedeemScreen =
                                                LoyaltyLionWaysToRedeemScreen(
                                                    context
                                                            .read<
                                                                LoyaltyLionDashboardScreenBloc>()
                                                            .customerData![
                                                        "points_approved"],
                                                    context
                                                        .read<
                                                            LoyaltyLionDashboardScreenBloc>()
                                                        .customerData!["merchant_id"]);
                                            context.push(
                                                "/${Routes.loyaltyLionWaysToRedeemScreen}",
                                                extra:
                                                    loyaltyLionWaysToRedeemScreen);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        DashboardFontSize.customBorderRadius),
                                  )),
                                  elevation:
                                      DashboardFontSize.dashboardElevation,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 20, 10, 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "Refer you Friends",
                                                style: CustomTextTheme
                                                    .getTextStyle(
                                                        MyTextStyle
                                                            .CommonThemeSubTitle,
                                                        context))),
                                        LoyaltyLionCustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius),
                                                  bottomLeft: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius))),
                                          text: LanguageManager.translations()[
                                              "Share"],
                                          leadingIcon:
                                              "assets/images/share.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            Share.share(
                                                "Hi ! Check this App for Amazing Offer!\n" +
                                                    "${context.read<LoyaltyLionDashboardScreenBloc>().customerData!["referral_url"]}");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        DashboardFontSize.customBorderRadius),
                                  )),
                                  elevation:
                                      DashboardFontSize.dashboardElevation,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        LoyaltyLionCustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius),
                                                  topRight: Radius.circular(
                                                      DashboardFontSize
                                                          .customBorderRadius))),
                                          text: "Your Activity",
                                          leadingIcon:
                                              "assets/images/recent.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            LoyaltyLionYourActivityScreen
                                                loyaltyLionYourActivityScreen =
                                                LoyaltyLionYourActivityScreen(
                                                    context
                                                        .read<
                                                            LoyaltyLionDashboardScreenBloc>()
                                                        .customerData!["merchant_id"]);
                                            context.push(
                                                "/${Routes.loyaltyLionYourActivityScreen}",
                                                extra:
                                                    loyaltyLionYourActivityScreen);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
