import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../simple_video_player/simple_video_player.dart';

class StyleOneSimpleWidgetSlider extends StatefulWidget {
  Function(SimpleImageSlider) OnClick;
  SimpleImageSliderData simpleImageSliderData;
  StyleOneSimpleWidgetSlider(this.simpleImageSliderData, this.OnClick);

  @override
  State<StyleOneSimpleWidgetSlider> createState() =>
      _StyleOneSimpleWidgetSliderState();
}

class _StyleOneSimpleWidgetSliderState
    extends State<StyleOneSimpleWidgetSlider> {
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _height = widget.simpleImageSliderData.height != null
        ? (MediaQuery.of(context).size.height *
            ((widget.simpleImageSliderData.height)! / 100))
        : MediaQuery.of(context).size.height * .38;

    if (widget.simpleImageSliderData.height == 100) {
      _height -= 200;
    } else {
      _height -= 80;
    }
    // var myBool = true;
    // if (widget.imageBannerSliderData.slideHeight! == "Medium") {
    //   //sliderViewType! == "Enlarge") {
    //   myBool = true;
    // } else {
    //   myBool = false;
    // }

    Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
    Color indicatorUnSelectedColor =
        AppTheme.primaryLightTextColor!.withAlpha(80);

    List<Widget> carouselItems =
        widget.simpleImageSliderData.simpleImageSlider!.map((item) {
      return InkWell(
          onTap: () {
            widget.OnClick(item);
          },
          child: item.type == "video"
              ? SimpleVideoPlayer(
                  item.videoLink,
                  autoPlay: item.autoPlay,
                  loop: item.loop,
                  height: _height,
                )
              : SliderWidgetImage(item, _height));
    }).toList();

    return Container(
      // margin: EdgeInsets.fromLTRB(
      //     0, DashboardFontSize.marginTop, 0, DashboardFontSize.marginBottom),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: CarouselSlider(
              items: carouselItems,
              carouselController: carouselController,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay:
                      // bool.parse(widget.simpleImageSliderData.autoSwitchSlides!)??
                      true,
                  height: _height,
                  // aspectRatio: 0.93, //16 / 9,
                  // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                  autoPlayCurve: Curves.linear,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: true,
                  viewportFraction:
                      0.68, // widget.imageBannerSliderData.sliderViewPortFraction!,
                  // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  // seconds: widget.simpleImageSliderData.changeSlidesEvery!),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
          widget.simpleImageSliderData.simpleImageSlider!.length > 1
              ? Container(
                  // bottom: 5,
                  // left: MediaQuery.of(context).size.width / 2.1 -
                  //     (widget.simpleImageSliderData.simpleImageSlider!.length *
                  //         5),
                  // right: MediaQuery.of(context).size.width / 2.1 -
                  //     (widget.simpleImageSliderData.simpleImageSlider!.length *
                  //         5),
                  height: 15,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Container(
                    width: (widget
                            .simpleImageSliderData.simpleImageSlider!.length *
                        15),
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.primaryLightTextColor!.withAlpha(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.simpleImageSliderData.simpleImageSlider!
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
                  ))
              : Container(),
        ],
      ),
    );
  }

  Widget SliderWidgetImage(SimpleImageSlider imageBanner, double _height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: _height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15
              // DashboardFontSize.imageSliderBorderRadius
              )),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: WidgetImage(imageBanner.imageSrc!, fit: BoxFit.cover)),
    );
  }
}
