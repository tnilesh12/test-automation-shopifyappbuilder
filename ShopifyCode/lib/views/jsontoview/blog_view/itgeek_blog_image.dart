import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetBlog extends StatelessWidget {
  BlogViewItem blogViewItems;
  String textColor;
  ItgeekWidgetBlog(this.blogViewItems, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        height: 200,
        padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
            DashboardFontSize.paddingRight, 2),
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(DashboardFontSize.customBorderRadius),
            child: WidgetImage(
              blogViewItems.image != null
                  ? blogViewItems.image!.originalSrc!
                  : "",
            )),
      ),
      blogViewItems.title != ""
          ? Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
                  DashboardFontSize.paddingRight, 2),
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.left,
                blogViewItems.title!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: DashboardFontSize.headingFontSize,
                      color: Utils.getColorFromHex(textColor),
                    ),
                maxLines: 2,
              ),
            )
          : Container(),
      blogViewItems.content != ""
          ? Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 2,
                  DashboardFontSize.paddingRight, 2),
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.left,
                blogViewItems.content!,
                style: TextStyle(
                    // color: subHeadingTextColor
                    color: Utils.getColorFromHex(textColor),
                    fontSize: DashboardFontSize.subHeadingFontSize),
                maxLines: 3,
              ),
            )
          : Container(),
      blogViewItems.authorV2 != null
          ? Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 2,
                  DashboardFontSize.paddingRight, 2),
              alignment: Alignment.centerLeft,
              child: Text(blogViewItems.authorV2!.name!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: DashboardFontSize.descFontSize,
                    color: Utils.getColorFromHex(textColor),
                    fontWeight: FontWeight.bold,
                  )),
            )
          : Container(),
    ]));
  }
}
