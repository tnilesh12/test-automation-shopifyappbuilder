import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:go_router/go_router.dart';
import '/views/widgets/custom_button.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onBack;
  bool showButton;
  ErrorScreen({required this.onBack, required this.showButton, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: SvgPicture.string(AppAssets.noDataFoundSvg),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    LanguageManager.translations()["Yourpagedidnotrespond"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    LanguageManager.translations()["pagedoesnotexist "],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                showButton
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomButton(
                          text: LanguageManager.translations()["BackHome"],
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            context.pop(true);
                            onBack.call();
                            // Navigator.pop(context);
                          },
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
