import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetDivider extends StatelessWidget {
  DividerData dividerData;
  ItgeekWidgetDivider(this.dividerData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: dividerData.space!.toDouble()),
      height: dividerData.thickness!.toDouble(),
      color: Utils.getColorFromHex(dividerData.color!),
    );
  }
}
