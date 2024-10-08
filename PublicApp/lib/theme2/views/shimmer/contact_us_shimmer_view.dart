import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';
import '/theme2/utils/theme_size.dart';

class ContactUsSchimmerView {
  Widget contactUsSchimmerView(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            // child: Container(
            //   // height : 350,
            //   height: MediaQuery.of(context).size.height / 2.3,
            //   width: double.infinity,
            //   decoration: BoxDecoration(color: AppTheme.primaryColor!),
            // ),
            child:  Container(
              // height : 350,
              height: MediaQuery.of(context).size.height / 2.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            top: 210,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ThemeSize.themeBorderRadius),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    ThemeSize.themeBorderRadius,
                  )),
                  elevation: ThemeSize.themeElevation,
                  // color: AppTheme.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    // height: 480,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppTheme.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
