import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:publicapp/common/bloc/home_screen_bloc/home_screen_state.dart';
import 'package:publicapp/common/bloc/recent_bloc/recent_product_bloc.dart';
import 'package:publicapp/common/bloc/recent_bloc/recent_product_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme2/views/product_details_screen/product_details_screen.dart';
import '/theme2/views/shimmer/home_screen_shimmer_view.dart';
import '../../../common/widgets/custome_page_from_json.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import '/theme2/utils/theme_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageManager.translations()['homeScreen']),
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
      body: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  static HomeScreenBody? homeScreenBody;

  static HomeScreenBody getInstance() {
    homeScreenBody ??= HomeScreenBody();
    return homeScreenBody!;
  }

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = false;
    if (MediaQuery.of(context).size.shortestSide >= 600) {
      isTablet = true;
    } else {
      isTablet = false;
    }
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeScreenBloc>(
            create: (context) => HomeScreenBloc(),
          ),
          BlocProvider<RecentProductBloc>(
            create: (context) => RecentProductBloc(),
          ),
        ],
        // create: (context) => HomeScreenBloc(),

        child: BlocListener<HomeScreenBloc, HomeScreenState>(
          listener: ((context, state) {}),
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: ((context, state) {
            if (state is HomeScreenSuccessState) {
              print(
                  "------home screen---------${state.dashboardDataModel!.toJson()}");
              return SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      CustomePageFromJson()
                          .GetWidget(context, state.dashboardDataModel!),
                      BlocBuilder<RecentProductBloc, RecentProductState>(
                          builder: ((context1, state1) {
                        if (state1 is RecentProductSuccessState) {
                          return globals.Settings.containsKey(
                                      SettingsEnum.Recently_Viewed_List.name) &&
                                  context1
                                      .read<RecentProductBloc>()
                                      .recentProduct
                                      .isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding:
                                      //     const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                      margin: EdgeInsets.fromLTRB(
                                          ThemeSize.marginLeft,
                                          10,
                                          ThemeSize.marginRight,
                                          5),
                                      child: Text(
                                          LanguageManager.translations()[
                                              'recentProduct'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: ThemeSize
                                                    .themeHeadingFontSize,
                                              )),
                                    ),

                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                                        // margin: EdgeInsets.fromLTRB(
                                        //     ThemeSize.marginLeft, 0, 0, 10),
                                        // color: Colors.blue,
                                        padding: EdgeInsets.only(
                                          left: DashboardFontSize.paddingLeft,
                                          // top: DashboardFontSize.customCollectionPadingtop
                                        ),
                                        height:
                                            ThemeSize.productGridAspectRatio(
                                                type: "List"),
                                        child: ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: context1
                                                .read<RecentProductBloc>()
                                                .recentProduct
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                width: isTablet
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.26
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.4,
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                // decoration: BoxDecoration(
                                                //     // color: viewBackgroundColor,
                                                //     borderRadius: BorderRadius.circular(
                                                //         DashboardFontSize.customBorderRadius),
                                                //     border: Border.all(
                                                //         width: 1,
                                                //         color: AppTheme.borderColor!.withAlpha(40))),
                                                // margin: EdgeInsets.all(5),
                                                child: InkWell(
                                                  onTap: () {
                                                    // OnClick(listItems[index]);
                                                    ProductDetailsScreen
                                                        productDetailsScreen =
                                                        ProductDetailsScreen(context
                                                            .read<
                                                                RecentProductBloc>()
                                                            .recentProduct[
                                                                index]
                                                            .id
                                                            .toString());
                                                    context.push(
                                                        "/${Routes.productDetailsScreen}",
                                                        extra:
                                                            productDetailsScreen);
                                                  },
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          height: ThemeSize
                                                              .productGridAspectRatio(
                                                                  type:
                                                                      "Image"),
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      DashboardFontSize
                                                                          .customBorderRadius),
                                                              child:
                                                                  WidgetImage(
                                                                context1
                                                                    .read<
                                                                        RecentProductBloc>()
                                                                    .recentProduct[
                                                                        index]
                                                                    .image
                                                                    .toString(),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                              )),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "${context1.read<RecentProductBloc>().recentProduct[index].title}",
                                                              maxLines: 2,
                                                              style: TextStyle(

                                                                  // color: textColor,
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Container(
                                                        //   padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                        //   alignment: Alignment.centerLeft,
                                                        //   child: Text(
                                                        //       listItems[index].price != null
                                                        //           ? "${listItems[index].price!.amount}"
                                                        //           : "100",
                                                        //       style: TextStyle(
                                                        //           // color: textColor,
                                                        //           fontSize: 10,
                                                        //           color: AppTheme.priceTagColor)),
                                                        // ),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              // StarWidget(
                                                              //   (p0) {},
                                                              //   true,
                                                              //   12,
                                                              //   initialCount: 4,
                                                              // ),
                                                            ]),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                  "${context1.read<RecentProductBloc>().recentProduct[index].price == null ? "" : context1.read<RecentProductBloc>().recentProduct[index].price}",
                                                                  style: TextStyle(
                                                                      // color: textColor,
                                                                      fontSize: DashboardFontSize.descFontSize,
                                                                      color: AppTheme.priceTagColor)),
                                                            ),
                                                            // Container(
                                                            //   padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                            //   alignment: Alignment.centerLeft,
                                                            //   child: Text(
                                                            //       "${context.read<HomeScreenBloc>().recentProduct[index]. == null ? "" : listItems[index].price!.formattedPrice}",
                                                            //       style: TextStyle(
                                                            //           // color: textColor,
                                                            //           fontSize: 10,
                                                            //           decoration: TextDecoration.lineThrough,
                                                            //           decorationColor: AppTheme.priceTagColor)),
                                                            // ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                              );
                                            }))
                                    // Container(
                                    // alignment: Alignment.centerLeft,
                                    // // padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                                    // margin: EdgeInsets.fromLTRB(
                                    //     ThemeSize.marginLeft, 0, 0, 10),
                                    //     height: 210,
                                    //     child: ListView.builder(
                                    //         physics: ClampingScrollPhysics(),
                                    //         shrinkWrap: true,
                                    //         scrollDirection: Axis.horizontal,
                                    //         itemCount: context
                                    //             .read<HomeScreenBloc>()
                                    //             .recentProduct
                                    //             .length,
                                    //         itemBuilder:
                                    //             (BuildContext context, int index) {
                                    //           return InkWell(
                                    //             onTap: () {
                                    //               // OnClick(listItems[index]);
                                    // ProductDetailsScreen
                                    //     productDetailsScreen =
                                    //     ProductDetailsScreen(context
                                    //         .read<HomeScreenBloc>()
                                    //         .recentProduct[index]
                                    //         .id
                                    //         .toString());
                                    // context.push(
                                    //     "/${Routes.productDetailsScreen}",
                                    //     extra: productDetailsScreen);
                                    //             },
                                    //             child: Container(
                                    //               width: 130,
                                    //               decoration: BoxDecoration(
                                    //                   // color: viewBackgroundColor,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(5),
                                    //                   border: Border.all(
                                    //                       width: 1,
                                    //                       color: AppTheme
                                    //                           .borderColor!)),
                                    //               margin: EdgeInsets.fromLTRB(
                                    //                   index == 0 ? 0 : 5, 5, 5, 5),
                                    //               child: Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(5.0),
                                    //                 child: ClipRRect(
                                    //                     borderRadius:
                                    //                         BorderRadius.circular(
                                    //                             5),
                                    //                     child: Column(
                                    //                         crossAxisAlignment:
                                    //                             CrossAxisAlignment
                                    //                                 .stretch,
                                    //                         children: [
                                    //                           Container(
                                    //                             margin:
                                    //                                 EdgeInsets.all(
                                    //                                     2),
                                    //                             height: 110,
                                    //                             width: 120,
                                    //                             // decoration: BoxDecoration(
                                    //                             //     // color: imageBackgroundColor,
                                    //                             //     image: DecorationImage(
                                    //                             //         image: NetworkImage(
                                    //                             //             listItems[index].imageSrc!),
                                    //                             //         fit: BoxFit.fill)),
                                    //                             child: ClipRRect(
                                    //                                 borderRadius:
                                    //                                     BorderRadius
                                    //                                         .circular(
                                    //                                             5),
                                    // child: WidgetImage(context
                                    //     .read<
                                    //         HomeScreenBloc>()
                                    //     .recentProduct[
                                    //         index]
                                    //     .image
                                    //     .toString())),
                                    //                           ),
                                    //                           Container(
                                    //                             padding: EdgeInsets
                                    //                                 .fromLTRB(
                                    //                                     0, 5, 0, 0),
                                    //                             alignment: Alignment
                                    //                                 .centerLeft,
                                    //                             child: Text(
                                    // "${context.read<HomeScreenBloc>().recentProduct[index].title}",
                                    //                                 maxLines: 2,
                                    //                                 style: TextStyle(

                                    //                                     // color: textColor,
                                    //                                     fontSize: 12)),
                                    //                           ),
                                    //                           Container(
                                    //                             padding: EdgeInsets
                                    //                                 .fromLTRB(
                                    //                                     0, 0, 5, 0),
                                    //                             alignment: Alignment
                                    //                                 .centerLeft,
                                    //                             child: Text(
                                    //                                 "${context.read<HomeScreenBloc>().recentProduct[index].price}",
                                    //                                 style: TextStyle(
                                    //                                     // color: textColor,
                                    //                                     fontSize: 10,
                                    //                                     color: AppTheme.priceTagColor)),
                                    //                           ),
                                    //                         ])),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         })),
                                  ],
                                )
                              : Container(
                                  // height: 50,
                                  // color: Colors.amber,
                                  );
                        } else {
                          return Container(
                              // height: 50,
                              // color: Colors.blue,
                              );
                        }
                      }))
                    ],
                  ),
                ),
              );
            } else {
              return HomeScreenShimmerView();
            }
          })),
        ));
  }
}
