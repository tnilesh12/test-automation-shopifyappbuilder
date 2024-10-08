import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import '/utils/theme_size.dart';
import '/views/category/category_from_menu/category_row_view_left_from_menu.dart';
import '/views/category/category_item_for_collection.dart';
import '/views/common_screens/api_failure.dart';
import '/views/product_list/product_list_screen.dart';
import '/views/shimmer/category_list_shimmer_view.dart';
import '/views/shimmer/product_filter_shimmer_view.dart';
import '/views/widgets/no_data_view.dart';
import '../bloc/category_screen_bloc.dart';
import 'category_row_view_right_from_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreenFromMenu extends StatefulWidget {
  bool showappbar;

  CategoryScreenFromMenu(this.showappbar, {super.key});

  @override
  State<CategoryScreenFromMenu> createState() => _CategoryScreenFromMenuState();
}

class _CategoryScreenFromMenuState extends State<CategoryScreenFromMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CategoryScreenBloc>().loadCollection();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<CategoryScreenBloc>().loadDataCollection();
    // context.read<CategoryScreenBloc>().loadDataCollectionMenu();
    // context.read<CategoryScreenBloc>().loadDataCollectionMenuHandle();
    if (widget.showappbar) {
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
              title: Text(LanguageManager.translations()['Collections']!)),
          // backgroundColor: Theme.of(context).primaryColor,
          body: CategoryScreenFromMenuBody(context, widget.showappbar));
    } else {
      return CategoryScreenFromMenuBody(context, widget.showappbar);
    }
  }

  Widget CategoryScreenFromMenuBody(BuildContext context, bool showAppBar) {
    return Container(
        child: BlocListener<CategoryScreenBloc, CategoryScreenState>(
      listener: (context, state) {},
      child: BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
          builder: (context, state) {
        if (context.read<CategoryScreenBloc>().isMultiLevel) {
          if (state is CategoryScreenLoadingCollection) {
            return Container(
              child: Row(children: [
                SizedBox(
                  width: 100,
                  child: ProductFilterShimmerView().ProductFilterLeftView(),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 1,
                  height: MediaQuery.of(context).size.height,
                  color: AppTheme.white!.withAlpha(120),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  child: Text(LanguageManager.translations()["LoadingText"]),
                ),
              ]),
            );
          } else if (state is CategoryScreenAPIFailureState) {
            return APIFailureScreens(showButton: showAppBar, state.message);
          } else if (state is CategoryScreenLoaded) {
            return Container(
              child: Row(children: [
                SizedBox(
                    width: 100,
                    height: MediaQuery.of(context).size.height,
                    child: CategoryRowViewLeftFromMenu(
                        menuDataModel:
                            context.read<CategoryScreenBloc>().menuDataModel!)),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 1,
                  height: MediaQuery.of(context).size.height,
                  color: AppTheme.white!.withAlpha(120),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 101,
                    height: MediaQuery.of(context).size.height,
                    child: CategoryRowViewRightFromMenu(
                      menuDataModel:
                          context.read<CategoryScreenBloc>().menuDataModel!,
                      mainIndex:
                          context.read<CategoryScreenBloc>().changeStyle!,
                    ))
              ]),
            );
          } else {
            return NoDataView(
              AppAssets.cart,
              LanguageManager.translations()['collectionEmpty'],
            );
          }
        } else {
          if (state is CategoryScreenLoadingCollection) {
            return CategoryScreenShimmerView()
                .categoryListshimmereffect(context);
          } else if (state is CategoryScreenAPIFailureState) {
            return APIFailureScreens(showButton: showAppBar, state.message);
          } else if (state is CategoryScreenLoaded) {
            //CategoryScreenLoadedCollection) {
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //2
                  mainAxisSpacing: 5, //20
                  crossAxisSpacing: 5, //20
                  mainAxisExtent: 140, //150
                ),
                // padding: EdgeInsets.only(
                //     right: 20, top: 20, left: 20.0),
                padding: EdgeInsets.fromLTRB(
                    ThemeSize.paddingLeft, 5, ThemeSize.paddingRight, 5),
                itemCount: context
                    .read<CategoryScreenBloc>()
                    .menuDataModel!
                    .menuItems!
                    .length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.synchronized(
                    duration: const Duration(milliseconds: 500),
                    // position: context
                    // .read<CategoryScreenBloc>()
                    // .collectionList
                    // .length,
                    // columnCount: 5,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: CategoryItemForCollection(
                            (context
                                            .read<CategoryScreenBloc>()
                                            .menuDataModel!
                                            .menuItems![index]
                                            .type!
                                            .toUpperCase() ==
                                        "COLLECTION" &&
                                    context
                                            .read<CategoryScreenBloc>()
                                            .menuDataModel!
                                            .menuItems![index]
                                            .resource !=
                                        null &&
                                    context
                                            .read<CategoryScreenBloc>()
                                            .menuDataModel!
                                            .menuItems![index]
                                            .resource!["image"] !=
                                        null &&
                                    context
                                            .read<CategoryScreenBloc>()
                                            .menuDataModel!
                                            .menuItems![index]
                                            .resource!["image"]["url"] !=
                                        null)
                                ? context
                                    .read<CategoryScreenBloc>()
                                    .menuDataModel!
                                    .menuItems![index]
                                    .resource!["image"]["url"] as String
                                : "",
                            context
                                .read<CategoryScreenBloc>()
                                .menuDataModel!
                                .menuItems![index]
                                .title!, () {
                          if (context
                              .read<CategoryScreenBloc>()
                              .menuDataModel!
                              .menuItems![index]
                              .resourceId!
                              .isNotEmpty) {
                            ProductListScreen productListScreen =
                                ProductListScreen(
                                    context
                                        .read<CategoryScreenBloc>()
                                        .menuDataModel!
                                        .menuItems![index]
                                        .resourceId!,
                                    context
                                        .read<CategoryScreenBloc>()
                                        .menuDataModel!
                                        .menuItems![index]
                                        .title!);
                            context.push("/${Routes.productListScreen}",
                                extra: productListScreen);
                          }
                        }),
                      ),
                    ),
                  );
                });
          } else {
            return NoDataView(
              AppAssets.cart,
              LanguageManager.translations()['collectionEmpty'],
            );
          }
        }
      }),
    ));
  }
}
