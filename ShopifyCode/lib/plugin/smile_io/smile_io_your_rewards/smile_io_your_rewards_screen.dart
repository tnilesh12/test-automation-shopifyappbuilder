import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_rewards/bloc/smile_io_your_rewards_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_rewards/bloc/smile_io_your_rewards_state.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmileIoYourRewardsScreen extends StatelessWidget {
  int customerId;
  SmileIoYourRewardsScreen(this.customerId, {super.key});
  final double defaultFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Rewards",
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
          create: (context) => SmileIoYourRewardsBloc(customerId),
          child: BlocListener<SmileIoYourRewardsBloc, SmileIoYourRewardsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: BlocBuilder<SmileIoYourRewardsBloc, SmileIoYourRewardsState>(
              builder: (context, state) {
                dynamic yourRewardsData =
                    context.read<SmileIoYourRewardsBloc>().yourRewardsData;

                if (state is SmileIoYourRewardsLoadingState) {
                  return Center(
                    child: Text("Loading"),
                  ); // SmileIoDashboardScreenShimmerView();
                } else {
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft,
                        0, DashboardFontSize.paddingRight, 0),
                    child: yourRewardsData!.isNotEmpty
                        ? Container(
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: yourRewardsData!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 10,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 5, right: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        child: WidgetImage(
                                            yourRewardsData![index]
                                                        ["image_url"] !=
                                                    null
                                                ? yourRewardsData![index]
                                                    ["image_url"]!
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
                                                      yourRewardsData![index]![
                                                          "name"]!,
                                                      style: CustomTextTheme
                                                          .getTextStyle(
                                                              MyTextStyle
                                                                  .CommonThemeSubTitle,
                                                              context))),
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      yourRewardsData![index]![
                                                          "source_description"]!,
                                                      style: CustomTextTheme
                                                              .getTextStyle(
                                                                  MyTextStyle
                                                                      .CommonThemeSubTitle,
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 12))),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "${yourRewardsData![index]!["code"]!}"));
                                                        Dialogs
                                                            .SuccessAlertInOut(
                                                          context: context,
                                                          message:
                                                              "Code Copied Successfully",
                                                        );
                                                      },
                                                      child: Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              yourRewardsData![
                                                                      index]![
                                                                  "code"]!,
                                                              style: CustomTextTheme.getTextStyle(
                                                                      MyTextStyle
                                                                          .CommonThemeSubTitle,
                                                                      context)
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14))),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        await Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "${yourRewardsData![index]!["code"]!}"));
                                                        Dialogs
                                                            .SuccessAlertInOut(
                                                          context: context,
                                                          message:
                                                              "Code Copied Successfully",
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: SvgPicture.asset(
                                                            "assets/images/copy-text.svg",
                                                            colorFilter:
                                                                ColorFilter.mode(
                                                                    AppTheme
                                                                        .primaryLightTextColor!,
                                                                    BlendMode
                                                                        .srcIn)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              yourRewardsData![index]![
                                                          "terms_and_conditions"] !=
                                                      null
                                                  ? Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          yourRewardsData![
                                                                  index]![
                                                              "terms_and_conditions"]!,
                                                          style: CustomTextTheme
                                                                  .getTextStyle(
                                                                      MyTextStyle
                                                                          .CommonThemeSubTitle,
                                                                      context)
                                                              .copyWith(
                                                                  fontSize:
                                                                      10)))
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
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
