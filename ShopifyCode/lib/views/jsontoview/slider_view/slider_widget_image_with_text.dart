import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/simple_video_player/simple_video_player.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class SliderWidgetImageWithTextBtn extends StatelessWidget {
  ImageBanner imageBanner;
  Function(ImageBanner) button1Click;
  Function(ImageBanner) button2Click;
  String? textColor;

  SliderWidgetImageWithTextBtn(
      this.imageBanner, this.button1Click, this.button2Click, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          // color: AppTheme.primaryDarkBackgroundColor!.withAlpha(20),
          borderRadius: BorderRadius.circular(
              DashboardFontSize.imageWithTextSliderBorderRadius)
          // image: DecorationImage(
          //   image: NetworkImage(
          //     imageBanner.imageSrc!,
          //   ),
          //   fit: BoxFit.fitHeight,
          // ),
          ),
      // color: Util.getColorFromHex(sliderItems.sliderBackgroundColor!),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .20,
              child: imageBanner.type == "video"
                  ? SimpleVideoPlayer(
                      imageBanner.videoLink,
                      autoPlay: imageBanner.autoPlay,
                      loop: imageBanner.loop,
                    )
                  : WidgetImage(imageBanner.imageSrc!)),
          // Container(
          //   // height: 200,
          //   // width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   // child: Expanded(
          //   child: Image.network(
          //     imageBanner.imageSrc!,
          //     fit: BoxFit.cover,
          //     // ),
          //   ),
          // ),
          imageBanner.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 2),
                  child: Text(imageBanner.heading!,
                      maxLines: DashboardFontSize.headingMaxLines,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: DashboardFontSize.headingFontSize,
                          color: Utils.getColorFromHex(textColor.toString()))),
                )
              : SizedBox(),
          imageBanner.subheading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 2),
                  child: Text(imageBanner.subheading!,
                      maxLines: DashboardFontSize.descMaxLines,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: DashboardFontSize.descFontSize,
                          color: Utils.getColorFromHex(textColor.toString()))),
                )
              : SizedBox(),
          // imageBanner.primarybuttonlabel != "" ||
          //         imageBanner.secondarybuttonlabel != ""
          //     ?
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageBanner.primarybuttonlabel != "" &&
                        imageBanner.primarybtnStatus!
                    ? InkWell(
                        child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: DashboardFontSize.dashboardButtonSize,
                            // width: 100,
                            decoration: BoxDecoration(
                                color: AppTheme.primaryButtonBackground!,
                                // border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius)),
                            child: Center(
                                child: Text(
                              imageBanner.primarybuttonlabel!,
                              style : TextStyle(color : AppTheme.primaryButtonText!)
                            ))),
                        onTap: () {
                          button1Click.call(imageBanner);
                          print(
                              "------------clicked1 --------${imageBanner.primarybuttonlink}");
                          print(
                              "------------clicked1 --------${imageBanner.primarybtnId}");
                        },
                      )
                    : SizedBox(),
                SizedBox(
                  width: imageBanner.primarybuttonlabel != "" &&
                          imageBanner.primarybtnStatus!
                      ? 15
                      : 0,
                ),
                imageBanner.secondarybuttonlabel != "" &&
                        imageBanner.secondarybtnStatus!
                    ? InkWell(
                        child: Container(
                            height: DashboardFontSize.dashboardButtonSize,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            // width: 100,
                            decoration: BoxDecoration(
                                color: AppTheme.secondaryButtonBackground!,
                                // border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius)),
                            child: Center(
                                child: Text(
                              imageBanner.secondarybuttonlabel!,
                              style : TextStyle(color : AppTheme.secondaryButtonText)
                            ))),
                        onTap: () {
                          button2Click.call(imageBanner);
                          print(
                              "------------clicked2 --------${imageBanner.secondarybuttonlink}");
                          print(
                              "------------clicked2 --------${imageBanner.secondarybtnId}");
                        },
                      )
                    : SizedBox(),
              ],
            ),
          )
          // : SizedBox(),
        ],
      ),
    );
  }
}
