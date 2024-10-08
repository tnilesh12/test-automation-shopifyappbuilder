import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import '/views/common_screens/api_failure.dart';
import 'bloc/theme_preview_bloc.dart';
import 'bloc/theme_preview_state.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:publicapp/main.dart' as publicapp;

class ThemePreviewScreen extends StatelessWidget {
  const ThemePreviewScreen({super.key});

  final double defaultFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Theme"),
      ),
      body: BlocProvider(
        create: (context) => ThemePreviewBloc(),
        child: BlocListener<ThemePreviewBloc, ThemePreviewState>(
          listener: (context, state) {},
          child: BlocBuilder<ThemePreviewBloc, ThemePreviewState>(
            builder: (context, state) {
              dynamic themeData = context.read<ThemePreviewBloc>().themeData;
              if (state is ThemePreviewLoadingState) {
                return Center(
                  child: Text("Loading"),
                ); // SmileIoDashboardScreenShimmerView();
              } else if (state is ThemePreviewAPIFailureState) {
                return APIFailureScreens(state.message, showButton: true);
              } else {
                return Container(
                  padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 0,
                      DashboardFontSize.paddingRight, 0),
                  child: themeData!.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.only(top: 5),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: themeData!.length,
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
                                          themeData![index]["img"] != null
                                              ? themeData![index]["img"]!
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
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    themeData![index]![
                                                        "title"]!,
                                                    style: CustomTextTheme
                                                            .getTextStyle(
                                                                MyTextStyle
                                                                    .CommonThemeSubTitle,
                                                                context)
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15))),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    themeData![index]!["des"]!,
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
                                    Expanded(
                                        child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(30, 10, 10, 10),
                                      child: InkWell(
                                        onTap: () async {
                                          if ((themeData![index]!["status"]! ==
                                                  "Live") ||
                                              (themeData![index]!["status"]! ==
                                                  "Publish")) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return publicapp.MyApp1(
                                                      themeName: themeData![
                                                          index]!["theme"]!,
                                                      isPublished: "no");
                                                },
                                              ),
                                              (route) {
                                                return false;
                                              },
                                            ).then((value) {
                                              print(
                                                  "---------callback ${value}--------");
                                            });
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: DashboardFontSize
                                              .dashboardButtonSize,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            ((themeData![index]!["status"]! ==
                                                        "Live") ||
                                                    (themeData![index]![
                                                            "status"]! ==
                                                        "Publish"))
                                                ? "View"
                                                : "Disabled",
                                            style: TextStyle(
                                                color: ((themeData![index]![
                                                                "status"]! ==
                                                            "Live") ||
                                                        (themeData![index]![
                                                                "status"]! ==
                                                            "Publish"))
                                                    ? Colors.white
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
                                              color: ((themeData![index]![
                                                              "status"]! ==
                                                          "Live") ||
                                                      (themeData![index]![
                                                              "status"]! ==
                                                          "Publish"))
                                                  ? Colors.black
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
      ),
    );
  }
}
