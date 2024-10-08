import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetComparisonView extends StatelessWidget {
  ComparisonData comparisonData;

  ItgeekWidgetComparisonView(this.comparisonData);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.getColorFromHex(comparisonData.backgroundColor!),
      padding: EdgeInsets.fromLTRB(
          DashboardFontSize.paddingLeft,
          DashboardFontSize.paddingTop,
          DashboardFontSize.paddingRight,
          DashboardFontSize.paddingBottom),
      child: Column(children: [
        Container(
          child: Text(
            comparisonData.heading.toString(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: DashboardFontSize.headingFontSize,
                color: Utils.getColorFromHex(comparisonData.textColor!)),
          ),
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      LanguageManager.translations()['before'],
                      style: TextStyle(
                          fontSize: DashboardFontSize.subHeadingFontSize,
                          color:
                              Utils.getColorFromHex(comparisonData.textColor!)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            DashboardFontSize.comparisonViewBorderRadius),
                      ),
                      margin: EdgeInsets.all(8),
                      height: 260,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              DashboardFontSize.comparisonViewBorderRadius),
                          child: WidgetImage(
                            comparisonData.beforeImageSrc.toString(),
                            fit: BoxFit.contain,
                          ))),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      LanguageManager.translations()['after'],
                      style: TextStyle(
                          fontSize: DashboardFontSize.subHeadingFontSize,
                          color:
                              Utils.getColorFromHex(comparisonData.textColor!)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            DashboardFontSize.comparisonViewBorderRadius),
                      ),
                      margin: EdgeInsets.all(8),
                      height: 260,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              DashboardFontSize.comparisonViewBorderRadius),
                          child: WidgetImage(
                            comparisonData.afterImageSrc.toString(),
                            fit: BoxFit.contain,
                          ))),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
