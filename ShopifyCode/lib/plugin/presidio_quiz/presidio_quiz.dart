import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/modelClass/sort_key_product_collection.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio_quiz_bloc.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio_quiz_state.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_start_quiz.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

import 'package:shopify_code/globels.dart' as globals;
import 'package:vimeo_video_player/vimeo_video_player.dart';
import '../../language/language_manager.dart';
import '../../theme/custom_text_theme.dart';
import '../../theme/dashboard_font_size.dart';
import '../../theme/my_text_style.dart';
import '../../util/plugins_enum.dart';
import '../../views/jsontoview/blog_view/itgeek_widget_blog_view.dart';
import 'presidio_quiz_bloc/presidio1_quiz_event.dart';
import 'presidio_submit_quiz.dart';

class PresidioQuiz extends StatefulWidget {
  Function(String) onClick;
  PresidioQuiz(this.onClick);

  @override
  State<PresidioQuiz> createState() => _PresidioQuizState();
}

class _PresidioQuizState extends State<PresidioQuiz> {
  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;
  List<Widget> carouselItems = [];
  Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
  Color indicatorUnSelectedColor =
      AppTheme.primaryLightTextColor!.withAlpha(80);
  @override
  Widget build(BuildContext context) {
    carouselItems = [];
    return BlocProvider(
      create: (context) => PresidioQuizBloc(),
      child: BlocListener<PresidioQuizBloc, PresidioQuizState>(
        listener: (context, state) {},
        child: BlocBuilder<PresidioQuizBloc, PresidioQuizState>(
            builder: (context, state) {
          if (state is PresidioQuizeSuccessState) {
            if (context.read<PresidioQuizBloc>().ISSTART) {
              return PresidioStartQuiz(context.read<PresidioQuizBloc>())
                  .getbuild(context);
            } else if (context.read<PresidioQuizBloc>().ISSUBMIT) {
              return PresidioSubmitQuiz(context.read<PresidioQuizBloc>())
                  .getbuild(context);
            } else {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                          child: Stack(
                        children: [
                          // Background image
                          Container(
                            height: MediaQuery.of(context).size.height * 0.805,
                            child: WidgetImage(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              state.data['quiz']['background']['image']['src']
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Overlay content
                          Positioned(
                            left: 20,
                            right: 20,
                            top: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.data['quiz']['title']['text']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize:
                                        // 30,
                                        double.parse(state.data['quiz']['title']
                                                ['fontSize']
                                            .toString()),
                                    color:
                                        //  Colors.white,
                                        Utils.getColorFromHex(state.data['quiz']
                                                ['title']['color']
                                            .toString()),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  state.data['quiz']['description']['text']
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        // 30,
                                        double.parse(state.data['quiz']
                                                ['description']['fontSize']
                                            .toString()),
                                    color:
                                        //  Colors.white,
                                        Utils.getColorFromHex(state.data['quiz']
                                                ['description']['color']
                                            .toString()),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<PresidioQuizBloc>()
                                        .add(PresidioQuizInitialEventStart());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 50),
                                    width: 200,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            double.parse(state.data['quiz']
                                                ['button']['borderRadius'])),
                                        color: Utils.getColorFromHex(state
                                            .data['quiz']['button']['mainColor']
                                            .toString())),
                                    child: Text(
                                      state.data['quiz']['button']['text'],
                                      style: TextStyle(
                                        fontSize:
                                            // 30,
                                            double.parse(state.data['quiz']
                                                    ['button']['fontSize']
                                                .toString()),
                                        color:
                                            //  Colors.white,
                                            Utils.getColorFromHex(state
                                                .data['quiz']['button']
                                                    ['textColor']
                                                .toString()),
                                        // fontWeight: FontWeight. (state.data['quiz']['button']
                                        //     ['fontWeight']),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ));
            }
          } else if (state is PresidioQuizSubmitState) {
            state.data["ruleset"]["contentBlocks"]["articles_1"]["articles"]
                .forEach((item) {
              carouselItems.add(
                  // currentIndex = state.data["ruleset"]["contentBlocks"]
                  //         ["articles_1"]["articles"]
                  //     .indexOf(item);

                  //  state
                  //               .data["ruleset"]["contentBlocks"]
                  //                   ["articles_1"]["articles"]
                  //               .length ==
                  //           0
                  //       ? Container(
                  //           child: Text("No Data ..."),
                  //         )
                  //       :
                  getBlog(context, item));
            });
            // Map<String, dynamic> list = state.data;
            return Container(
              color: Color.fromARGB(255, 180, 155, 154),
              child: SingleChildScrollView(
                // physics: ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["headings"]
                            ["subtitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: DashboardFontSize.subHeadingFontSize),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["headings"]
                            ["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: DashboardFontSize.headingFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["headings"]
                            ["description"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: DashboardFontSize.descFontSize,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: VimeoVideoPlayer(
                          url: state.data["ruleset"]["contentBlocks"]["video_1"]
                                  ["url"]
                              .toString(), // + getVimeoVideoId().toString(),
                          autoPlay: false, // widget.videoData.autoplay!,
                          startAt: Duration.zero,
                          deviceOrientation: [
                            DeviceOrientation.landscapeLeft,
                            DeviceOrientation.landscapeRight,
                            DeviceOrientation.portraitDown,
                            DeviceOrientation.portraitUp
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["products_1"]
                            ["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.subHeadingFontSize),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["products_1"]
                            ["description"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: DashboardFontSize.descFontSize,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.4, color: Colors.white))),
                    getProductGrid(state.data),
                    Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.4, color: Colors.white))),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]["articles_1"]
                            ["heading"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.subHeadingFontSize),
                      ),
                    ),
                    // getBlog(
                    //     context,
                    //     state.data["ruleset"]["contentBlocks"]["articles_1"]
                    //         ["articles"][0]),
                    Container(
                        // color: Colors.red,
                        // margin: EdgeInsets.fromLTRB(
                        //     DashboardFontSize.marginLeft,
                        //     DashboardFontSize.marginTop,
                        //     DashboardFontSize.marginRight,
                        //     DashboardFontSize.marginBottom),
                        // margin: EdgeInsets.only(left: 5, right: 5),
                        // padding: EdgeInsets.only(left: 5, right: 5),
                        child: CarouselSlider(
                      items: carouselItems,
                      carouselController: carouselController,
                      options: CarouselOptions(
                          enlargeCenterPage: false, //myBool,
                          autoPlay: true,
                          aspectRatio: 1.2,
                          autoPlayCurve: Curves.linear,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          enableInfiniteScroll: false,
                          viewportFraction:
                              1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
                          // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                          autoPlayInterval: Duration(seconds: 5),
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    )),
                    carouselItems.length > 1
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Container(
                              width: (carouselItems.length * 15),
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppTheme.primaryLightTextColor!
                                    .withAlpha(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    carouselItems.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: currentIndex == entry.key ? 7 : 7,
                                      height: 7,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: currentIndex == entry.key
                                              ? indicatorSelectedColor
                                              : indicatorUnSelectedColor),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        : Container(),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]
                            ["imageWithText_1"]["subheading"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.subHeadingFontSize),
                      ),
                    ),

                    Container(
                        height: 220,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            child: WidgetImage(
                              state.data["ruleset"]["contentBlocks"]
                                  ["imageWithText_1"]["imageSrc"],
                              fit: BoxFit.contain,
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.width,
                            ))),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state.data["ruleset"]["contentBlocks"]
                            ["imageWithText_1"]["text"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.descFontSize),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     context.read<PresidioQuizBloc>().getData();
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.all(10),
                    //     child: Text(
                    //       "Retake Quiz",
                    //       textAlign: TextAlign.center,
                    //       style:
                    //           TextStyle(decoration: TextDecoration.underline),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "...................................................."),
                    SizedBox(height: 10),
                    Text(
                        "...................................................."),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        context
                            .read<PresidioQuizBloc>()
                            .add(PresidioQuizInitialEventStart());
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 200),
                          width: 200,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                          child: Text(""),
                        ),
                      ),
                    ),
                  ],
                ));
          }
        }),
      ),
    );
  }

  Widget getBlog(BuildContext context, article) {
    print("-------------1____________+++++>>>>>>>>>>>>>${article}");
    return Column(children: [
      Container(
          height: 220,
          child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(DashboardFontSize.customBorderRadius),
              child: WidgetImage(
                article["image"]["src"],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ))),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          article["title"],
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: DashboardFontSize.descMaxLines,
          style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: DashboardFontSize.descFontSize),
        ),
      ),
    ]);
  }

  Widget getProductGrid(dynamic data) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //2
            mainAxisSpacing: 10, //20
            crossAxisSpacing: 10, //20
            childAspectRatio: DashboardFontSize.imagetype == "Square"
                ? 0.66
                : DashboardFontSize.imagetype == "Portrait"
                    ? 0.58
                    : 0.51
            // mainAxisExtent: 150
            ),
        padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 5,
            DashboardFontSize.paddingRight, 5),
        itemCount: data['products'].length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                widget.onClick(data['products'][index]['id'].toString());

                // ProductDetailsScreen productDetailsScreen =
                //     ProductDetailsScreen(
                //         widget.data.productList![index].id.toString());
                // context.push("/${Routes.productDetailsScreen}",
                //     extra: productDetailsScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),
                  // border: Border.all(
                  //     width: 0.5, color: AppTheme.borderColor!
                  //     )
                ),
                // margin: EdgeInsets.all(2),
                // padding: EdgeInsets.all(0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height:
                                  DashboardFontSize.imageHeightForProductCell(
                                      context),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      DashboardFontSize.customBorderRadius),
                                  child: WidgetImage(
                                    data['products'][index]["image"]["src"],
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width,
                                  ))),
                          //widget.product.images!.length!=0 ? widget.product.images!.first.originalSrc! : "")),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  // padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      data['products'][index]['title']
                                          .toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)
                                      //  CustomTextTheme.getTextStyle(
                                      //     MyTextStyle.ProductGridViewCardTitle,
                                      //     context),
                                      // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      //     color: Colors.black, )
                                      ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          LanguageManager.translations()[
                                              'From']!,
                                          //AppLocalizations.of(context)!.from,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12)
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .bodySmall!
                                          //     .copyWith(
                                          //         color: Colors.black.withAlpha(120),
                                          //         fontSize: 12,
                                          //         )
                                          ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "\$ ${data['products'][index]['variants'][0]['price']}",
                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle
                                                .ProductGridViewCardPrice,
                                            context),
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodyMedium!
                                        //     .copyWith(
                                        //         color: Colors.red,
                                        //         fontWeight: FontWeight.bold,
                                        //         )
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ])),
              ));
        });
  }
}
