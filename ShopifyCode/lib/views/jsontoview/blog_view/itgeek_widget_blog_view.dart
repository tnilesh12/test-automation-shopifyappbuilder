import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/blog_view/itgeek_blog_image.dart';

class ItgeekWidgetBlogView extends StatefulWidget {
  Function(BlogViewItem) onClick;
  BlogSliderData blogSliderData;

  ItgeekWidgetBlogView(this.blogSliderData, this.onClick);

  @override
  State<ItgeekWidgetBlogView> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<ItgeekWidgetBlogView> {
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
    // Color indicatorUnSelectedColor =
    //     AppTheme.primaryLightTextColor!.withAlpha(80);
    Color indicatorSelectedColor =
        Utils.getColorFromHex(widget.blogSliderData.textColor!)!;
    Color indicatorUnSelectedColor = indicatorSelectedColor.withAlpha(80);

    List<Widget> carouselItems = widget.blogSliderData.blogList!.map((item) {
      return InkWell(
          onTap: () {
            widget.onClick(item);
          },
          child: ItgeekWidgetBlog(item, widget.blogSliderData.textColor!));
    }).toList();

    return Container(
      color: Utils.getColorFromHex(widget.blogSliderData.backgroundColor!),
      child: Column(
        children: [
          CarouselSlider(
            items: carouselItems,
            carouselController: carouselController,
            options: CarouselOptions(
                enlargeCenterPage: false, //myBool,
                autoPlay: false,
                height: 355, //370,
                // aspectRatio: 0.93, //16 / 9,
                // aspectRatio: widget.blogSliderData.sliderAspectRatio!,
                autoPlayCurve: Curves.linear,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                enableInfiniteScroll: true,
                viewportFraction:
                    1, // 0.88,// widget.blogSliderData.sliderViewPortFraction!,
                // autoPlayAnimationDuration: Duration(seconds: widget.blogSliderData.changeSlidesEvery!),
                autoPlayInterval: Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          widget.blogSliderData.blogList!.length > 1
              ? Container(
                margin: EdgeInsets.only(bottom: 5),
                  width: (widget.blogSliderData.blogList!.length * 15),
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.primaryLightTextColor!.withAlpha(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.blogSliderData.blogList!
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
