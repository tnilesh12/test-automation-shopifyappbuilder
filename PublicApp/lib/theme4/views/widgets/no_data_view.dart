import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme4/views/widgets/common/custom_button.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataView extends StatelessWidget {
  String? svg;
  String? title;
  String? buttonTitle;
  Function? onTap;
  NoDataView(this.svg, this.title, {this.buttonTitle, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   maxRadius: 80,
            //   backgroundColor: AppTheme.primaryButtonBackground,
            //   child:
            SvgPicture.string(
              colorFilter: ColorFilter.mode(
                  AppTheme.appBarTextColor!.withAlpha(50), BlendMode.srcIn),
              svg!,
              height: 100,
            ),
            // ),
            title != null && title != ""
                ? Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(title! ,
                        // LanguageManager.translations()[
                        //     title]!, // AppLocalizations.of(context)!.nodatafoundpleasetryagain,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.titleMedium!.fontSize,
                          // color: AppTheme.lightBorder
                        )),
                  )
                : Container(),
            onTap != null
                ? CustomButton(
                    text: buttonTitle!,
                    onPressed: () {
                      onTap!();
                    },
                  )
                : Container()
          ],
        ));
  }
}
