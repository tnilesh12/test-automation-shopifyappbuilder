import 'package:flutter/material.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/product_collection_tab_view/bloc/product_collection_tab_view_bloc.dart';
import 'package:shopify_code/views/jsontoview/product_collection_tab_view/bloc/product_collection_tab_view_state.dart';
import 'package:shopify_code/views/shimmers/product_grid_shimmer_view.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCollectionTabView extends StatelessWidget {
  Function(Product) onClick;
  FeaturedCollectionData featuredCollectionData;
  ProductCollectionTabView(this.featuredCollectionData, this.onClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor =
        (Utils.getColorFromHex(featuredCollectionData.textColor!));
    return BlocProvider(
      create: (context) => ProductCollectionTabViewBloc(
          0,
          featuredCollectionData.featuredCollectionList![0].id,
          featuredCollectionData.showItems!,
          featuredCollectionData.columns!),
      child: BlocListener<ProductCollectionTabViewBloc,
          ProductCollectionTabViewState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<ProductCollectionTabViewBloc,
            ProductCollectionTabViewState>(
          builder: (context, state) {
            return Container(
              color:
                  Utils.getColorFromHex(featuredCollectionData.containerColor!),
              padding: EdgeInsets.only(
                  left: DashboardFontSize.paddingLeft,
                  right: DashboardFontSize.paddingRight,
                  top: 20),
              child: Column(
                children: [
                  featuredCollectionData.heading! != ""
                      ? Container(
                          alignment: Alignment.centerLeft,
                          child: Text(featuredCollectionData.heading!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DashboardFontSize.headingFontSize,
                                    color: Utils.getColorFromHex(
                                        featuredCollectionData.textColor!),
                                  )),
                        )
                      : Container(),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 10, 2),
                    height: 20,
                    child: ListView.builder(
                      itemCount:
                          featuredCollectionData.featuredCollectionList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<ProductCollectionTabViewBloc>()
                                  .LoadProductListAPI(
                                      index,
                                      featuredCollectionData
                                          .featuredCollectionList![index].id!,
                                      featuredCollectionData.showItems!,
                                      featuredCollectionData.columns!);
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 1, 1, 1),
                                alignment: Alignment.center,
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  featuredCollectionData
                                      .featuredCollectionList![index]
                                      .productTitle!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // shadows: [Shadow(offset: Offset(0, -5))],
                                    // color: Colors.transparent,
                                    color: context
                                                .read<
                                                    ProductCollectionTabViewBloc>()
                                                .selectedIndex ==
                                            index
                                        ? textColor
                                        : textColor.withAlpha(200),
                                    decoration: context
                                                .read<
                                                    ProductCollectionTabViewBloc>()
                                                .selectedIndex ==
                                            index
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    fontWeight: context
                                                .read<
                                                    ProductCollectionTabViewBloc>()
                                                .selectedIndex ==
                                            index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    decorationThickness: 2,
                                    fontSize: DashboardFontSize.descFontSize,
                                    decorationColor: Utils.getColorFromHex(
                                        featuredCollectionData.textColor!),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  (state is ProductCollectionTabViewLoadingState)
                      ? Container(
                          padding: EdgeInsets.only(top: 10),
                          child: productGridShimmerView()
                              .productGridShimmerEffect(context,
                                  showItems: featuredCollectionData.showItems!,
                                  columns: featuredCollectionData.columns!),
                        )
                      : (state is ProductCollectionTabViewNoDataState)
                          ? Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                "No Data Found.",
                                style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      featuredCollectionData.textColor!),
                                ),
                              ),
                            )
                          : (state is ProductCollectionTabViewLoadedState)
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent: DashboardFontSize
                                                    .productGridHeightForDashboard(
                                                        type: "Grid"),
                                                crossAxisSpacing: 5,
                                                mainAxisSpacing: 5,
                                                crossAxisCount:
                                                    featuredCollectionData
                                                        .columns!),
                                        itemCount: state.gridCount,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ProductCollectionTabGridView(
                                              state.productList, index,
                                              (product) {
                                            onClick.call(product);
                                          });
                                        },
                                      ),
                                      state.rowCount > 0
                                          ? Container(
                                              height: DashboardFontSize
                                                  .productGridHeightForDashboard(
                                                      type: "List"),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    for (int index =
                                                            state.gridCount;
                                                        index <
                                                            state.productList!
                                                                .length;
                                                        index++)
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets.only(
                                                              right: index ==
                                                                      state.productList!
                                                                              .length -
                                                                          1
                                                                  ? 0
                                                                  : 5),
                                                          child: ProductCollectionTabGridView(
                                                              state.productList,
                                                              index, (product) {
                                                            onClick
                                                                .call(product);
                                                          }),
                                                        ),
                                                      )
                                                  ]),
                                            )
                                          : Container()
                                    ],
                                  ),
                                )
                              : Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget ProductCollectionTabGridView(
    List<Product>? productList,
    int index,
    Function(Product)? onClick,
  ) {
    return InkWell(
      onTap: () => onClick!.call(productList![index]),
      child: Container(
        height: DashboardFontSize.productGridHeightForDashboard(type: "List"),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(DashboardFontSize.customBorderRadius),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // color: Colors.grey.shade300,
                // margin: EdgeInsets.all(2),
                // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                // padding: EdgeInsets.only(right: 5),
                height: DashboardFontSize.productGridHeightForDashboard(
                  type: "Image",
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    child: WidgetImage(
                        productList![index].image != null
                            ? productList[index].image!
                            : AppAssets.no_image,
                        fit: AppConfig.imageFit)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      productList[index].title!,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: DashboardFontSize.descFontSize,
                        color: Utils.getColorFromHex(
                            featuredCollectionData.textColor!),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            productList[index].formattedPrice == null
                                ? ""
                                : productList[index].formattedPrice!,
                            style: TextStyle(
                              fontSize: DashboardFontSize.descFontSize,
                              color: Utils.getColorFromHex(
                                  featuredCollectionData.textColor!),
                            )),
                      ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //       productList[index].priceCompareUpdate == null
                      //           ? ""
                      //           : productList[index].tempPrice!.formattedPrice,
                      //       style: TextStyle(
                      //           fontSize: DashboardFontSize.priceFontSize,
                      //           decoration: TextDecoration.lineThrough,
                      //           decorationColor: AppTheme.priceTagColor)),
                      // ),
                    ],
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
