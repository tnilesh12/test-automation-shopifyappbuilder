import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

import '../../../app_config/app_config.dart';
// import '/views/widgets/rating_review/star_widget.dart';

class ItgeekWidgetPopulorProduct extends StatelessWidget {
  ProductGridData product;
  Function(ProductList) OnClick;

  ItgeekWidgetPopulorProduct(this.product, this.OnClick);

  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final scale = mediaQueryData.textScaler.clamp(
    //   minScaleFactor: 0.80, // Minimum scale factor allowed.
    //   maxScaleFactor: 1.2, // Maximum scale factor allowed.
    // );
    // Color containerBackgroundColor =
    //     Utils.getColorFromHex(product.);

    return Container(
      color: Utils.getColorFromHex(
          product.containerColor!), //containerBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            margin: EdgeInsets.fromLTRB(DashboardFontSize.marginLeft,
                DashboardFontSize.marginTop, DashboardFontSize.marginRight, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product.heading! != ""
                    ? Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: Text(product.heading!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DashboardFontSize.headingFontSize,
                                  color:
                                      Utils.getColorFromHex(product.textColor!),
                                )),
                      )
                    : Container(),
                product.viewAll!
                    ? Flexible(
                        // flex: 1,
                        // fit: FlexFit.loose,
                        child: InkWell(
                          onTap: () {
                            context.push("/${Routes.productViewAll}",
                                extra: product);
                          },
                          child: Text(
                            LanguageManager.translations()['viewAll'],
                            style: TextStyle(
                              fontSize: DashboardFontSize.descFontSize,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          product.heading! != "" ? SizedBox(height: 10) : Container(),
          product.enableSlider!
              ? product.style == "default"
                  ? PopulorProductListView(product, OnClick)
                  : product.style == "Style_1"
                      ? ProductListViewStyleOne(product, OnClick)
                      : product.style == "Style_2"
                          ? ProductListViewStyleTwo(product, OnClick)
                          : product.style == "Style_3"
                              ? ProductListViewStyleThree(product, OnClick)
                              : Container()
              : ProductWidgetSlider(product, OnClick)
        ],
      ),
    );
  }
}

class ProductWidgetSlider extends StatefulWidget {
  ProductGridData product;
  Function(ProductList) OnClick;

  ProductWidgetSlider(this.product, this.OnClick, {super.key});

  @override
  State<ProductWidgetSlider> createState() => _ProductWidgetSliderState();
}

class _ProductWidgetSliderState extends State<ProductWidgetSlider> {
  CarouselSliderController carouselController = CarouselSliderController();
  int i = 0, j = 0, k = 0;

  Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
  Color indicatorUnSelectedColor =
      AppTheme.primaryLightTextColor!.withAlpha(80);

  getSliderAspectRatio(int row, int column) {
    // double ar;

    //row=3 & column=3
    if (widget.product.enableSlider!) {
      return 0.5;
    } else if (row == 3 && column == 3) {
      if (widget.product.productList!.length <= 3) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.9;
        }

        print("image type1------->" + DashboardFontSize.imagetype);
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.38;
        }
        return 1.5;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.9;
        } else if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.7;
        }
        return 0.78;
      } else if (widget.product.productList!.length <= 9) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.62;
        } else if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.47;
        }
        return 0.53;
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.634;
        } else if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.467;
        }
        return 0.537;
      }
    } else if (row == 3 && column == 2) {
      if (widget.product.productList!.length <= 2) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.39;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.1;
        }
        return 1.26;
      } else if (widget.product.productList!.length <= 4) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.73;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.56;
        }

        return 0.64;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.49;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.378;
        }
        return 0.43;
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.492;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.38;
        }
        return 0.434;
      }
    } else if (row == 3 && column == 1) {
      if (widget.product.productList!.length <= 1) {
        if (DashboardFontSize.imagetype == "Square") {
          return 3.5;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.9;
        }

        return 2.4;
      } else if (widget.product.productList!.length <= 2) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.8;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.97;
        }

        return 1.18;
      } else if (widget.product.productList!.length <= 3) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.25;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.645;
        }

        return 0.798;
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.24;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.645;
        }

        return 0.798;
      }
    }
    if (row == 2 && column == 3) {
      if (widget.product.productList!.length <= 3) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.83;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.37;
        }

        return 1.54;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.93;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.69;
        }

        return 0.8;
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.95;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.69;
        }
        return 0.8;
      }
    } else if (row == 2 && column == 2) {
      if (widget.product.productList!.length <= 2) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.43;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.1;
        }
        return 1.25;
      } else if (widget.product.productList!.length <= 4) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.745;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.56;
        }
        return 0.64;
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.745;
        }

        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.567;
        }
        return 0.647;
      }
    } else if (row == 2 && column == 1) {
      if (widget.product.productList!.length <= 1) {
        if (DashboardFontSize.imagetype == "Square") {
          return 3.5;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.92;
        }

        return 2.4;
      } else if (widget.product.productList!.length <= 2) {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.77;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.95;
        }

        return 1.29;
        // } else if (widget.product.productList!.length <= 3) {
        //   return   0.89;
        // }
      } else {
        if (DashboardFontSize.imagetype == "Square") {
          return 1.875;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.965;
        }
        return 1.2;
      }
    } else {
      return 0.67;
    }
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int row = widget.product.rows!;
    var myBool = false;

    if (widget.product.columns != 1) {
      k = (widget.product.productList!.length /
              (widget.product.columns! * row)) //widget.collectionGridData.rows!
          .toInt();
      i = widget.product.productList!.length % (widget.product.columns! * row);
      i != 0 ? k++ : k;
      print("k=$k ,i= $i,j= $j,${k + i + j}");
    } else {
      k = (widget.product.productList!.length / widget.product.rows!).toInt();

      i = widget.product.productList!.length % widget.product.rows!;
      i != 0 ? k++ : k;
      print("k=$k ,i= $i,j= $j,${k + i + j}");
    }
    List<ProductList> sliderI = widget.product.productList!.sublist(0, k);

    List<Widget> carouselItems = sliderI.map((item) {
      currentIndex = sliderI.indexOf(item);
      return widget.product.enableSlider!
          ? PopulorProductListView(widget.product, widget.OnClick)
          : widget.product.columns == 1
              ? ProductListView(widget.OnClick, widget.product, currentIndex)
              : PopularProductGridView(
                  widget.OnClick, widget.product, currentIndex);
    }).toList();

    return Column(
      children: [
        Container(
            // color: Colors.red,
            // margin: EdgeInsets.fromLTRB(
            //     DashboardFontSize.marginLeft,
            //     DashboardFontSize.marginTop,
            //     DashboardFontSize.marginRight,
            //     DashboardFontSize.marginBottom),
            // margin: EdgeInsets.only(left: 5, right: 5),
            // padding: EdgeInsets.only(left: 5, right: 5),
            child: CarouselSlider(
          items: carouselItems,
          carouselController: carouselController,
          options: CarouselOptions(
              enlargeCenterPage: false, //myBool,
              autoPlay: myBool,
              aspectRatio: widget.product.productList!.length == 0
                  ? 38.5
                  : getSliderAspectRatio(row, widget.product.columns!),
              autoPlayCurve: Curves.linear,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enableInfiniteScroll: false,
              viewportFraction:
                  1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
              // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        )),
        carouselItems.length > 1
            ? Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Container(
                  width: (carouselItems.length * 15),
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.primaryLightTextColor!.withAlpha(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselItems.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 7 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? indicatorSelectedColor
                                  : indicatorUnSelectedColor),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class PopulorProductListView extends StatelessWidget {
  Function(ProductList) OnClick;
  ProductGridData product;

  PopulorProductListView(this.product, this.OnClick);

  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final scale = mediaQueryData.textScaler.clamp(
    //   minScaleFactor: 0.80, // Minimum scale factor allowed.
    //   maxScaleFactor: 1.2, // Maximum scale factor allowed.
    // );
    List<ProductList> listItems = [];
    product.productList!.map((item) => {listItems.add(item)}).toList();

    return product.productList!.length == 0
        ? Container()
        : Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(
                left: DashboardFontSize.paddingLeft,
                right: DashboardFontSize.paddingRight
                // top: DashboardFontSize.customCollectionPadingtop
                ),
            // height: DashboardFontSize.imageHeightForProductCell(context) +
            //     MediaQuery.of(context).size.height * 0.08,
            height:
                DashboardFontSize.productGridHeightForDashboard(type: "List"),
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product.productList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // color: Colors.red,
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
                        OnClick(listItems[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            color: Utils.getColorFromHex(product.cellColor!)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      DashboardFontSize.customBorderRadius),
                                  color: Colors.white,
                                ),
                                height: DashboardFontSize
                                    .productGridHeightForDashboard(
                                        type: "Image"),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        DashboardFontSize.customBorderRadius),
                                    child: WidgetImage(
                                      listItems[index].imageSrc == null
                                          ? AppAssets.no_image
                                          : listItems[index].imageSrc!,
                                      fit: AppConfig.imageFit,
                                    )),
                              ),
                              Container(
                                height: 70,
                                // color: Utils.getColorFromHex(product.cellColor!),
                                child: Column(
                                  children: [
                                    Container(
                                      //color:  Colors.blue,//Utils.getColorFromHex(product.cellColor!),
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "${listItems[index].productTitle!}",
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Utils.getColorFromHex(
                                                  product.cellTextColor!),
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
                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    // StarWidget(
                                    //   (p0) {},
                                    //   true,
                                    //   12,
                                    //   initialCount: 4,
                                    // ),
                                    // ]),
                                    Container(
                                      //color:  Utils.getColorFromHex(product.cellColor!),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                listItems[index]
                                                            .discountedPrice ==
                                                        null
                                                    ? ""
                                                    : listItems[index]
                                                        .discountedPrice!
                                                        .formattedPrice,
                                                style: TextStyle(
                                                    // color: textColor,
                                                    fontSize: DashboardFontSize
                                                        .descFontSize,
                                                    color: AppTheme
                                                        .priceTagColor)),
                                          ),
                                          Container(
                                            //color: Colors.amber,
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 5),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                listItems[index].price == null
                                                    ? ""
                                                    : listItems[index]
                                                        .price!
                                                        .formattedPrice,
                                                style: TextStyle(
                                                    color: Utils
                                                        .getColorFromHex(product
                                                            .cellTextColor!),
                                                    fontSize: DashboardFontSize
                                                        .priceFontSize,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor: AppTheme
                                                        .priceTagColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                }));
  }
}

class ProductListViewStyleTwo extends StatelessWidget {
  final Function(ProductList) onClick;
  final ProductGridData product;

  ProductListViewStyleTwo(this.product, this.onClick);

  @override
  Widget build(BuildContext context) {
    return product.productList!.isEmpty
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            height: 280,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: product.productList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Utils.getColorFromHex(product.cellColor!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 165,
                  margin: EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      onClick(product.productList![index]);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: WidgetImage(
                                product.productList![index].imageSrc ??
                                    'assets/no_image.png',
                                fit: AppConfig.imageFit,
                                //width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            product.productList![index].productTitle.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: DashboardFontSize.subHeadingFontSize,
                              fontWeight: FontWeight.bold,
                              color:
                                  Utils.getColorFromHex(product.cellTextColor!),
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          padding:
                              EdgeInsets.only(left: 12, right: 12, bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (product.productList![index]
                                          .discountedPrice !=
                                      null)
                                    Row(
                                      children: [
                                        Text(
                                          product.productList![index].price
                                                  ?.formattedPrice ??
                                              '',
                                          style: TextStyle(
                                            fontSize:
                                                DashboardFontSize.descFontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Utils.getColorFromHex(
                                                product.cellTextColor!),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          product.productList![index]
                                              .discountedPrice!.formattedPrice,
                                          style: TextStyle(
                                            fontSize:
                                                DashboardFontSize.descFontSize,
                                            color: AppTheme.priceTagColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              CircleAvatar(
                                maxRadius: 15,
                                backgroundColor: Utils.getColorFromHex(
                                    product.buyNowBackgroundColor!),
                                child: IconButton(
                                  icon: Icon(
                                      size: 15,
                                      Icons.add,
                                      color: Utils.getColorFromHex(
                                          product.buyNowForegroundColor!)),
                                  onPressed: () {
                                    onClick(product.productList![index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class ProductListViewStyleOne extends StatelessWidget {
  Function(ProductList) OnClick;
  ProductGridData product;

  ProductListViewStyleOne(this.product, this.OnClick);

  @override
  Widget build(BuildContext context) {
    return product.productList!.length == 0
        ? Container()
        : Container(
            padding: EdgeInsets.only(
                left: DashboardFontSize.paddingLeft,
                right: DashboardFontSize.paddingRight,
                bottom: DashboardFontSize.paddingBottom
                // top: DashboardFontSize.customCollectionPadingtop
                ),
            // height: DashboardFontSize.imageHeightForProductCell(context) +
            //     MediaQuery.of(context).size.height * 0.08,
            height: 127,
            // DashboardFontSize.productGridHeightForDashboard(type: "List"),
            child: Container(
              // decoration: BoxDecoration(color: Colors.amber),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product.productList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Utils.getColorFromHex(product.cellColor!),
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(
                              DashboardFontSize.customBorderRadius)),
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.39,
                      //  Utils.isTablet(context)
                      //     ? MediaQuery.of(context).size.width * 0.26
                      //     : MediaQuery.of(context).size.width * 0.4,
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
                          OnClick(product.productList![index]);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // decoration: BoxDecoration(color: Colors.amber),
                                width: MediaQuery.of(context).size.width * 0.39,
                                height: 55,
                                // padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.productList![index].productTitle
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: DashboardFontSize
                                            .subHeadingFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: Utils.getColorFromHex(
                                            product.cellTextColor!),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.39,
                                height: 55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text(
                                        product.productList![index]
                                                    .discountedPrice ==
                                                null
                                            ? ""
                                            : product
                                                .productList![index]
                                                .discountedPrice!
                                                .formattedPrice,
                                        style: TextStyle(
                                          fontSize:
                                              DashboardFontSize.descFontSize,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      // SizedBox(height: 8),
                                      Text(
                                        product.productList![index].price ==
                                                null
                                            ? ""
                                            : product.productList![index].price!
                                                .formattedPrice,
                                        style: TextStyle(
                                          fontSize:
                                              DashboardFontSize.descFontSize,
                                          color: AppTheme.priceTagColor,
                                        ),
                                      ),
                                    ]),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        color:
                                            Color.fromARGB(255, 209, 217, 221),
                                        // padding: EdgeInsets.only(
                                        //   bottom:
                                        //       DashboardFontSize.paddingBottom,
                                        // ),
                                        height: 60,
                                        width: 60,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: WidgetImage(
                                            product.productList![index]
                                                        .imageSrc ==
                                                    null
                                                ? AppAssets.no_image
                                                : product.productList![index]
                                                    .imageSrc!,
                                            fit: AppConfig.imageFit,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ));
  }
}

class ProductListViewStyleThree extends StatelessWidget {
  Function(ProductList) OnClick;
  ProductGridData product;

  ProductListViewStyleThree(this.product, this.OnClick);

  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final scale = mediaQueryData.textScaler.clamp(
    //   minScaleFactor: 0.80, // Minimum scale factor allowed.
    //   maxScaleFactor: 1.2, // Maximum scale factor allowed.
    // );
    List<ProductList> listItems = [];
    product.productList!.map((item) => {listItems.add(item)}).toList();

    return product.productList!.length == 0
        ? Container()
        : Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(
                bottom: DashboardFontSize.paddingBottom,
                left: DashboardFontSize.paddingLeft,
                right: DashboardFontSize.paddingRight
                // top: DashboardFontSize.customCollectionPadingtop
                ),
            // height: DashboardFontSize.imageHeightForProductCell(context) +
            //     MediaQuery.of(context).size.height * 0.08,
            height: MediaQuery.of(context).size.height * 0.355,
            // DashboardFontSize.productGridHeightForDashboard(type: "List"),
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product.productList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // color: Colors.red,
                    width: Utils.isTablet(context)
                        ? MediaQuery.of(context).size.width * 0.26
                        : MediaQuery.of(context).size.width * 0.4,
                    margin: EdgeInsets.only(
                      right: 8,
                    ),
                    // decoration: BoxDecoration(
                    //     // color: viewBackgroundColor,
                    //     borderRadius: BorderRadius.circular(
                    //         DashboardFontSize.customBorderRadius),
                    //     border: Border.all(
                    //         width: 1,
                    //         color: AppTheme.borderColor!.withAlpha(40))),
                    // margin: EdgeInsets.all(5),
                    // height: MediaQuery.of(context).size.height,
                    child: InkWell(
                      onTap: () {
                        OnClick(listItems[index]);
                      },
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            color: Utils.getColorFromHex(product.cellColor!)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      DashboardFontSize.customBorderRadius),
                                  color:
                                      Utils.getColorFromHex(product.cellColor!),
                                ),
                                height: 250,
                                // DashboardFontSize
                                //     .productGridHeightForDashboard(
                                //         type: "Image"),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        DashboardFontSize.customBorderRadius),
                                    child: WidgetImage(
                                      listItems[index].imageSrc == null
                                          ? AppAssets.no_image
                                          : listItems[index].imageSrc!,
                                      fit: AppConfig.imageFit,
                                    )),
                              ),
                              Container(
                                // height: 80,
                                // color: Utils.getColorFromHex(product.cellColor!),
                                child: Column(
                                  children: [
                                    Container(
                                      //color:  Colors.blue,//Utils.getColorFromHex(product.cellColor!),
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      alignment: Alignment.center,
                                      child: Text(
                                          "${listItems[index].productTitle!}",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Utils.getColorFromHex(
                                                  product.cellTextColor!),
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
                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    // StarWidget(
                                    //   (p0) {},
                                    //   true,
                                    //   12,
                                    //   initialCount: 4,
                                    // ),
                                    // ]),
                                    Container(
                                      //color:  Utils.getColorFromHex(product.cellColor!),
                                      // height: 0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            alignment: Alignment.center,
                                            child: Text(
                                                listItems[index]
                                                            .discountedPrice ==
                                                        null
                                                    ? ""
                                                    : listItems[index]
                                                        .discountedPrice!
                                                        .formattedPrice,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    // color: textColor,
                                                    fontSize: DashboardFontSize
                                                        .descFontSize,
                                                    color: AppTheme
                                                        .priceTagColor)),
                                          ),
                                          listItems[index].price == null ||
                                                  listItems[index]
                                                      .price!
                                                      .formattedPrice
                                                      .isEmpty
                                              ? Container()
                                              : Container(
                                                  //color: Colors.amber,
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 5, 5),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      listItems[index].price ==
                                                              null
                                                          ? ""
                                                          : listItems[index]
                                                              .price!
                                                              .formattedPrice,
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          color: Utils
                                                              .getColorFromHex(
                                                                  product
                                                                      .cellTextColor!),
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
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                }));
  }
}

class PopularProductGridView extends StatefulWidget {
  Function(ProductList) OnClick;
  ProductGridData product;
  int currentIndex;

  PopularProductGridView(this.OnClick, this.product, this.currentIndex,
      {super.key});

  @override
  State<PopularProductGridView> createState() => _PopularProductGridViewState();
}

class _PopularProductGridViewState extends State<PopularProductGridView> {
  getGridAspectRatio(int row, int columns) {
    if (columns == 3 && row == 3) {
      if (DashboardFontSize.imagetype == "Square") {
        return 0.62;
      }
      print("image type ------->" + DashboardFontSize.imagetype);
      if (DashboardFontSize.imagetype == "Adapt To Image") {
        return 0.45;
      }
      return 0.52;
    } else if (columns == 3) {
      if (DashboardFontSize.imagetype == "Square") {
        return 0.63;
      }
      if (DashboardFontSize.imagetype == "Adapt To Image") {
        return 0.45;
      }
      return 0.52;
    } else if (row == 3) {
      if (DashboardFontSize.imagetype == "Square") {
        return 0.72;
      }
      if (DashboardFontSize.imagetype == "Adapt To Image") {
        return 0.55;
      }
      return 0.63;
    } else if (columns == 2 && row == 2) {
      if (DashboardFontSize.imagetype == "Square") {
        return 0.73;
      }
      if (DashboardFontSize.imagetype == "Adapt To Image") {
        return 0.55;
      }
      return 0.63;
    } else {
      return 0.54;
    }
  }

  getHeight(int row, int column) {
    // double h = 0;

    //row=3 & column=3
    if (row == 3 && column == 3) {
      if (widget.product.productList!.length <= 3) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.4;
        }
        return 0.4;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Square") {
          return 0.6;
        }
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.4;
        }
        return 0.71;
      } else if (widget.product.productList!.length <= 9) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.2;
        }
        return 0.94;
      } else {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.2;
        }
        return 0.94;
      }
    } else if (row == 3 && column == 2) {
      if (widget.product.productList!.length <= 2) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.45;
        }
        return 0.4;
      } else if (widget.product.productList!.length <= 4) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.45;
        }
        return 0.8;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.6;
        }
        return 1.2;
      } else {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 1.6;
        }
        return 1.2;
      }
    } else if (row == 2 && column == 3) {
      if (widget.product.productList!.length <= 3) {
        return 0.4;
      } else if (widget.product.productList!.length <= 6) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.85;
        }
        return 0.6;
      } else {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.85;
        }
        return 0.6;
      }
    } else if (row == 2 && column == 2) {
      if (widget.product.productList!.length <= 2) {
        return 0.8;
      } else if (widget.product.productList!.length <= 4) {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.88;
        }
        return 0.77;
      } else {
        if (DashboardFontSize.imagetype == "Adapt To Image") {
          return 0.88;
        }
        return 0.77;
      }
    } else if (row == 2 && column == 1) {
      if (widget.product.productList!.length <= 2) {
        return 0.9;
      } else if (widget.product.productList!.length <= 4) {
        return 0.77;
      } else {
        return 0.77;
      }
    } else {
      return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    int row = widget.product.rows!;
    List<ProductList> listItems = [];
    widget.product.productList!.map((item) => {listItems.add(item)}).toList();
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
          left: DashboardFontSize.paddingLeft,
          right: DashboardFontSize.paddingRight,
          top: DashboardFontSize.customCollectionPadingtop),
      // padding: EdgeInsets.only(left: DashboardFontSize.paddingLeft),

      // margin: widget.product.columns == 2 && row == 3
      //     ? EdgeInsets.only(left: 20, right: 20)
      //     : row == 3
      //         ? EdgeInsets.only(left: 10, right: 10)
      //         : EdgeInsets.only(),
      height: MediaQuery.of(context).size.height *
          getHeight(row, widget.product.columns!),
      // widget.product.columns == 3 && row == 3
      //     ? MediaQuery.of(context).size.height *
      //         getHeight(row, widget.product.columns!)
      //     : widget.product.columns == 3 && row == 2
      //         ? MediaQuery.of(context).size.height *
      //             getHeight(row, widget.product.columns!)
      //         : widget.product.columns == 2 && row == 3
      //             ? MediaQuery.of(context).size.height *
      //                 getHeight(row, widget.product.columns!)
      //             : widget.product.columns == 2 && row == 2
      //                 ? MediaQuery.of(context).size.height *
      //                     getHeight(row, widget.product.columns!)
      //                 : getHeight(row, widget.product.columns!),
      child: GridView.builder(
          shrinkWrap: true,

          // scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.product.columns!,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 3,
            // mainAxisExtent: 180,
            childAspectRatio: widget.product.productList!.length == 0
                ? 3
                : getGridAspectRatio(row, widget.product.columns!),
            // widget.product.columns == 3 && row == 3
            //     ? 0.5
            //     : widget.product.columns == 3
            //         ? 0.49
            //         : row == 3
            //             ? 0.63
            //             : widget.product.columns == 2 && row == 2
            //                 ? 0.57
            //                 : 0.54,
            // childAspectRatio: data.columns == 3
            //     ? 0.8
            //     : data.columns == 2
            //         ? 1
            //         : 1.5,
            // MediaQuery.of(context).size.width / data.columns!,
            // mainAxisExtent: MediaQuery.of(context).size.width / ,
          ),
          itemCount: widget.currentIndex == 0
              ? (widget.product.columns! * row) >
                      widget.product.productList!.length
                  ? widget.product.productList!.length
                  : (widget.product.columns! * row) //widget.product.rows!
              : widget.product.productList!.length -
                  (widget.product.columns! * row) * widget.currentIndex,
          //data.rows!
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext, index) {
            return InkWell(
              onTap: () {
                widget.OnClick(listItems[
                    (widget.product.columns! * row!) * widget.currentIndex +
                        index]);
              },
              child: Container(
                height: DashboardFontSize.imageHeightForProductCell(context),
                // +
                //     MediaQuery.of(context).size.height * 0.08,
                // width: 170,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),

                  // color: Colors.blue,
                ),
                // border:
                //     Border.all(width: 0.5, color: AppTheme.borderColor!)),
                // margin: EdgeInsets.all(5),
                // padding: EdgeInsets.all(5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        // margin: EdgeInsets.all(2),
                        // padding: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              DashboardFontSize.customBorderRadius),
                          color: Colors.white,
                        ),
                        height: DashboardFontSize.imageHeightForProductCell(
                            context,
                            row: widget.product.rows!,
                            colum: widget.product.columns!),
                        //      +
                        // MediaQuery.of(context).size.height * 0.08,
                        //  MediaQuery.of(context).size.height *
                        //     getImageHeight(row, widget.product.columns!),
                        //  widget.product.columns == 3 && row == 3
                        //     ? MediaQuery.of(context).size.height * 0.2
                        //     : widget.product.columns == 2 && row == 3
                        //         ? MediaQuery.of(context).size.height * 0.25
                        //         : widget.product.columns! * row == 4
                        //             ? MediaQuery.of(context).size.height * 0.27
                        //             : MediaQuery.of(context).size.height * 0.2,
                        // width: 120,
                        // decoration: BoxDecoration(
                        // color: imageBackgroundColor,

                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            child: WidgetImage(
                                listItems[(widget.product.columns! * row!) *
                                                    widget.currentIndex +
                                                index]
                                            .imageSrc !=
                                        null
                                    ? listItems[
                                            (widget.product.columns! * row!) *
                                                    widget.currentIndex +
                                                index]
                                        .imageSrc!
                                    : AppAssets.no_image,
                                fit: AppConfig.imageFit)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${listItems[(widget.product.columns! * row!) * widget.currentIndex + index].productTitle!}",
                          maxLines: 2,
                          style: TextStyle(
                              color: Utils.getColorFromHex(
                                  widget.product.cellTextColor!),
                              fontSize: DashboardFontSize.descFontSize),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       // StarWidget(
                      //       //   (p0) {},
                      //       //   true,
                      //       //   12,
                      //       //   initialCount: 4,
                      //       // ),
                      //     ]),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "${listItems[(widget.product.columns! * row!) * widget.currentIndex + index].discountedPrice == null ? "" : listItems[(widget.product.columns! * row!) * widget.currentIndex + index].discountedPrice!.formattedPrice}",
                                style: TextStyle(
                                    // color: textColor,
                                    fontSize: DashboardFontSize.descFontSize,
                                    color: AppTheme.priceTagColor)),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "${listItems[(widget.product.columns! * row!) * widget.currentIndex + index].price == null ? "" : listItems[(widget.product.columns! * row!) * widget.currentIndex + index].price!.formattedPrice}",
                                style: TextStyle(
                                    // color: textColor,
                                    fontSize: DashboardFontSize.priceFontSize,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppTheme.priceTagColor)),
                          ),
                        ],
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}

class ProductListView extends StatefulWidget {
  Function(ProductList) OnClick;
  ProductGridData productGridData;
  int currentIndex;

  ProductListView(this.OnClick, this.productGridData, this.currentIndex,
      {super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final scale = mediaQueryData.textScaler.clamp(
    //   minScaleFactor: 0.80, // Minimum scale factor allowed.
    //   maxScaleFactor: 1.2, // Maximum scale factor allowed.
    // );

    List<ProductList> listItem = [];
    widget.productGridData.productList!.map((e) => {listItem.add(e)}).toList();

    return Container(
      // padding: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        left: DashboardFontSize.paddingLeft,
        right: DashboardFontSize.paddingRight,
        // top: DashboardFontSize.customCollectionPadingtop
      ),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.currentIndex == 0 &&
                  widget.productGridData.productList!.length <
                      widget.productGridData.rows!
              ? widget.productGridData.productList!.length
              : widget.currentIndex == 0
                  ? widget.productGridData.rows //widget.product.rows!
                  : widget.productGridData.productList!.length -
                      widget.productGridData.rows! * widget.currentIndex,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 7),
              child: InkWell(
                onTap: () {
                  widget.OnClick(listItem[
                      widget.productGridData.rows! * widget.currentIndex +
                          index]);
                },
                child: Container(
                  // padding: EdgeInsets.all(5),
                  // margin: EdgeInsets.only(bottom: 7),
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: AppTheme.borderColor!),
                  //     borderRadius: BorderRadius.circular(
                  //         DashboardFontSize.customBorderRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 209, 217, 221),
                        // margin: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: DashboardFontSize.imageHeightForProductCell(
                            context,
                            colum: widget.productGridData.columns!),
                        // MediaQuery.of(context).size.width * 0.36,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            child: WidgetImage(
                                listItem[widget.productGridData.rows! *
                                                    widget.currentIndex +
                                                index]
                                            .imageSrc !=
                                        null
                                    ? listItem[widget.productGridData.rows! *
                                                widget.currentIndex +
                                            index]
                                        .imageSrc!
                                    : AppAssets.no_image,
                                fit: AppConfig.imageFit)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              listItem[widget.productGridData.rows! *
                                          widget.currentIndex +
                                      index]
                                  .productTitle
                                  .toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  // color: textColor,
                                  fontSize: DashboardFontSize.descFontSize),
                              overflow: TextOverflow.ellipsis,
                            ),

                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       // StarWidget(
                            //       //   (p0) {},
                            //       //   true,
                            //       //   12,
                            //       //   initialCount: 4,
                            //       // ),
                            //     ]),
                            Row(
                              children: [
                                Container(
                                  // padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${listItem[widget.productGridData.rows! * widget.currentIndex + index].discountedPrice == null ? "" : listItem[widget.productGridData.rows! * widget.currentIndex + index].discountedPrice!.formattedPrice}",
                                      style: TextStyle(
                                          // color: textColor,
                                          fontSize:
                                              DashboardFontSize.descFontSize,
                                          color: AppTheme.priceTagColor)),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${listItem[widget.productGridData.rows! * widget.currentIndex + index].price == null ? "" : listItem[widget.productGridData.rows! * widget.currentIndex + index].price!.formattedPrice}",
                                      style: TextStyle(
                                          // color: textColor,
                                          fontSize:
                                              DashboardFontSize.priceFontSize,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor:
                                              AppTheme.priceTagColor)),
                                ),
                              ],
                            ),
                            // Text(
                            //   listItem[3 * widget.currentIndex + index].price ==
                            //           null
                            //       ? ""
                            //       : listItem[3 * widget.currentIndex + index]
                            //           .price!
                            //           .amount
                            //           .toString(),
                            //   maxLines: 2,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(color: AppTheme.priceTagColor),
                            // ),
                            // Text(ProductData[index].price.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
