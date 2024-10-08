import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/rating_review/okendo/okendo_rating_webview_star_widget.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/plugin/rating_review/looxs/loox_rating_webview_star_widget.dart';
import 'package:shopify_code/plugin/rating_review/widgets/star_widget.dart';

class PluginStarWidgetMain extends StatelessWidget {
  String productId;
  Function(String url) onClick;
  PluginStarWidgetMain(this.productId, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: globals.plugins.containsKey(PluginsEnum.LOOX_REVIEW.name)
          ? InkWell(
              onTap: onClick(ApiConst.looxAddReview.replaceAll(
                  "{product_id}",
                  productId.replaceAll("gid://shopify/Product/", ""))),
              child: Container(
                height: 40,
                child: LooxRatingWebViewStarWidget(productId
                    .replaceAll("gid://shopify/Product/", "")
                    .toString()),
              ),
            )
          : globals.plugins.containsKey(PluginsEnum.OKENDO_REVIEW.name)
              ? InkWell(
                  onTap: onClick(ApiConst.okendoReviewThird.replaceAll(
                      "{product_id}",
                      productId
                          .replaceAll("gid://shopify/Product/", "")
                          .replaceAll(
                              "{subscriber_id}",
                              globals.plugins[PluginsEnum.OKENDO_REVIEW.name]
                                  .secrets.subscriberId))),
                  child: Container(
                    height: 40,
                    child: OkendoRatingWebViewStarWidget(productId
                        .replaceAll("gid://shopify/Product/", "")
                        .toString()),
                  ),
                )
              : (globals.plugins.containsKey(PluginsEnum.YOTPO_REVIEW.name) ||
                      globals.plugins
                          .containsKey(PluginsEnum.ITGEEKS_REVIEW.name) ||
                      globals.plugins
                          .containsKey(PluginsEnum.JUDGE_ME_REVIEW.name))
                  ? BlocListener<StarWidgetBloc, StarWidgetState>(
                      listener: (context, state) {},
                      child: BlocBuilder<StarWidgetBloc, StarWidgetState>(
                        builder: (context, state) {
                          // context.read<StarWidgetBloc>().loadStarWidgetData(widget.product.id!);
                          if (state is StarWidgetLoadedState) {
                            return Container(
                              margin:
                                  EdgeInsets.only(left: 1, right: 0, bottom: 4),
                              child: StarWidget(
                                (p0) {},
                                false,
                                14,
                                initialCount: state.rating!,
                              ),
                            );
                          } else if (state is StarWidgetNoDataState) {
                            print("----------star widget state is ${state}");
                            return Container(
                              margin:
                                  EdgeInsets.only(left: 1, right: 0, bottom: 4),
                              child: StarWidget(
                                (p0) => null,
                                false,
                                14,
                                initialCount: state.rating!,
                              ),
                            );
                          } else {
                            return Container(
                              margin:
                                  EdgeInsets.only(left: 1, right: 0, bottom: 4),
                              child: StarWidget(
                                (p0) => null,
                                false,
                                14,
                                initialCount: 0,
                              ),
                            );
                          }
                        },
                      ),
                    )
                  : Container(),
    );
  }
}
