import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/utils.dart';
import '/theme1/views/widgets/common/custom_button.dart';

class UnderMaintenanceScreen extends StatefulWidget {
  const UnderMaintenanceScreen({super.key});

  @override
  State<UnderMaintenanceScreen> createState() => _UnderMaintenanceScreenState();
}

class _UnderMaintenanceScreenState extends State<UnderMaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Utils.convertColorToHex(
                          AppTheme.primaryButtonBackground!) ==
                      ""
                  ? SvgPicture.string(AppAssets.underMaintenanceSvg
                      .replaceAll("407BFF", "a5a795"))
                  : SvgPicture.string(AppAssets.underMaintenanceSvg.replaceAll(
                      "113138",
                      Utils.convertColorToHex(
                          AppTheme.primaryButtonBackground!))),
              // SvgPicture.asset(
              // "assets/images/maintenance.svg"), // height: 200, width: 100,),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                "We are under maintenance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                "We will be back in few hours, Thank you for understanding.",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                text: "Close",
                onPressed: () {
                  // Navigator.pop(context);
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     // Navigator.pop(context);
            //     if (Platform.isAndroid) {
            //       SystemNavigator.pop();
            //     } else if (Platform.isIOS) {
            //       exit(0);
            //     }
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(top: 40),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         borderRadius:
            //             BorderRadius.circular(ThemeSize.themeBorderRadius),
            //         color: AppTheme.primaryButtonBackground ?? Colors.black),
            //     height: MediaQuery.of(context).size.height * 0.05,
            //     width: MediaQuery.of(context).size.width * 0.60,
            //     child: Text(
            //       "Close",
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: AppTheme.primaryButtonText ?? Colors.white),
            //     ),
            //   ),
            // )
          ],
        ),
        // ),
      ),
    );
  }
}
