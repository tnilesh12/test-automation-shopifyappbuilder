import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/bloc/insta_feed_bloc.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/bloc/insta_feed_state.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/insta_feed_shimmer_view.dart';

class ItgeekWidgetInstaFeed extends StatelessWidget {
  InstaData instaData;
  ItgeekWidgetInstaFeed(this.instaData);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InstaFeedBloc(),
        child: BlocListener<InstaFeedBloc, InstaFeedState>(
          listener: (context, state) {},
          child: BlocBuilder<InstaFeedBloc, InstaFeedState>(
            builder: (context, state) {
              if (state is InstaFeedLoadingState) {
                return InstaFeedShimmerView();
              } else if (state is InstaFeedAPIFailureState) {
                return Container();
              } else {
                //(state is InstaFeedDataLoadedState) {
                return Container(
                  // padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(
                      DashboardFontSize.marginLeft,
                      DashboardFontSize.marginTop,
                      DashboardFontSize.marginRight,
                      DashboardFontSize.marginBottom),
                  child: Column(
                    children: [
                      instaData.heading != ""
                          ? Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Text(instaData.heading!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            DashboardFontSize.headingFontSize,
                                      )),
                            )
                          : Container(),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: context
                                    .read<InstaFeedBloc>()
                                    .instaFeedModel!
                                    .data!
                                    .length >
                                instaData.columns! * instaData.rows!
                            ? instaData.columns! * instaData.rows!
                            : context
                                .read<InstaFeedBloc>()
                                .instaFeedModel!
                                .data!
                                .length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: instaData.columns ?? 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          final post = context
                              .read<InstaFeedBloc>()
                              .instaFeedModel!
                              .data![index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(DashboardFontSize.instaImageBorderRadius),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        post.mediaType == 'IMAGE'
                                            ? post.mediaUrl!
                                            : post.thumbnailUrl!),
                                    fit: BoxFit.cover)),
                            // Text(post['caption'] != null ? post['caption'] : ''),
                            // onTap: () {
                            // },
                            child: Center(
                              child: post.mediaType != 'IMAGE'
                                  ? Icon(Icons.play_circle)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
