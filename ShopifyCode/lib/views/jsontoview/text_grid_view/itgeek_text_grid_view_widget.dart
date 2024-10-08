import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetTextGridView extends StatelessWidget {
  TextGridData textGridData;
  Function(TextGridItem) onClick;
  ItgeekWidgetTextGridView(this.textGridData, this.onClick) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: textGridData.marginLeftRight != null
              ? textGridData.marginLeftRight!.toDouble()
              : 0,
          vertical: textGridData.marginTopBottom != null
              ? textGridData.marginTopBottom!.toDouble()
              : 0),
      child: Container(
        decoration: BoxDecoration(
            color: Utils.getColorFromHex(textGridData.containerColor!),
            borderRadius: BorderRadius.circular(
                textGridData.borderRadius != null
                    ? textGridData.borderRadius!.toDouble()
                    : 0)),
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          children: [
            textGridData.heading != ""
                ? Container(
                    //alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(textGridData.heading!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: DashboardFontSize.headingFontSize,
                              color: Utils.getColorFromHex(
                                  textGridData.textColor!),
                            )),
                  )
                : Container(),
            Container(
              height: MediaQuery.of(context).size.height *
                  ((textGridData.height)! / 100),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: textGridData.textList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 10,
                        right: index == textGridData.textList!.length - 1
                            ? 10
                            : 0),
                    width: MediaQuery.of(context).size.width *
                        ((textGridData.width)! / 100),
                    //  height: MediaQuery.of(context).size.width *  ((textGridData.height )!/100),
                    child: TextGridItemView(
                        context, textGridData.textList, index, (textGridItem) {
                      onClick.call(textGridItem);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TextGridItemView(
    BuildContext context,
    List<TextGridItem>? TextGridItem,
    int index,
    Function(TextGridItem)? onClick,
  ) {
    return InkWell(
        onTap: () => onClick!.call(TextGridItem![index]),
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: _getContainerAlignment(textGridData.alignment!),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(DashboardFontSize.customBorderRadius),
            color: Utils.getColorFromHex(textGridData.cellColor!),
          ),
          height: MediaQuery.of(context).size.height *
              ((textGridData.height)! / 100),
          child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(DashboardFontSize.customBorderRadius),
              child: Text(
                textAlign: _getAlignment(textGridData.alignment!),
                TextGridItem![index].text!,
                style: TextStyle(
                    color: Utils.getColorFromHex(textGridData.textColor!)),
              )),
        ));
  }

  TextAlign _getAlignment(String alignment) {
    switch (alignment) {
      case 'center':
        return TextAlign.center;
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      default:
        return TextAlign.justify;
    }
  }

  Alignment _getContainerAlignment(String alignment) {
    switch (alignment) {
      case 'center':
        return Alignment.center;
      case 'left':
        return Alignment.centerLeft;
      case 'right':
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}
