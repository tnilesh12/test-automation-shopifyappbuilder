import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class AddressListShimmerView extends StatelessWidget {
  const AddressListShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: AppTheme.borderColor!)),
                ),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                            child: Container(
                              width: 70,
                              height: 10,
                              color: AppTheme.baseColor,
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        Row(
                          children: [
                            Shimmer.fromColors(
                                child: Container(
                                  width: 12,
                                  height: 10,
                                  color: AppTheme.baseColor,
                                ),
                                baseColor: AppTheme.baseColor,
                                highlightColor: AppTheme.highlightColor),
                            SizedBox(
                              width: 5,
                            ),
                            Shimmer.fromColors(
                                child: Container(
                                  width: 12,
                                  height: 10,
                                  color: AppTheme.baseColor,
                                ),
                                baseColor: AppTheme.baseColor,
                                highlightColor: AppTheme.highlightColor),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Shimmer.fromColors(
                        child: Container(
                          width: 70,
                          height: 10,
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
                          height: 10,
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
                          height: 10,
                          color: AppTheme.baseColor,
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                            child: Container(
                              width: 15,
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
                              width: 70,
                              height: 10,
                              color: AppTheme.baseColor,
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                      ],
                    )
                  ],
                ),
              ),
           
           
            ],
          );
        });
  }
}
