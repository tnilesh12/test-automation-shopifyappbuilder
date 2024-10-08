import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import '/theme3/views/widgets/common/custom_button.dart';
import 'package:go_router/go_router.dart';

class NetworkErrorScreen extends StatefulWidget {
  final VoidCallback onRetry;
  String? exitOrTryAgain;
  NetworkErrorScreen(
      {required this.onRetry, this.exitOrTryAgain = "TryAgain", super.key});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
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
              child: AppTheme.primaryButtonBackground != null &&
                      Utils.convertColorToHex(
                              AppTheme.primaryButtonBackground!) !=
                          ""
                  ? SvgPicture.string(AppAssets.internetConnectionLostSvg
                      // .replaceAll(
                      //     "263238",
                      //     Utils.convertColorToHex(
                      //         AppTheme.primaryButtonBackground!))
                      .replaceAll(
                          "113138",
                          Utils.convertColorToHex(
                              AppTheme.primaryButtonBackground!)))
                  : SvgPicture.string(AppAssets.internetConnectionLostSvg
                      .replaceAll("263238", "263238")),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                LanguageManager.translations()["NetworkErrorConnectionLost"] ??
                    "Network Error! Connection Lost",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                LanguageManager.translations()[
                        "Pleasecheckyourinternetconnectionandtryagain"] ??
                    "Please check your internet connection and try again. ",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            widget.exitOrTryAgain == "TryAgain"
                ?
                // InkResponse(
                //     onTap: widget.onRetry,
                //     child: Container(
                //       margin: EdgeInsets.only(top: 40),
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                //           color: Colors.black),
                //       height: MediaQuery.of(context).size.height * 0.05,
                //       width: MediaQuery.of(context).size.width * 0.30,
                //       child: Text(
                //         LanguageManager.translations()["TryAgain"] ??
                //             "Try Again",
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //       ),
                //     ),
                //   )
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      text: LanguageManager.translations()["TryAgain"] ??
                          "Try Again",
                      backgroundColor:
                          AppTheme.primaryButtonBackground ?? Colors.black,
                      textColor: AppTheme.primaryButtonText ?? Colors.white,
                      onPressed: () {
                        context.push("/${Routes.dashboardScreen}");
                      },
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      text: "Exit App",
                      backgroundColor:
                          AppTheme.primaryButtonBackground ?? Colors.black,
                      textColor: AppTheme.primaryButtonText ?? Colors.white,
                      onPressed: widget.onRetry,
                    ),
                  )
            // InkResponse(
            //     onTap: widget.onRetry,
            //     child: Container(
            //       margin: EdgeInsets.only(top: 40),
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(
            //               ThemeSize.themeBorderRadius),
            //           color: Colors.black),
            //       height: MediaQuery.of(context).size.height * 0.05,
            //       width: MediaQuery.of(context).size.width * 0.30,
            //       child: Text(
            //         "Exit App",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
      // ),
    );
  }
}
