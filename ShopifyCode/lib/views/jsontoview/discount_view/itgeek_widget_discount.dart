import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItgeekWidgetDiscountView extends StatefulWidget {
  DiscountData discountData;

  ItgeekWidgetDiscountView(this.discountData); //, this.OnClick);

  @override
  State<ItgeekWidgetDiscountView> createState() =>
      _ItgeekWidgetDiscountViewState();
}

class _ItgeekWidgetDiscountViewState extends State<ItgeekWidgetDiscountView> {
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
    Color indicatorUnSelectedColor =
        AppTheme.primaryLightTextColor!.withAlpha(80);

    // CarouselController carouselController = CarouselController();
    List<Widget> carouselItems = widget.discountData.discountList!.map((item) {
      return Container(
        // alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height * 0.24,
        padding: EdgeInsets.all(8),
        // margin: EdgeInsets.only(top: 2, bottom: 2),
        // decoration: BoxDecoration(
        //     // color: Colors.red,
        //     // border: Border.all(color: AppTheme.borderColor!),
        //     // borderRadius: BorderRadius.circular(3)
        //     ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(DashboardFontSize.customBorderRadius)),
              ),
              // clipBehavior: Clip.antiAlias,
              context: context,
              builder: (BuildContext context) {
                return AnimationConfiguration.synchronized(
                  duration: Duration(seconds: 1),
                  child: FadeInAnimation(
                    child: ScaleAnimation(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child:
                                    // Container(
                                    //   padding: EdgeInsets.all(10),
                                    //   alignment: Alignment.topRight,
                                    //   child: Icon(Icons.clear_rounded),
                                    // ),
                                    Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                    child: SvgPicture.asset(
                                      "assets/images/close-icon.svg",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    item.title != null
                                        ? item.title.toString()
                                        : "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: DashboardFontSize
                                              .subHeadingFontSize,
                                        )),
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        DashboardFontSize
                                            .discountViewBorderRadius),
                                    child: WidgetImage(item.imageSrc != null
                                        ? item.imageSrc.toString()
                                        : "")),
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  item.description != null
                                      ? item.description!
                                      : "N/A",
                                  style: TextStyle(
                                      fontSize: DashboardFontSize.descFontSize),
                                  // .toString()
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.comparisonViewBorderRadius),
                ),
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.width * 0.18,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.discountViewBorderRadius),
                    child: WidgetImage(item.imageSrc.toString())),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(item.title.toString(),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      DashboardFontSize.subHeadingFontSize,
                                  color: Utils.getColorFromHex(
                                      widget.discountData.textColor!),
                                )),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(0),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          item.description!,
                          style: TextStyle(
                              color: Utils.getColorFromHex(
                                  widget.discountData.textColor!),
                              fontSize: DashboardFontSize.descFontSize),
                          overflow: TextOverflow.ellipsis,
                          maxLines: DashboardFontSize.descMaxLines,
                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     showBottomSheet(
                    //       // clipBehavior: Clip.antiAlias,
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           height: MediaQuery.of(context).size.height * 0.7,
                    //           child: SingleChildScrollView(
                    //             child: Column(
                    //               children: [
                    //                 InkWell(
                    //                   onTap: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                   child: Container(
                    //                     padding: EdgeInsets.all(10),
                    //                     alignment: Alignment.topRight,
                    //                     child: Icon(Icons.clear_rounded),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.all(8),
                    //                   child: Text(
                    //                       item.title != null
                    //                           ? item.title.toString()
                    //                           : "N/A",
                    //                       style: Theme.of(context)
                    //                           .textTheme
                    //                           .titleSmall!
                    //                           .copyWith(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: DashboardFontSize
                    //                                 .subHeadingFontSize,
                    //                           )),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.all(15),
                    //                   child: ClipRRect(
                    //                       borderRadius: BorderRadius.circular(5),
                    //                       child: WidgetImage(item.imageSrc != null
                    //                           ? item.imageSrc.toString()
                    //                           : "")),
                    //                 ),
                    //                 Container(
                    //                   padding: EdgeInsets.all(15),
                    //                   child: Text(
                    //                     item.description != null
                    //                         ? item.description!
                    //                         : "N/A",
                    //                     style: TextStyle(
                    //                         fontSize:
                    //                             DashboardFontSize.descFontSize),
                    //                     // .toString()
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: Center(
                    //       child: Text(
                    //     "Read more...",
                    //     style: TextStyle(color: Colors.blue),
                    //   )),
                    // )

                    // Text(ProductData[index].price.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }).toList();

    return Container(
        color: Utils.getColorFromHex(widget.discountData.backgroundColor!),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: carouselItems,
                carouselController: carouselController,
                options: CarouselOptions(
                    enlargeCenterPage: false, //myBool,
                    autoPlay: true,
                    aspectRatio: 1.86, //16 / 9,
                    // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                    autoPlayCurve: Curves.linear,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enableInfiniteScroll: true,
                    viewportFraction:
                        1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
                    // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
              ),
            ),
            carouselItems.length > 1
                ? Container(
                    width: (carouselItems.length * 15),
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.primaryLightTextColor!.withAlpha(30),
                    ),
                    margin:
                        EdgeInsets.only(bottom: DashboardFontSize.marginBottom),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: carouselItems.asMap().entries.map((entry) {
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
