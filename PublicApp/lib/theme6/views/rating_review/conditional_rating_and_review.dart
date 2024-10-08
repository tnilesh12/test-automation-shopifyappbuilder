import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../views/webview_pages/webview_pages_screen.dart';
import '../../views/rating_review/rating_review_webview_screen.dart';
import '../../utils/theme_size.dart';
import '../../views/widgets/common/link_button.dart';
import '../../views/rating_review/rating_review_widget.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';

Widget ConditionalRatingAndReview(BuildContext context, Product product) {
  String pluginEnabled = Utils.checkSomeRatingReviewPluginEnabled();
  if (pluginEnabled == "NATIVE") {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: RatingAndReview().ratingandreview(context, product),
        ),
        Container(
          height: 4,
          color: AppTheme.borderColor!.withAlpha(40),
          margin: EdgeInsets.symmetric(vertical: 10),
        )
      ],
    );
  } else if (pluginEnabled == "WEBVIEW") {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              ThemeSize.paddingLeft, 0, ThemeSize.paddingRight, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            LanguageManager.translations()['RatingandReview']!,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(
                ThemeSize.paddingLeft, 0, ThemeSize.paddingRight, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinkButton(
                  text: LanguageManager.translations()['AllReview']!,
                  onPressed: () {
                    String allReviewUrl = Utils.getAllReviewUrlPluginUrl();
                    WebViewPagesScreen webViewPagesScreen = WebViewPagesScreen(
                        titleMain: "All Reviews",
                        urlToLoad: allReviewUrl.replaceAll(
                            "{product_id}",
                            product.id!
                                .replaceAll("gid://shopify/Product/", "")),
                        bodyTags: "");
                    context.push("/${Routes.webUrlScreen}",
                        extra: webViewPagesScreen);
                  },
                ),
                Container(
                  // margin: EdgeInsets.only(right: 10),
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
                      String addReviewUrl = Utils.getAddReviewUrlPluginUrl();
                      bool islogin = await Session().IsLogin();
                      if (islogin) {
                        RatingReviewWebViewScreen ratingReviewWebViewScreen =
                            RatingReviewWebViewScreen(
                                titleMain: "Add Reviews",
                                urlToLoad: addReviewUrl.replaceAll(
                                    "{product_id}",
                                    product.id!.replaceAll(
                                        "gid://shopify/Product/", "")),
                                bodyTags: "");
                        context.push("/${Routes.ratingReviewWebViewScreen}",
                            extra: ratingReviewWebViewScreen);
                      } else {
                        bool? refresh = await (context.pushNamed(
                            "${Routes.loginScreen}",
                            pathParameters: {"goBack": true.toString()},
                            extra: null)) as bool;

                        if (refresh != null) {
                          if (refresh as bool) {
                            RatingReviewWebViewScreen
                                ratingReviewWebViewScreen =
                                RatingReviewWebViewScreen(
                                    titleMain: "Add Reviews",
                                    urlToLoad: addReviewUrl.replaceAll(
                                        "{product_id}",
                                        product.id!.replaceAll(
                                            "gid://shopify/Product/", "")),
                                    bodyTags: "");
                            context.push("/${Routes.ratingReviewWebViewScreen}",
                                extra: ratingReviewWebViewScreen);
                          }
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      child: Text(
                        LanguageManager.translations()['AddReview']!,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Container(
          height: 4,
          color: AppTheme.borderColor!.withAlpha(40),
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
      ],
    );
  } else {
    return Container();
  }
}
