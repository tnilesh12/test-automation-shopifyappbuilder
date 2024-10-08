import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/smile_io/dashboad_sections/bloc/smile_io_dashboard_section_widget_bloc.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/smile_io_dashboard_screen.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';

class SmileIoDashboardWidget extends StatelessWidget {
  Function() loginButtonClick;
  SmileIoData smileIoData;

  SmileIoDashboardWidget(this.smileIoData, this.loginButtonClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.getColorFromHex(smileIoData.backgroundColor!),
      child: BlocProvider(
        create: (context) => SmileIoDashboardSectionWidgetBloc(),
        child: BlocBuilder<SmileIoDashboardSectionWidgetBloc,
            SmileIoDashboardSectionWidgetState>(
          builder: (context, state) {
            print("-------------state is ${state.toString()}---------------");
            if (state is SmileIoDashboardSectionWidgetLoadingState ||
                state is SmileIoDashboardSectionWidgetInitialState) {
              return Center(
                child: Text(
                  "Loading",
                  style: TextStyle(
                    color: Utils.getColorFromHex(smileIoData.textcolor!),
                  ),
                ),
              ); // SmileIoDashboardSectionWidgetShimmerView();
            } else if (state is SmileIoDashboardSectionWidgetAPIFailureState) {
              return Container();
            } else if (state is SmileIoDashboardSectionWidgetNoLoginState) {
              return Container(
                // padding: const EdgeInsets.all(16.0),
                padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
                    DashboardFontSize.paddingRight, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      smileIoData.heading!,
                      style: TextStyle(
                          fontSize: DashboardFontSize.headingFontSize,
                          fontWeight: FontWeight.bold,
                          color: Utils.getColorFromHex(smileIoData.textcolor!)),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        "assets/images/gift.svg",
                        colorFilter: ColorFilter.mode(
                            Utils.getColorFromHex(
                              smileIoData.textcolor!,
                            ),
                            BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please Login to see Points Balance",
                      style: TextStyle(
                          fontSize: DashboardFontSize.subHeadingFontSize,
                          // fontWeight: FontWeight.bold,
                          color: Utils.getColorFromHex(smileIoData.textcolor!)),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => loginButtonClick.call(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: DashboardFontSize.dashboardButtonSize,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                                color: AppTheme.primaryButtonBackground,
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius)),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: AppTheme.primaryButtonText),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                //color: Colors.black.withOpacity(0.5),
                // padding: const EdgeInsets.all(16.0),
                padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
                    DashboardFontSize.paddingRight, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        smileIoData.heading!,
                        style: TextStyle(
                            fontSize: DashboardFontSize.headingFontSize,
                            fontWeight: FontWeight.bold,
                            color:
                                Utils.getColorFromHex(smileIoData.textcolor!)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Hi, ",
                                          style: CustomTextTheme.getTextStyle(
                                                  MyTextStyle
                                                      .CommonThemeSubTitle,
                                                  context)
                                              .copyWith(
                                                  fontSize: DashboardFontSize
                                                      .descFontSize,
                                                  color: Utils.getColorFromHex(
                                                      smileIoData
                                                          .textcolor!)))),
                                  context
                                              .read<
                                                  SmileIoDashboardSectionWidgetBloc>()
                                              .customerData!["first_name"] !=
                                          null
                                      ? Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              context
                                                  .read<
                                                      SmileIoDashboardSectionWidgetBloc>()
                                                  .customerData!["first_name"]!,
                                              style: CustomTextTheme
                                                      .getTextStyle(
                                                          MyTextStyle
                                                              .CommonThemeTitle,
                                                          context)
                                                  .copyWith(
                                                      fontSize: 18,
                                                      color:
                                                          Utils.getColorFromHex(
                                                              smileIoData
                                                                  .textcolor!))))
                                      : Container(),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Points Balance",
                                    style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.CommonThemeSubTitle,
                                            context)
                                        .copyWith(
                                            fontSize:
                                                DashboardFontSize.descFontSize,
                                            color: Utils.getColorFromHex(
                                                smileIoData.textcolor!)))),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          context
                                      .read<SmileIoDashboardSectionWidgetBloc>()
                                      .customerData!["vip_tier"]["name"] !=
                                  null
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        DashboardFontSize.customBorderRadius),
                                    color: context
                                                .read<
                                                    SmileIoDashboardSectionWidgetBloc>()
                                                .customerData!["vip_tier"]
                                                    ["name"]!
                                                .toLowerCase() ==
                                            "gold"
                                        ? Colors.amber
                                        : context
                                                    .read<
                                                        SmileIoDashboardSectionWidgetBloc>()
                                                    .customerData!["vip_tier"]
                                                        ["name"]!
                                                    .toLowerCase() ==
                                                "silver"
                                            ? Colors.grey
                                            : const Color.fromARGB(
                                                100, 184, 115, 51),
                                  ),
                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                  // margin: EdgeInsets.fromLTRB(5, 0, 5, 2),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      context
                                          .read<
                                              SmileIoDashboardSectionWidgetBloc>()
                                          .customerData!["vip_tier"]["name"]!,
                                      style: CustomTextTheme.getTextStyle(
                                              MyTextStyle.CommonThemeTitle,
                                              context)
                                          .copyWith(fontSize: 12)))
                              : Container(),
                          context
                                      .read<SmileIoDashboardSectionWidgetBloc>()
                                      .customerData!["points_balance"] !=
                                  null
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${context.read<SmileIoDashboardSectionWidgetBloc>().customerData!["points_balance"]}",
                                      style: CustomTextTheme.getTextStyle(
                                              MyTextStyle.CommonThemeTitle,
                                              context)
                                          .copyWith(
                                              fontSize: 30,
                                              color: Utils.getColorFromHex(
                                                  smileIoData.rewardColor!))))
                              : Container(),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        ShopifyUser? user = await Session().getLoginData();
                        SmileIoDashboardScreen smileIoDashboardScreen =
                            SmileIoDashboardScreen(true, email: user!.email!);
                        context.push("/${Routes.smileIoDashboardScreen}",
                            extra: smileIoDashboardScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: DashboardFontSize.dashboardButtonSize,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                color: AppTheme.primaryButtonBackground,
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius)),
                            child: Text(
                              smileIoData.button!,
                              style:
                                  TextStyle(color: AppTheme.primaryButtonText!),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
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
