import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/bloc/loyalty_lion_ways_to_redeem_bloc.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/bloc/loyalty_lion_ways_to_redeem_event.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/bloc/loyalty_lion_ways_to_redeem_state.dart';
import 'package:shopify_code/plugin/loyalty_lion/widgets/loyalty_lion_redeem_bottom_sheet_view.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoyaltyLionWaysToRedeemScreen extends StatefulWidget {
  int? totalPoints;
  String? customerMerchantId;
  LoyaltyLionWaysToRedeemScreen(this.totalPoints, this.customerMerchantId,
      {super.key});

  @override
  State<LoyaltyLionWaysToRedeemScreen> createState() =>
      _LoyaltyLionWaysToRedeemScreenState();
}

class _LoyaltyLionWaysToRedeemScreenState
    extends State<LoyaltyLionWaysToRedeemScreen> {
  final double defaultFontSize = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Ways to redeem",
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
        body: BlocProvider(
          create: (context) =>
              LoyaltyLionWaysToRedeemBloc(widget.customerMerchantId!),
          child: BlocListener<LoyaltyLionWaysToRedeemBloc,
              LoyaltyLionWaysToRedeemState>(
            listener: (context, state) {
              if (state is LoyaltyLionWaysToRedeemPointsSuccessState) {
                widget.totalPoints = widget.totalPoints! - state.pointsToSpend;
                // Dialogs.SuccessAlertInOut(context: context, message: "Success");
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 2,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      titlePadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      buttonPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      actionsPadding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            DashboardFontSize.customBorderRadius),
                      ),
                      // title: Text(
                      //   title,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodyLarge!,
                      // ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Success use this code at checkout",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            state.redeemPointsData["redeemable"] != null
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.redeemPointsData["redeemable"]
                                          ["code"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    "${state.redeemPointsData!["redeemable"]!["code"]!}"));
                            Dialogs.SuccessAlertInOut(
                              context: context,
                              message: "Code Copied Successfully",
                            );
                            context.pop(DialogAction.ABORT);
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            padding: EdgeInsets.fromLTRB(22, 5, 22, 5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.secondaryButtonBackground!,
                                    AppTheme.secondaryButtonBackground!,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius)),
                            child: Text("COPY",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: AppTheme.secondaryButtonText!)),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: BlocBuilder<LoyaltyLionWaysToRedeemBloc,
                LoyaltyLionWaysToRedeemState>(
              builder: (context, state) {
                dynamic waysToRedeemData = context
                    .read<LoyaltyLionWaysToRedeemBloc>()
                    .waysToRedeemData;
                if (state is LoyaltyLionWaysToRedeemLoadingState) {
                  return Center(
                    child: Text("Loading"),
                  ); // LoyaltyLionDashboardScreenShimmerView();
                } else {
                  return Container(
                    padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft,
                        0, DashboardFontSize.paddingRight, 0),
                    child: waysToRedeemData!.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.only(top: 5),
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: waysToRedeemData!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 10,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        width: 25,
                                        height: 25,
                                        child: SvgPicture.asset(
                                            "assets/images/price-tag.svg"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      waysToRedeemData![index]![
                                                          "title"]!,
                                                      style: CustomTextTheme
                                                          .getTextStyle(
                                                              MyTextStyle
                                                                  .CommonThemeSubTitle,
                                                              context))),
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      waysToRedeemData![index]![
                                                                  "point_cost"]!
                                                              .toString() +
                                                          " points",
                                                      style: CustomTextTheme
                                                              .getTextStyle(
                                                                  MyTextStyle
                                                                      .CommonThemeSubTitle,
                                                                  context)
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal))),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(30, 10, 10, 10),
                                        child: InkWell(
                                          onTap: () async {
                                            if (waysToRedeemData![index]![
                                                        "discount_type"]! ==
                                                    "variable" ||
                                                (waysToRedeemData![index]![
                                                        "point_cost"]! <=
                                                    widget.totalPoints)) {
                                              if (waysToRedeemData![index]![
                                                      "discount_type"]! ==
                                                  "flat") {
                                                DialogAction action = await Dialogs
                                                    .customAbortDialog(
                                                        context,
                                                        "Spend ${waysToRedeemData![index]!["point_cost"]} points for this reward?",
                                                        "",
                                                        secondarybuttonText:
                                                            "Claim");
                                                if (action ==
                                                    DialogAction.YES) {
                                                  context
                                                      .read<
                                                          LoyaltyLionWaysToRedeemBloc>()
                                                      .add(onLoadRedeemPointsDataEvent(
                                                          waysToRedeemData![
                                                                  index]
                                                              ["point_cost"],
                                                          waysToRedeemData![
                                                              index]["id"],
                                                          widget
                                                              .customerMerchantId!));
                                                }
                                              } else if (waysToRedeemData![
                                                          index]![
                                                      "discount_type"]! ==
                                                  "variable") {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (context1) {
                                                    return RedeemBottomSheetView(
                                                        waysToRedeemData![
                                                            index],
                                                        widget.totalPoints,
                                                        (points) async {
                                                      int pointsToSpend =
                                                          points;
                                                      DialogAction action =
                                                          await Dialogs
                                                              .customAbortDialog(
                                                                  context,
                                                                  "Spend ${waysToRedeemData![index]!["point_cost"]} points for this reward?",
                                                                  "");
                                                      if (action ==
                                                          DialogAction.YES) {
                                                        context1.pop(true);
                                                        context
                                                            .read<
                                                                LoyaltyLionWaysToRedeemBloc>()
                                                            .add(onLoadRedeemPointsDataEvent(
                                                                pointsToSpend,
                                                                waysToRedeemData![
                                                                        index]
                                                                    ["id"],
                                                                widget
                                                                    .customerMerchantId!));
                                                      }
                                                    });
                                                  },
                                                );
                                              }
                                            } else {
                                              Dialogs.ErrorAlertInOut(
                                                  context: context,
                                                  message: "Not Enough Points");
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: DashboardFontSize
                                                .dashboardButtonSize,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              // (state is LoyaltyLionPointsRedeemingState) ? "..." :
                                              "Redeem",
                                              style: TextStyle(
                                                  color: (waysToRedeemData![
                                                                      index]![
                                                                  "discount_type"]! ==
                                                              "variable" ||
                                                          (waysToRedeemData![
                                                                      index]![
                                                                  "point_cost"]! <=
                                                              widget
                                                                  .totalPoints))
                                                      ? AppTheme
                                                          .primaryButtonText!
                                                      : Colors.black,
                                                  fontSize: defaultFontSize),
                                              textAlign: TextAlign.center,
                                            ),
                                            decoration: BoxDecoration(
                                                // shape: BoxShape.circle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        DashboardFontSize
                                                            .customBorderRadius)),
                                                color: ((waysToRedeemData![index]!["discount_type"]! ==
                                                                "variable" &&
                                                            waysToRedeemData![index]![
                                                                    "variable_points_step"]! <=
                                                                widget
                                                                    .totalPoints) ||
                                                        (waysToRedeemData![index]![
                                                                    "discount_type"]! ==
                                                                "flat" &&
                                                            waysToRedeemData![index]![
                                                                    "point_cost"]! <=
                                                                widget.totalPoints))
                                                    ? AppTheme.primaryButtonBackground
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              },
                            ),
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
