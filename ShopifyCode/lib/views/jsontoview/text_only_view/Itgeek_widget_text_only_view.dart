import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetTextOnlyView extends StatelessWidget {
  TextOnlyData textOnlyData;

  ItgeekWidgetTextOnlyView(this.textOnlyData);

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry containerAlign;
    TextAlign textAlign;
    switch (textOnlyData.alignment?.toLowerCase()) {
      case 'center':
        containerAlign = Alignment.center;
        textAlign = TextAlign.center;
        break;
      case 'left':
        containerAlign = Alignment.centerLeft;
        textAlign = TextAlign.left;
        break;
      case 'right':
        containerAlign = Alignment.centerRight;
        textAlign = TextAlign.right;
        break;
      default:
        containerAlign = Alignment.center;
        textAlign = TextAlign.center;
    }

    double fontSizee;
    switch (textOnlyData.fontSize) {
      case 'medium':
        fontSizee = DashboardFontSize.subHeadingFontSize;
        break;
      case 'large':
        fontSizee = DashboardFontSize.headingFontSize;
        break;
      case 'small':
        fontSizee = DashboardFontSize.descFontSize;
        break;
      default:
        fontSizee = DashboardFontSize.subHeadingFontSize;
    }

    FontWeight fontWeight;
    switch (textOnlyData.fontWeight) {
      case 'bold':
        fontWeight = FontWeight.bold;
        break;
      case 'normal':
        fontWeight = FontWeight.normal;
        break;
      default:
        fontWeight = FontWeight.normal;
    }

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: textOnlyData.marginLeftRight != null
              ? textOnlyData.marginLeftRight!.toDouble()
              : 0,
          vertical: textOnlyData.marginTopBottom != null
              ? textOnlyData.marginTopBottom!.toDouble()
              : 0),
      child: Container(
        decoration: BoxDecoration(
            color: textOnlyData.backgroundColor != null
                ? Utils.getColorFromHex(textOnlyData.backgroundColor!)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
                textOnlyData.borderRadius != null
                    ? textOnlyData.borderRadius!.toDouble()
                    : 0)),

        alignment: containerAlign,
        // padding: EdgeInsets.all(16.0),

        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Text(
          textOnlyData.text ?? '',
          textAlign: textAlign,
          style: TextStyle(
              color: textOnlyData.textColor != null
                  ? Utils.getColorFromHex(textOnlyData.textColor!)
                  : Colors.black,
              fontSize: fontSizee,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
