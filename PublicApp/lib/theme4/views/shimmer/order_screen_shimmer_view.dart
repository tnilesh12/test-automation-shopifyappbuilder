import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class OrderListScreenShimmerEffect {
  Widget oderlistscreenshimmereffect(context, bool isBack) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: ListView.builder(
              itemCount: 6,
              itemBuilder: (context,state){
              return  Container(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppTheme.highlightColor, width: 1)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Shimmer.fromColors(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: AppTheme.highlightColor,
                                  ),
                                  baseColor: AppTheme.baseColor,
                                  highlightColor: AppTheme.highlightColor),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    child: Container(
                                      width: 100,
                                      height: 10,
                                      color: AppTheme.highlightColor,
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Shimmer.fromColors(
                                    child: Container(
                                      width: 70,
                                      height: 10,
                                      color: AppTheme.highlightColor,
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Shimmer.fromColors(
                                    child: Container(
                                      width: 50,
                                      height: 10,
                                      color: AppTheme.highlightColor,
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Shimmer.fromColors(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppTheme.highlightColor,
                                      ),
                                      width: 80,
                                      height: 20,
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
            })
            )
            );
  }
}
