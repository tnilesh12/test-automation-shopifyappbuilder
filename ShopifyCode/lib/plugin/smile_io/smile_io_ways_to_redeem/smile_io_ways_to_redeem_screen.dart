import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/bloc/smile_io_ways_to_redeem_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/bloc/smile_io_ways_to_redeem_event.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/bloc/smile_io_ways_to_redeem_state.dart';
import 'package:shopify_code/plugin/smile_io/widgets/redeem_bottom_sheet_view.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmileIoWaysToRedeemScreen extends StatefulWidget {
  int? totalPoints;
  int? customerId;
  SmileIoWaysToRedeemScreen(this.totalPoints, this.customerId, {super.key});

  @override
  State<SmileIoWaysToRedeemScreen> createState() =>
      _SmileIoWaysToRedeemScreenState();
}

class _SmileIoWaysToRedeemScreenState extends State<SmileIoWaysToRedeemScreen> {
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
          create: (context) => SmileIoWaysToRedeemBloc(),
          child:
              BlocListener<SmileIoWaysToRedeemBloc, SmileIoWaysToRedeemState>(
            listener: (context, state) {
              if (state is SmileIoWaysToRedeemPointsSuccessState) {
                widget.totalPoints = widget.totalPoints! - state.pointsToSpend;
                Dialogs.SuccessAlertInOut(context: context, message: "Success");
              }
            },
            child:
                BlocBuilder<SmileIoWaysToRedeemBloc, SmileIoWaysToRedeemState>(
              builder: (context, state) {
                dynamic waysToRedeemData =
                    context.read<SmileIoWaysToRedeemBloc>().waysToRedeemData;
                if (state is SmileIoWaysToRedeemLoadingState) {
                  return Center(
                    child: Text("Loading"),
                  ); // SmileIoDashboardScreenShimmerView();
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
                                        width: 50,
                                        height: 50,
                                        child: WidgetImage(
                                            waysToRedeemData![index]
                                                        ["reward"] !=
                                                    null
                                                ? waysToRedeemData![index]![
                                                    "reward"]["image_url"]!
                                                : ""),
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
                                                          "reward"]["name"]!,
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
                                                          "exchange_description"]!,
                                                      style: CustomTextTheme
                                                          .getTextStyle(
                                                              MyTextStyle
                                                                  .CommonThemeSubTitle,
                                                              context))),
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
                                                        "exchange_type"]! ==
                                                    "variable" ||
                                                (waysToRedeemData![index]![
                                                        "points_price"]! <=
                                                    widget.totalPoints)) {
                                              if (waysToRedeemData![index]![
                                                      "exchange_type"]! ==
                                                  "fixed") {
                                                DialogAction action = await Dialogs
                                                    .customAbortDialog(
                                                        context,
                                                        "Do you want to redeem points?",
                                                        "");
                                                if (action ==
                                                    DialogAction.YES) {
                                                  context
                                                      .read<
                                                          SmileIoWaysToRedeemBloc>()
                                                      .add(onLoadRedeemPointsDataEvent(
                                                          waysToRedeemData![
                                                                  index]
                                                              ["points_price"],
                                                          waysToRedeemData![
                                                              index]["id"],
                                                          widget.customerId!));
                                                }
                                              } else if (waysToRedeemData![
                                                          index]![
                                                      "exchange_type"]! ==
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
                                                                  "Do you want to redeem points?",
                                                                  "");
                                                      if (action ==
                                                          DialogAction.YES) {
                                                        context1.pop(true);
                                                        context
                                                            .read<
                                                                SmileIoWaysToRedeemBloc>()
                                                            .add(onLoadRedeemPointsDataEvent(
                                                                pointsToSpend,
                                                                waysToRedeemData![
                                                                        index]
                                                                    ["id"],
                                                                widget
                                                                    .customerId!));
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
                                              // (state is SmileIoPointsRedeemingState) ? "..." :
                                              "Redeem",
                                              style: TextStyle(
                                                  color: (waysToRedeemData![
                                                                      index]![
                                                                  "exchange_type"]! ==
                                                              "variable" ||
                                                          (waysToRedeemData![
                                                                      index]![
                                                                  "points_price"]! <=
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
                                                color: ((waysToRedeemData![index]!["exchange_type"]! ==
                                                                "variable" &&
                                                            waysToRedeemData![index]![
                                                                    "variable_points_step"]! <=
                                                                widget
                                                                    .totalPoints) ||
                                                        (waysToRedeemData![index]![
                                                                    "exchange_type"]! ==
                                                                "fixed" &&
                                                            waysToRedeemData![index]![
                                                                    "points_price"]! <=
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
