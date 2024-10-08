import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/util/routes.dart';
import '../../utils/theme_size.dart';
import '/theme1/views/product_details_screen/product_details_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '/theme1/views/widgets/product_grid_view.dart';

class ProductListWidgets extends StatelessWidget {
  List<Product> list;
  BuildContext context;

  ProductListWidgets(this.context, this.list);

  @override
  Widget build(BuildContext context) {
    bool isTablet = false;
    if (MediaQuery.of(context).size.shortestSide >= 600) {
      isTablet = true;
    } else {
      isTablet = false;
    }
    return Container(
        // padding: EdgeInsets.fromLTRB(ThemeSize.paddingLeft, 10, 1, 10),
        height: ThemeSize.productGridAspectRatio(type: "List"),
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: list!.length,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                      child: Container(
                    margin: EdgeInsets.only(right: ThemeSize.marginRight),
                    child: InkWell(
                        onTap: () {
                          ProductDetailsScreen productDetailsScreen =
                              ProductDetailsScreen(list![index].id!);
                          context.push("/${Routes.productDetailsScreen}",
                              extra: productDetailsScreen);
                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 8),
                          // margin: EdgeInsets.fromLTRB(
                          //     index == 0 ? ThemeSize.paddingLeft : 6,
                          //     10,
                          //     0,
                          //     10),
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.26
                              : MediaQuery.of(context).size.width * 0.4,
                          // height: DashboardFontSize.imageHeightForProductCell(
                          //     context),
                          child: ProductGridView(
                              context, list![index], (productId) {},
                              OnRemove: (String productId) {}),
                        )),
                  )),
                ),
              );
            }));
  }
}
