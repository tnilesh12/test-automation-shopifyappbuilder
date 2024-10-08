import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import '../theme/app_text_theme.dart';
import 'package:shopify_code/globels.dart' as globals;

class AppTheme {
  // AppTheme._();
  late dynamic? colorsData;

  //chat colors
  // static const Color pColor = Color(0xFF3B8099);
  // static const Color sColor = Color(0xFF12262E);//secondary
  // static const Color blueLytColor = Color(0xFFEBF2F5);
  // static const Color grayColor = Color(0xFF989898);
  //Shimmer colors
  static const Color highlightColor = Color.fromARGB(255, 215, 215, 221);
  static const Color lightBorder = Color(0xffd7d7d7);
  static const Color baseColor = Color.fromARGB(255, 226, 226, 234);

  AppTheme(this.colorsData) {
    print("-----------AppTheme---- ${colorsData}");
    // primaryColor = Utils.getColorFromHex(colorsData!["page_json"]["General"]["AppBar_Color"]); //Color(0xFF151515);
    if (colorsData!["page_json"].containsKey('Radius') && colorsData!["page_json"]["Radius"]) {
      DashboardFontSize.customBorderRadius = 5;
    } else {
      DashboardFontSize.customBorderRadius = 0;
    }
    if (colorsData!["page_json"]["Height"] == "") {
      DashboardFontSize.imagetype = "Square";
    } else {
      try {
        print(colorsData!["page_json"]["Height"]);
        DashboardFontSize.imagetype =
            colorsData!["page_json"]["Height"]["name"];
      } catch (e) {
        debugPrint(e.toString());
        DashboardFontSize.imagetype = "Square";
      }
    }

    typographySize = colorsData!["page_json"]["TypographySize"]; //StyleData
    headingFont = colorsData!["page_json"]["HeadingFont"];
    bodyFont = colorsData!["page_json"]["BodyFont"];

//general
    primaryColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["AppBar_Color"]);
    appBarTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["AppBar_Text_Color"]);
    primaryLightTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Text_color"]);
    primaryLightBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Background_Color"]);
    successColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Success_Color"]);
    errorColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Error_Color"]);
    borderColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Border_Color"]);
    priceTagColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Price_Color"]);
    ratingColor = Utils.getColorFromHex(
        colorsData!["page_json"]["General"]["Rating_Color"]);
    productGridCellColor = Utils.getColorFromHex(
      colorsData!["page_json"]["General"]["cellColor"]);
    productGridCellTextColor = Utils.getColorFromHex(
      colorsData!["page_json"]["General"]["Cell_Text_color"]);
    productGridBuyNowBackgroundColor = Utils.getColorFromHex(
      colorsData!["page_json"]["General"]["buy_now_background_color"]);
    productGridBuyNowForegroundColor = Utils.getColorFromHex(
      colorsData!["page_json"]["General"]["buy_now_foreground_color"]);
      

    primaryDarkBackgroundColor = darken(primaryLightBackgroundColor!, 90);
    primaryDarkTextColor = lighten(primaryLightTextColor!, 50);

// Side_Navigation
    drawerSelectedTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Side_Navigation"]["Selected_Text_Color"]);
    drawerUnSelectedTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Side_Navigation"]["UnSelected_Text_Color"]);
    drawerSelectedBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Side_Navigation"]
            ["Selected_Background_Color"]);
    drawerUnSelectedBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Side_Navigation"]
            ["UnSelected_Background_Color"]);
    drawerMenuBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Side_Navigation"]["Menu_Background_color"]);

// Bottom_Navigation
    bottomNavigationSelectedTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Bottom_Navigation"]["Selected_Text_Color"]);
    bottomNavigationUnSelectedTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Bottom_Navigation"]["UnSelected_Text_Color"]);
    bottomNavigationSelectedBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Bottom_Navigation"]
            ["Selected_Background_Color"]);
    bottomNavigationUnSelectedBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Bottom_Navigation"]
            ["UnSelected_Background_Color"]);
    bottomNavBackgroundColor = Utils.getColorFromHex(colorsData!["page_json"]
        ["Bottom_Navigation"]["Bottom_Nav_Background_Color"]);

// Primary_Button
    primaryButtonBackground = Utils.getColorFromHex(
        colorsData!["page_json"]["Primary_Button"]["Background"]);
    primaryButtonText = Utils.getColorFromHex(
        colorsData!["page_json"]["Primary_Button"]["Text"]);

// Secondary_Button
    secondaryButtonBackground = Utils.getColorFromHex(
        colorsData!["page_json"]["Secondary_Button"]["Background"]);
    secondaryButtonText = Utils.getColorFromHex(
        colorsData!["page_json"]["Secondary_Button"]["Text"]);

// Edit_Text
    editTextBackgroundColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Edit_Text"]["Background"]);
    editTextPlaceholderColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Edit_Text"]["Placeholder_color"]);
    editTextControllerTextColor = Utils.getColorFromHex(
        colorsData!["page_json"]["Edit_Text"]["Controller_Text_color"]);
  }

  static String? typographySize;
  static String? headingFont;
  static String? bodyFont;

  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  /// Lighten a color by [percent] amount (100 = white)
// ........................................................
  static Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
  }

  static Color? primaryDarkTextColor; // = lighten(primaryLightTextColor!, 50);
  static Color?
      primaryDarkBackgroundColor; // = darken(primaryLightBackgroundColor!, 90);

//general
  static Color? primaryColor;
  static Color? appBarTextColor;
  static Color? primaryLightTextColor;
  static Color? primaryLightBackgroundColor;
  static Color? successColor;
  static Color? errorColor;
  static Color? borderColor;
  static Color? priceTagColor;
  static Color? ratingColor;
  static Color? productGridCellColor;
  static Color? productGridCellTextColor;
  static Color? productGridBuyNowBackgroundColor;
  static Color? productGridBuyNowForegroundColor;

// Side_Navigation
  static Color? drawerSelectedTextColor;
  static Color? drawerUnSelectedTextColor;
  static Color? drawerSelectedBackgroundColor;
  static Color? drawerUnSelectedBackgroundColor;
  static Color? drawerMenuBackgroundColor;

// Bottom_Navigation
  static Color? bottomNavigationSelectedTextColor;
  static Color? bottomNavigationUnSelectedTextColor;
  static Color? bottomNavigationSelectedBackgroundColor;
  static Color? bottomNavigationUnSelectedBackgroundColor;
  static Color? bottomNavBackgroundColor;

// Primary_Button
  static Color? primaryButtonBackground;
  static Color? primaryButtonText;

// Secondary_Button
  static Color? secondaryButtonBackground;
  static Color? secondaryButtonText;

// Edit_Text
  static Color? editTextBackgroundColor;
  static Color? editTextPlaceholderColor;
  static Color? editTextControllerTextColor;

  static Color black = Colors.black;
  static Color? white = Colors.white;

//   static const Color Border_Color = Color(0xFF4DADA9);
//   static const Color menubackColor = Color(0xFF4B4B4B); ///// primary colour
//   static const Color menuTextColor = Color(0xFFFDFDFD); //// white colour
//   // static const Color menuTextTitleColor = Color(0xFFCECECE);
// //   static const Color buttonbackColor= Color(0XFF15969A);

  static ThemeData lightTheme = ThemeData(
    canvasColor: AppTheme.primaryLightBackgroundColor,
    useMaterial3: true,

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(fontFamily: AppTheme.headingFont),
      tileColor: AppTheme.primaryLightBackgroundColor,
      textColor: AppTheme.primaryLightTextColor,
      iconColor: AppTheme.primaryLightTextColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.primaryColor, //primaryLightAppBarColor
      titleTextStyle:
          globals.Settings.containsKey(SettingsEnum.Customizable_Font.name)
              ? GoogleFonts.getFont(
                  AppTheme.headingFont!.trim(),
                  fontSize: 16,
                  color: AppTheme.appBarTextColor,
                )
              : TextStyle(fontSize: 16, color: AppTheme.appBarTextColor),
      iconTheme: IconThemeData(
        color: AppTheme.appBarTextColor, //change your color here
      ),
      toolbarTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(AppTheme.primaryColor),
      thumbColor: MaterialStateProperty.all(AppTheme.primaryLightTextColor),
      // thumbIcon: MaterialStateProperty.all(Icon(Icons.dark_mode_outlined)),
    ),

    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppTheme.primaryLightTextColor)),

    // Radio Button Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme
                .primaryLightTextColor!; // Color when the radio button is selected
          }
          return AppTheme.black!; // Color when the radio button is not selected
        },
      ),
      visualDensity:
          VisualDensity.compact, // Adjusts the spacing of the radio button
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryButtonBackground,
      elevation: 8.0,
      splashColor: AppTheme.black, // Color when the button is tapped
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle:
            MaterialStateProperty.all(TextStyle(fontFamily: AppTheme.bodyFont)),
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return AppTheme.appBarTextColor!; // Text color of the text button
          },
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return AppTheme.white!; // Color when the button is tapped
          },
        ),
      ),
    ),

    // Form Theme
    inputDecorationTheme: InputDecorationTheme(
      helperStyle: TextStyle(
          color: AppTheme.editTextPlaceholderColor,
          fontFamily: AppTheme.bodyFont),
      errorStyle: TextStyle(color: Colors.red, fontFamily: AppTheme.bodyFont),
      labelStyle: TextStyle(
          color: AppTheme.editTextPlaceholderColor,
          fontFamily: AppTheme.bodyFont),
      iconColor: AppTheme.editTextControllerTextColor,
      fillColor: AppTheme.editTextBackgroundColor,
      hintStyle: TextStyle(
          color: AppTheme.editTextControllerTextColor,
          fontFamily: AppTheme.bodyFont),
      prefixIconColor: AppTheme.editTextControllerTextColor,
      suffixIconColor: AppTheme.editTextControllerTextColor,

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide:
            BorderSide(style: BorderStyle.solid, color: AppTheme.borderColor!),
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppTheme.borderColor!.withAlpha(200)!),
      ),
      // Style of the form field border

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppTheme.borderColor!), // Border color when focused
      ),

      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            color: AppTheme.errorColor!), // Border color when in error state
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            color: AppTheme.errorColor!,
            width: 2.0), // Border color when in error state and focused
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: AppTheme.primaryLightBackgroundColor,
      // Background color of the card
      elevation: 5.0,
      // Elevation of the card
      margin: EdgeInsets.all(16.0), // Margin around the card
    ),

    // Dialog Theme
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(fontFamily: AppTheme.bodyFont),
      backgroundColor: AppTheme
          .primaryLightBackgroundColor, // Background color of the dialog
      elevation: 10.0, // Elevation of the dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DashboardFontSize
            .customBorderRadius), // Border radius of the dialog
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppTheme.primaryLightTextColor, // Default color of icons
      size: 24.0, // Size of icons
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme
          .primaryButtonBackground, // Background color of regular buttons
      textTheme: ButtonTextTheme.primary, // Style of text on the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DashboardFontSize
            .customBorderRadius), // Border radius of the button
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppTheme.primaryLightTextColor!.withAlpha(50), // Color of dividers
      thickness: 1.0, // Thickness of dividers
      space: 16.0, // Vertical space between dividers
    ),

    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //       backgroundColor : MaterialStateProperty.all(AppTheme.primaryButtonBackground),
    //       foregroundColor:   MaterialStateProperty.all(AppTheme.primaryButtonText),
    //   )
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //       backgroundColor : MaterialStateProperty.all(AppTheme.primaryButtonBackground),
    //       foregroundColor:   MaterialStateProperty.all(AppTheme.primaryButtonText),
    //   ),
    // ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontFamily: AppTheme.bodyFont),
      unselectedLabelStyle: TextStyle(fontFamily: AppTheme.bodyFont),
      backgroundColor: AppTheme.bottomNavBackgroundColor,
      selectedItemColor: AppTheme.bottomNavigationSelectedTextColor,
      unselectedItemColor: AppTheme.bottomNavigationUnSelectedTextColor,
      // selected and unselected backgound color
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppTheme.drawerMenuBackgroundColor,
    ),

    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTheme,

    colorScheme: ColorScheme(
      background: AppTheme.primaryLightBackgroundColor!,
      brightness: Brightness.light,
      primary: AppTheme.primaryColor!,
      onPrimary: AppTheme.primaryColor!,
      secondary: AppTheme.primaryColor!,
      onSecondary: AppTheme.primaryColor!,
      error: AppTheme.errorColor!,
      onError: AppTheme.errorColor!,
      onBackground: AppTheme.primaryLightBackgroundColor!,
      surface: AppTheme.editTextBackgroundColor!,
      onSurface: AppTheme.editTextControllerTextColor!,
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppTheme.primaryButtonBackground, // Primary button color
    //   textTheme: ButtonTextTheme.primary, // Text color of primary buttons
    //   secondaryButtonColor: secondaryColor, // Uncomment if you want to set secondary button color
    //   textTheme: ButtonTextTheme.secondary, // Uncomment if you want to set text color of secondary buttons
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    canvasColor: AppTheme.primaryDarkBackgroundColor,
    useMaterial3: true,

    listTileTheme: ListTileThemeData(
      tileColor: AppTheme.primaryDarkBackgroundColor,
      textColor: AppTheme.primaryDarkTextColor,
      iconColor: AppTheme.primaryDarkTextColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.primaryColor, //primaryDarkAppBarColor
      titleTextStyle:
          globals.Settings.containsKey(SettingsEnum.Customizable_Font.name)
              ? GoogleFonts.getFont(
                  AppTheme.headingFont!.trim(),
                  fontSize: 16,
                  color: AppTheme.appBarTextColor,
                )
              : TextStyle(fontSize: 16, color: AppTheme.appBarTextColor),
      iconTheme: IconThemeData(
        color: AppTheme.appBarTextColor, //change your color here
      ),
      toolbarTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(AppTheme.primaryColor),
      thumbColor: MaterialStateProperty.all(AppTheme.primaryDarkTextColor),
      // thumbIcon: MaterialStateProperty.all(Icon(Icons.dark_mode_outlined)),
    ),

    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppTheme.primaryDarkTextColor)),

    // Radio Button Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme
                .primaryColor!; // Color when the radio button is selected
          }
          return AppTheme.black!; // Color when the radio button is not selected
        },
      ),
      visualDensity:
          VisualDensity.compact, // Adjusts the spacing of the radio button
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryColor,
      elevation: 8.0,
      splashColor: AppTheme.black, // Color when the button is tapped
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return AppTheme.appBarTextColor!; // Text color of the text button
          },
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return AppTheme.white!; // Color when the button is tapped
          },
        ),
      ),
    ),

    // Form Theme
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppTheme.editTextPlaceholderColor),
      iconColor: AppTheme.editTextControllerTextColor,
      fillColor: AppTheme.editTextBackgroundColor,
      hintStyle: TextStyle(color: AppTheme.editTextControllerTextColor),
      prefixIconColor: AppTheme.editTextControllerTextColor,
      suffixIconColor: AppTheme.editTextControllerTextColor,

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide:
            BorderSide(style: BorderStyle.solid, color: AppTheme.borderColor!),
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppTheme.borderColor!.withAlpha(200)),
      ),
      // Style of the form field border

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppTheme.borderColor!), // Border color when focused
      ),

      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            color: AppTheme.errorColor!), // Border color when in error state
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(DashboardFontSize.customBorderRadius),
        borderSide: BorderSide(
            color: AppTheme.errorColor!,
            width: 2.0), // Border color when in error state and focused
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color:
          AppTheme.primaryDarkBackgroundColor, // Background color of the card
      elevation: 5.0, // Elevation of the card
      margin: EdgeInsets.all(16.0), // Margin around the card
    ),

    // Dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor:
          AppTheme.primaryDarkBackgroundColor, // Background color of the dialog
      elevation: 10.0, // Elevation of the dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DashboardFontSize
            .customBorderRadius), // Border radius of the dialog
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppTheme.primaryDarkTextColor, // Default color of icons
      size: 24.0, // Size of icons
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme
          .primaryButtonBackground, // Background color of regular buttons
      textTheme: ButtonTextTheme.primary, // Style of text on the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DashboardFontSize
            .customBorderRadius), // Border radius of the button
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppTheme.primaryDarkTextColor!.withAlpha(50), // Color of dividers
      thickness: 1.0, // Thickness of dividers
      space: 16.0, // Vertical space between dividers
    ),

    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //       backgroundColor : MaterialStateProperty.all(AppTheme.primaryButtonBackground),
    //       foregroundColor:   MaterialStateProperty.all(AppTheme.primaryButtonText),
    //   )
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //       backgroundColor : MaterialStateProperty.all(AppTheme.primaryButtonBackground),
    //       foregroundColor:   MaterialStateProperty.all(AppTheme.primaryButtonText),
    //   ),
    // ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppTheme.bottomNavBackgroundColor,
      selectedItemColor: AppTheme.bottomNavigationSelectedTextColor,
      unselectedItemColor: AppTheme.bottomNavigationUnSelectedTextColor,
      // selected and unselected backgound color
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppTheme.drawerMenuBackgroundColor,
    ),

    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTheme,

    colorScheme: ColorScheme(
      background: AppTheme.primaryDarkBackgroundColor!,
      brightness: Brightness.dark,
      primary: AppTheme.primaryColor!,
      onPrimary: AppTheme.primaryColor!,
      secondary: AppTheme.primaryColor!,
      onSecondary: AppTheme.primaryColor!,
      error: AppTheme.errorColor!,
      onError: AppTheme.errorColor!,
      onBackground: AppTheme.primaryDarkBackgroundColor!,
      surface: AppTheme.editTextBackgroundColor!,
      onSurface: AppTheme.editTextControllerTextColor!,
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppTheme.primaryButtonBackground, // Primary button color
    //   textTheme: ButtonTextTheme.primary, // Text color of primary buttons
    //   secondaryButtonColor: secondaryColor, // Uncomment if you want to set secondary button color
    //   textTheme: ButtonTextTheme.secondary, // Uncomment if you want to set text color of secondary buttons
    // ),
  );
}

// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_text_theme.dart';

// class AppTheme {
//   AppTheme._();

//   static Color darken(Color c, [int percent = 10]) {
//     assert(1 <= percent && percent <= 100);
//     var f = 1 - percent / 100;
//     return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
//         (c.blue * f).round());
//   }

//   /// Lighten a color by [percent] amount (100 = white)
// // ........................................................
//   static Color lighten(Color c, [int percent = 10]) {
//     assert(1 <= percent && percent <= 100);
//     var p = percent / 100;
//     return Color.fromARGB(
//         c.alpha,
//         c.red + ((255 - c.red) * p).round(),
//         c.green + ((255 - c.green) * p).round(),
//         c.blue + ((255 - c.blue) * p).round());
//   }

//   static const Color primaryLightBackgroundColor = Color(0xFFFFFFFF);
//   static const Color primaryLightAppBarColor = Color(0xFFA9A2A2);
//   static const Color primaryLightTextColor = Color.fromARGB(255, 58, 58, 58);

//   static Color primaryDarkBackgroundColor =
//       darken(primaryLightBackgroundColor, 90);
//   static Color primaryDarkAppBarColor = darken(primaryLightAppBarColor, 100);
//   static Color primaryDarkTextColor = lighten(primaryLightTextColor, 50);

//   // static const Color baseColor = Color.fromARGB(255, 226, 226, 234);
//   // static const Color highlightColor = Color.fromARGB(255, 215, 215, 221);
//   // static const Color lightBorder = Color(0xffd7d7d7);
//   // static const Color priceTagColor = Color(0xff068380);
//   static const Color black = Colors.black;
//   static const Color white = Colors.white;

//   // static const Color buttonbackColor = Color(0XFF15969A);
//   // static const Color SuccessColor = Color(0xff0e8118);
//   static const Color ErrorColor = Color(0xffc90505);

//   //
//   // static const Color menuTextBackColor = Color(0xFF4DADA9);
//   // static const Color menubackColor = Color(0xFF4B4B4B); ///// primary colour
//   // static const Color menuTextColor = Color(0xFFFDFDFD); //// white colour
//   // static const Color menuTextTitleColor = Color(0xFFCECECE);
//   static const Color buttonbackColor = Color(0XFF15969A);

//   static ThemeData lightTheme = ThemeData(
//       useMaterial3: true,

//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppTheme.primaryLightAppBarColor,
//         titleTextStyle: TextStyle(
//           color: primaryLightTextColor,
//           fontSize: 16,
//         ),
//         iconTheme: IconThemeData(
//           color: AppTheme.primaryLightTextColor, //change your color here
//         ),
//       ),

//       switchTheme: SwitchThemeData(
//         thumbColor: MaterialStateProperty.all(AppTheme.primaryLightTextColor),
//         // thumbIcon: MaterialStateProperty.all(Icon(Icons.dark_mode_outlined)),
//       ),

//       checkboxTheme: CheckboxThemeData(
//           checkColor:
//               MaterialStateProperty.all(AppTheme.primaryLightTextColor)),

//       // Radio Button Theme
//       radioTheme: RadioThemeData(
//         fillColor: MaterialStateColor.resolveWith(
//           (Set<MaterialState> states) {
//             if (states.contains(MaterialState.selected)) {
//               return AppTheme
//                   .buttonbackColor; // Color when the radio button is selected
//             }
//             return AppTheme
//                 .black; // Color when the radio button is not selected
//           },
//         ),
//         visualDensity:
//             VisualDensity.compact, // Adjusts the spacing of the radio button
//       ),

//       // Floating Action Button Theme
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: AppTheme.buttonbackColor,
//         elevation: 8.0,
//         splashColor: AppTheme.black, // Color when the button is tapped
//       ),

//       // Text Button Theme
//       textButtonTheme: TextButtonThemeData(
//         style: ButtonStyle(
//           foregroundColor: MaterialStateColor.resolveWith(
//             (Set<MaterialState> states) {
//               return AppTheme.buttonbackColor; // Text color of the text button
//             },
//           ),
//           overlayColor: MaterialStateColor.resolveWith(
//             (Set<MaterialState> states) {
//               return AppTheme.black; // Color when the button is tapped
//             },
//           ),
//         ),
//       ),

//       // Form Theme
//       inputDecorationTheme: InputDecorationTheme(
//         labelStyle: TextStyle(color: AppTheme.primaryLightTextColor),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid, color: AppTheme.primaryDarkTextColor),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid, color: AppTheme.primaryLightTextColor),
//         ), // Style of the form field border
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid,
//               color:
//                   AppTheme.primaryLightTextColor), // Border color when focused
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: AppTheme.ErrorColor), // Border color when in error state
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: AppTheme.ErrorColor,
//               width: 2.0), // Border color when in error state and focused
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color: AppTheme
//             .primaryLightBackgroundColor, // Background color of the card
//         elevation: 5.0, // Elevation of the card
//         margin: EdgeInsets.all(16.0), // Margin around the card
//       ),

//       // Dialog Theme
//       dialogTheme: DialogTheme(
//         backgroundColor: AppTheme
//             .primaryLightBackgroundColor, // Background color of the dialog
//         elevation: 10.0, // Elevation of the dialog
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(16.0), // Border radius of the dialog
//         ),
//       ),

//       // Icon Theme
//       iconTheme: IconThemeData(
//         color: AppTheme.primaryLightTextColor, // Default color of icons
//         size: 24.0, // Size of icons
//       ),

//       // Button Theme
//       buttonTheme: ButtonThemeData(
//         buttonColor:
//             AppTheme.buttonbackColor, // Background color of regular buttons
//         textTheme: ButtonTextTheme.primary, // Style of text on the button
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(8.0), // Border radius of the button
//         ),
//       ),

//       // Divider Theme
//       dividerTheme: DividerThemeData(
//         color: Colors.grey, // Color of dividers
//         thickness: 2.0, // Thickness of dividers
//         space: 16.0, // Vertical space between dividers
//       ),
//       brightness: Brightness.light,
//       textTheme: AppTextTheme.lightTheme,
//       colorScheme: const ColorScheme(
//         background: primaryLightBackgroundColor,
//         brightness: Brightness.light,
//         primary: Colors.blue,
//         onPrimary: Colors.green,
//         secondary: Colors.green,
//         onSecondary: Colors.green,
//         error: AppTheme.ErrorColor,
//         onError: AppTheme.ErrorColor,
//         onBackground: Colors.black,
//         surface: AppTheme.white,
//         onSurface: AppTheme.black,
//       ));

//   static ThemeData darkTheme = ThemeData(
//       useMaterial3: true,
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppTheme.primaryDarkAppBarColor,
//         titleTextStyle: TextStyle(
//           color: AppTheme.primaryDarkTextColor,
//           fontSize: 16,
//         ),
//         iconTheme: IconThemeData(
//           color: AppTheme.white, //change your color here
//         ),
//       ),
//       switchTheme: SwitchThemeData(
//         thumbColor: MaterialStateProperty.all(AppTheme.primaryDarkTextColor),
//         // thumbIcon: MaterialStateProperty.all(
//         //   // Icon(Icons.light_mode_outlined,  color: AppTheme.primaryDarkBackgroundColor,)
//         // ),
//       ),
//       checkboxTheme: CheckboxThemeData(
//           checkColor: MaterialStateProperty.all(AppTheme.primaryDarkTextColor)),

//       // Radio Button Theme
//       radioTheme: RadioThemeData(
//         fillColor: MaterialStateColor.resolveWith(
//           (Set<MaterialState> states) {
//             if (states.contains(MaterialState.selected)) {
//               return AppTheme
//                   .buttonbackColor; // Color when the radio button is selected
//             }
//             return AppTheme
//                 .white; // Color when the radio button is not selected
//           },
//         ),
//         visualDensity:
//             VisualDensity.compact, // Adjusts the spacing of the radio button
//       ),

//       // Floating Action Button Theme
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: AppTheme.buttonbackColor,
//         elevation: 8.0,
//         splashColor: AppTheme.white, // Color when the button is tapped
//       ),

//       // Text Button Theme
//       textButtonTheme: TextButtonThemeData(
//         style: ButtonStyle(
//           foregroundColor: MaterialStateColor.resolveWith(
//             (Set<MaterialState> states) {
//               return AppTheme.buttonbackColor; // Text color of the text button
//             },
//           ),
//           overlayColor: MaterialStateColor.resolveWith(
//             (Set<MaterialState> states) {
//               return AppTheme.black; // Color when the button is tapped
//             },
//           ),
//         ),
//       ),

//       // Form Theme
//       inputDecorationTheme: InputDecorationTheme(
//         labelStyle: TextStyle(color: AppTheme.primaryDarkTextColor),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid, color: AppTheme.primaryDarkTextColor),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid, color: AppTheme.primaryDarkTextColor),
//         ), // Style of the form field border
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               style: BorderStyle.solid,
//               color:
//                   AppTheme.primaryDarkTextColor), // Border color when focused
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: AppTheme.ErrorColor), // Border color when in error state
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: AppTheme.ErrorColor,
//               width: 2.0), // Border color when in error state and focused
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color:
//             AppTheme.primaryDarkBackgroundColor, // Background color of the card
//         elevation: 5.0, // Elevation of the card
//         margin: EdgeInsets.all(16.0), // Margin around the card
//       ),

//       // Dialog Theme
//       dialogTheme: DialogTheme(
//         backgroundColor: AppTheme
//             .primaryDarkBackgroundColor, // Background color of the dialog
//         elevation: 10.0, // Elevation of the dialog
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(16.0), // Border radius of the dialog
//         ),
//       ),

//       // Icon Theme
//       iconTheme: IconThemeData(
//         color: AppTheme.primaryDarkTextColor, // Default color of icons
//         size: 24.0, // Size of icons
//       ),

//       // Button Theme
//       buttonTheme: ButtonThemeData(
//         buttonColor:
//             AppTheme.buttonbackColor, // Background color of regular buttons
//         textTheme: ButtonTextTheme.primary, // Style of text on the button
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(8.0), // Border radius of the button
//         ),
//       ),

//       // Divider Theme
//       dividerTheme: DividerThemeData(
//         color: Colors.grey, // Color of dividers
//         thickness: 2.0, // Thickness of dividers
//         space: 16.0, // Vertical space between dividers
//       ),
//       brightness: Brightness.dark,
//       textTheme: AppTextTheme.darkTheme,
//       colorScheme: ColorScheme(
//         background: primaryDarkBackgroundColor,
//         brightness: Brightness.dark,
//         primary: Colors.blue,
//         onPrimary: Colors.green,
//         secondary: Colors.green,
//         onSecondary: Colors.green,
//         error: AppTheme.ErrorColor,
//         onError: AppTheme.ErrorColor,
//         onBackground: Colors.white,
//         surface: AppTheme.black,
//         onSurface: AppTheme.white,
//       ));
// }
