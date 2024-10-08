import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/utils.dart';
import '../../utils/theme_size.dart';
import 'package:go_router/go_router.dart';
import '/theme5/views/widgets/common/custom_button.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onBack;
  bool showButton;
  ErrorScreen({required this.onBack, required this.showButton, super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        SafeArea(
          
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(
              left: ThemeSize.marginLeft, right: ThemeSize.marginRight),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Utils.convertColorToHex(
                            AppTheme.primaryButtonBackground!) ==
                        ""
                    ? SvgPicture.string(
                        AppAssets.noDataFoundSvg.replaceAll("407BFF", "a5a795"))
                    : SvgPicture.string(AppAssets.noDataFoundSvg.replaceAll(
                        "407BFF",
                        Utils.convertColorToHex(
                            AppTheme.primaryButtonBackground!))),
                // SvgPicture.asset(
                //     "assets/images/errorPage404.svg"), // height: 200, width: 100,),
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
                        backgroundColor:
                            AppTheme.primaryButtonBackground ?? Colors.black,
                        textColor: AppTheme.primaryButtonText ?? Colors.white,
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
      // ),
    );
  }
}
