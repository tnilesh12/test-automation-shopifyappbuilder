import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_state.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/boost_ai/boost_ai_model.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../utils/theme_size.dart';
import '/theme6/views/category/category_item_for_collection.dart';
import '/theme6/views/common_screens/api_failure.dart';
import '/theme6/views/pages/pages_view_screen.dart';
import '/theme6/views/product_details_screen/product_details_screen.dart';
import '/theme6/views/product_list/product_list_screen.dart';
import '/theme6/views/search/boost_ai_search/product_grid_view_boostAI.dart';
import '/theme6/views/search/suggested_search_view.dart';
import '/theme6/views/shimmer/search_shimmer_view.dart';
import 'package:go_router/go_router.dart';
import '/theme6/views/widgets/no_data_view.dart';
import 'package:shopify_code/globels.dart' as globals;
import '/theme6/views/search/search_history_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BoostAISearchMainView extends StatefulWidget {
  final Function(String) onClick;
  Function(String) suggestCallBack;
  final Function() onNoDataClick;
  bool showAppBar;

  BoostAISearchMainView(this.onClick, this.suggestCallBack, this.onNoDataClick,
      {this.showAppBar = true});

  @override
  _BoostAISearchMainViewState createState() => _BoostAISearchMainViewState();
}

class _BoostAISearchMainViewState extends State<BoostAISearchMainView> {
  String tab = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoostAISearchScreenBloc, BoostAISearchScreenState>(
      builder: (context, state) {
        if (state is BoostAISearchAPIFailureState) {
          debugPrint(
              "----------------------------------Sm12.........${state.message}");
          return APIFailureScreens(
              showButton: widget.showAppBar, state.message);
        } else if (state is BoostAISearchScreenLoading) {
          return SearchScreenShimmerView().searchscreenshimmereffect(context);
        } else if (state is BoostAISearchScreenSuccessState) {
          return buildSearchResultsView(context, state);
        } else if (state is BoostAISearchScreenNoDataFound) {
          return SingleChildScrollView(
            child: Container(
              height: 470,
              child: NoDataView(AppAssets.search,
                  LanguageManager.translations()['noMatchFound'],
                  buttonTitle:
                      LanguageManager.translations()['continueSearching'],
                  onTap: () {
                widget.onNoDataClick.call();
              }),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SearchHistoryView((searchedHistory) {
                  widget.onClick(searchedHistory);
                }),
                // SuggestedSearchView(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildSearchResultsView(
      BuildContext context, BoostAISearchScreenSuccessState state) {
    return
        //  globals.Settings.containsKey(
        //         SettingsEnum.Smart_Search_Suggestions.name)
        //     ?
        //   SingleChildScrollView(
        // physics: ClampingScrollPhysics(), child:
        Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 6, left: 4, bottom: 4),
          height: 35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildTabButton(
                title: LanguageManager.translations()["Products"],
                itemCount: state.boostAISearch.products!.length,
                tb: "1",
                onPressed: () {
                  setState(() {
                    tab = "1";
                  });
                },
              ),
              buildTabButton(
                title: LanguageManager.translations()["Collections"],
                itemCount: state.boostAISearch.collections!.length,
                tb: "2",
                onPressed: () {
                  setState(() {
                    tab = "2";
                  });
                },
              ),
              // buildTabButton(
              //   title: LanguageManager.translations()["articles"],
              //   itemCount: state.predictiveSearch.articles!.length,
              //   tb: "3",
              //   onPressed: () {
              //     setState(() {
              //       tab = "3";
              //     });
              //   },
              // ),
              buildTabButton(
                title: LanguageManager.translations()["pages"],
                itemCount: state.boostAISearch.pages!.length,
                tb: "3",
                onPressed: () {
                  setState(() {
                    tab = "3";
                  });
                },
              ),
            ],
          ),
        ),
        SuggestedSearchView((suggestedSrch) {
          widget.suggestCallBack.call(suggestedSrch);
        }),
        Expanded(child: buildTabContent(context, state)),
      ],
      // ),
    );
    // : Container(
    //     child:
    //         buildProductsGridView(context, state.boostAISearch.products!),
    //   );
  }

  Widget buildTabButton(
      {required String title,
      required int itemCount,
      required String tb,
      required VoidCallback onPressed}) {
    if (itemCount != 0 && tab == "") tab = tb;
    return itemCount != 0
        ? InkWell(
            onTap: onPressed,
            child: Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 5, right: 5), //top: 5, bottom: 0, ),
                margin: EdgeInsets.only(left: ThemeSize.marginLeft),
                decoration: BoxDecoration(
                  color: AppTheme.primaryButtonBackground,
                  borderRadius:
                      BorderRadius.circular(ThemeSize.themeBorderRadius),
                ),
                child: Text(
                  "$title: $itemCount",
                  style: TextStyle(
                      color: AppTheme.primaryButtonText,
                      fontSize: ThemeSize.themeFontSize),
                )),
          )
        : SizedBox();
  }

  Widget buildTabContent(
      BuildContext context, BoostAISearchScreenSuccessState state) {
    switch (tab) {
      case "1":
        return buildProductsGridView(context, state.boostAISearch.products!);
      case "2":
        return buildCollectionsGridView(
            context, state.boostAISearch.collections!);
      // case "3":
      //   return buildArticleView(context, state.predictiveSearch.articles!);
      case "3":
        return buildPagesView(context, state.boostAISearch.pages!);
      // Add cases for other tabs
      default:
        return SizedBox();
    }
  }

  Widget buildProductsGridView(
      BuildContext context, List<BoostAIProducts> products) {
    bool isTablet = false;
    if (products.isNotEmpty && products.length != 0) {
      if (MediaQuery.of(context).size.shortestSide >= 600) {
        isTablet = true;
      } else {
        isTablet = false;
      }
      return AnimationLimiter(
          child: GridView.builder(
              physics:
                  NeverScrollableScrollPhysics(), //  ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 3 : 2,
                mainAxisSpacing: 6,
                // childAspectRatio:
                // ThemeSize.productGridAspectRatio(MediaQuery.of(context).size),
                mainAxisExtent: ThemeSize.productGridAspectRatio(type: "Grid"),
                crossAxisSpacing: 6,
              ),
              padding: EdgeInsets.fromLTRB(
                  ThemeSize.paddingLeft, 5, ThemeSize.paddingRight, 5.0),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: products.length,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                        child: InkWell(
                            onTap: () {
                              //// FIREBASE EVENT /////////
                              globals.analytics.logEvent(
                                  name: FireBaseEvent
                                      .OPEN_PRODUCT_FROM_SEARCH.name);
                              ////////////////////////////
                              //Store in database as a recent product
                              DataBaseOperation(globals.database!)
                                  .insertProduct(
                                      products[index].id.toString(),
                                      products[index].title.toString(), //"45",
                                      products[index].priceMax.toString(),
                                      products[index].images!.toString(),
                                      DateTime.now());
                              ProductDetailsScreen productDetailsScreen =
                                  ProductDetailsScreen(
                                      products[index].id.toString());
                              context.push("/${Routes.productDetailsScreen}",
                                  extra: productDetailsScreen);
                            },
                            child: BoostAIProductGridView(
                              context,
                              products[index],
                              (productId) {},
                            ))),
                  ),
                );
              }));
    } else {
      return SizedBox();
    }
  }

  Widget buildCollectionsGridView(
      BuildContext context, List<BoostAICollections> collections) {
    if (collections.isNotEmpty && collections.length != 0) {
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 150,
        ),
        padding: EdgeInsets.only(right: 20, top: 20, left: 20.0),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return CategoryItemForCollection(
              collections[index].image != null
                  ? collections[index].image!.toString()
                  : "",
              collections[index].title.toString(), () {
            if (collections[index].id != null) {
              ProductListScreen productListScreen = ProductListScreen(
                  collections![index].id.toString(), collections[index].title!);
              context.push("/${Routes.productListScreen}",
                  extra: productListScreen);
            }
          });
        },
      );
    } else {
      return SizedBox();
    }
  }

  // Widget buildArticleView(BuildContext context, List<Article> articles) {
  //   return ListView.builder(
  //     itemCount: articles!.length,
  //     itemBuilder: (context, index) {
  //       return GestureDetector(
  //         onTap: () {
  //           BlogPostScreen blogPostScreen =
  //               BlogPostScreen(articles[index], index);
  //           context.push("/${Routes.blogPostScreen}", extra: blogPostScreen);

  //           // Navigator.pushNamed(
  //           //                       context, RouteGenerate.blogpostscreen,
  //           //                       arguments: {
  //           //                   articles![index],
  //           //                         index
  //           //                       });
  //         },
  //         child: Container(
  //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //           padding: EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             color: Theme.of(context).primaryColor.withAlpha(10),
  //             borderRadius: BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
  //           ),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Hero(
  //                 tag: LanguageManager.translations()["image"] + "$index",
  //                 child: CachedNetworkImage(
  //                   imageUrl: articles![index].image!.originalSrc.toString(),
  //                   placeholder: (context, url) => Image.asset(
  //                     AppAssets.placeholder,
  //                     fit: BoxFit.cover,
  //                   ),
  //                   errorWidget: (context, url, error) => Image.asset(
  //                     AppAssets.placeholder,
  //                     fit: BoxFit.cover,
  //                   ),
  //                   width: 100,
  //                   height: 100,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               SizedBox(width: 20),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Hero(
  //                       tag: LanguageManager.translations()["title"] + "$index",
  //                       child: Text(
  //                         articles![index].title.toString(),
  //                         style: Theme.of(context).textTheme.bodyMedium!,
  //                         maxLines: 4,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                     SizedBox(height: 5),
  //                     Text(
  //                       DateTimeUtils.getDateTime(
  //                           articles![index].publishedAt.toString()),
  //                       style: Theme.of(context).textTheme.bodySmall!,
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget buildPagesView(BuildContext context, List<BoostAIPages> pages) {
    if (pages.isNotEmpty && pages.length != 0) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: pages!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              PageViewScreen pageViewScreen =
                  PageViewScreen(pages[index].handle!);
              context.push("/${Routes.pageViewScreen}", extra: pageViewScreen);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .primaryColor
                    .withAlpha(10), //editTextBackgroundColor
                borderRadius: BorderRadius.all(
                    Radius.circular(ThemeSize.themeBorderRadius)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pages[index].title.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   LanguageManager.translations()["CreatedAt"] +
                  //       DateTimeUtils.getDateTime(
                  //           pages[index].image!.createdAt.toString()),
                  //   style: Theme.of(context).textTheme.bodySmall!,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return SizedBox();
    }
  }
}
