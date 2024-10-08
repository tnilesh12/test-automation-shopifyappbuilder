import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class SearchScreenShimmerView {
  Widget searchscreenshimmereffect(context) {
    return Container(
        // margin: EdgeInsets.fromLTRB(4, 128, 4, 0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: (1 / 1.35),
              // spacing between rows
              crossAxisSpacing: 10, // spacing between columns
            ),
            itemCount: 6,
            padding: EdgeInsets.all(10),
            // total number of items
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container( decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  width: 0.5, color: AppTheme.lightBorder)),
                          // padding: EdgeInsets.fromLTRB(6, 0, 6, 5),
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                child: Shimmer.fromColors(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              40 /
                                              100,
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
                                          margin:
                                              EdgeInsets.fromLTRB(10, 5, 10, 0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 10,
                                          color: AppTheme.highlightColor,
                                        ),
                                        baseColor: AppTheme.baseColor,
                                        highlightColor:
                                            AppTheme.highlightColor),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Shimmer.fromColors(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 10,
                                          color: AppTheme.highlightColor,
                                        ),
                                        baseColor: AppTheme.baseColor,
                                        highlightColor:
                                            AppTheme.highlightColor),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Shimmer.fromColors(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          height: 10,
                                          color: AppTheme.highlightColor,
                                        ),
                                        baseColor: AppTheme.baseColor,
                                        highlightColor:
                                            AppTheme.highlightColor),
                                            SizedBox(height: 10,)
                                  
                                  ],
                                ),
                              )
                            ],
                          ))
                    ]),
              );
            }));
  }
}
