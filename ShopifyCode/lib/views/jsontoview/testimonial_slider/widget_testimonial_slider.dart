import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/testimonial_slider/testimonial_widget.dart';

class ItgeekWidgetTestimonialSlider extends StatefulWidget {
  // Function(TestimonialsList) OnClick;
  TestimonialsData testimonialsData;

  ItgeekWidgetTestimonialSlider(this.testimonialsData); //, this.OnClick);

  @override
  State<ItgeekWidgetTestimonialSlider> createState() =>
      _ItgeekWidgetTestimonialSliderState();
}

class _ItgeekWidgetTestimonialSliderState
    extends State<ItgeekWidgetTestimonialSlider> {
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
    Color indicatorUnSelectedColor =
        AppTheme.primaryLightTextColor!.withAlpha(80);
    List<Widget> carouselItems =
        widget.testimonialsData.testimonialsList!.map((item) {
      // return
      // InkWell(
      // onTap: () {
      //   widget.OnClick(item);
      // },
      // child
      return ItgeekWidgetTestimonial(
          item, widget.testimonialsData.textColor.toString());
      //  );
    }).toList();

    return Container(
        color: Utils.getColorFromHex(
            widget.testimonialsData.backgroundColor.toString()),
        padding: EdgeInsets.fromLTRB(
            DashboardFontSize.paddingLeft,
            DashboardFontSize.paddingTop,
            DashboardFontSize.paddingRight,
            DashboardFontSize.paddingBottom),
        // margin: EdgeInsets.only(bottom: DashboardFontSize.marginBottom),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: carouselItems,
                carouselController: carouselController,
                options: CarouselOptions(
                    enlargeCenterPage: false,
                    //myBool,
                    autoPlay: true,
                    aspectRatio: 1.7,
                    //16 / 9,
                    // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                    autoPlayCurve: Curves.linear,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
                    // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                    autoPlayInterval: Duration(seconds: 5),
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

            widget.testimonialsData.testimonialsList!.length > 1
                ? Container(
                    width:
                        (widget.testimonialsData.testimonialsList!.length * 15),
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.primaryLightTextColor!.withAlpha(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.testimonialsData.testimonialsList!
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
          ],
        ));
  }
}
