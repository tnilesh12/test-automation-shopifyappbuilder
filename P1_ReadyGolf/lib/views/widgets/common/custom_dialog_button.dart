import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/utils/theme_size.dart';

class CustomDialogButton extends StatelessWidget {
  CustomDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeSize.themeButtonSize,
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: Image.asset(
        AppAssets.loadingImg,
        color: AppTheme.primaryButtonText,
      ),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
          color: AppTheme.primaryButtonBackground),
    );
  }
}
