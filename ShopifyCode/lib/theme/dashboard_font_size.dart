import 'package:flutter/cupertino.dart';
import 'package:shopify_code/globels.dart' as globals;

class DashboardFontSize {
  DashboardFontSize() {
    if (globals.publishedTheme == "second") {
      headingFontSize = 16;
      // subHeadingFontSize = 16;
      // descFontSize = 14;
    } else if (globals.publishedTheme == "third") {
      headingFontSize = 20;
      // subHeadingFontSize = 16;
      // descFontSize = 14;
    }
    // else {}
  }

  static double paddingLeft = 10;
  static double paddingRight = 10;
  static double paddingTop = 5;
  static double paddingBottom = 5;

  static const double marginLeft = 10;
  static const double marginRight = 10;
  static const double marginTop = 5;
  static const double marginBottom = 5;

  static const double customCollectionPadingtop = 10;
  static double customBorderRadius = 5;
  static double productBorderRadius = customBorderRadius;
  static double countDownBorderRadius = customBorderRadius;
  static double searchBorderRadius = customBorderRadius;
  static double imageWithTextSliderBorderRadius = customBorderRadius;
  static double imageSliderBorderRadius = customBorderRadius;
  static double testimonialBorderRadius = customBorderRadius;

  // static const double productBorderRadius = customBorderRadius;
  static double formBorderRadius = customBorderRadius;
  static double imageWithTextBorderRadius = customBorderRadius;
  static double instaImageBorderRadius = customBorderRadius;
  static double iconWithTextBorderRadius = customBorderRadius;
  static double comparisonViewBorderRadius = customBorderRadius;
  static double discountViewBorderRadius = customBorderRadius;

  static const double dashboardElevation = 2;

  static const double dashboardButtonSize = 45;
  static const double dashboardTextFieldSize = 45;

  static const double scrollingTextSize = 26;

  static double headingFontSize = 16;
  static double subHeadingFontSize = 14;
  static double descFontSize = 12;
  static double priceFontSize = 10;

  static const int headingMaxLines = 2;
  static const int subHeadingMaxLines = 2;
  static const int descMaxLines = 3;

  static String imagetype = "Square";

  static double imageHeightForProductCell(BuildContext context,
      {int row = 0, int colum = 0}) {
    // print("row...${row}");
    // print("colum...${colum}");
    if (row == 3 && colum == 3) {
      return imagetype == "Adapt To Image"
          ? MediaQuery.of(context).size.width * 50 / 100
          : imagetype == "Portrait"
              ? MediaQuery.of(context).size.width * 40 / 100
              : imagetype == "Square"
                  ? MediaQuery.of(context).size.width * 30 / 100
                  : MediaQuery.of(context).size.width * 30 / 100;
    }
    if (row == 2 && colum == 3) {
      return imagetype == "Adapt To Image"
          ? MediaQuery.of(context).size.width * 50 / 100
          : imagetype == "Portrait"
              ? MediaQuery.of(context).size.width * 40 / 100
              : imagetype == "Square"
                  ? MediaQuery.of(context).size.width * 30 / 100
                  : MediaQuery.of(context).size.width * 30 / 100;
    }
    if (colum == 1) {
      return imagetype == "Adapt To Image"
          ? MediaQuery.of(context).size.width * 50 / 100
          : imagetype == "Portrait"
              ? MediaQuery.of(context).size.width * 40 / 100
              : imagetype == "Square"
                  ? MediaQuery.of(context).size.width * 25 / 100
                  : MediaQuery.of(context).size.width * 25 / 100;
    }

    return imagetype == "Adapt To Image"
        ? MediaQuery.of(context).size.width * 65 / 100
        : imagetype == "Portrait"
            ? MediaQuery.of(context).size.width * 55 / 100
            : imagetype == "Square"
                ? MediaQuery.of(context).size.width * 45 / 100
                : MediaQuery.of(context).size.width * 45 / 100;
  }

  static double imageHeightForProductPage(BuildContext context) {
    return imagetype == "Adapt To Image"
        ? MediaQuery.of(context).size.height * 65 / 100
        : imagetype == "Portrait"
            ? MediaQuery.of(context).size.height * 55 / 100
            : imagetype == "Square"
                ? MediaQuery.of(context).size.height * 45 / 100
                : 200;
  }
// static double productGridAspectRatio =1 / 1.48;

  static double productGridHeightForDashboard({required String type}) {
    double imageheight = DashboardFontSize.imagetype == "Adapt To Image"
        ? 240
        : DashboardFontSize.imagetype == "Portrait"
            ? 190
            : DashboardFontSize.imagetype == "Square"
                ? 160
                : 0;

    if (type == "Image") return imageheight;

    return imageheight + 70;
  }
}
