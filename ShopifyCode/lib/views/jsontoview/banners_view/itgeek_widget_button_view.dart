import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/utils.dart';

import '../../../theme/dashboard_font_size.dart';

class ItgeekWidgetButtonView extends StatelessWidget {
  Function(ButtonOnlyData) onClick;
  ButtonOnlyData buttonOnlyData;

  ItgeekWidgetButtonView(this.onClick, this.buttonOnlyData);

  @override
  Widget build(BuildContext context) {
    print("------------buttonOnlyData  ${buttonOnlyData.toJson()}------");
    AlignmentGeometry buttonAlign;
    switch (buttonOnlyData.alignment?.toLowerCase()) {
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

    return InkWell(
        onTap: () {
          onClick(buttonOnlyData);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: buttonOnlyData.marginLeftRight!.toDouble(),
              vertical: buttonOnlyData.marginTopBottom!.toDouble()),
          child: Container(
            color: buttonOnlyData.backgroundColor == null
                ? AppTheme.primaryColor
                : Utils.getColorFromHex(buttonOnlyData.backgroundColor!),
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            alignment: buttonAlign,
            child: Container(
              width: buttonOnlyData.width == "full"
                  ? MediaQuery.of(context).size.width
                  : null,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              decoration: BoxDecoration(
                color: buttonOnlyData.buttonColor == null
                    ? AppTheme.primaryButtonBackground
                    : Utils.getColorFromHex(buttonOnlyData.buttonColor!),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.,
                mainAxisSize: buttonOnlyData.width == "full"
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: buttonOnlyData.prefixIconStatus == true
                        ? SvgPicture.string(
                            buttonOnlyData.prefixIcon!,
                            colorFilter: ColorFilter.mode(
                                Utils.getColorFromHex(
                                    buttonOnlyData.textColor!),
                                BlendMode.srcIn),
                            width: 24,
                            height: 24,
                          )
                        : SvgPicture.string(
                            buttonOnlyData.prefixIcon!,
                            width: 24,
                            height: 24,
                          ),
                  ),
                  Text(
                    buttonOnlyData.buttonText == null
                        ? " "
                        : buttonOnlyData.buttonText!,
                    style: TextStyle(
                      color: buttonOnlyData.textColor == null
                          ? AppTheme.primaryButtonText
                          : Utils.getColorFromHex(buttonOnlyData.textColor!),
                      fontSize: DashboardFontSize.descFontSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {},
                    child: buttonOnlyData.suffixIconStatus == true
                        ? SvgPicture.string(
                            buttonOnlyData.suffixIcon!,
                            colorFilter: ColorFilter.mode(
                                Utils.getColorFromHex(
                                    buttonOnlyData.textColor!),
                                BlendMode.srcIn),
                            width: 24,
                            height: 24,
                          )
                        : SvgPicture.string(
                            buttonOnlyData.suffixIcon!,
                            width: 24,
                            height: 24,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
