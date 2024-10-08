import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme2/utils/theme_size.dart';

class CheckoutShimmerEffect {
  Widget checkoutshimmereffect(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 150,
                        height: 13,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 80,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
                            color: AppTheme.baseColor,
                            // color: AppTheme.yellow
                          ),
                          width: 100,
                          height: 35),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 50,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 50,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 30,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 30,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 50,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 50,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 60,
                        height: 10,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 100,
                      height: 10,
                      color: AppTheme.baseColor,
                    ),
                  ),
                  baseColor: AppTheme.baseColor,
                  highlightColor: AppTheme.highlightColor),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 100,
                        height: 12,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 15,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 100,
                        height: 12,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 65,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
                            color: AppTheme.baseColor,
                            // color: AppTheme.yellow
                          ),
                          width: 50,
                          height: 35),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 25,
                        height: 25,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 20,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 200,
                        height: 12,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                  child: Container(
                    width: 80,
                    height: 12,
                    color: AppTheme.baseColor,
                  ),
                  baseColor: AppTheme.baseColor,
                  highlightColor: AppTheme.highlightColor),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 80,
                        height: 80,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                          child: Container(
                            width: 200,
                            height: 12,
                            color: AppTheme.baseColor,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                          child: Container(
                            width: 150,
                            height: 12,
                            color: AppTheme.baseColor,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                      child: Container(
                        width: 60,
                        height: 12,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                  SizedBox(
                    width: 10,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        width: 60,
                        height: 12,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Shimmer.fromColors(child: Container(width: 250,height: 50,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   SizedBox(width: 7,),
                    Shimmer.fromColors(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
                            color: AppTheme.baseColor,
                            // color: AppTheme.yellow
                          ),
                          width: 70,
                          height: 50),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              )
            ],
          ),
        ),
         SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 3,
        ),
        Container(
           margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
           child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(child: Container(width: 80,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   Shimmer.fromColors(child: Container(width: 70,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(height: 5,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(child: Container(width: 50,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   Shimmer.fromColors(child: Container(width: 70,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(height: 5,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(child: Container(width: 80,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   Shimmer.fromColors(child: Container(width: 70,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(height: 5,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(child: Container(width: 80,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   Shimmer.fromColors(child: Container(width: 70,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                ],
              ),
              SizedBox(height: 5,),
                Divider(
          thickness: 3,
        ),
              SizedBox(height: 5,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(child: Container(width: 80,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                   Shimmer.fromColors(child: Container(width: 70,height: 12,color: AppTheme.baseColor,),
                   baseColor: AppTheme.baseColor, highlightColor: AppTheme.highlightColor),
                ],
              ),
            ],
           ),
        )
      ],
    );
  }
}
