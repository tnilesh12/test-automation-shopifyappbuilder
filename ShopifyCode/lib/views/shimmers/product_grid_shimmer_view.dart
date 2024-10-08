import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class productGridShimmerView {
  Widget productGridShimmerEffect(context,
      {required int showItems, required int columns}) {
    return Container(
        // margin: EdgeInsets.fromLTRB(4, 128, 4, 0),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: DashboardFontSize.productGridHeightForDashboard(
                        type: "Grid") +
                    5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: columns),
            itemCount: showItems,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      border:
                          Border.all(width: 0.5, color: AppTheme.lightBorder)),
                  // padding: EdgeInsets.fromLTRB(6, 0, 6, 5),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        child: Shimmer.fromColors(
                            child: Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.fromLTRB(8, 6, 8, 8),
                              width: MediaQuery.of(context).size.width,
                              height: DashboardFontSize
                                  .productGridHeightForDashboard(type: "Image"),
                              color: AppTheme.highlightColor,
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 8,
                                  color: AppTheme.highlightColor,
                                ),
                                baseColor: AppTheme.baseColor,
                                highlightColor: AppTheme.highlightColor),
                            SizedBox(
                              height: 8,
                            ),
                            Shimmer.fromColors(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 8,
                                  color: AppTheme.highlightColor,
                                ),
                                baseColor: AppTheme.baseColor,
                                highlightColor: AppTheme.highlightColor),
                            SizedBox(
                              height: 8,
                            ),
                            Shimmer.fromColors(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: 8,
                                  color: AppTheme.highlightColor,
                                ),
                                baseColor: AppTheme.baseColor,
                                highlightColor: AppTheme.highlightColor),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }));
  }
}
