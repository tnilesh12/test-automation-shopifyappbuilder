import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';

class ProfileScreenShimmerView extends StatelessWidget {
  const ProfileScreenShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 25, right: 25, top: 120),
      child: Column(
        children: [
          Shimmer.fromColors(
              child: Container(
                width: 130,
                height: 20,
                color: AppTheme.baseColor,
              ),
              baseColor: AppTheme.baseColor,
              highlightColor: AppTheme.highlightColor),
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, state) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 234, 234),
                      // border: Border(bottom: BorderSide(color: AppTheme.borderColor!))
                    ),
                    child: Row(
                      children: [
                        Shimmer.fromColors(
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Color.fromARGB(255, 236, 234, 234),
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                        SizedBox(
                          width: 15,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                              width: 150,
                              height: 20,
                              color: Color.fromARGB(255, 236, 234, 234),
                              alignment: Alignment.center,
                            ),
                            baseColor: AppTheme.baseColor,
                            highlightColor: AppTheme.highlightColor),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          // Column(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.all(15),
          //           width: MediaQuery.of(context).size.width,
          //           height: 60,
          //           decoration: BoxDecoration(
          //             color: Color.fromARGB(255, 236, 234, 234),
          //             border: Border(bottom: BorderSide(color: AppTheme.borderColor!))
          //           ),
          //           child: Row(
          //             children: [
          //               Shimmer.fromColors(
          //                   child: Container(
          //                     width: 30,
          //                     height: 30,
          //                     color: Color.fromARGB(255, 236, 234, 234),
          //                   ),
          //                   baseColor: AppTheme.baseColor,
          //                   highlightColor: AppTheme.highlightColor),
          //               SizedBox(
          //                 width: 15,
          //               ),
          //               Shimmer.fromColors(
          //                   child: Container(
          //                     width: 150,
          //                     height: 20,
          //                     color: Color.fromARGB(255, 236, 234, 234),
          //                     alignment: Alignment.center,
          //                   ),
          //                   baseColor: AppTheme.baseColor,
          //                   highlightColor: AppTheme.highlightColor),
          //             ],
          //           ),
          //         ),
          //          Container(
          //           padding: EdgeInsets.all(15),
          //           width: MediaQuery.of(context).size.width,
          //           height: 30,
          //           decoration: BoxDecoration(
          //             color: Color.fromARGB(255, 236, 234, 234),
          //             border: Border(bottom: BorderSide(color: AppTheme.borderColor!))
          //           ),
          //           child: Row(
          //             children: [
          //               Shimmer.fromColors(
          //                   child: Container(
          //                     width: 30,
          //                     height: 30,
          //                     color: Color.fromARGB(255, 236, 234, 234),
          //                   ),
          //                   baseColor: AppTheme.baseColor,
          //                   highlightColor: AppTheme.highlightColor),
          //               SizedBox(
          //                 width: 15,
          //               ),
          //               Shimmer.fromColors(
          //                   child: Container(
          //                     width: 150,
          //                     height: 5,
          //                     color: Color.fromARGB(255, 236, 234, 234),
          //                     alignment: Alignment.center,
          //                   ),
          //                   baseColor: AppTheme.baseColor,
          //                   highlightColor: AppTheme.highlightColor),
          //             ],
          //           ),
          //         ),
          //       ],
          //     )
          
        ],
      ),
    );
  }
}
