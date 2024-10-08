import 'package:flutter/cupertino.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class EasySubscriptionShimmerView extends StatelessWidget {
  const EasySubscriptionShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: 150,
                  height: 15,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                    color: AppTheme.highlightColor,
                    boxShadow: [
                      BoxShadow(color: AppTheme.lightBorder, blurRadius: 2)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                        child: Container(
                          margin: EdgeInsets.only(left: 12),
                          width: 150,
                          height: 15,
                          color: AppTheme.baseColor,
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                    Shimmer.fromColors(
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          width: 150,
                          height: 15,
                          color: AppTheme.baseColor,
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                  color: AppTheme.highlightColor,
                  boxShadow: [
                    BoxShadow(color: AppTheme.lightBorder, blurRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            width: 150,
                            height: 15,
                            color: AppTheme.baseColor,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                      Shimmer.fromColors(
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            width: 150,
                            height: 15,
                            color: AppTheme.baseColor,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Shimmer.fromColors(
                      child: Container(
                        margin: EdgeInsets.only(left: 12, right: 12),
                        width: 300,
                        height: 45,
                        color: AppTheme.baseColor,
                      ),
                      baseColor: AppTheme.baseColor,
                      highlightColor: AppTheme.highlightColor),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: AppTheme.baseColor,
                ),
                baseColor: AppTheme.baseColor,
                highlightColor: AppTheme.highlightColor)
          ],
        ));
    
  }
}
