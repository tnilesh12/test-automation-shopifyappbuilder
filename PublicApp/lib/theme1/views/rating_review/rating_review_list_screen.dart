import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_bloc.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme1/views/widgets/no_data_view.dart';
import '/theme1/views/rating_review/rating_review_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RatingReviewListScreen extends StatefulWidget {
  String productId;

  RatingReviewListScreen(this.productId, {super.key});

  @override
  State<RatingReviewListScreen> createState() => _RatingReviewListScreenState();
}

class _RatingReviewListScreenState extends State<RatingReviewListScreen> {
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
          title: Text(LanguageManager.translations()['RatingReviews']!),
        ),
        body: BlocProvider(
            create: (context) => RatingReviewBloc(widget.productId),
            child: BlocListener<RatingReviewBloc, RatingReviewState>(
                listener: (context, state) {},
                child: BlocBuilder<RatingReviewBloc, RatingReviewState>(
                    builder: (context, state) {
                  if (state is RatingReviewLoadingState) {
                    return Center(
                      child: Text(LanguageManager.translations()['Loading']!),
                    );
                  } else if (state is RatingReviewLoadedState) {
                    return SingleChildScrollView(
                      child: Column(
                          children: state.reviewList!.map((item) {
                        var index = state.reviewList!.indexOf(item);
                        return RatingAndReview().ratingAndReviewItem(
                            context, state.reviewList!, index);
                      }).toList()),
                    );
                  } else {
                    return Center(
                      child: NoDataView(AppAssets.star.toString(), ""),
                    );
                  }
                }))));
  }
}
