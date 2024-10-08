import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class AdminChatScreenShimmerView {
  final double _height = 40;
  final double _width = 150;
  Widget chatShimmerView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 8, right: 8),
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          Container(
            height: 40,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
          Container(
            height: 40,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: AppTheme.baseColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
          ),
        ],
      ),
    );
  }
}
