import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetTextTile extends StatelessWidget {
  final TextListData textListData;

  ItgeekWidgetTextTile(this.textListData);

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = textListData.list!.map((item) {
      return Container(
        color: Utils.getColorFromHex(textListData.backgroundColor!),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: textListData.listStyle == 'numerical'
                ? Text(
                    "${textListData.list!.indexOf(item) + 1}.",
                    style: TextStyle(
                      color: Utils.getColorFromHex(textListData.textColor!),
                      fontSize: DashboardFontSize.subHeadingFontSize,
                    ),
                  )
                : Container(
                    width: 5,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Utils.getColorFromHex(textListData.textColor!),
                      shape: BoxShape.circle,
                    ),
                  ),
            ),
            Expanded(
              
              child: Text(
                item.txt!,
                style: TextStyle(
                  fontSize: DashboardFontSize.subHeadingFontSize,
                  color: Utils.getColorFromHex(textListData.textColor!),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();

    return Container(
      color: Utils.getColorFromHex(textListData.backgroundColor!),
      padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
          DashboardFontSize.paddingRight, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (textListData.heading != null)
            Text(
              textListData.heading!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Utils.getColorFromHex(textListData.textColor!),
                    fontWeight: FontWeight.bold,
                    fontSize: DashboardFontSize.headingFontSize,
                  ),
            ),
          SizedBox(height: 8),
          ...listItems,
        ],
      ),
    );
  }
}
