import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTheme =
      globals.Settings.containsKey(SettingsEnum.Customizable_Font.name)
          ? TextTheme(
              bodySmall: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
              bodyMedium: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
              bodyLarge: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
              titleMedium: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
              titleSmall: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
              titleLarge: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryLightTextColor,
              ),
            )
          : TextTheme(
              bodySmall: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
              bodyMedium: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
              bodyLarge: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
              titleMedium: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
              titleSmall: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
              titleLarge: TextStyle(
                color: AppTheme.primaryLightTextColor,
              ),
            );

  static TextTheme darkTheme =
      globals.Settings.containsKey(SettingsEnum.Customizable_Font.name)
          ? TextTheme(
              bodySmall: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
              bodyMedium: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
              bodyLarge: GoogleFonts.getFont(
                AppTheme.bodyFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
              titleMedium: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
              titleSmall: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
              titleLarge: GoogleFonts.getFont(
                AppTheme.headingFont!.trim(),
                color: AppTheme.primaryDarkTextColor,
              ),
            )
          : TextTheme(
              bodySmall: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
              bodyMedium: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
              bodyLarge: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
              titleMedium: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
              titleSmall: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
              titleLarge: TextStyle(
                color: AppTheme.primaryDarkTextColor,
              ),
            );
}
