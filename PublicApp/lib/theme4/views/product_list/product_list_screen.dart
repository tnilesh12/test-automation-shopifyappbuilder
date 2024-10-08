import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/product_list_bloc/new_filter_list.dart';
import 'package:publicapp/common/bloc/product_list_bloc/product_list_screen_bloc.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:shopify_code/modelClass/sort_key_product_collection.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/setting_enum.dart';
import '../../utils/theme_size.dart';
import '/theme4/views/common_screens/api_failure.dart';
import '/theme4/views/product_details_screen/product_details_screen.dart';
import '/theme4/views/product_filter/product_filter_screen.dart';
import '/theme4/views/shimmer/search_shimmer_view.dart';
import '/theme4/views/widgets/no_data_view.dart';
import '/theme4/views/widgets/product_grid_view.dart';
import 'package:shopify_code/globels.dart' as globals;
import '/theme4/views/product_list/Sort_Bottom_ListView.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListScreen extends StatefulWidget {
  final String collection_id;
  final String collection_name;
  bool showappbar;

  ProductListScreen(this.collection_id, this.collection_name,
      {this.showappbar = true, super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int page = 1;
  Widget? appBarTitle;
  FilterBottomList? sorting =
      FilterBottomList("", false, false, SortKeyProductCollection.BEST_SELLING);
  late ProductListScreenBloc bloc;
  Map<String, dynamic>? filterarray = Map();

  @override
  void initState() {
    super.initState();
    globals.productFilterOptionValue = ProductFilterData("", [], [], "");
    SortBottomList = FilterList().SortBottomList;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appBarTitle = Text(widget.collection_name);
    });
    setState(() {});
  }

  FilterClick() async {
    try {
      filterarray = Map();
      ProductFilterScreen productFilterScreen =
          ProductFilterScreen(globals.FilterHandle);
      bool? filter = await context.push("/${Routes.productFilterScreen}",
          extra: productFilterScreen) as bool;
      // await Navigator.pushNamed(
      //     context, Routes.productFilterScreen,
      //     arguments: {globals.FilterHandle}) as bool;

      if (filter) {
        for (int i = 0; i < globals.productFilterOptionValue.keys.length; i++) {
          Map<String, dynamic> valueMap =
              json.decode((globals.productFilterOptionValue.values[i]));

          filterarray!.addAll(valueMap);
        }
      }

      page = 1;
      // context.read<ProductListScreenBloc>().LoadProductListAPI(widget.collection_id, page,
      //     sorting!.sortKeyProductCollection.name, sorting!.reverse!,
      //     filters: filterarray, clearCursor: true);
      bloc.cursorClear();
      bloc.LoadProductListAPI(widget.collection_id, page,
          sorting!.sortKeyProductCollection.name, sorting!.reverse!,
          filters: filterarray, clearCursor: true);
    } catch (e) {
      e.toString();
    }
  }

  SortClick() {
    showModalBottomSheet(
      context: context,
      builder: (context1) {
        return SortBottomListView((value) {
          sorting = value;
          page = 1;
          bloc.cursorClear();
          bloc.LoadProductListAPI(widget.collection_id, page,
              value.sortKeyProductCollection.name, value.reverse!,
              clearCursor: true);
          // context.read<ProductListScreenBloc>().LoadProductListAPI(
          //     widget.collection_id,
          //     page,
          //     value.sortKeyProductCollection.name,
          //     value.reverse!,
          //     clearCursor: true);
          Navigator.of(context).pop();
        });
      },
    );
  }

  SearchClick() {
    context.push("/${Routes.searchScreenFull}");
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ProductListScreenBloc>().LoadData(widget.collection_id, page,
    //     sorting!.sortKeyProductCollection, sorting!.reverse!);

    if (widget.showappbar) {
      return Scaffold(
          appBar: AppBar(
              title: Text(
                widget.collection_name,
              ),
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
              actions: [
                globals.Settings.containsKey(
                        SettingsEnum.Product_Search_And_Sort.name)
                    ? IconButton(
                        icon: Container(
                          width: 35, //MediaQuery.of(context).size.width * 0.09,
                          height:
                              35, //MediaQuery.of(context).size.height * 0.09,
                          padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                          child: SvgPicture.asset("assets/images/search.svg",
                              colorFilter: ColorFilter.mode(
                                  AppTheme.appBarTextColor!, BlendMode.srcIn)),
                        ),
                        onPressed: () {
                          SearchClick();
                        })
                    : Container(),
                globals.Settings.containsKey(
                        SettingsEnum.Show_Filter_On_Product_List_Page.name)
                    ? Stack(
                        children: [
                          IconButton(
                              icon: Container(
                                width:
                                    35, //MediaQuery.of(context).size.width * 0.09,
                                height:
                                    35, //MediaQuery.of(context).size.height * 0.09,
                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                child: SvgPicture.asset(
                                    "assets/images/filter.svg",
                                    colorFilter: ColorFilter.mode(
                                        AppTheme.appBarTextColor!,
                                        BlendMode.srcIn)),
                              ),
                              onPressed: () {
                                FilterClick();
                              }),
                          // globals.productFilterOptionValue.keys.length != 0
                          //     ? Positioned(
                          //         top: 10,
                          //         right: 10,
                          //         child: Icon(
                          //           Icons.info,
                          //           color: Colors.red,
                          //           size: 10,
                          //         ))
                          //     : SizedBox.shrink()
                        ],
                      )
                    : Container(),
                globals.Settings.containsKey(
                        SettingsEnum.Product_Search_And_Sort.name)
                    ? Stack(
                        children: [
                          IconButton(
                              icon: Container(
                                width:
                                    35, //MediaQuery.of(context).size.width * 0.09,
                                height:
                                    35, //MediaQuery.of(context).size.height * 0.09,
                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                child: SvgPicture.asset(
                                    "assets/images/sort.svg",
                                    colorFilter: ColorFilter.mode(
                                        AppTheme.appBarTextColor!,
                                        BlendMode.srcIn)),
                              ),
                              onPressed: () {
                                SortClick();
                              }),
                          // Positioned(
                          //     top: 10,
                          //     right: 10,
                          //     child: Icon(
                          //       Icons.info,
                          //       color: Colors.red,
                          //       size: 10,
                          //     ))
                        ],
                      )
                    : Container()
              ]),
          body: ProductListScreenBody(
            widget.collection_id,
            widget.collection_name,
            (ProductListScreenBloc b) {
              bloc = b;
            },
            sorting: sorting,
            filterarray: filterarray,
          ));
    } else {
      return ProductListScreenBody(
        widget.collection_id,
        widget.collection_name,
        (ProductListScreenBloc b) {
          bloc = b;
        },
        sorting: sorting,
        filterarray: filterarray,
      );
    }
  }
}

Widget GetViewToRender(BuildContext context, ProductListScreenState state,
    {required bool showAppBar}) {
  bool isTablet = false;
  if (state is ProductListScreenAPIFailureState) {
    return APIFailureScreens(showButton: showAppBar, state.message);
  } else if (state is ProductListScreenLoading) {
    return SearchScreenShimmerView().searchscreenshimmereffect(context);
  } else if (state is ProductListScreenLoaded) {
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
        // mainAxisExtent: isTablet ? 380 : 670,
        crossAxisSpacing: 6,
      ),
      padding: EdgeInsets.fromLTRB(
          ThemeSize.paddingLeft, 10, ThemeSize.paddingRight, 10.0),
      shrinkWrap: true,
      itemCount: state.list!.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 375),
          columnCount: state.list!.length,
          child: ScaleAnimation(
            child: FadeInAnimation(
                child: InkWell(
                    onTap: () {
                      //Store in database as a recent product
                      DataBaseOperation(globals.database!).insertProduct(
                          state.list![index].id.toString(),
                          state.list![index].title.toString(), //"45",
                          state.list![index].formattedPrice.toString(),
                          state.list![index].image!.toString(),
                          DateTime.now());

                      ProductDetailsScreen productDetailsScreen =
                          ProductDetailsScreen(state.list![index].id!);
                      context.push("/${Routes.productDetailsScreen}",
                          extra: productDetailsScreen);
                    },
                    child: ProductGridView(
                      context,
                      state.list![index],
                      (productId) {},
                      OnRemove: (String productId) {},
                    ))),
          ),
        );
      },
    ));
  } else {
    return NoDataView(
        AppAssets.cart, LanguageManager.translations()['noProductFound'],
        buttonTitle: LanguageManager.translations()['ContinueShopping'],
        onTap: () {
      context.push("/${Routes.categoryScreen}", extra: true);
    });
  }
}

class ProductListScreenBody extends StatelessWidget {
  final String collection_id;
  final String collection_name;
  int page = 1;
  FilterBottomList? sorting;
  Function(ProductListScreenBloc) onSetBloc;
  bool showappbar;

  ProductListScreenBody(
      this.collection_id, this.collection_name, this.onSetBloc,
      {this.showappbar = true,
      this.page = 1,
      this.sorting,
      this.filterarray = null,
      super.key});

  bool LoadingData = false;
  Map<String, dynamic>? filterarray; // = null;//Map();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context1) => ProductListScreenBloc(collection_id, page,
            sorting!.sortKeyProductCollection.name, sorting!.reverse!),
        child: BlocListener<ProductListScreenBloc, ProductListScreenState>(
            listener: (context, state) {},
            child: BlocBuilder<ProductListScreenBloc, ProductListScreenState>(
                builder: (context, state) {
              onSetBloc.call(context.read<ProductListScreenBloc>());
              return NotificationListener<ScrollEndNotification>(
                  onNotification: (ScrollEndNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      page++;
                      context.read<ProductListScreenBloc>().LoadProductListAPI(
                          collection_id,
                          page,
                          sorting!.sortKeyProductCollection.name,
                          sorting!.reverse!,
                          filters: filterarray);
                      return true;
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: GetViewToRender(context, state,
                              showAppBar: showappbar))
                    ],
                  ));
            })));
  }
}
