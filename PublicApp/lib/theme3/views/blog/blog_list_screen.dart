import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import 'blog_screen_item_view.dart';
import '/theme3/views/blog/blog_post/blog_post_screen.dart';
import '/theme3/views/common_screens/api_failure.dart';
import '/theme3/views/shimmer/order_screen_shimmer_view.dart';
import '/theme3/views/widgets/no_data_view.dart';
import '../../../common/bloc/blog_screen_bloc/blog_screen_bloc.dart';
import '../../../common/bloc/blog_screen_bloc/blog_screen_state.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogHandleListScreen extends StatelessWidget {
  String blogId = "", title;
  bool showAppBar;
  BlogHandleListScreen(this.blogId, {required this.title, this.showAppBar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showAppBar) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(title),//"Blogs"),
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
          ),
          body: BlogHandleListScreenBody(blogId, showAppBar));
    } else {
      return BlogHandleListScreenBody(blogId, showAppBar);
    }
  }
}

class BlogHandleListScreenBody extends StatelessWidget {
  String blogId = "";
  bool showAppBar;
  BlogHandleListScreenBody(this.blogId, this.showAppBar, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogScreenBloc(blogId),
      child: SafeArea(
        child: Container(
          child: Column(children: [
            Expanded(
              child: BlocBuilder<BlogScreenBloc, BlogScreenState>(
                builder: (context, state) {
                  if (state is BlogScreenAPIFailureState) {
                    return APIFailureScreens(
                        showButton: showAppBar, state.message);
                  } else if (state is BlogScreenLoadedState) {
                    return AnimationLimiter(
                      child: ListView.builder(
                          itemCount: state.blog.articles!.articleList!.length,
                          itemBuilder: (context, index) {
                            return BlogScreenItemView(
                                index,
                                state.blog.articles!.articleList![index]
                                            .image !=
                                        null
                                    ? state.blog.articles!.articleList![index]
                                        .image!.originalSrc!
                                    : "",
                                state.blog.articles!.articleList![index].title!,
                                state.blog.articles!.articleList![index]
                                    .publishedAt!, () {
                              context.pushNamed(Routes.articleScreen,
                                  pathParameters: {
                                    "id": state
                                        .blog.articles!.articleList![index].id
                                        .toString()
                                  },
                                  extra: null);
                            });
                          }),
                    );
                  } else if (state is BlogScreenNoDataFound) {
                    return Center(
                        child: NoDataView(
                      AppAssets.article.toString(),
                      "No Blogs Found",
                    ));
                  } else {
                    return Center(
                      child: OrderListScreenShimmerEffect()
                          .oderlistscreenshimmereffect(context, false),
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
