import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetImageOnlyView extends StatelessWidget {
  ImageOnlyData imageOnlyData;
  Function(ImageOnlyData)? buttonClick;

  ItgeekWidgetImageOnlyView(this.imageOnlyData, this.buttonClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: imageOnlyData.marginTopBottom != null
              ? imageOnlyData.marginTopBottom!.toDouble()
              : 0,
          horizontal: imageOnlyData.marginLeftRight != null
              ? imageOnlyData.marginLeftRight!.toDouble()
              : 0),
      child: Container(
        decoration: BoxDecoration(
            color: Utils.getColorFromHex(imageOnlyData.backgroundColor!),
            borderRadius: BorderRadius.circular(
                imageOnlyData.borderRadius != null
                    ? imageOnlyData.borderRadius!.toDouble()
                    : 0)),
        child: InkWell(
            onTap: () => buttonClick!(imageOnlyData),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  imageOnlyData.borderRadius != null
                      ? imageOnlyData.borderRadius!.toDouble()
                      : 0),
              child: WidgetImage(
                imageOnlyData.imageSrc!,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
