import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:shopify_code/modelClass/data_model.dart';

class ItgeekWidgetImageGridView extends StatelessWidget {
  ImageGridData imageGridData;
  Function(ImageGridItem) onClick;
  ItgeekWidgetImageGridView(this.imageGridData, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: imageGridData.marginTopBottom != null
              ? imageGridData.marginTopBottom!.toDouble()
              : 0,
          horizontal: imageGridData.marginLeftRight != null
              ? imageGridData.marginLeftRight!.toDouble()
              : 0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(imageGridData.borderRadius != null
              ? imageGridData.borderRadius!.toDouble()
              : 0),
          child: (imageGridData.enableSlider!)
              ? imageGridData.style == "Style_1"
                  ? ImageGridListView(context)
                  : imageGridData.style == "Style_2"
                      ? ImageGridcustomView(context, imageGridData)
                      : imageGridData.style == "Style_3"
                          ? ImageGridWithTextStyleThree(context)
                          : imageGridData.style == "Style_4"
                              ? ImageGridWithTextStyleFour(context)
                              : ImageListView(context)
              : ImageGridView(context)),
    );
  }

  Widget ImageGridWithTextStyleThree(BuildContext context) {
    // Determine the number of items to show
    int length = imageGridData.imageGridList!.length;
    //  (imageGridData.imageGridList!.length > imageGridData.showItems!
    //     ? imageGridData.showItems!
    //     : imageGridData.imageGridList!.length);

    // Ensure we have at most 2 rows of items
    int Index = 0;

    return Container(
      padding: EdgeInsets.all(imageGridData.containerPadding != null
          ? imageGridData.containerPadding!.toDouble()
          : 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                imageGridData.containerRadius != null
                    ? imageGridData.containerRadius!.toDouble()
                    : 0),
            color: Utils.getColorFromHex(imageGridData.containerColor!)),
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          children: [
            imageGridData.heading != ""
                ? Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(imageGridData.heading!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: DashboardFontSize.headingFontSize,
                              color: Utils.getColorFromHex(
                                  imageGridData.textColor!),
                            )),
                  )
                : Container(),
            Container(
              height: MediaQuery.of(context).size.width / 1.5,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                // physics: NeverScrollableScrollPhysics(),
                itemCount: imageGridData.imageGridList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MediaQuery.of(context).size.width / 3,
                    crossAxisCount: 2, // Two rows
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4),
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ImageGridStyleThreeItemView(
                        context, imageGridData.imageGridList, index,
                        (imageGridItem) {
                      onClick.call(imageGridItem);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ImageGridStyleThreeItemView(
    BuildContext context,
    List<ImageGridItem>? imageGridItem,
    int index,
    Function(ImageGridItem)? onClick,
  ) {
    return InkWell(
        onTap: () => onClick!.call(imageGridItem![index]),
        child: Container(
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(DashboardFontSize.customBorderRadius),
            color: imageGridData.cellColor != null
                ? Utils.getColorFromHex(imageGridData.cellColor!)
                : Colors.white,
          ),
          // height: MediaQuery.of(context).size.width / 3,
          // width: 500,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    child: WidgetImage(
                        imageGridData.imageGridList![index].imageSrc != null
                            ? imageGridData.imageGridList![index].imageSrc!
                            : AppAssets.no_image,
                        fit: BoxFit.cover)),
              ),
              imageGridData.imageGridList![index].title != "" &&
                      imageGridData.imageGridList![index].title != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Text(imageGridData.imageGridList![index].title!,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold,
                                    color: Utils.getColorFromHex(
                                        imageGridData.textColor!),
                                  )),
                    )
                  : Container(),
            ],
          ),
        ));
  }

  Widget ImageGridListView(BuildContext context) {
    // Determine the number of items to show
    int length = imageGridData.imageGridList!.length;
    //  (imageGridData.imageGridList!.length > imageGridData.showItems!
    //     ? imageGridData.showItems!
    //     : imageGridData.imageGridList!.length);

    // Ensure we have at most 2 rows of items
    int Index = 0;

    return Container(
      color: Utils.getColorFromHex(imageGridData.containerColor!),
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Column(
        children: [
          imageGridData.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Text(imageGridData.heading!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.headingFontSize,
                            color:
                                Utils.getColorFromHex(imageGridData.textColor!),
                          )),
                )
              : Container(),
          Container(
              height: MediaQuery.of(context).size.width / 3.5,
              padding: EdgeInsets.only(left: 15),
              child: GridView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisCount: 2, // Two rows
                  mainAxisSpacing: 5, // Space between the main axis items
                  crossAxisSpacing: 5.0, // Space between the cross axis items
                  // childAspectRatio: 1.3, // Aspect ratio for the items
                ),
                itemCount: imageGridData
                    .imageGridList!.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    // margin: EdgeInsets.only(
                    //     left: 10,
                    //     right: Index == imageGridData.imageGridList!.length - 1
                    //         ? 10
                    //         : 0),
                    // width: 350,
                    //  MediaQuery.of(context).size.width /
                    //     ((imageGridData.columns ?? 3) + 0.3),
                    decoration: BoxDecoration(
                      color: Utils.getColorFromHex(
                          imageGridData.cellColor.toString()),
                    ),
                    child: ImageGridListItemView(
                        context, imageGridData.imageGridList, index,
                        (imageGridItem) {
                      onClick.call(imageGridItem);
                    }),
                  );
                },
              )

              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   shrinkWrap: true,
              //   itemCount: length % 2 == 0
              //       ? (length / 2).toInt()
              //       : ((length / 2) + 1).toInt(),
              //   //  (imageGridData.imageGridList!.length >
              //   //         imageGridData.showItems!
              //   //     ? imageGridData.showItems!
              //   //     : imageGridData.imageGridList!.length),
              //   itemBuilder: (context, index) {
              // Index = index + 1;
              // print("--------------->>>>>>>>>${Index}");
              // return Column(
              //   children: [
              //     Container(
              //       height: 50,
              //       margin: EdgeInsets.only(
              //           left: 10,
              //           right:
              //               Index == imageGridData.imageGridList!.length - 1
              //                   ? 10
              //                   : 0),
              //       width: 150,
              //       //  MediaQuery.of(context).size.width /
              //       //     ((imageGridData.columns ?? 3) + 0.3),
              //       child: ImageGridListItemView(
              //           context, imageGridData.imageGridList, index,
              //           (imageGridItem) {
              //         onClick.call(imageGridItem);
              //       }),
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     // length == index
              //     //     ? Container()
              //     //     :
              //     Container(
              //       height: 50,
              //       margin: EdgeInsets.only(
              //           left: 10,
              //           right:
              //               Index == imageGridData.imageGridList!.length - 1
              //                   ? 10
              //                   : 0),
              //       width: 150,
              //       //  MediaQuery.of(context).size.width /
              //       //     ((imageGridData.columns ?? 3) + 0.3),
              //       child: ImageGridListItemView(
              //           context, imageGridData.imageGridList, Index,
              //           (imageGridItem) {
              //         onClick.call(imageGridItem);
              //       }),
              //     ),
              //   ],
              // );
              //   },
              // ),
              ),
        ],
      ),
    );
  }

  Widget ImageGridView(BuildContext context) {
    int length = (imageGridData.imageGridList!.length > imageGridData.showItems!
        ? imageGridData.showItems!
        : imageGridData.imageGridList!.length);

    int gridCount = length % imageGridData.columns! == 0
        ? length
        : length - (length % imageGridData.columns!);
    int rowCount = length % imageGridData.columns! == 0
        ? 0
        : (length % imageGridData.columns!);
    return Container(
      color: Utils.getColorFromHex(imageGridData.containerColor!),
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      child: Column(
        children: [
          imageGridData.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Text(imageGridData.heading!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.headingFontSize,
                            color:
                                Utils.getColorFromHex(imageGridData.textColor!),
                          )),
                )
              : Container(),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: gridCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: MediaQuery.of(context).size.width / 3,
                  crossAxisCount: imageGridData.columns ?? 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemBuilder: (context, index) {
                return ImageGridItemView(
                    context, imageGridData.imageGridList, index,
                    (imageGridItem) {
                  onClick.call(imageGridItem);
                });
              },
            ),
          ),
          SizedBox(
            height: 4,
          ),
          rowCount > 0
              ? Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int index = gridCount;
                            index < imageGridData.imageGridList!.length;
                            index++)
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: index ==
                                          imageGridData.imageGridList!.length -
                                              1
                                      ? 0
                                      : 5),
                              child: ImageGridItemView(
                                  context, imageGridData.imageGridList, index,
                                  (imageGridItem) {
                                onClick.call(imageGridItem);
                              }),
                            ),
                          )
                      ]),
                )
              : Container()
        ],
      ),
    );
  }

  Widget ImageListView(BuildContext context) {
    return Container(
      color: Utils.getColorFromHex(imageGridData.containerColor!),
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Column(
        children: [
          imageGridData.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Text(imageGridData.heading!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.headingFontSize,
                            color:
                                Utils.getColorFromHex(imageGridData.textColor!),
                          )),
                )
              : Container(),
          Container(
            height: MediaQuery.of(context).size.width / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: (imageGridData.imageGridList!.length >
                      imageGridData.showItems!
                  ? imageGridData.showItems!
                  : imageGridData.imageGridList!.length),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 10,
                      right: index == imageGridData.imageGridList!.length - 1
                          ? 10
                          : 0),
                  width: MediaQuery.of(context).size.width /
                      ((imageGridData.columns ?? 3) + 0.3),
                  child: ImageGridItemView(
                      context, imageGridData.imageGridList, index,
                      (imageGridItem) {
                    onClick.call(imageGridItem);
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ImageGridItemView(
    BuildContext context,
    List<ImageGridItem>? imageGridItem,
    int index,
    Function(ImageGridItem)? onClick,
  ) {
    return InkWell(
        onTap: () => onClick!.call(imageGridItem![index]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(DashboardFontSize.customBorderRadius),
            color: imageGridData.cellColor != null
                ? Utils.getColorFromHex(imageGridData.cellColor.toString())
                : Colors.white,
          ),
          height: MediaQuery.of(context).size.width / 3,
          width: 500,
          child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(DashboardFontSize.customBorderRadius),
              child: WidgetImage(
                  imageGridData.imageGridList![index].imageSrc != null
                      ? imageGridData.imageGridList![index].imageSrc!
                      : AppAssets.no_image,
                  fit: BoxFit.cover)),
        ));
  }

  Widget ImageGridListItemView(
    BuildContext context,
    List<ImageGridItem>? imageGridItem,
    int index,
    Function(ImageGridItem)? onClick,
  ) {
    return imageGridItem!.length == index
        ? Container()
        : InkWell(
            onTap: () => onClick!.call(imageGridItem![index]),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(DashboardFontSize.customBorderRadius),
                // color: Utils.getColorFromHex(imageGridItem[index].),
              ),
              height: MediaQuery.of(context).size.width / 3,
              width: 500,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),
                  child: WidgetImage(
                      imageGridData.imageGridList![index].imageSrc != null
                          ? imageGridData.imageGridList![index].imageSrc!
                          : AppAssets.no_image,
                      fit: BoxFit.cover)),
            ));
  }

  Widget ImageGridWithTextStyleFour(
    BuildContext context,
  ) {
    int length = (imageGridData.imageGridList!.length > imageGridData.showItems!
        ? imageGridData.showItems!
        : imageGridData.imageGridList!.length);

    int gridCount = length % imageGridData.columns! == 0
        ? length
        : length - (length % imageGridData.columns!);
    int rowCount = length % imageGridData.columns! == 0
        ? 0
        : (length % imageGridData.columns!);

    return Container(
      color: Utils.getColorFromHex(imageGridData.containerColor!),
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      child: Column(
        children: [
          imageGridData.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Text(imageGridData.heading!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.headingFontSize,
                            color:
                                Utils.getColorFromHex(imageGridData.textColor!),
                          )),
                )
              : Container(),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imageGridData.imageGridList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: MediaQuery.of(context).size.width / 3,
                  crossAxisCount: imageGridData.columns ?? 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemBuilder: (context, index) {
                return ImageGridStyleThreeItemView(
                    context, imageGridData.imageGridList, index,
                    (imageGridItem) {
                  onClick.call(imageGridItem);
                });
              },
            ),
          ),
          SizedBox(
            height: 4,
          ),
          // rowCount > 0
          //     ? Container(
          //         child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               for (int index = gridCount;
          //                   index < imageGridData.imageGridList!.length;
          //                   index++)
          //                 Expanded(
          //                   child: Container(
          //                       padding: EdgeInsets.only(
          //                           right: index ==
          //                                   imageGridData
          //                                           .imageGridList!.length -
          //                                       1
          //                               ? 0
          //                               : 5),
          //                       child: ImageGridStyleThreeItemView(
          //                           context, imageGridData.imageGridList, index,
          //                           (imageGridItem) {
          //                         onClick.call(imageGridItem);
          //                       })),
          //                 )
          //             ]),
          //       )
          //     : Container()
        ],
      ),
    );
  }

  Widget ImageGridcustomView(
      BuildContext context, ImageGridData imageGridData) {
    return Container(
      color: Utils.getColorFromHex(imageGridData.containerColor!),
      padding: EdgeInsets.only(
          left: DashboardFontSize.paddingLeft,
          right: DashboardFontSize.paddingRight,
          bottom: DashboardFontSize.paddingBottom),
      child: Column(
        children: [
          imageGridData.heading != ""
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Text(imageGridData.heading!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: DashboardFontSize.headingFontSize,
                            color:
                                Utils.getColorFromHex(imageGridData.textColor!),
                          )),
                )
              : Container(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  onClick.call(imageGridData.imageGridList![0]);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5, left: 0, right: 5),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.blue.shade50,
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Colors.black,
                  //     )),
                  height: MediaQuery.of(context).size.height * 0.34,
                  width: MediaQuery.of(context).size.width * 0.53,
                  child: WidgetImage(
                    imageGridData.imageGridList![0].imageSrc.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      onClick.call(imageGridData.imageGridList![1]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 5, right: 0),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.blue.shade100,
                      //     border: Border.all(
                      //       width: 1,
                      //       color: Colors.black,
                      //     )),
                      height: MediaQuery.of(context).size.height * 0.165,
                      width: MediaQuery.of(context).size.width * 0.385,
                      child: WidgetImage(
                        imageGridData.imageGridList![1].imageSrc.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onClick.call(imageGridData.imageGridList![2]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 5, right: 0),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.blue.shade100,
                      //     border: Border.all(
                      //       width: 1,
                      //       color: Colors.black,
                      //     )),
                      height: MediaQuery.of(context).size.height * 0.165,
                      width: MediaQuery.of(context).size.width * 0.385,
                      child: WidgetImage(
                        imageGridData.imageGridList![2].imageSrc.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          imageGridData.imageGridList!.length > 3
              ? InkWell(
                  onTap: () {
                    onClick.call(imageGridData.imageGridList![3]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.blue.shade100,
                    //     border: Border.all(
                    //       width: 1,
                    //       color: Colors.black,
                    //     )),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: WidgetImage(
                      imageGridData.imageGridList![3].imageSrc.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container(),
          Row(
            children: [
              imageGridData.imageGridList!.length > 4
                  ? InkWell(
                      onTap: () {
                        onClick.call(imageGridData.imageGridList![4]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 0, right: 5),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.blue.shade50,
                        //     border: Border.all(
                        //       width: 1,
                        //       color: Colors.black,
                        //     )),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.615,
                        child: WidgetImage(
                          imageGridData.imageGridList![4].imageSrc.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container(),
              imageGridData.imageGridList!.length > 5
                  ? InkWell(
                      onTap: () {
                        onClick.call(imageGridData.imageGridList![5]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 5, right: 0),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.blue.shade100,
                        //     border: Border.all(
                        //       width: 1,
                        //       color: Colors.black,
                        //     )),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: WidgetImage(
                          imageGridData.imageGridList![5].imageSrc.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          imageGridData.imageGridList!.length > 6
              ? InkWell(
                  onTap: () {
                    onClick.call(imageGridData.imageGridList![6]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.blue.shade100,
                    //     border: Border.all(
                    //       width: 1,
                    //       color: Colors.black,
                    //     )),
                    // height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: WidgetImage(
                      imageGridData.imageGridList![6].imageSrc.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          imageGridData.imageGridList!.length > 7
              ? InkWell(
                  onTap: () {
                    onClick.call(imageGridData.imageGridList![7]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.blue.shade100,
                    //     border: Border.all(
                    //       width: 1,
                    //       color: Colors.black,
                    //     )),
                    // height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    child: WidgetImage(
                      imageGridData.imageGridList![7].imageSrc.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          Row(
            children: [
              imageGridData.imageGridList!.length > 8
                  ? InkWell(
                      onTap: () {
                        onClick.call(imageGridData.imageGridList![8]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 0, right: 5),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.blue.shade100,
                        //     border: Border.all(
                        //       width: 1,
                        //       color: Colors.black,
                        //     )),
                        height: MediaQuery.of(context).size.height * 0.165,
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: WidgetImage(
                          imageGridData.imageGridList![8].imageSrc.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Container(),
              imageGridData.imageGridList!.length > 9
                  ? InkWell(
                      onTap: () {
                        onClick.call(imageGridData.imageGridList![9]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 5, right: 0),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.blue.shade50,
                        //     border: Border.all(
                        //       width: 1,
                        //       color: Colors.black,
                        //     )),
                        height: MediaQuery.of(context).size.height * 0.165,
                        width: MediaQuery.of(context).size.width * 0.58,
                        child: WidgetImage(
                          imageGridData.imageGridList![9].imageSrc.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
