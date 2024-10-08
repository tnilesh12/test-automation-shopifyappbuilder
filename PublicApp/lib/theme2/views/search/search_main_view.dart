import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/search_screen_bloc/search_screen_bloc.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/article/article.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/modelClass/src/page/page.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:shopify_code/util/routes.dart';
import '/theme2/utils/theme_size.dart';
import '../blog/blog_screen_item_view.dart';
import '/theme2/views/blog/blog_post/blog_post_screen.dart';
import '/theme2/views/category/category_item_for_collection.dart';
import '/theme2/views/common_screens/api_failure.dart';
import '/theme2/views/pages/pages_view_screen.dart';
import '/theme2/views/product_details_screen/product_details_screen.dart';
import '/theme2/views/product_list/product_list_screen.dart';
import '/theme2/views/shimmer/search_shimmer_view.dart';
import '/theme2/views/widgets/no_data_view.dart';
import '../widgets/product_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import '/theme2/views/search/search_history_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchMainView extends StatefulWidget {
  final Function(String) onClick;
  final Function() onNoDataClick;
  bool showAppBar;

  SearchMainView(this.onClick, this.onNoDataClick, {this.showAppBar = true});

  @override
  _SearchMainViewState createState() => _SearchMainViewState();
}

class _SearchMainViewState extends State<SearchMainView> {
  String tab = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        if (state is PredictiveSearchAPIFailureState) {
          debugPrint(
              "----------------------------------Sm12.........${state.message}");
          return APIFailureScreens(
              showButton: widget.showAppBar, state.message);
        } else if (state is SearchScreenLoading) {
          return SearchScreenShimmerView().searchscreenshimmereffect(context);
        } else if (state is PredictiveSearchScreenSuccessState) {
          return buildSearchResultsView(context, state);
        } else if (state is SearchScreenNoDataFound) {
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
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildSearchResultsView(
      BuildContext context, PredictiveSearchScreenSuccessState state) {
    return globals.Settings.containsKey(
            SettingsEnum.Smart_Search_Suggestions.name)
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 6, left: 8, bottom: 4),
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildTabButton(
                      title: LanguageManager.translations()["Products"],
                      itemCount: state.predictiveSearch.products!.length,
                      tb: "1",
                      onPressed: () {
                        setState(() {
                          tab = "1";
                        });
                      },
                    ),
                    buildTabButton(
                      title: LanguageManager.translations()["Collections"],
                      itemCount: state.predictiveSearch.collections!.length,
                      tb: "2",
                      onPressed: () {
                        setState(() {
                          tab = "2";
                        });
                      },
                    ),
                    buildTabButton(
                      title: LanguageManager.translations()["articles"],
                      itemCount: state.predictiveSearch.articles!.length,
                      tb: "3",
                      onPressed: () {
                        setState(() {
                          tab = "3";
                        });
                      },
                    ),
                    buildTabButton(
                      title: LanguageManager.translations()["pages"],
                      itemCount: state.predictiveSearch.pages!.length,
                      tb: "4",
                      onPressed: () {
                        setState(() {
                          tab = "4";
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: buildTabContent(context, state)),
            ],
          )
        : Container(
            child: buildProductsGridView(
                context, state.predictiveSearch.products!),
          );
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
      BuildContext context, PredictiveSearchScreenSuccessState state) {
    switch (tab) {
      case "1":
        return buildProductsGridView(context, state.predictiveSearch.products!);
      case "2":
        return buildCollectionsGridView(
            context, state.predictiveSearch.collections!);
      case "3":
        return buildArticleView(context, state.predictiveSearch.articles!);
      case "4":
        return buildPagesView(context, state.predictiveSearch.pages!);
      // Add cases for other tabs
      default:
        return SizedBox();
    }
  }

  Widget buildProductsGridView(BuildContext context, List<Product> products) {
    bool isTablet = false;
    if (MediaQuery.of(context).size.shortestSide >= 600) {
      isTablet = true;
    } else {
      isTablet = false;
    }
    return AnimationLimiter(
        child: GridView.builder(
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 3 : 2,
              mainAxisSpacing: 6,
              // childAspectRatio:
              // ThemeSize.productGridAspectRatio(MediaQuery.of(context).size),
              mainAxisExtent: ThemeSize.productGridAspectRatio(type: "Grid"),
              crossAxisSpacing: 6,
            ),
            padding: EdgeInsets.fromLTRB(
                ThemeSize.paddingLeft, 10, ThemeSize.paddingRight, 10.0),
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
                            DataBaseOperation(globals.database!).insertProduct(
                                products[index].id.toString(),
                                products[index].title.toString(), //"45",
                                products[index].formattedPrice.toString(),
                                products[index].image!.toString(),
                                DateTime.now());

                            ProductDetailsScreen productDetailsScreen =
                                ProductDetailsScreen(products[index].id!);
                            context.push("/${Routes.productDetailsScreen}",
                                extra: productDetailsScreen);
                          },
                          child: ProductGridView(
                            context,
                            products[index],
                            (productId) {},
                            OnRemove: (String productId) {},
                          ))),
                ),
              );
            }));
  }

  Widget buildCollectionsGridView(
      BuildContext context, List<Collection> collections) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 150,
      ),
      padding: EdgeInsets.only(right: 20, top: 20, left: 20.0),
      itemCount: collections!.length,
      itemBuilder: (context, index) {
        return CategoryItemForCollection(
            collections![index].image != null
                ? collections![index].image!.originalSrc!
                : "",
            collections![index].title!, () {
          if (collections![index].id!.isNotEmpty) {
            ProductListScreen productListScreen = ProductListScreen(
                collections![index].id!, collections![index].title!);
            context.push("/${Routes.productListScreen}",
                extra: productListScreen);
          }
        });
      },
    );
  }

  Widget buildArticleView(BuildContext context, List<Article> articles) {
    return ListView.builder(
      itemCount: articles!.length,
      itemBuilder: (context, index) {
        return BlogScreenItemView(
            index,
            articles![index].image != null
                ? articles![index].image!.originalSrc!
                : "",
            articles![index].title!,
            articles![index].publishedAt!, () {
          context.pushNamed(Routes.articleScreen,
              pathParameters: {"id": articles[index].id.toString()},
              extra: null);
        });
      },
    );
  }

  Widget buildPagesView(BuildContext context, List<Pagess> pages) {
    return ListView.builder(
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
              color: Theme.of(context).primaryColor.withAlpha(10),
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
                Text(
                  LanguageManager.translations()["CreatedAt"] +
                      DateTimeUtils.getDateTime(
                          pages[index].createdAt.toString()),
                  style: Theme.of(context).textTheme.bodySmall!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
