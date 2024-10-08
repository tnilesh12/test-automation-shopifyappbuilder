import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class NotificationShimmerView extends StatelessWidget {
  const NotificationShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 5),
        child: ListView.builder(itemBuilder: (context, state) {
          return Column(
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: AppTheme.borderColor!.withAlpha(120))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                          child: Container(
                            color: AppTheme.baseColor,
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                          child: Container(
                            color: AppTheme.baseColor,
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                          child: Container(
                            color: AppTheme.baseColor,
                            width: MediaQuery.of(context).size.width / 2,
                            height: 20,
                          ),
                          baseColor: AppTheme.baseColor,
                          highlightColor: AppTheme.highlightColor),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                              child: Container(
                                color: AppTheme.baseColor,
                                width: MediaQuery.of(context).size.width / 3,
                                height: 20,
                              ),
                              baseColor: AppTheme.baseColor,
                              highlightColor: AppTheme.highlightColor),
                          SizedBox(
                            width: 20,
                          ),
                          Shimmer.fromColors(
                              child: Container(
                                color: AppTheme.baseColor,
                                width: MediaQuery.of(context).size.width / 3,
                                height: 20,
                              ),
                              baseColor: AppTheme.baseColor,
                              highlightColor: AppTheme.highlightColor),
                        ],
                      )
                    ],
                  ))
            ],
          );
        }),
      ),
    );
  }
}
