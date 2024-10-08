import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/bloc/loyalty_lion_your_activity_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/bloc/loyalty_lion_your_activity_state.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoyaltyLionYourActivityScreen extends StatelessWidget {
  LoyaltyLionYourActivityScreen(this.customerMerchantId, {super.key});
  String customerMerchantId;
  final double defaultFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Activity",
          ),
          leading: IconButton(
              icon: Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                child: SvgPicture.asset("assets/images/arrow-back.svg",
                    colorFilter: ColorFilter.mode(
                        AppTheme.appBarTextColor!, BlendMode.srcIn)),
              ),
              onPressed: () {
                context.pop();
              }),
        ),
        body: BlocProvider(
          create: (context) => LoyaltyLionYourActivityBloc(customerMerchantId),
          child: BlocListener<LoyaltyLionYourActivityBloc,
              LoyaltyLionYourActivityState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: BlocBuilder<LoyaltyLionYourActivityBloc,
                LoyaltyLionYourActivityState>(
              builder: (context, state) {
                dynamic yourActivityData = context
                    .read<LoyaltyLionYourActivityBloc>()
                    .yourActivityData;

                if (state is LoyaltyLionYourActivityLoadingState) {
                  return Center(
                    child: Text("Loading"),
                  ); // LoyaltyLionDashboardScreenShimmerView();
                } else {
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft,
                        0, DashboardFontSize.paddingRight, 0),
                    child: yourActivityData!.isNotEmpty
                        ? Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text("DATE",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold, fontSize: 15)))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text("ACTIVITY",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold, fontSize: 15)))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text("POINTS",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold, fontSize: 15)))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "STATUS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 15),
                                            ))),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Divider(height: 2,),
                              SizedBox(height: 2),
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: yourActivityData!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      height: 1,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          top: index == 0 ? 10 : 15, bottom: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                    DateTimeUtils.getDateAndTime(
                                                        yourActivityData![index]
                                                            ["created_at"]),
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  yourActivityData![index]![
                                                              "resource"] ==
                                                          "claimed_reward"
                                                      ? yourActivityData![
                                                                  index]![
                                                              "claimed_reward"]
                                                          ["reward"]["title"]
                                                      : yourActivityData![index]![
                                                              "resource"] ==
                                                          "activity" ? yourActivityData![
                                                                  index]!["activity"][
                                                              "rule"]
                                                          ["title"]! : yourActivityData![
                                                                  index]![
                                                              "adjustment"]
                                                          ["note"]!,
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    yourActivityData![index]![
                                                                "points_approved"]
                                                            .toString()!
                                                            .contains("-")
                                                        ? "${yourActivityData![index]!["points_approved"]} Points"
                                                        : "+${yourActivityData![index]!["points_approved"].toString()} Points",
                                                    style: TextStyle(
                                                        fontSize: 13))),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  yourActivityData![index]![
                                                              "resource"] ==
                                                          "claimed_reward"
                                                      ? yourActivityData![
                                                                  index]![
                                                              "claimed_reward"]
                                                          ["state"]
                                                      : "-",
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  );
                }
              },
            ),
          ),
        ));
  }
}
