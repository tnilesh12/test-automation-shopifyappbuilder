import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/views/jsontoview/banners_view/heading_View.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetBannerImage extends StatelessWidget {
  Function(ImageWithTextData) OnClick;
  ImageWithTextData imageWithTextData;

  ItgeekWidgetBannerImage(this.imageWithTextData, this.OnClick);

  @override
  Widget build(BuildContext context) {
    // if (imageWithTextData.imageViewViewType == ViewType.ImageViewFull.name) {
    return InkWell(
        onTap: () {
          OnClick(imageWithTextData);
        },
        child: FullImage(imageWithTextData));
    // } else {
    //   return InkWell(
    //       onTap: () {
    //         OnClick(imageWithTextData);
    //       },
    //       child: HalfImage(imageWithTextData));
    // }
  }
}

class FullImage extends StatefulWidget {
  ImageWithTextData imageWithTextData;

  FullImage(this.imageWithTextData);

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  var controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        mytext = controller.text;
      });
    });
    controller.text = widget.imageWithTextData.description!;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String mytext = "";

  @override
  Widget build(BuildContext context) {
    // var headingTextColor = Colors.red;
    // var subheadingTextColor = Colors.orange;
    // var descriptionTextColor = Colors.blue;
    // var bgColor = Colors.grey;

    // int descriptionMaxLines = DashboardFontSize.descMaxLines;//widget.imageWithTextData.styleProperties!.descriptionTextNoOfLines!;
    // double descriptionFontSize = DashboardFontSize.descFontSize; //descriptionFontSize;
    // double headingFontSize = 20;
    // double subheadingFontSize = 18;

    return Container(
        // margin: EdgeInsets.fromLTRB(
        //     0, // DashboardFontSize.marginLeft,
        //     DashboardFontSize.marginTop,
        //     0, // DashboardFontSize.marginRight,
        //     DashboardFontSize.marginBottom),
        // margin: EdgeInsets.all(5),
        // padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              DashboardFontSize.imageWithTextBorderRadius),
          // color: bgColor,
        ),
        width: double.infinity,
        child: Column(children: <Widget>[
          // widget.imageWithTextData.image != ""?
          WidgetImage(widget.imageWithTextData.image!),
          // : Container(),
          // Container(
          //   margin: EdgeInsets.all(5),
          //   padding: EdgeInsets.all(5),
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: widget.imageWithTextData.image != ""
          //           ? CachedNetworkImage(
          //               fit: BoxFit.cover,
          //               width: double.infinity,
          //               imageUrl: widget.imageWithTextData.image!,
          //               placeholder: (context, url) => Image.asset(
          //                     'assets/images/placeholder-image.jpg',
          //                     package: 'jsontoview',
          //                     fit: BoxFit.fill,
          //                   ),
          //               errorWidget: (context, url, error) => Image.asset(
          //                     'assets/images/placeholder-image.jpg',
          //                     package: 'jsontoview',
          //                     fit: BoxFit.fill,
          //                   ))
          //           : Container()),
          // ),
          HeadingView(
            widget.imageWithTextData.heading,
            widget.imageWithTextData.subheading,
            mytext,
            () {
              return print("read more clicked");
            },
          ),
          /*  widget.imageWithTextData.heading != ""
              ? Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                  alignment:
                      //  widget.imageWithTextData.styleProperties!.alignment! == "left" ? Alignment.centerLeft
                      //     : widget.imageWithTextData.styleProperties!.alignment! == "right"
                      //         ? Alignment.centerRight
                      //         :
                      Alignment.center,
                  child: Text(
                    widget.imageWithTextData.heading!,
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        // color: headingTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: headingFontSize!),
                    maxLines:
                        2, // widget.imageWithTextData.styleProperties!.headingTextNoOfLines!,
                  ),
                )
              : Container(),
          widget.imageWithTextData.subheading != ""
              ? Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(vertical:2, horizontal: 10),
                  alignment:
                      //  widget.imageWithTextData.styleProperties!.alignment! == "left" ? Alignment.centerLeft
                      //     : widget.imageWithTextData.styleProperties!.alignment! == "right"
                      //         ? Alignment.centerRight
                      //         :
                      Alignment.center,
                  child: Text(
                    widget.imageWithTextData.subheading!,
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        // color: subheadingTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: subheadingFontSize!),
                    maxLines:
                        2, // widget.imageWithTextData.styleProperties!.headingTextNoOfLines!,
                  ),
                )
              : Container(),
          LayoutBuilder(builder: (context, size) {
            var span = TextSpan(
              text: mytext,
              style: TextStyle(
                  fontFamily: 'Cinzel', fontSize: descriptionFontSize),
            );

            // Use a textpainter to determine if it will exceed max lines
            var tp = TextPainter(
              maxLines: descriptionMaxLines,
              textDirection: TextDirection.ltr,
              text: span,
            );

            // trigger it to layout
            tp.layout(maxWidth: size.maxWidth);

            // whether the text overflowed or not
            var exceeded = tp.didExceedMaxLines;
            print("cjvgffmdf ${exceeded}");

            return widget.imageWithTextData.description != ""
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(vertical:5, horizontal: 10),
                        alignment:
                            //  widget.imageWithTextData.styleProperties!.alignment! == "left"
                            //     ? Alignment.centerLeft
                            //     : widget.imageWithTextData.styleProperties!.alignment! == "right"
                            //         ? Alignment.centerRight
                            //         :
                            Alignment.center,
                        child: Text.rich(
                          span,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Cinzel',
                              // color: descriptionTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: descriptionFontSize),
                          maxLines: descriptionMaxLines,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("read more clicked");

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ItgeekWidgetFullView(
                          //             widget.imageWithTextData.image!,
                          //             widget.imageWithTextData.heading!,
                          //             widget.imageWithTextData.description!,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .alignment,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .headingTextColor,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .descriptionTextColor,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .headingTextFontSize!,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .descriptionTextFontSize!,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .padding!,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .margin!,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .backgroundColor,
                          //             widget.imageWithTextData.styleProperties!
                          //                 .backgroundColor)));
                        },
                        child: Text(
                          exceeded ? 'Read More' : '',
                          style: TextStyle(
                              fontFamily: 'Cinzel',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  )
                : Container();
          })
       */
        ]));
  }
}

/*
class HalfImage extends StatefulWidget {
  ImageWithTextData imageWithTextData;

  HalfImage(this.imageWithTextData);

  @override
  State<HalfImage> createState() => _HalfImageState();
}

class _HalfImageState extends State<HalfImage> {
  var controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        mytext = controller.text;
      });
    });
    controller.text = widget.imageWithTextData.description!;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String mytext = "";

  @override
  Widget build(BuildContext context) {
    var headingTextColor = Util.getColorFromHex(
        widget.imageWithTextData.styleProperties!.headingTextColor!);
    var descriptionTextColor = Util.getColorFromHex(
        widget.imageWithTextData.styleProperties!.descriptionTextColor!);
    var bgColor = Util.getColorFromHex(
        widget.imageWithTextData.styleProperties!.backgroundColor!);
    int descriptionMaxLines =
        widget.imageWithTextData.styleProperties!.descriptionTextNoOfLines!;
    double fontSize =
        descriptionFontSize;

    return Container(
      margin: EdgeInsets.all(
          widget.imageWithTextData.styleProperties!.backgroundMargin!),
      padding: EdgeInsets.all(
          widget.imageWithTextData.styleProperties!.backgroundPadding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            widget.imageWithTextData.styleProperties!.backgroundRadius!),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsets.all(widget.imageWithTextData.styleProperties!.margin!),
            padding:
                EdgeInsets.all(widget.imageWithTextData.styleProperties!.padding!),
            // width: MediaQuery.of(context).size.width * .04,
            height: 220,

            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10.0),
            // image: DecorationImage(
            //   image: NetworkImage(
            //     widget.imageWithTextData.image!,
            //   ),
            //   fit: BoxFit.cover,
            // ),
            // ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    widget.imageWithTextData.styleProperties!.radius!),
                child:
                 CachedNetworkImage(
                        fit: BoxFit.cover,
                        // width: double.infinity,
                        imageUrl: widget.imageWithTextData.image!,
                        placeholder: (context, url) => Image.asset(
                              'assets/images/placeholder-image.jpg',
                              package: 'jsontoview',
                              fit: BoxFit.fill,
                            ),
                        errorWidget: (context, url, error) => Image.asset(
                              'assets/images/placeholder-image.jpg',
                              package: 'jsontoview',
                              fit: BoxFit.fill,
                            ))

                ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.imageWithTextData.heading != ""
                    ? Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        alignment:
                            widget.imageWithTextData.styleProperties!.alignment! ==
                                    "left"
                                ? Alignment.centerLeft
                                : widget.imageWithTextData.styleProperties!
                                            .alignment! ==
                                        "right"
                                    ? Alignment.centerRight
                                    : Alignment.center,
                        child: Text(
                          widget.imageWithTextData.heading!,
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: widget.imageWithTextData.styleProperties!
                                  .headingTextFontSize!,
                              color: headingTextColor),
                          maxLines: widget.imageWithTextData.styleProperties!
                              .headingTextNoOfLines!,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                LayoutBuilder(builder: (context, size) {
                  var span = TextSpan(
                    text: mytext,
                    style: TextStyle(
                            fontFamily: 'Cinzel',fontSize: fontSize),
                  );

                  // Use a textpainter to determine if it will exceed max lines
                  var tp = TextPainter(
                    maxLines: descriptionMaxLines,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    text: span,
                  );

                  // trigger it to layout
                  tp.layout(maxWidth: size.maxWidth);

                  // whether the text overflowed or not
                  var exceeded = tp.didExceedMaxLines;
                  print("cjvgffmdf ${exceeded}");
                  return Expanded(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        // height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              widget.imageWithTextData.styleProperties!.radius!),
                          color: bgColor.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.imageWithTextData.description != ""
                                ? Column(
                                    children: [
                                      Container(
                                        child: Text.rich(
                                          span,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                            fontFamily: 'Cinzel',
                                              fontSize: widget
                                                  .imageWithTextData
                                                  .styleProperties!
                                                  .descriptionTextFontSize!,
                                              color: descriptionTextColor!),
                                          maxLines: descriptionMaxLines,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print("more clicked");

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItgeekWidgetFullView(
                                                          widget.imageWithTextData
                                                              .image!,
                                                          widget.imageWithTextData
                                                              .heading!,
                                                          widget.imageWithTextData
                                                              .description!,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .alignment,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .headingTextColor,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .descriptionTextColor,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .headingTextFontSize!,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .descriptionTextFontSize!,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .padding!,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .margin!,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .backgroundColor,
                                                          widget
                                                              .imageWithTextData
                                                              .styleProperties!
                                                              .backgroundColor)));
                                        },
                                        child: Text(
                                          exceeded ? 'Read More' : '',
                                          style: TextStyle(
                            fontFamily: 'Cinzel',
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        )),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

*/
