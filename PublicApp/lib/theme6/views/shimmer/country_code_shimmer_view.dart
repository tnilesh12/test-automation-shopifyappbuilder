import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../utils/theme_size.dart';

class CountryCodeShimmerEffect {
  Widget countrycodeshimmereffect(context) {
    return Container(
        child: ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            itemBuilder: (context, state) {
              return Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                        child: Container(
                          width: 20,
                          height: 20,
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
                          height: 20,
                          color: AppTheme.baseColor,
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                    Spacer(),
                    Shimmer.fromColors(
                        child: Container(
                          width: 20,
                          height: 20,
                          color: const Color.fromARGB(255, 15, 15, 18),
                        ),
                        baseColor: AppTheme.baseColor,
                        highlightColor: AppTheme.highlightColor),
                  ],
                ),
              );
            }));
  }

  Widget statecodeshimmereffect(context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        // Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: 50,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(
        //             Radius.circular(ThemeSize.themeBorderRadius)),
        //         border: Border.all(color: AppTheme.highlightColor)),
        //     margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        //     padding: EdgeInsets.only(
        //       left: 20,
        //       right: 20,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text("search",
        //             style:
        //                 TextStyle(color: AppTheme.editTextControllerTextColor)),
        //         Icon(Icons.search),
        //       ],
        //     )),
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // searchbar(context),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Shimmer.fromColors(
                                    child: Container(
                                      height: 20,
                                      color: AppTheme.baseColor,
                                    ),
                                    baseColor: AppTheme.baseColor,
                                    highlightColor: AppTheme.highlightColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                    ],
                  ),
                );
              }),
        ),
      ],
    )));
  }
}
