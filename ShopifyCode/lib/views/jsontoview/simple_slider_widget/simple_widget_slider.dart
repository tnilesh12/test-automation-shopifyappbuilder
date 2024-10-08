import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/simple_slider_widget/style_default_simple_widget_slider.dart';
import 'package:shopify_code/views/jsontoview/simple_slider_widget/style_one_simple_widget_slider.dart';
import 'package:shopify_code/views/jsontoview/simple_slider_widget/style_three_simple_widget_slider.dart';
import 'package:shopify_code/views/jsontoview/simple_slider_widget/style_two_simple_widget_slider.dart';

class ItgeekSimpleWidgetSlider extends StatelessWidget {
  Function(SimpleImageSlider) onClick;
  SimpleImageSliderData simpleImageSliderData;
  ItgeekSimpleWidgetSlider(this.simpleImageSliderData, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: simpleImageSliderData.backgroundColor != null
            ? Utils.getColorFromHex(simpleImageSliderData.backgroundColor!)
            : Colors.transparent,
        child: simpleImageSliderData.style == "Style_1"
            ? StyleOneSimpleWidgetSlider(simpleImageSliderData, (val) {
                onClick.call(val);
              })
            : simpleImageSliderData.style == "Style_2"
                ? StyleTwoSimpleWidgetSlider(simpleImageSliderData, (val) {
                    onClick.call(val);
                  })
                : simpleImageSliderData.style == "Style_3"
                    ? StyleThreeSimpleWidgetSlider(simpleImageSliderData,
                        (val) {
                        onClick.call(val);
                      })
                    : DefaultStyleSimpleWidgetSlider(simpleImageSliderData,
                        (val) {
                        onClick.call(val);
                      }));
  }
}
