import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class ProductDetailShimmerEffects {
  Widget productdetailsscreenshimmereffect(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: AppTheme.baseColor,
          highlightColor: AppTheme.highlightColor,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            color: AppTheme.black,
          ),
        ),

        Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Shimmer.fromColors(
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 6,
                  color: AppTheme.black.withAlpha(50),
                )),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width * 30 / 100,
                  height: 6,
                  color: AppTheme.black.withAlpha(50),
                )),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width * 50 / 100,
                  height: 6,
                  color: AppTheme.black.withAlpha(50),
                )),
            SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: AppTheme.black.withAlpha(50),
                )),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: AppTheme.black.withAlpha(50),
                )),
          ]),
        )
        // Divider(height: 1, color: Colors.grey),
      ],
    ));
  }
}
