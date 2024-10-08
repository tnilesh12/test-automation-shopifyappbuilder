import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../theme/app_theme.dart';

class ItgeekWidgetTextWithBackgroundImage extends StatelessWidget {
  TextWithBackgroundImageData textWithBackgroundImageData;
  Function(TextWithBackgroundImageData)? buttonClick;

  ItgeekWidgetTextWithBackgroundImage(
      this.textWithBackgroundImageData, this.buttonClick);

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry buttonAlign;
    TextAlign headingTextAlign, descriptionTextAlign;
    MainAxisAlignment fullContentMainAxisAlignment;
    double _height = textWithBackgroundImageData.height != null
        ? (MediaQuery.of(context).size.height *
            ((textWithBackgroundImageData.height)! / 100))
        : MediaQuery.of(context).size.height * .20;

    if (textWithBackgroundImageData.height == 100) {
      _height -= 200;
    } else {
      _height -= 80;
    }

    switch (textWithBackgroundImageData.bodyAlignment?.toLowerCase()) {
      case 'center':
        fullContentMainAxisAlignment = MainAxisAlignment.center;
        break;
      case 'flex-start':
        fullContentMainAxisAlignment = MainAxisAlignment.start;
        break;
      case 'flex-end':
        fullContentMainAxisAlignment = MainAxisAlignment.end;
        break;
      default:
        fullContentMainAxisAlignment = MainAxisAlignment.center;
    }

    switch (textWithBackgroundImageData.buttonAlignment?.toLowerCase()) {
      case 'center':
        buttonAlign = Alignment.center;
        break;
      case 'left':
        buttonAlign = Alignment.centerLeft;
        break;
      case 'right':
        buttonAlign = Alignment.centerRight;
        break;
      default:
        buttonAlign = Alignment.center;
    }
    switch (textWithBackgroundImageData.headingTextAlign?.toLowerCase()) {
      case 'center':
        headingTextAlign = TextAlign.center;
        break;
      case 'left':
        headingTextAlign = TextAlign.left;
        break;
      case 'right':
        headingTextAlign = TextAlign.right;
        break;
      default:
        headingTextAlign = TextAlign.center;
    }
    switch (textWithBackgroundImageData.descriptionTextAlign?.toLowerCase()) {
      case 'center':
        descriptionTextAlign = TextAlign.center;
        break;
      case 'left':
        descriptionTextAlign = TextAlign.left;
        break;
      case 'right':
        descriptionTextAlign = TextAlign.right;
        break;
      default:
        descriptionTextAlign = TextAlign.center;
    }

    return InkWell(
      onTap: (textWithBackgroundImageData.buttonStatus != null &&
              textWithBackgroundImageData.buttonStatus!)
          ? () {}
          : () {
              buttonClick!(textWithBackgroundImageData);
            },
      child: Container(
        height: _height,
        margin: EdgeInsets.symmetric(
            vertical: textWithBackgroundImageData.marginTopBottom != null
                ? textWithBackgroundImageData.marginTopBottom!.toDouble()
                : 0,
            horizontal: textWithBackgroundImageData.marginLeftRight != null
                ? textWithBackgroundImageData.marginLeftRight!.toDouble()
                : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                textWithBackgroundImageData.blockRadius != null
                    ? textWithBackgroundImageData.blockRadius!.toDouble()
                    : 0),
            color: Utils.getColorFromHex(
                textWithBackgroundImageData.backgroundColor!)),
        child: Stack(
          children: [
            if (textWithBackgroundImageData.backgroundImageUrl != null &&
                textWithBackgroundImageData.backgroundImageUrl != "")
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      textWithBackgroundImageData.blockRadius != null
                          ? textWithBackgroundImageData.blockRadius!.toDouble()
                          : 0),
                  child: WidgetImage(
                      textWithBackgroundImageData.backgroundImageUrl!,
                      fit: BoxFit.fill),
                ),
              ),
            Container(
              padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 20,
                  DashboardFontSize.paddingRight, 5),
              child: Column(
                mainAxisAlignment:
                    fullContentMainAxisAlignment, // MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (textWithBackgroundImageData.blockHeading != null)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        textWithBackgroundImageData.blockHeading!,
                        textAlign: headingTextAlign,
                        style: TextStyle(
                          color: textWithBackgroundImageData.textColor != null
                              ? Utils.getColorFromHex(
                                  textWithBackgroundImageData.textColor!)
                              : Colors.transparent,
                          fontSize: DashboardFontSize.headingFontSize,
                        ),
                      ),
                    ),
                  SizedBox(height: 5),
                  if (textWithBackgroundImageData.description != null)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Text(
                        textWithBackgroundImageData.description!,
                        textAlign: descriptionTextAlign,
                        style: TextStyle(
                          color: textWithBackgroundImageData.textColor != null
                              ? Utils.getColorFromHex(
                                  textWithBackgroundImageData.textColor!)
                              : Colors.transparent,
                          fontSize: DashboardFontSize.subHeadingFontSize,
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                  (textWithBackgroundImageData.buttonStatus != null &&
                          textWithBackgroundImageData.buttonStatus! &&
                          textWithBackgroundImageData.buttonText != null &&
                          textWithBackgroundImageData.buttonText != "")
                      ? InkWell(
                          onTap: () =>
                              buttonClick!(textWithBackgroundImageData),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            // padding: EdgeInsets.fromLTRB(15,10,15,10),
                            alignment: buttonAlign,
                            child: Container(
                              width: textWithBackgroundImageData.width == "full"
                                  ? MediaQuery.of(context).size.width
                                  : null,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                  color: ((textWithBackgroundImageData
                                                  .buttonStyle !=
                                              null) &&
                                          (textWithBackgroundImageData
                                                  .buttonStyle!
                                                  .toLowerCase() ==
                                              "outline"))
                                      ? null
                                      : textWithBackgroundImageData
                                                  .buttonBackgroundColor ==
                                              null
                                          ? AppTheme.primaryButtonBackground
                                          : Utils.getColorFromHex(
                                              textWithBackgroundImageData
                                                  .buttonBackgroundColor!),
                                  borderRadius: BorderRadius.circular(
                                      textWithBackgroundImageData
                                                  .buttonRadius !=
                                              null
                                          ? textWithBackgroundImageData
                                              .buttonRadius!
                                              .toDouble()
                                          : DashboardFontSize
                                              .customBorderRadius),
                                  border: Border.all(
                                    width: 0.5,
                                    color: textWithBackgroundImageData
                                                .buttonBackgroundColor ==
                                            null
                                        ? AppTheme.primaryButtonBackground
                                        : Utils.getColorFromHex(
                                            textWithBackgroundImageData
                                                .buttonBackgroundColor!),
                                  )),
                              child: Text(
                                textWithBackgroundImageData.buttonText!,
                                style: TextStyle(
                                    color: Utils.getColorFromHex(
                                        textWithBackgroundImageData
                                            .buttonTextColor!)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
