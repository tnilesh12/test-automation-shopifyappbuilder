import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/review_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class RatingPageSlider extends StatefulWidget {
  final List<Pictures> pictures;
  RatingPageSlider(this.pictures, {super.key});

  @override
  State<RatingPageSlider> createState() => _RatingPageSliderState();
}

class _RatingPageSliderState extends State<RatingPageSlider> {
  PageController controllerImage = PageController(initialPage: 0);
  int currentIndex = 0;
  Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
  Color indicatorUnSelectedColor =
      AppTheme.primaryLightTextColor!.withAlpha(80);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];
    for (Pictures picture in widget.pictures) {
      pages.add(RatingImageSlider(picture.urls!.original!));
    }

    return Container(
        height: 400,
        child: Stack(
          children: [
            // pictures.isNotEmpty?
            PageView(
              controller: controllerImage,
              children: pages,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
            pages.length > 1
                ? Positioned(
                    bottom: 7,
                    left: MediaQuery.of(context).size.width / 2.1 -
                        (pages.length * 5),
                    right: MediaQuery.of(context).size.width / 2.1 -
                        (pages.length * 5),
                    height: 15,
                    child: Container(
                      width: (pages.length * 15),
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppTheme.primaryLightTextColor!.withAlpha(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pages.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () {
                              controllerImage.jumpToPage(entry.key);
                              // carouselController.animateToPage(entry.key),
                            },
                            child: Container(
                              width: currentIndex == entry.key ? 7 : 7,
                              height: 7,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
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
            // : WidgetImage(product.image!),
          ],
        ));
  }
}

class RatingImageSlider extends StatelessWidget {
  final String imageUrl;
  const RatingImageSlider(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: WidgetImage(
          imageUrl!,
          fit: BoxFit.contain,
        ));
  }
}
