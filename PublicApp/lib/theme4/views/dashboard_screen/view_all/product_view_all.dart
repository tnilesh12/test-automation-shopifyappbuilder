import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../utils/theme_size.dart';
import '/theme4/views/product_details_screen/product_details_screen.dart';
import 'package:go_router/go_router.dart';

class ProductViewAll extends StatefulWidget {
  ProductGridData data;
  ProductViewAll(this.data, {super.key});

  @override
  State<ProductViewAll> createState() => _ProductViewAllState();
}

class _ProductViewAllState extends State<ProductViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageManager.translations()['allProducts']),
      ),
      body: Container(
          // alignment: Alignment.centerLeft,
          // padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
          // margin: EdgeInsets.fromLTRB(ThemeSize.marginLeft, 0, 0, 10),
          // height: MediaQuery.of(context).size.height,
          child: GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //2
                  mainAxisSpacing: 10, //20
                  crossAxisSpacing: 10, //20
                  childAspectRatio: DashboardFontSize.imagetype == "Square"
                      ? 0.72
                      : DashboardFontSize.imagetype == "Portrait"
                          ? 0.63
                          : 0.55
                  // mainAxisExtent: 150
                  ),
              padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 5,
                  DashboardFontSize.paddingRight, 5),
              itemCount: widget.data.productList!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // OnClick(listItems[index]);
                    ProductDetailsScreen productDetailsScreen =
                        ProductDetailsScreen(
                            widget.data.productList![index].id.toString());
                    context.push("/${Routes.productDetailsScreen}",
                        extra: productDetailsScreen);
                  },
                  child: Container(
                    // color: Colors.amber,
                    // height:
                    //     DashboardFontSize.imageHeightForProductCell(context) +
                    //         MediaQuery.of(context).size.height * 0.02,
                    // width: MediaQuery.of(context).size.height * 0.4,
                    // decoration: BoxDecoration(
                    //     // color: viewBackgroundColor,
                    //     borderRadius: BorderRadius.circular(5),
                    //     border: Border.all(
                    //         // width: 1,
                    //         // color: AppTheme
                    //         //     .borderColor!
                    //         )),
                    // margin: EdgeInsets.fromLTRB(index == 0 ? 0 : 5, 5, 5, 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height:
                                    DashboardFontSize.imageHeightForProductCell(
                                        context),
                                width: MediaQuery.of(context).size.height * 0.1,
                                // decoration: BoxDecoration(
                                //     // color: imageBackgroundColor,
                                //     image: DecorationImage(
                                //         image: NetworkImage(
                                //             listItems[index].imageSrc!),
                                //         fit: BoxFit.fill)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: WidgetImage(
                                      widget.data.productList![index].imageSrc
                                          .toString(),
                                      // width: MediaQuery.of(context).size.width,
                                      // height: MediaQuery.of(context).size.width,
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    widget.data.productList![index].productTitle
                                        .toString(),
                                    // "${context.read<HomeScreenBloc>().recentProduct[index].title}",
                                    maxLines: 2,
                                    style: TextStyle(

                                        // color: textColor,
                                        fontSize: 12)),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "${widget.data.productList![index].discountedPrice == null ? "₹ 45" : widget.data.productList![index].discountedPrice!.formattedPrice}",
                                        style: TextStyle(
                                            // color: textColor,
                                            fontSize: 14,
                                            color: AppTheme.priceTagColor)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "${widget.data.productList![index].price == null ? "" : widget.data.productList![index].price!.formattedPrice}",
                                        style: TextStyle(
                                            // color: textColor,
                                            fontSize: 10,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                AppTheme.priceTagColor)),
                                  ),
                                ],
                              ),
                            ])),
                  ),
                );
              })),
    );
    ;
  }
}
