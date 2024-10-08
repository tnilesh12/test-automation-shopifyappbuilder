import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class HomeScreenShimmerView extends StatelessWidget {
  HomeScreenShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 25,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 25,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 100,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
                Shimmer.fromColors(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 100,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 100,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
                Shimmer.fromColors(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 100,
                      color: AppTheme.baseColor,
                    ),
                    baseColor: AppTheme.baseColor,
                    highlightColor: AppTheme.highlightColor),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
