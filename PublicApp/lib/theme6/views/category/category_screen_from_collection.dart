import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/routes.dart';
import '../../utils/theme_size.dart';
import '/theme6/views/category/category_item_for_collection.dart';
import '/theme6/views/category/category_row_view_left_from_collection.dart';
import '/theme6/views/common_screens/api_failure.dart';
import '/theme6/views/product_list/product_list_screen.dart';
import '/theme6/views/shimmer/category_list_shimmer_view.dart';
import '/theme6/views/shimmer/product_filter_shimmer_view.dart';
import '/theme6/views/widgets/no_data_view.dart';
import '../../../common/bloc/category_screen_bloc/category_screen_bloc.dart';
import 'category_row_view_right_from_collection.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreenFromCollection extends StatefulWidget {
  bool showappbar;

  CategoryScreenFromCollection(this.showappbar, {super.key});

  @override
  State<CategoryScreenFromCollection> createState() =>
      _CategoryScreenFromCollectionState();
}

class _CategoryScreenFromCollectionState
    extends State<CategoryScreenFromCollection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CategoryScreenBloc>().loadCollection();
  }

  @override
  Widget build(BuildContext context) {
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
          body: CategoryScreenFromCollectionBody(
              context, true, widget.showappbar));
    } else {
      return CategoryScreenFromCollectionBody(context, true, widget.showappbar);
    }
  }

  Widget CategoryScreenFromCollectionBody(
      BuildContext context, bool Single_Category, bool showAppBar) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Single_Category
              ? Expanded(
                  child: BlocListener<CategoryScreenBloc, CategoryScreenState>(
                      listener: (context, state) {},
                      child:
                          BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
                              builder: (context, state) {
                        if (state is CategoryScreenLoadingCollection) {
                          return CategoryScreenShimmerView()
                              .categoryListshimmereffect(context);
                        } else if (state is CategoryScreenAPIFailureState) {
                          return APIFailureScreens(
                              showButton: showAppBar, state.message);
                        } else if (state is CategoryScreenLoadedCollection) {
                          return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, //2
                                mainAxisSpacing: 5, //20
                                crossAxisSpacing: 5, //20
                                mainAxisExtent: 140, //150
                              ),
                              // padding: EdgeInsets.only(
                              //     right: 20, top: 20, left: 20.0),
                              padding: EdgeInsets.fromLTRB(
                                  ThemeSize.paddingLeft,
                                  5,
                                  ThemeSize.paddingRight,
                                  5),
                              itemCount: context
                                  .read<CategoryScreenBloc>()
                                  .collectionList
                                  .length,
                              itemBuilder: (context, state1) {
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
                                          context
                                                      .read<
                                                          CategoryScreenBloc>()
                                                      .collectionList[state1]
                                                      .image !=
                                                  null
                                              ? context
                                                  .read<CategoryScreenBloc>()
                                                  .collectionList[state1]
                                                  .image!
                                                  .originalSrc!
                                              : "",
                                          context
                                              .read<CategoryScreenBloc>()
                                              .collectionList[state1]
                                              .title!, () {
                                        if (context
                                            .read<CategoryScreenBloc>()
                                            .collectionList[state1]
                                            .id!
                                            .isNotEmpty) {
                                          ProductListScreen productListScreen =
                                              ProductListScreen(
                                                  context
                                                      .read<
                                                          CategoryScreenBloc>()
                                                      .collectionList[state1]
                                                      .id!,
                                                  context
                                                      .read<
                                                          CategoryScreenBloc>()
                                                      .collectionList[state1]
                                                      .title!);
                                          context.push(
                                              "/${Routes.productListScreen}",
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
                            // buttonTitle: "Continue Shopping",
                            // onTap: () {
                            //   context.push("/${Routes.categoryScreen}",
                            //       extra: true);
                            // },
                          );
                        }
                      })))
              : Expanded(
                  child: Container(
                    child: Row(children: [
                      BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
                        builder: (context, state) {
                          if (state is CategoryScreenLoadingCollection) {
                            return Container(
                              width: 100,
                              child: ProductFilterShimmerView()
                                  .ProductFilterLeftView(),
                            );
                          } else {
                            return Container(
                                child: SizedBox(
                                    width: 100,
                                    height: MediaQuery.of(context).size.height,
                                    child: CategoryRowViewLeftFromCollection(
                                        menus: context
                                            .read<CategoryScreenBloc>()
                                            .collectionList)));
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 1,
                        height: MediaQuery.of(context).size.height,
                        color: AppTheme.white!.withAlpha(120),
                      ),
                      BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
                        builder: (context, state) {
                          return Container(
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 101,
                                  height: MediaQuery.of(context).size.height,
                                  child: CategoryRowViewRightFromCollection(
                                      menus: context
                                          .read<CategoryScreenBloc>()
                                          .collectionList)));
                        },
                      ),
                    ]),
                  ),
                ),
        ],
      ),
    );
  }
}
