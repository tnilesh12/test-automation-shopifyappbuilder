import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'slider_widget_image_with_text.dart';

class ItgeekWidgetSlider extends StatefulWidget {
  Function(ImageBanner) OnClick;
  Function(ImageBanner)? OnClickBtn1;
  Function(ImageBanner)? OnClickBtn2;

  ImageBannerSliderData imageBannerSliderData;

  ItgeekWidgetSlider(this.imageBannerSliderData, this.OnClick,
      {this.OnClickBtn1, this.OnClickBtn2});

  @override
  State<ItgeekWidgetSlider> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<ItgeekWidgetSlider> {
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var myBool = true;
    if (widget.imageBannerSliderData.slideHeight! == "Medium") {
      //sliderViewType! == "Enlarge") {
      myBool = true;
    } else {
      myBool = false;
    }

    Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
    Color indicatorUnSelectedColor =
        AppTheme.primaryLightTextColor!.withAlpha(80);

    List<Widget> carouselItems =
        widget.imageBannerSliderData.imageBanner!.map((item) {
      // if (item.sliderType == ViewType.SliderImageView.name) {
      //   return InkWell(
      //       onTap: () {
      //         widget.OnClick(item);
      //       },
      //       child: WidgetImage(item));
      // } else if (item.sliderType == ViewType.SliderImageWithTextView.name) {
      //   return InkWell(
      //       onTap: () {
      //         widget.OnClick(item);
      //       },
      //       child: WidgetImageWithText(item));
      // } else {
      return InkWell(
          onTap: () {
            widget.OnClick(item);
          },
          // child: WidgetImageSlider(item));
          child: SliderWidgetImageWithTextBtn(item, widget.OnClickBtn1!,
              widget.OnClickBtn2!, widget.imageBannerSliderData.textColor));
      // }
    }).toList();

    return Container(
      color: Utils.getColorFromHex(
          widget.imageBannerSliderData.backgroundColor.toString()),
      // margin: EdgeInsets.only(bottom: DashboardFontSize.marginBottom),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: CarouselSlider(
              items: carouselItems,
              carouselController: carouselController,
              options: CarouselOptions(
                  enlargeCenterPage: false, //myBool,
                  autoPlay: bool.parse(
                          widget.imageBannerSliderData.autoSwitchSlides!) ??
                      false,
                  height: 365, //370,
                  // aspectRatio: 0.93, //16 / 9,
                  // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                  autoPlayCurve: Curves.linear,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: true,
                  viewportFraction:
                      1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
                  // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                  autoPlayInterval: Duration(
                      seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
          // Positioned(
          //   bottom: 7,
          //   left: 165 - (widget.imageBannerSliderData.imageBanner!.length * 5),
          //   right: 165 - (widget.imageBannerSliderData.imageBanner!.length * 5),
          //   height: 15,
          // child:
          widget.imageBannerSliderData.imageBanner!.length > 1
              ? Container(
                  width:
                      (widget.imageBannerSliderData.imageBanner!.length * 15),
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.primaryLightTextColor!.withAlpha(30),
                  ),
                  margin:
                      EdgeInsets.only(bottom: DashboardFontSize.marginBottom),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageBannerSliderData.imageBanner!
                        .asMap()
                        .entries
                        .map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 7 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? indicatorSelectedColor
                                  : indicatorUnSelectedColor),
                        ),
                      );
                    }).toList(),
                  ),
                )
              : Container(),
          // )
        ],
      ),
    );
  }
}
