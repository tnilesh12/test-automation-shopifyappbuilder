import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetCollectionView extends StatefulWidget {
  CollectionGridData collectionGridData;
  Function(CollectionList) onClickItem;
  ItgeekWidgetCollectionView(this.collectionGridData, this.onClickItem);
  @override
  _ItgeekWidgetCollectionViewState createState() =>
      _ItgeekWidgetCollectionViewState();
}

class _ItgeekWidgetCollectionViewState
    extends State<ItgeekWidgetCollectionView> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    widget.collectionGridData.buttonRadius != null
        ? print(
            "------------------>>>>>>>>>>>>${widget.collectionGridData.buttonRadius!.toDouble()}")
        : "";
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.collectionGridData.marginLeftRight != null
              ? widget.collectionGridData.marginLeftRight!.toDouble()
              : 0,
          vertical: widget.collectionGridData.marginTopBottom != null
              ? widget.collectionGridData.marginTopBottom!.toDouble()
              : 0),
      child: Container(
        decoration: BoxDecoration(
            color: Utils.getColorFromHex(
                widget.collectionGridData.containerColor.toString()),
            borderRadius: BorderRadius.circular(
                widget.collectionGridData.blockRadius != null
                    ? widget.collectionGridData.blockRadius!.toDouble()
                    : 0)),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                // margin: EdgeInsets.fromLTRB(
                //     DashboardFontSize.marginLeft,
                //     DashboardFontSize.marginTop,
                //     DashboardFontSize.marginRight,
                //     DashboardFontSize.marginBottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.collectionGridData.heading! != "" &&
                            widget.collectionGridData.style != "Style_7"
                        ? Flexible(
                            flex: 3,
                            fit: FlexFit.loose,
                            child: Container(
                              padding: EdgeInsets.only(
                                // left: DashboardFontSize.paddingLeft,
                                right: DashboardFontSize.paddingRight,
                                top: DashboardFontSize.paddingTop,
                                bottom: DashboardFontSize.paddingBottom,
                              ),
                              child: Text(
                                widget.collectionGridData.heading!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          DashboardFontSize.headingFontSize,
                                      color: Utils.getColorFromHex(
                                          widget.collectionGridData.textColor!),
                                    ),
                              ),
                            ),
                          )
                        : Container(),
                    widget.collectionGridData.viewAll!
                        ? Flexible(
                            // flex: 1,
                            // fit: FlexFit.loose,
                            child: InkWell(
                              onTap: () {
                                context.push("/${Routes.collectionViewAll}",
                                    extra: widget.collectionGridData);
                                // CollectionViewAll(widget.collectionGridData);
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: DashboardFontSize.descFontSize,
                                  color: widget.collectionGridData.textColor ==
                                          null
                                      ? AppTheme.primaryDarkTextColor
                                      : Utils.getColorFromHex(
                                          widget.collectionGridData.textColor!),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Container(
                child: Container(
                  
                    child: widget.collectionGridData.enableSlider!
                        ? widget.collectionGridData.style == "default"
                            ? ListViewWidget(
                                widget.collectionGridData, widget.onClickItem)
                            : widget.collectionGridData.style == "Style_1"
                                ? ListViewWidgetStyleOne(
                                    widget.collectionGridData,
                                    widget.onClickItem)
                                : widget.collectionGridData.style == "Style_2"
                                    ? ListViewWidgetStyleTwo(
                                        widget.collectionGridData,
                                        widget.onClickItem)
                                    : widget.collectionGridData.style ==
                                            "Style_3"
                                        ? ListViewWidgetStyleThree(
                                            widget.collectionGridData,
                                            widget.onClickItem)
                                        : widget.collectionGridData.style ==
                                                "Style_4"
                                            ? ListViewWidgetStyleFour(
                                                widget.collectionGridData,
                                                widget.onClickItem)
                                            : widget.collectionGridData.style ==
                                                    "Style_5"
                                                ? ListViewWidgetStyleFive(
                                                    widget.collectionGridData,
                                                    widget.onClickItem)
                                                : widget.collectionGridData
                                                            .style ==
                                                        "Style_6"
                                                    ? ListViewWidgetStyleSix(
                                                        widget
                                                            .collectionGridData,
                                                        widget.onClickItem)
                                                    : widget.collectionGridData
                                                                .style ==
                                                            "Style_7"
                                                        ? ListViewWidgetStyleSeven(
                                                            widget
                                                                .collectionGridData,
                                                            widget.onClickItem)
                                                        : widget.collectionGridData
                                                                    .style ==
                                                                "Style_8"
                                                            ? ListViewWidgetStyleEight(
                                                                widget
                                                                    .collectionGridData,
                                                                widget
                                                                    .onClickItem)
                                                            : widget.collectionGridData
                                                                        .style ==
                                                                    "Style_9"
                                                                ? ListViewWidgetStyleNine(
                                                                    widget
                                                                        .collectionGridData,
                                                                    widget
                                                                        .onClickItem)
                                                                : Container()
                        : WidgetSlider(widget.collectionGridData,
                            widget.onClickItem) //rows, columns, totalItems)
                    ),
              )
            ]),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;
  ListViewWidget(this.data, this.onClickEvent);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.17,
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.collectionList!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  onClickEvent.call(data.collectionList![index]);
                },
                child: Container(
                  margin: const EdgeInsets.all(DashboardFontSize.marginRight),
                  width: MediaQuery.of(context).size.width * 0.20,
                  // width: 70,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //         )),
                  padding: EdgeInsets.only(
                      left: DashboardFontSize.paddingLeft,
                      right: DashboardFontSize.paddingRight),
                  // padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            color: AppTheme.white, shape: BoxShape.circle),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(
                          //     MediaQuery.of(context).size.width * .18),
                          //  borderRadius: BorderRadius.circular(
                          //     10),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .18),
                          child: WidgetImage(
                            data.collectionList![index].imageSrc.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      data.collectionList![index].productTitle!.length > 0
                          ? Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  // "Ready Golf Putter Covers Ready Golf Putter Covers"
                                  data.collectionList![index].productTitle
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: DashboardFontSize.descFontSize,
                                    color: data.textColor == null
                                        ? AppTheme.primaryDarkTextColor
                                        : Utils.getColorFromHex(
                                            data.textColor!),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            })));
  }
}

class ListViewWidgetStyleOne extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;
  ListViewWidgetStyleOne(this.data, this.onClickEvent);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        // padding: EdgeInsets.fromLTRB(
        //     0, // DashboardFontSize.paddingLeft,
        //     DashboardFontSize.paddingTop,
        //     0, //DashboardFontSize.paddingRight,
        //     DashboardFontSize.paddingBottom),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.collectionList!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  onClickEvent.call(data.collectionList![index]);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.only(
                    left: DashboardFontSize.paddingLeft,
                    // right: DashboardFontSize.paddingRight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: EdgeInsets.fromLTRB(
                            DashboardFontSize.paddingLeft,
                            DashboardFontSize.paddingTop,
                            DashboardFontSize.paddingRight,
                            DashboardFontSize.paddingBottom),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .18),
                          color: data.cellColor == null
                              ? AppTheme.primaryDarkBackgroundColor
                              : Utils.getColorFromHex(data.cellColor!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.10,
                              height: MediaQuery.of(context).size.width * 0.10,
                              decoration: BoxDecoration(
                                  color: Utils.getColorFromHex(data.cellColor!),
                                  shape: BoxShape.circle),
                              child: ClipOval(
                                child: WidgetImage(
                                    data.collectionList![index].imageSrc
                                        .toString(),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            data.collectionList![index].productTitle!.isNotEmpty
                                ? Expanded(
                                    child: Text(
                                      data.collectionList![index].productTitle
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            DashboardFontSize.descFontSize,
                                        color: data.cellTextColor == null
                                            ? AppTheme.primaryDarkTextColor
                                            : Utils.getColorFromHex(
                                                data.cellTextColor!),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}

class ListViewWidgetStyleTwo extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;

  ListViewWidgetStyleTwo(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.collectionList!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onClickEvent.call(data.collectionList![index]);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              margin: EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Utils.getColorFromHex(data.containerColor!),
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      child: WidgetImage(
                        data.collectionList![index].imageSrc.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.0),
                  data.collectionList![index].productTitle!.isNotEmpty
                      ? Expanded(
                          child: Text(
                            data.collectionList![index].productTitle.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: DashboardFontSize.descFontSize,
                              color: data.cellTextColor == null
                                  ? AppTheme.primaryDarkTextColor
                                  : Utils.getColorFromHex(data.cellTextColor!),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewWidgetStyleThree extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;
  ListViewWidgetStyleThree(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.builder(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two rows
            mainAxisSpacing: 5, // Space between the main axis items
            crossAxisSpacing: 5.0, // Space between the cross axis items
            childAspectRatio: 1.3, // Aspect ratio for the items
          ),
          itemCount: data.collectionList!.length, // Number of items in the list
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onClickEvent.call(data.collectionList![index]);
              },
              child: Column(
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 209, 217, 221),
                      border: Border.all(color: Colors.black, width: 0.01),
                      borderRadius: BorderRadius.all(Radius.circular(
                          DashboardFontSize.customBorderRadius)),
                    ),
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: WidgetImage(
                          data.collectionList![index].imageSrc.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (data.collectionList![index].productTitle!.isNotEmpty)
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: DashboardFontSize.paddingLeft),
                    //   child: Expanded(
                    //     child: Text(
                    //       data.collectionList![index].productTitle.toString(),
                    //       maxLines: 2,
                    //       overflow: TextOverflow.ellipsis,
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontSize: DashboardFontSize.descFontSize,
                    //       ),
                    //     ),
                    //   ),
                    // )
                    Container(
                      child: Text(
                        data.collectionList![index].productTitle.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DashboardFontSize.descFontSize,
                          color: data.cellTextColor == null
                              ? AppTheme.primaryDarkTextColor
                              : Utils.getColorFromHex(data.textColor!),
                        ),
                      ),
                    )
                  else
                    Container(),
                ],
              ),
            );
          },
        ));
  }
}

class ListViewWidgetStyleSeven extends StatelessWidget {
  final CollectionGridData data;
  final Function(CollectionList) onClickEvent;

  ListViewWidgetStyleSeven(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.containerColor == null
          ? Colors.white
          : Utils.getColorFromHex(data.containerColor!),
      padding: EdgeInsets.all(16.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 100,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3!),
        itemCount: data.collectionList!.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 1)
            return Container(
              // decoration: BoxDecoration(
              //   color: data.cellColor == null
              //       ? Colors.white
              //       : Utils.getColorFromHex(data.cellColor!),
              //  // borderRadius: BorderRadius.circular(12),
              // ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Utils.getColorFromHex(data.containerColor!),
                ), // borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  data.heading!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: DashboardFontSize.subHeadingFontSize,
                    color: Utils.getColorFromHex(data.textColor!),
                  ),
                ),
              ),
            );

          if (index > 1) index -= 1;
          return InkWell(
            onTap: () {
              onClickEvent.call(data.collectionList![index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: data.cellColor == null
                    ? Colors.white
                    : Utils.getColorFromHex(data.cellColor!),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: WidgetImage(
                          data.collectionList![index].imageSrc.toString(),
                          fit: AppConfig.imageFit,
                        ),
                      )),
                  Align(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        data.collectionList![index].productTitle.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DashboardFontSize.priceFontSize,
                          color: Utils.getColorFromHex(data.cellTextColor!),
                        ),
                      ),
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

class ListViewWidgetStyleFive extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;

  ListViewWidgetStyleFive(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.containerColor == Null
          ? AppTheme.primaryLightBackgroundColor
          : Utils.getColorFromHex(data.containerColor!),
      height: MediaQuery.of(context).size.height * 0.408,
      padding: EdgeInsets.all(DashboardFontSize.paddingRight),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.collectionList!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onClickEvent.call(data.collectionList![index]);
            },
            child: Container(
              // height: 350,
              margin: EdgeInsets.fromLTRB(2, 10, 2, 10),
              color: data.cellColor == Null
                  ? AppTheme.primaryLightBackgroundColor
                  : Utils.getColorFromHex(data.cellColor!),
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.all(
                  DashboardFontSize.paddingRight), // Adjusted padding here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.24,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 217, 221),
                        borderRadius: BorderRadius.circular(
                            DashboardFontSize.customBorderRadius)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      child: WidgetImage(
                        data.collectionList![index].imageSrc.toString(),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  //Text(data.collectionList!.length.toString() + " " + "items"),
                  data.collectionList![index].productTitle!.isNotEmpty
                      ? Container(
                          child: Text(
                            data.collectionList![index].productTitle
                                .toString()
                                .toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: DashboardFontSize.descFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 8.0),
                  Container(
                    color: Colors.green.shade300,
                    height: 25,
                    width: 25, //MediaQuery.of(context).size.width * 0.058,
                    child: SvgPicture.asset("assets/images/arrow-up-right.svg",
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryLightTextColor!, BlendMode.srcIn)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewWidgetStyleFour extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;

  ListViewWidgetStyleFour(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.containerColor == Null
          ? AppTheme.primaryLightBackgroundColor
          : Utils.getColorFromHex(data.containerColor!),
      height: MediaQuery.of(context).size.height * 0.23,
      // padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.collectionList!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onClickEvent.call(data.collectionList![index]);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  DashboardFontSize.marginLeft,
                  DashboardFontSize.marginTop,
                  DashboardFontSize.marginRight,
                  DashboardFontSize.marginBottom),
              width: MediaQuery.of(context).size.width * 0.275,
              decoration: BoxDecoration(
                  color: data.cellColor == null
                      ? AppTheme.primaryDarkBackgroundColor
                      : Utils.getColorFromHex(data.cellColor!),
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 217, 221),
                        border: Border.all(color: Colors.black, width: 0.01),
                        borderRadius: BorderRadius.circular(
                            DashboardFontSize.customBorderRadius)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      child: WidgetImage(
                          data.collectionList![index].imageSrc.toString()),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  if (data.collectionList![index].productTitle!.isNotEmpty)
                    Container(
                      child: Text(
                        data.collectionList![index].productTitle.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DashboardFontSize.descFontSize,
                          color: data.cellTextColor == null
                              ? AppTheme.primaryDarkTextColor
                              : Utils.getColorFromHex(data.cellTextColor!),
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewWidgetStyleSix extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;
  ListViewWidgetStyleSix(this.data, this.onClickEvent);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        // padding: EdgeInsets.fromLTRB(
        //     0, // DashboardFontSize.paddingLeft,
        //     DashboardFontSize.paddingTop,
        //     0, //DashboardFontSize.paddingRight,
        //     DashboardFontSize.paddingBottom),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.collectionList!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  onClickEvent.call(data.collectionList![index]);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.only(
                    left: DashboardFontSize.paddingLeft,
                    // right: DashboardFontSize.paddingRight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: EdgeInsets.fromLTRB(
                            DashboardFontSize.paddingLeft,
                            DashboardFontSize.paddingTop,
                            DashboardFontSize.paddingRight,
                            DashboardFontSize.paddingBottom),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: data.cellColor == null
                              ? AppTheme.primaryDarkBackgroundColor
                              : Utils.getColorFromHex(data.cellColor!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            data.collectionList![index].productTitle!.isNotEmpty
                                ? Expanded(
                                    child: Text(
                                      data.collectionList![index].productTitle
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            DashboardFontSize.descFontSize,
                                        color: data.cellTextColor == null
                                            ? AppTheme.primaryDarkTextColor
                                            : Utils.getColorFromHex(
                                                data.cellTextColor!),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.10,
                              height: MediaQuery.of(context).size.width * 0.10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Utils.getColorFromHex(data.cellColor!),
                                // shape: BoxShape.rectangle
                              ),
                              child: WidgetImage(
                                  data.collectionList![index].imageSrc
                                      .toString(),
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}

class WidgetSlider extends StatefulWidget {
  CollectionGridData collectionGridData;
  Function(CollectionList) onClickItem;
  WidgetSlider(this.collectionGridData, this.onClickItem, {super.key});

  @override
  State<WidgetSlider> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider> {
  getSliderAspectRatio(int row, int column) {
    // double ar;

    //row=3 & column=3
    if (widget.collectionGridData.columns == 3 &&
        widget.collectionGridData.rows == 3) {
      if (widget.collectionGridData.collectionList!.length <= 3) {
        return 2.2;
      } else if (widget.collectionGridData.collectionList!.length <= 6) {
        return 1.1;
      } else if (widget.collectionGridData.collectionList!.length <= 9) {
        return 0.73;
      } else {
        return 0.73;
      }
    } else if (widget.collectionGridData.columns == 2 &&
        widget.collectionGridData.rows == 3) {
      if (widget.collectionGridData.collectionList!.length <= 2) {
        return 1.9;
      } else if (widget.collectionGridData.collectionList!.length <= 4) {
        return 0.94;
      } else if (widget.collectionGridData.collectionList!.length <= 6) {
        return 0.6;
      } else {
        return 0.6;
      }
    }
    //else if (row == 3 && column == 1) {
    //   if (widget.product.productList!.length <= 1) {
    //     return 2.6;
    //   } else if (widget.product.productList!.length <= 2) {
    //     return 1.32;
    //   } else if (widget.product.productList!.length <= 3) {
    //     return 0.87;
    //   } else {
    //     return 0.87;
    //   }
    // }
    if (widget.collectionGridData.columns == 3 &&
        widget.collectionGridData.rows == 2) {
      if (widget.collectionGridData.collectionList!.length <= 3) {
        return 2.1;
      } else if (widget.collectionGridData.collectionList!.length <= 6) {
        return 1.1;
      } else {
        return 1.1;
      }
    } else if (widget.collectionGridData.columns == 2 &&
        widget.collectionGridData.rows == 2) {
      if (widget.collectionGridData.collectionList!.length <= 2) {
        return 1.9;
      } else if (widget.collectionGridData.collectionList!.length <= 4) {
        return 0.94;
      } else {
        return 0.94;
      }
    }
    //else if (row == 2 && column == 1) {
    //   if (widget.product.productList!.length <= 1) {
    //     return 2.6;
    //   } else if (widget.product.productList!.length <= 2) {
    //     return 1.29;
    //     // } else if (widget.product.productList!.length <= 3) {
    //     //   return   0.89;
    //     // }
    //   } else {
    //     return 1.29;
    //   }
    // }
    else if (widget.collectionGridData.rows == 3 &&
        widget.collectionGridData.columns == 4) {}
    {
      return 0.6;
    }
  }

  CarouselSliderController carouselController = CarouselSliderController();
  int i = 0, j = 0, k = 0, currentIndex = 0, currentIndicatorIndex = 0;
  Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
  Color indicatorUnSelectedColor =
      AppTheme.primaryLightTextColor!.withAlpha(80);

  @override
  Widget build(BuildContext context) {
    var myBool = false;
    k = (widget.collectionGridData.collectionList!.length /
            (widget.collectionGridData.columns! *
                widget.collectionGridData.rows!))
        .toInt();
    i = widget.collectionGridData.collectionList!.length %
        (widget.collectionGridData.columns! * widget.collectionGridData.rows!);
    j = i != 0 ? k++ : k;
    print("k=$k ,i= $i,j= $j,${k + i + j}");
    List<CollectionList> sliderI =
        widget.collectionGridData.collectionList!.sublist(0, k);

    List<Widget> carouselItems = sliderI.map((item) {
      currentIndex = sliderI.indexOf(item);
      return GridViewWidget(
          widget.collectionGridData, currentIndex, widget.onClickItem);
    }).toList();

    return Column(
      children: [
        Container(
            // alignment: Alignment,
            child: CarouselSlider(
          items: carouselItems,
          carouselController: carouselController,
          options: CarouselOptions(
              enlargeCenterPage: false, //myBool,
              autoPlay: myBool,
              aspectRatio: getSliderAspectRatio(widget.collectionGridData.rows!,
                  widget.collectionGridData.columns!),
              autoPlayCurve: Curves.linear,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enableInfiniteScroll: false,
              viewportFraction:
                  1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
              // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndicatorIndex = index;
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
                          width: currentIndicatorIndex == entry.key ? 7 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndicatorIndex == entry.key
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

class GridViewWidget extends StatelessWidget {
  CollectionGridData data;
  int currentIndex;
  Function(CollectionList) onClickItem;
  GridViewWidget(this.data, this.currentIndex, this.onClickItem);
  getImageHeight(int row, int column) {
    if (data.columns == 3 && data.rows == 3) {
      return 0.14;
    } else if (data.columns == 2 && data.rows == 2) {
      return 0.18;
    } else if (data.columns == 3 && data.rows == 2) {
      return 0.14;
    } else if (data.columns == 4 && data.rows == 2) {
      return 0.1;
    } else if (data.columns == 4 && data.rows == 3) {
      return 0.1;
    } else {
      return 0.18;
    }
  }

  getImageWidth(int row, int column) {
    if (data.columns == 3 && data.rows == 3) {
      return 0.14;
    } else if (data.columns == 2 && data.rows == 2) {
      return 0.18;
    } else if (data.columns == 3 && data.rows == 2) {
      return 0.14;
    } else if (data.columns == 4 && data.rows == 2) {
      return 0.1;
    } else if (data.columns == 4 && data.rows == 3) {
      return 0.1;
    } else {
      return 0.18;
    }
  }

  getGridAspectRatio(int row, int column) {
    if (data.columns == 2 && data.rows == 3) {
      return 0.92;
    } else if (data.columns == 4 && data.rows == 3) {
      return 0.62;
    } else if (data.columns == 3 && data.rows == 3) {
      return 0.7;
    } else if (data.rows == 2 && data.columns == 3) {
      return 0.7;
    } else if (data.columns == 3) {
      return 2;
    } else if (data.columns == 2 && data.rows == 2) {
      return 0.9;
    } else if (data.columns == 4 && data.rows == 2) {
      return 0.6;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(10),
          // color: Colors.amber,
          // margin: EdgeInsets.only(top: 50, bottom: 50),
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            shrinkWrap: true,

            // scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: data.columns!,
              mainAxisSpacing:
                  10, // data.columns == 3 && data.rows == 3 ? 16.0 : 6,
              crossAxisSpacing: 10.0,
              // mainAxisExtent: ,
              childAspectRatio: getGridAspectRatio(data.rows!, data.columns!),
              // (data.columns == 2 &&
              //         data.rows == 3)
              //     ? 0.92
              //     : data.columns == 4 && data.rows == 3
              //         ? 0.62
              //         : (data.columns == 3 && data.rows == 3)
              //             ? 0.7 //1.3
              //             : //(data.columns! * data.rows!) == 6 &&
              //             (data.rows == 2 &&
              //                     data.columns == 3)
              //                 ? 0.7
              //                 : data.columns == 3
              //                     ? 2
              //                     : data.columns == 2 && data.rows ==2
              //                         ? 0.9
              //                         : data.columns == 4 && data.rows == 2
              //                             ? 0.6
              //                             : 1,
              // 2,
              // childAspectRatio: data.columns == 3
              //     ? 0.8
              //     : data.columns == 2
              //         ? 1
              //         : 1.5,
              // MediaQuery.of(context).size.width / data.columns!,
              // mainAxisExtent: MediaQuery.of(context).size.width / ,
            ),
            itemCount: currentIndex == 0
                ? (data.columns! * data.rows!) > data.collectionList!.length
                    ? data.collectionList!.length
                    : (data.columns! * data.rows!)
                : data.collectionList!.length -
                    (data.columns! * data.rows!) * currentIndex,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext, index) {
              print("-----------collection grid currendIndex $currentIndex");
              return InkWell(
                onTap: () {
                  onClickItem.call(data.collectionList![
                      (data.columns! * data.rows!) * currentIndex + index]);
                },
                child: Container(
                  // color: Colors.blue,
                  // height: MediaQuery.of(context).size.height * 0.45,
                  // height: MediaQuery.of(context).size.height * 3,
                  // width: 70,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //         width: 0.5, color: AppTheme.borderColor! //.lightBorder
                  //         )),
                  // margin:
                  // data.columns == 1
                  //     ? EdgeInsets.only(left: 108, right: 108, top: 10, bottom: 10)
                  //     :
                  // (data.columns! * data.rows!) == 4 && data.columns == 2
                  //     ? EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5)
                  //     :
                  // (data.columns! * data.rows!) == 6 && data.rows == 3
                  //     ? EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 5)
                  //     : data.rows == 3
                  //         ? EdgeInsets.only(
                  //             left: 25, right: 25, top: 5, bottom: 5)
                  //         : data.columns == 3
                  //             ? EdgeInsets.only(
                  //                 left: 12, right: 12, top: 5, bottom: 5)
                  //             : EdgeInsets.only(
                  //                 left: 12, right: 12, top: 16, bottom: 5),
                  // padding:
                  //     //  data.columns == 2||data.rows == 2  ? EdgeInsets.only(left: 15,right: 15):
                  //     EdgeInsets.only(left: 10, right: 10),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *
                            getImageHeight(data.rows!, data.columns!),
                        // data.columns == 3 && data.rows == 3
                        //     ? MediaQuery.of(context).size.height * 0.14
                        //     : data.columns == 2 && data.rows == 2
                        //         ? MediaQuery.of(context).size.height * 0.18
                        //         : data.columns == 3 && data.rows == 2
                        //             ? MediaQuery.of(context).size.height * 0.14
                        //             : data.columns == 4 && data.rows == 2
                        //                 ? MediaQuery.of(context).size.height *
                        //                     0.1
                        //                 : data.columns == 4 && data.rows == 3
                        //                     ? MediaQuery.of(context)
                        //                             .size
                        //                             .height *
                        //                         0.1
                        //                     : MediaQuery.of(context)
                        //                             .size
                        //                             .height *
                        //                         0.18,
                        width: MediaQuery.of(context).size.height *
                            getImageWidth(data.rows!, data.columns!),
                        //  data.columns == 3 && data.rows == 3
                        //     ? MediaQuery.of(context).size.height * 0.14
                        //     : data.columns == 2 && data.rows == 2
                        //         ? MediaQuery.of(context).size.height * 0.18
                        //         : data.columns == 3 && data.rows == 2
                        //             ? MediaQuery.of(context).size.height * 0.14
                        //             : data.columns == 4 && data.rows == 2
                        //                 ? MediaQuery.of(context).size.height *
                        //                     0.1
                        //                 : MediaQuery.of(context).size.height *
                        //                     0.18,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: WidgetImage(data
                                .collectionList![(data.columns! * data.rows!) *
                                        currentIndex +
                                    index]
                                .imageSrc
                                .toString()),
                          ),
                        ),
                      ),
                      data.collectionList![index].productTitle!.length > 0
                          ? Expanded(
                              child: Text(
                                  data
                                      .collectionList![
                                          (data.columns! * data.rows!) *
                                                  currentIndex +
                                              index]
                                      .productTitle
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        Utils.getColorFromHex(data.textColor!),
                                    fontSize: DashboardFontSize.descFontSize,
                                  )),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

class ListViewWidgetStyleEight extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;
  ListViewWidgetStyleEight(this.data, this.onClickEvent);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        // padding: EdgeInsets.fromLTRB(
        //     0, // DashboardFontSize.paddingLeft,
        //     DashboardFontSize.paddingTop,
        //     0, //DashboardFontSize.paddingRight,
        //     DashboardFontSize.paddingBottom),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.collectionList!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  onClickEvent.call(data.collectionList![index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.only(
                    left: DashboardFontSize.paddingLeft,
                    // right: DashboardFontSize.paddingRight,
                  ),
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      ),
                  child: Text(
                    data.collectionList![index].productTitle.toString(),
                    style: TextStyle(
                        fontSize: DashboardFontSize.subHeadingFontSize),
                  ),
                ),
              );
            })));
  }
}

class ListViewWidgetStyleNine extends StatelessWidget {
  CollectionGridData data;
  Function(CollectionList) onClickEvent;

  ListViewWidgetStyleNine(this.data, this.onClickEvent);

  @override
  Widget build(BuildContext context) {
    // int digit = (data.collectionList!.length / 2).toInt();
    return Container(
      color: data.containerColor == null
          ? Colors.white
          : Utils.getColorFromHex(data.containerColor!),
      padding: EdgeInsets.only(bottom: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 350,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemCount: data.collectionList!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onClickEvent.call(data.collectionList![index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: data.cellColor == null
                    ? Colors.white
                    : Utils.getColorFromHex(data.cellColor!),
                // borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.2),
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //   ),
                // ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                      // borderRadius: BorderRadius.circular(12),
                      child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: WidgetImage(
                      data.collectionList![index].imageSrc.toString(),
                      fit: AppConfig.imageFit,
                    ),
                  )),
                  Positioned(
                    top: 0,
                    bottom: 175,
                    left: 0,
                    right: 0,
                    child: Container(
                      // height: 20,
                      // width: (data.collectionList![index].productTitle.toString().length)*1 ,
                      alignment: Alignment.bottomCenter,
                      // padding: EdgeInsets.all(8.0),

                      child: Text(
                        data.collectionList![index].productTitle.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: DashboardFontSize.descFontSize,
                            color: Utils.getColorFromHex(data.cellTextColor!),
                            backgroundColor: Colors.black),
                      ),
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
