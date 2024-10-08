import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_bloc.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/review_model.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme4/views/auth/login/login_screen.dart';
import '/theme4/views/widgets/common/link_button.dart';
import '/theme4/views/rating_review/add_review_screen.dart';
import '/theme4/views/rating_review/rating_review_full_view_widget.dart';
import '/theme4/views/rating_review/rating_review_list_screen.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/widgets/star_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/datetime_utils.dart';

class RatingAndReview {
  Widget ratingandreview(BuildContext context, Product product) {
    // return Scaffold(
    //   body:

    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageManager.translations()['RatingandReview']!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: AppTheme.primaryButtonBackground!.withAlpha(100),
                    border: Border.all(
                      color: AppTheme.borderColor!.withAlpha(50),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () async {
                      bool islogin = await Session().IsLogin();
                      if (islogin) {
                        AddReviewScreen addReviewScreen =
                            AddReviewScreen(product);
                        context.push("/${Routes.addReviewScreen}",
                            extra: addReviewScreen);
                      } else {
                        bool? refresh = await (context.pushNamed(
                            "${Routes.loginScreen}",
                            pathParameters: {"goBack": true.toString()},
                            extra: null)) as bool;

                        if (refresh != null) {
                          if (refresh as bool) {
                            AddReviewScreen addReviewScreen =
                                AddReviewScreen(product);
                            context.push("/${Routes.addReviewScreen}",
                                extra: addReviewScreen);
                          }
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      child: Text(
                        LanguageManager.translations()['AddReview']!,
                        style: TextStyle(
                            fontSize:
                                12), // AppLocalizations.of(context)!.addtocart,
                        // style: CustomTextTheme.getTextStyle(
                        //         MyTextStyle
                        //             .ProductGridViewCardCart,
                        //         context)
                        //     .copyWith(
                        //         color:
                        //             AppTheme.primaryButtonText),
                      ),
                    ),
                  ),
                ),
                // LinkButton(
                //   text: "Add Review",
                //   onPressed: () {
                //   },
                // ),
              ],
            )),
        SizedBox(
          height: 15,
        ),
        BlocProvider(
            create: (context) => RatingReviewBloc(product.id!),
            child: BlocListener<RatingReviewBloc, RatingReviewState>(
                listener: (context, state) {},
                child: BlocBuilder<RatingReviewBloc, RatingReviewState>(
                    builder: (context, state) {
                  if (state is RatingReviewLoadingState) {
                    return Center(
                      child:
                          Text(LanguageManager.translations()['LoadingText']!),
                    );
                  } else if (state is RatingReviewLoadedState) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              height: 100,
                              // decoration: BoxDecoration(
                              //     border: Border.all(
                              //         color: AppTheme
                              //             .borderColor!, //color: Colors.black.withOpacity(.5),
                              //         width: 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.averageRating >= 4
                                        ? "Excellent"
                                        : state.averageRating >= 3
                                            ? "Very Good"
                                            : state.averageRating >= 2
                                                ? "Good"
                                                : "Ok",
                                    // style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StarWidget(
                                          (p0) {},
                                          false,
                                          24,
                                          initialCount: state.averageRating,
                                        ),
                                      ]),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${state.numberOfReviews} ${LanguageManager.translations()['Review']!}",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${state.averageRating} ${LanguageManager.translations()['Rating']!}",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: AppTheme.borderColor!.withAlpha(40),
                                    margin: EdgeInsets.only(top: 12, bottom: 2),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                                children: state.reviewList!.map((item) {
                              var index = state.reviewList!.indexOf(item);
                              return ratingAndReviewItem(
                                  context, state.reviewList!, index);
                            }).toList()),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  LinkButton(
                                    text: LanguageManager.translations()[
                                        'AllReview']!,
                                    onPressed: () {
                                      RatingReviewListScreen ratingReviewList =
                                          RatingReviewListScreen(product.id!);
                                      context.push(
                                          "/${Routes.ratingReviewList}",
                                          extra: ratingReviewList);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                    );
                  } else {
                    return Center(
                      child: Text(
                          LanguageManager.translations()['noReviewAvailable']!),
                    );
                  }
                }))),
      ],
    );
  }

  Widget ratingAndReviewItem(
      BuildContext context, List<Reviews> reviewList, int index) {
    return InkWell(
      onTap: () {
        context.push("/${Routes.ratingReviewFullScreen}",
            extra: RatingReviewFullViewWidget(reviewList, index));
      },
      child: Column(
        children: [
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
                Text(
                  reviewList![index].title!,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  reviewList![index].body!,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 4,
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
                reviewList![index].pictures!.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height: 75,
                        child: Row(
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        reviewList![index].pictures!.length,
                                    itemBuilder:
                                        (BuildContext context, int index2) {
                                      return Container(
                                        width: 60,
                                        height: 50,
                                        child: WidgetImage(reviewList![index]
                                            .pictures![index2]
                                            .urls!
                                            .original!),
                                        margin: EdgeInsets.all(2),
                                        // decoration:
                                        //     BoxDecoration(
                                        //   image: DecorationImage(
                                        //       image: AssetImage(
                                        //           ProductList[index2]
                                        //               .image),
                                        //       fit: BoxFit
                                        //           .cover),
                                        // ),
                                      );
                                    }))
                          ],
                        ))
                    : Container(),
                reviewList![index].pictures!.isNotEmpty
                    ? SizedBox(
                        height: 10,
                      )
                    : Container(),
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
                SizedBox(
                  height: 5,
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
      ),
    );
  }
}
