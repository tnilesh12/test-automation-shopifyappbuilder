import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class InstaFeedShimmerView extends StatelessWidget {
  const InstaFeedShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          physics: ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            // childAspectRatio: (1 / 1.20), //1.45
            childAspectRatio: (1 / 1.1),
            crossAxisSpacing: 6,
          ),
          padding: EdgeInsets.all(10.0),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, state) {
            return Container(
              child: Column(
                children: [
                  Container(
                    child: Shimmer.fromColors(
                        child:
                            Container(height: 100, color: AppTheme.baseColor),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    child: Shimmer.fromColors(
                        child: Container(
                          height: 10,
                          color: AppTheme.baseColor,
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                  )
                ],
              ),
            );
          }),
    );
  }
}
