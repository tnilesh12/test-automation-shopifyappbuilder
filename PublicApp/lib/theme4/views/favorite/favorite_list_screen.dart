import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/favorite_bloc/favorite_list_screen_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../utils/theme_size.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '/theme4/views/common_screens/api_failure.dart';
import '/theme4/views/product_details_screen/product_details_screen.dart';
import '/theme4/views/shimmer/search_shimmer_view.dart';
import '/theme4/views/widgets/no_data_view.dart';
import '/theme4/views/widgets/no_data_view12.dart';
import '/theme4/views/widgets/product_grid_view.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteListScreen extends StatefulWidget {
  bool showappbar;
  FavoriteListScreen({this.showappbar = true, super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  // Widget? appBarTitle;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // appBarTitle = Text("Favorites", //AppLocalizations.of(context)!.favorites,
      //     style: TextStyle(
      //                             fontFamily: 'Cinzel',
      //                             fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
      //                             color: AppTheme.white
      //                         ));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // context.read<FavoriteListScreenBloc>().LoadData();
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
            title: Text(
              LanguageManager.translations()["Favorites"],
              // AppLocalizations.of(context)!.favorites,
            ),
          ),
          // bottomNavigationBar:
          //     BlocBuilder<FavoriteListScreenBloc, FavoriteListScreenState>(
          //   builder: (context, state) {
          //     return SizedBox.shrink();
          //   },
          // ),
          body: FavoriteListScreenBody());
    } else {
      return FavoriteListScreenBody();
    }
  }
}

Widget GetViewToRenderBody(BuildContext context, FavoriteListScreenState state,
    {required bool showAppBar}) {
  bool isTablet = false;
  if (state is FavoriteListScreenAPIFailureState) {
    return APIFailureScreens(showButton: showAppBar, state.message);
  } else if (state is FavoriteListScreenLoading) {
    return SearchScreenShimmerView().searchscreenshimmereffect(context);
  } else if (context.read<CartBloc>().productListFav!.length == 0) {
    return NoDataView(
      AppAssets.favoriteNoData,
      LanguageManager.translations()['noProductAvailable'],
      buttonTitle: LanguageManager.translations()['ContinueShopping'],
      onTap: () {
        context.push("/${Routes.categoryScreen}", extra: true);
      },
    );
  } else {
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
            // padding around the grid
            itemCount: context.read<CartBloc>().productListFav!.length,
            // total number of items
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: context.read<CartBloc>().productListFav!.length,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                      child: InkWell(
                          onTap: () {
                            ProductDetailsScreen productDetailsScreen =
                                ProductDetailsScreen(context
                                    .read<CartBloc>()
                                    .productListFav![index]
                                    .id
                                    .toString());
                            context.push("/${Routes.productDetailsScreen}",
                                extra: productDetailsScreen);
                            // Navigator.of(context).pushNamed(
                            // Routes.productDetailsScreen,
                            // arguments: {state.list![index].id});
                          },
                          child: ProductGridView(context,
                              context.read<CartBloc>().productListFav![index],
                              (productId) {
                            // context.read<FavoriteListScreenBloc>().loadFavoriteListData();
                          }, OnRemove: (String productId) {
                            //context.read<CartBloc>().productListFav!.removeAt(index);
                            context.read<FavoriteListScreenBloc>().GetFavList();
                          }))),
                ),
              );
            }));
  }
}

class FavoriteListScreenBody extends StatelessWidget {
  bool showAppBar;
  FavoriteListScreenBody({this.showAppBar = true, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteListScreenBloc(),
        child: BlocListener<FavoriteListScreenBloc, FavoriteListScreenState>(
            listener: (context, state) {},
            child: BlocBuilder<FavoriteListScreenBloc, FavoriteListScreenState>(
                builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                      child: GetViewToRenderBody(context, state,
                          showAppBar: showAppBar))
                ],
              );
            })));
  }
}
