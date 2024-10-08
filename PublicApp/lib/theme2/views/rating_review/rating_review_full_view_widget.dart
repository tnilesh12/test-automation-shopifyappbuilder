import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/review_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import '/theme2/views/rating_review/widgets/rating_page_slider.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/widgets/star_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RatingReviewFullViewWidget extends StatelessWidget {
  List<Reviews> reviewList;
  int index;

  RatingReviewFullViewWidget(this.reviewList, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Container(
                width: 35, //MediaQuery.of(context).size.width * 0.09,
                height: 35, //MediaQuery.of(context).size.height * 0.09,
                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                child: SvgPicture.asset("assets/images/arrow-back.svg",
                    colorFilter: ColorFilter.mode(
                        AppTheme.appBarTextColor!, BlendMode.srcIn)),
              ),
              onPressed: () {
                context.pop();
              }),
          title: Text("")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                reviewList![index].pictures!.isNotEmpty
                    ? RatingPageSlider(reviewList![index].pictures!)
                    : Container(),
                reviewList![index].pictures!.isNotEmpty
                    ? SizedBox(
                        height: 5,
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LanguageManager.translations()['By']! +
                                  reviewList![index].reviewer!.name!,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              DateTimeUtils.getDateAndTime(
                                  reviewList![index].createdAt!),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StarWidget(
                              (p0) {},
                              false,
                              14,
                              initialCount: reviewList![index].rating!,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              reviewList![index].rating.toString(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        reviewList![index].title!,
                        style: TextStyle(
                            // overflow: TextOverflow.ellipsis,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        // maxLines: 2,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        reviewList![index].body!,
                        // overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        // maxLines: 3,
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  // ),
                ),
                Container(
                  height: 1,
                  color: AppTheme.borderColor!.withAlpha(40),
                  margin: EdgeInsets.symmetric(vertical: 2),
                ),
              ],
            )),
      ),
    );
  }
}
