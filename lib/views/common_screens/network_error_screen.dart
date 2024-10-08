import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import '/views/widgets/custom_button.dart';

class NetworkErrorScreen extends StatefulWidget {
  NetworkErrorScreen({super.key});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  child:
                      SvgPicture.string(AppAssets.internetConnectionLostSvg)),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  LanguageManager.translations()[
                          "NetworkErrorConnectionLost"] ??
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
              // widget.exitOrTryAgain == "TryAgain"
              //     ?
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 10),
              //     child: CustomButton(
              //       text: LanguageManager.translations()["TryAgain"] ??
              //           "Try Again",
              //       backgroundColor: Colors.black,
              //       textColor:  Colors.white,
              //       onPressed: () {
              //         context.push("/${Routes.dashboardScreen}");
              //       },
              //     ),
              //   )
              // :
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  text: "Exit App",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else {
                      exit(0);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
