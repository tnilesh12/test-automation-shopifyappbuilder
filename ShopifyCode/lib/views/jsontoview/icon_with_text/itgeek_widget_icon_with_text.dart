import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class ItgeekWidgetIconWithText extends StatelessWidget {
  IconTextData iconTextData;

  ItgeekWidgetIconWithText(this.iconTextData);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Utils.getColorFromHex(iconTextData.backgroundColor!),
        child: iconTextData.style == "Style_1"
            ? styleOne(context)
            : iconTextData.style == "Style_2"
                ? styleTwo(context)
                : styleDefault(context));
  }

  Widget styleDefault(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          DashboardFontSize.paddingLeft,
          DashboardFontSize.paddingTop,
          DashboardFontSize.paddingRight,
          DashboardFontSize.paddingBottom),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount: int.parse(iconTextData.iconWithTextList![0].column!),
          crossAxisCount: 2,
          // childAspectRatio: 1.0,
          mainAxisExtent: iconTextData.height != null
              ? (MediaQuery.of(context).size.height *
                  ((iconTextData.height)! / 100))
              : (MediaQuery.of(context).size.width / 2),
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
        ),
        itemCount: iconTextData.iconWithTextList!.length,
        itemBuilder: (context, index) {
          return Container(
            // height: iconTextData.height != null
            //   ? (MediaQuery.of(context).size.height *
            //       ((iconTextData.height)! / 100))
            //   : (MediaQuery.of(context).size.width / 2),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: iconTextData.iconWithTextList![index].backgroundColor ==
                      null
                  ? AppTheme.primaryColor
                  : Utils.getColorFromHex(
                      iconTextData.iconWithTextList![index].backgroundColor!),
              borderRadius: BorderRadius.circular(
                  DashboardFontSize.iconWithTextBorderRadius),
              // boxShadow: [
              //   BoxShadow(
              //     color: Utils.getColorFromHex(
              //         iconTextData.iconWithTextList![index].backgroundColor!),
              //     spreadRadius: 2,
              //     blurRadius: 5,
              //     offset: Offset(0, 2),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  child: SvgPicture.string(
                    iconTextData.iconWithTextList![index].iconSrc == ""
                        ? "<svg xmlns='http://www.w3.org/2000/svg' cursor='pointer' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='#333333' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-image'><rect x='3' y='3' width='18' height='18' rx='2' ry='2'></rect><circle cx='8.5' cy='8.5' r='1.5'></circle><polyline points='21 15 16 10 5 21'></polyline></svg>"
                        : iconTextData.iconWithTextList![index].iconSrc!,
                    colorFilter: ColorFilter.mode(
                        iconTextData.iconWithTextList![index].textColor == null
                            ? AppTheme.appBarTextColor
                            : Utils.getColorFromHex(iconTextData
                                .iconWithTextList![index].textColor!),
                        BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 8.0),
                (iconTextData.iconWithTextList![index].title != null &&
                        iconTextData.iconWithTextList![index].title != "")
                    ? Text(
                        iconTextData.iconWithTextList![index].title!,
                        textAlign: TextAlign.center,
                        // maxLines: 2,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: iconTextData
                                          .iconWithTextList![index].textColor ==
                                      null
                                  ? AppTheme.appBarTextColor
                                  : Utils.getColorFromHex(iconTextData
                                      .iconWithTextList![index].textColor!),
                              fontWeight: FontWeight.bold,
                              fontSize: DashboardFontSize.headingFontSize,
                            ),
                      )
                    : Container(),
                (iconTextData.iconWithTextList![index].description != null &&
                        iconTextData.iconWithTextList![index].description != "")
                    ? Text(
                        iconTextData.iconWithTextList![index].description!,
                        textAlign: TextAlign.center,
                        // maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: iconTextData
                                        .iconWithTextList![index].textColor ==
                                    null
                                ? AppTheme.appBarTextColor
                                : Utils.getColorFromHex(iconTextData
                                    .iconWithTextList![index].textColor!),
                            fontSize: DashboardFontSize.descFontSize),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget styleOne(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          DashboardFontSize.paddingLeft,
          DashboardFontSize.paddingTop,
          DashboardFontSize.paddingRight,
          DashboardFontSize.paddingBottom),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisCount: int.parse(iconTextData.iconWithTextList![0].column!),
            crossAxisCount: 4,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            // childAspectRatio: 0.5,
            mainAxisExtent: MediaQuery.of(context).size.width / 4),
        itemCount: iconTextData.iconWithTextList!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color:
                        iconTextData.iconWithTextList![index].backgroundColor ==
                                null
                            ? AppTheme.primaryColor
                            : Utils.getColorFromHex(iconTextData
                                .iconWithTextList![index].backgroundColor!),
                    borderRadius: BorderRadius.circular(51),
                  ),
                  child: SvgPicture.string(
                    iconTextData.iconWithTextList![index].iconSrc == ""
                        ? "<svg xmlns='http://www.w3.org/2000/svg' cursor='pointer' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='#333333' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-image'><rect x='3' y='3' width='18' height='18' rx='2' ry='2'></rect><circle cx='8.5' cy='8.5' r='1.5'></circle><polyline points='21 15 16 10 5 21'></polyline></svg>"
                        : iconTextData.iconWithTextList![index].iconSrc!,
                    colorFilter: ColorFilter.mode(
                        iconTextData.iconWithTextList![index].textColor == null
                            ? AppTheme.appBarTextColor
                            : Utils.getColorFromHex(iconTextData
                                .iconWithTextList![index].textColor!),
                        BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 8.0),
                (iconTextData.iconWithTextList![index].title != null &&
                        iconTextData.iconWithTextList![index].title != "")
                    ? Text(iconTextData.iconWithTextList![index].title!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: iconTextData
                                          .iconWithTextList![index].textColor ==
                                      null
                                  ? AppTheme.appBarTextColor
                                  : Utils.getColorFromHex(iconTextData
                                      .iconWithTextList![index].textColor!),
                              fontWeight: FontWeight.bold,
                              fontSize: DashboardFontSize.headingFontSize,
                            ))
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget styleTwo(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: DashboardFontSize.paddingTop,
          bottom: DashboardFontSize.paddingBottom),
      height:
          MediaQuery.of(context).size.height * ((iconTextData.height)! / 100),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: iconTextData.iconWithTextList!.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(
                  left: 10,
                  right: index == iconTextData.iconWithTextList!.length - 1
                      ? 10
                      : 0),
              width: MediaQuery.of(context).size.width *
                  ((iconTextData.width)! /
                      ((iconTextData.width! > 90) &&
                              (iconTextData.width! <= 100)
                          ? 110
                          : 100)),
              child: Container(
                // height: iconTextData.height != null
                //   ? (MediaQuery.of(context).size.height *
                //       ((iconTextData.height)! / 100))
                //   : (MediaQuery.of(context).size.width / 2),
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color:
                      iconTextData.iconWithTextList![index].backgroundColor ==
                              null
                          ? AppTheme.primaryColor
                          : Utils.getColorFromHex(iconTextData
                              .iconWithTextList![index].backgroundColor!),
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.iconWithTextBorderRadius),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Utils.getColorFromHex(
                  //         iconTextData.iconWithTextList![index].backgroundColor!),
                  //     spreadRadius: 2,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 2),
                  //   ),
                  // ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      child: SvgPicture.string(
                        iconTextData.iconWithTextList![index].iconSrc == ""
                            ? "<svg xmlns='http://www.w3.org/2000/svg' cursor='pointer' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='#333333' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-image'><rect x='3' y='3' width='18' height='18' rx='2' ry='2'></rect><circle cx='8.5' cy='8.5' r='1.5'></circle><polyline points='21 15 16 10 5 21'></polyline></svg>"
                            : iconTextData.iconWithTextList![index].iconSrc!,
                        colorFilter: ColorFilter.mode(
                            iconTextData.iconWithTextList![index].textColor ==
                                    null
                                ? AppTheme.appBarTextColor
                                : Utils.getColorFromHex(iconTextData
                                    .iconWithTextList![index].textColor!),
                            BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    (iconTextData.iconWithTextList![index].title != null &&
                            iconTextData.iconWithTextList![index].title != "")
                        ? Text(
                            iconTextData.iconWithTextList![index].title!,
                            textAlign: TextAlign.center,
                            // maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: iconTextData.iconWithTextList![index]
                                              .textColor ==
                                          null
                                      ? AppTheme.appBarTextColor
                                      : Utils.getColorFromHex(iconTextData
                                          .iconWithTextList![index].textColor!),
                                  fontWeight: FontWeight.bold,
                                  fontSize: DashboardFontSize.headingFontSize,
                                ),
                          )
                        : Container(),
                    (iconTextData.iconWithTextList![index].description !=
                                null &&
                            iconTextData.iconWithTextList![index].description !=
                                "")
                        ? Text(
                            iconTextData.iconWithTextList![index].description!,
                            textAlign: TextAlign.center,
                            // maxLines: 3,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: iconTextData.iconWithTextList![index]
                                            .textColor ==
                                        null
                                    ? AppTheme.appBarTextColor
                                    : Utils.getColorFromHex(iconTextData
                                        .iconWithTextList![index].textColor!),
                                fontSize: DashboardFontSize.descFontSize),
                          )
                        : Container(),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
