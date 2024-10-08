import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/utils/theme_size.dart';

class CategoryScreenShimmerView {
  Widget categoryListshimmereffect(context) {
    return Container(
        // margin: EdgeInsets.fromLTRB(4, 128, 4, 0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //2
              mainAxisSpacing: 5, //20
              crossAxisSpacing: 5, //20
              mainAxisExtent: 140, //150
            ),
            // padding: EdgeInsets.only(
            //     right: 20, top: 20, left: 20.0),
            padding: EdgeInsets.fromLTRB(ThemeSize.paddingLeft, 5,
                ThemeSize.paddingRight, 5),
            itemCount: 12,
            // total number of items
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 140,//150,
                          // padding:
                          //     EdgeInsets.only(right: 20, top: 20, left: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              // border: Border.all(
                              //     width: 0.5, color: AppTheme.lightBorder)
                              ),
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                child: Shimmer.fromColors(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: AppTheme.highlightColor,
                                      ),
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor),
                              ),
                              Shimmer.fromColors(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: 10,
                                    color: AppTheme.highlightColor,
                                  ),
                                  baseColor: AppTheme.baseColor,
                                  highlightColor: AppTheme.highlightColor),
                            ],
                          ))
                    ]),
              );
            }));
  }
}
