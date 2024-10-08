import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/utils/theme_size.dart';

class ProductFilterShimmerView {
  Widget ProductFilterLeftView() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: AppTheme.baseColor,
                  child: Shimmer.fromColors(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ),
                SizedBox(
                  height: 1,
                )
              ],
            ),
          );
        });
  }

  Widget ProductFilterRightView(context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width - 110,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 70,
                      height: 15,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
                SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: AppTheme.baseColor,
                          borderRadius: BorderRadius.circular(
                              ThemeSize.themeBorderRadius)),
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
              ],
            ),
            Column(
              children: [
                Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 70,
                      height: 15,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
                SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: AppTheme.baseColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(ThemeSize.themeBorderRadius))),
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
              ],
            ),
          ]),
          Column(
            children: [
              Shimmer.fromColors(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppTheme.baseColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(ThemeSize.themeBorderRadius))),
                  ),
                  baseColor: AppTheme.baseColor,
                  highlightColor: AppTheme.highlightColor),
              Shimmer.fromColors(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 10,
                    height: 150,
                    color: AppTheme.baseColor,
                  ),
                  baseColor: AppTheme.baseColor,
                  highlightColor: AppTheme.highlightColor),
              Shimmer.fromColors(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppTheme.baseColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(ThemeSize.themeBorderRadius))),
                  ),
                  baseColor: AppTheme.baseColor,
                  highlightColor: AppTheme.highlightColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget ProductFilterButtonView(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Shimmer.fromColors(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ThemeSize.themeBorderRadius)),
                    color: AppTheme.baseColor),
              ),
              baseColor: AppTheme.baseColor,
              highlightColor: AppTheme.highlightColor),
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: Shimmer.fromColors(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ThemeSize.themeBorderRadius)),
                    color: AppTheme.baseColor),
              ),
              baseColor: AppTheme.baseColor,
              highlightColor: AppTheme.highlightColor),
        )
      ],
    );
  }
}
