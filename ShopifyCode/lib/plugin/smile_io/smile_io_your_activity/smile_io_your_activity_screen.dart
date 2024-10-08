import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_activity/bloc/smile_io_your_activity_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_activity/bloc/smile_io_your_activity_state.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmileIoYourActivityScreen extends StatelessWidget {
  SmileIoYourActivityScreen(this.customerId, {super.key});
  int customerId;
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
          create: (context) => SmileIoYourActivityBloc(customerId),
          child:
              BlocListener<SmileIoYourActivityBloc, SmileIoYourActivityState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child:
                BlocBuilder<SmileIoYourActivityBloc, SmileIoYourActivityState>(
              builder: (context, state) {
                dynamic yourActivityData =
                    context.read<SmileIoYourActivityBloc>().yourActivityData;

                if (state is SmileIoYourActivityLoadingState) {
                  return Center(
                    child: Text("Loading"),
                  ); // SmileIoDashboardScreenShimmerView();
                } else {
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft,
                        0, DashboardFontSize.paddingRight, 0),
                    child: yourActivityData!.isNotEmpty
                        ? Container(
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: yourActivityData!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 10,
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      yourActivityData![index]![
                                                          "description"]!,
                                                      style: CustomTextTheme
                                                          .getTextStyle(
                                                              MyTextStyle
                                                                  .CommonThemeSubTitle,
                                                              context))),
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      yourActivityData![index]![
                                                                  "points_change"]
                                                              .toString()!
                                                              .contains("-")
                                                          ? "${yourActivityData![index]!["points_change"]} Points"
                                                          : "+${yourActivityData![index]!["points_change"].toString()} Points",
                                                      style: CustomTextTheme
                                                              .getTextStyle(
                                                                  MyTextStyle
                                                                      .CommonThemeSubTitle,
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 13))),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Text(DateTimeUtils.getDate(
                                              yourActivityData![index]
                                                  ["updated_at"])))
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
