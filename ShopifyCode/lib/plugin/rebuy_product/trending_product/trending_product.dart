import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/plugin/rebuy_product/trending_product/Bloc/trending_product_bloc.dart';
import 'package:shopify_code/plugin/rebuy_product/trending_product/Bloc/trending_product_state.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/shimmers/product_grid_shimmer_view.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class RebuyTrendingProduct extends StatelessWidget {
  Function(dynamic) OnClick;
  RebuyTrendingProductData rebuyTrendingProductData;

  RebuyTrendingProduct(this.rebuyTrendingProductData, this.OnClick);
  var data;
  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final scale = mediaQueryData.textScaler.clamp(
    //   minScaleFactor: 0.80, // Minimum scale factor allowed.
    //   maxScaleFactor: 1.2, // Maximum scale factor allowed.
    // );
    // List<ProductList> listItems = [];
    // product.productList!.map((item) => {listItems.add(item)}).toList();

    return BlocProvider(
      create: (context) => TrendingProductBloc(),
      child: BlocListener<TrendingProductBloc, TrendingProductState>(
        listener: (context, state) {},
        child: BlocBuilder<TrendingProductBloc, TrendingProductState>(
            builder: (context, state) {
          if (state is TrendingProductSuccessState) {
            // data = state.quickViewDataModel;
            return state.quickViewDataModel['data']!.length == 0
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: DashboardFontSize.paddingLeft),
                        child: Text("Trending Product",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DashboardFontSize.headingFontSize,
                                )),
                      ),
                      Container(
                          // color: Colors.blue,
                          padding: EdgeInsets.only(
                              left: DashboardFontSize.paddingLeft,
                              right: DashboardFontSize.paddingRight
                              // top: DashboardFontSize.customCollectionPadingtop
                              ),
                          // height: DashboardFontSize.imageHeightForProductCell(context) +
                          //     MediaQuery.of(context).size.height * 0.08,
                          height:
                              DashboardFontSize.productGridHeightForDashboard(
                                  type: "List"),
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.quickViewDataModel['data']!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: Utils.isTablet(context)
                                      ? MediaQuery.of(context).size.width * 0.26
                                      : MediaQuery.of(context).size.width * 0.4,
                                  margin: EdgeInsets.only(right: 8),
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
                                      OnClick(state.quickViewDataModel['data']!
                                          [index]);
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            height: DashboardFontSize
                                                .productGridHeightForDashboard(
                                                    type: "Image"),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(DashboardFontSize
                                                        .customBorderRadius),
                                                child: WidgetImage(
                                                  state.quickViewDataModel[
                                                                      'data']![
                                                                  index][
                                                              'image']['src'] ==
                                                          null
                                                      ? AppAssets.no_image
                                                      : state.quickViewDataModel[
                                                              'data']![index]
                                                          ['image']['src']!,
                                                  fit: AppConfig.imageFit,
                                                )),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "${state.quickViewDataModel['data']![index]['title']}",
                                                maxLines: 2,
                                                style: TextStyle(

                                                    // color: textColor,
                                                    fontSize: DashboardFontSize
                                                        .descFontSize)),
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
                                                  MainAxisAlignment.start,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    state
                                                                    .quickViewDataModel[
                                                                        'data']![
                                                                        index][
                                                                        'variants']
                                                                    .first[
                                                                'price'] ==
                                                            null
                                                        ? ""
                                                        : state
                                                            .quickViewDataModel[
                                                                'data']![index]
                                                                ['variants']
                                                            .first['price'],
                                                    style: TextStyle(
                                                        // color: textColor,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .descFontSize,
                                                        color: AppTheme
                                                            .priceTagColor)),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    state
                                                                    .quickViewDataModel[
                                                                        'data']![
                                                                        index][
                                                                        'variants']
                                                                    .first[
                                                                'price'] ==
                                                            null
                                                        ? ""
                                                        : state
                                                            .quickViewDataModel[
                                                                'data']![index]
                                                                ['variants']
                                                            .first['price']!,
                                                    style: TextStyle(
                                                        // color: textColor,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .priceFontSize,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationColor: AppTheme
                                                            .priceTagColor)),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                );
                              })),
                    ],
                  );
          } else {
            return Container(
              padding: EdgeInsets.only(top: 10),
              child: productGridShimmerView()
                  .productGridShimmerEffect(context, showItems: 3, columns: 3),
            );
          }
        }),
      ),
    );
  }
}
