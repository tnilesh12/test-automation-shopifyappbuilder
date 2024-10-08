import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/utils/theme_size.dart';

class CustomButton extends StatelessWidget {
  final double defaultFontSize = 16;
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  // bool showloading = true;

  // final Color? backgroundColor;
  // final Color? textColor;

  CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: ThemeSize.themeButtonSize,
        width: double.infinity,
        // child: ElevatedButton(
        padding: EdgeInsets.all(10.0),
        // onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppTheme.primaryButtonText!,
              fontSize: defaultFontSize),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius:
                BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
            color: backgroundColor ??
                AppTheme
                    .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
            ),
      ),
    );
  }
}
