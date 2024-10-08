import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/views/article_screen/article_screen_bloc/article_screen_bloc.dart';
import '/views/common_screens/api_failure.dart';
import '/views/shimmer/product_detail_shimmer_view.dart';
import '/views/widgets/no_data_view.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/views/widgets/common_webview_widget.dart';

class ArticleScreen extends StatelessWidget {
  bool showappbar;
  final String articleId;
  ArticleScreen(this.articleId, {this.showappbar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showappbar) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              LanguageManager.translations()['Blog Post']!,
            ),
            leading: IconButton(
                icon: Container(
                  width: 35,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                  child: SvgPicture.asset("assets/images/arrow-back.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!, BlendMode.srcIn)),
                ),
                onPressed: () {
                  context.pop();
                }),
          ),
          body: ArticleScreenBody(articleId, showappbar));
    } else {
      return SafeArea(child: ArticleScreenBody(articleId, showappbar));
    }
  }
}

class ArticleScreenBody extends StatelessWidget {
  ArticleScreenBody(this.articleId, this.showAppBar, {super.key});
  final String articleId;
  bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleScreenBloc(articleId),
      child: SafeArea(
        child: Container(
          child: Column(children: [
            Expanded(
              child: BlocBuilder<ArticleScreenBloc, ArticleScreenState>(
                builder: (context, state) {
                  if (state is ArticleScreenAPIFailureState) {
                    return APIFailureScreens(
                        showButton: showAppBar, state.message);
                  } else if (state is ArticleScreenLoadedState) {
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        // color: Theme.of(context).colorScheme.background,
                        //  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                        child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.article.image != null
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: Hero(
                                            tag:
                                                "${LanguageManager.translations()['image']!}${0}", //widget.index}",
                                            child: WidgetImage(
                                              state.article.image!.originalSrc!,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                            )),
                                      )
                                    : Container(),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 0),
                                  child: Hero(
                                      tag:
                                          "${LanguageManager.translations()['title']!}${0}", //widget.index}",
                                      child: Text(
                                        state.article.title.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      )),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Container(
                                    child: CommonWebviewWidget(
                                        state.article.contentHtml!)
                                    // child: WebViewPagesScreenBody(titleMain: "", urlToLoad: "", bodyTags: state.article.contentHtml!)
                                    ),
                                // Container(
                                //   padding: EdgeInsets.only(
                                //       left: 10, right: 10, top: 10, bottom: 0),
                                //   child: Html(data: '''
                                //             <html>
                                //             <head>
                                //             <style>
                                //             body{
                                //             }
                                //             </style>
                                //             </head>
                                //             <body>
                                //             ${state.article.contentHtml}
                                //             </body>
                                //             </html>
                                //           '''
                                //       // body{
                                //       //   font-family: Cinzel;
                                //       //   color:black;
                                //       // }
                                //       // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                                //       ),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )));
                  } else if (state is ArticleScreenNoDataFound) {
                    return Center(
                        child: NoDataView(
                      AppAssets.article.toString(),
                      "No Article Found",
                    ));
                  } else {
                    return SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Center(
                        child: ProductDetailShimmerEffects()
                            .productdetailsscreenshimmereffect(context),
                      ),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
