import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetTestimonial extends StatefulWidget {
  TestimonialsList testimonialsList;
  String? textColor;

  ItgeekWidgetTestimonial(this.testimonialsList, this.textColor, {super.key});

  @override
  State<ItgeekWidgetTestimonial> createState() =>
      _ItgeekWidgetTestimonialState();
}

class _ItgeekWidgetTestimonialState extends State<ItgeekWidgetTestimonial> {
  var controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        mytext = controller.text;
      });
    });
    // controller.text = widget.imageViewData.description!;
    controller.text = widget.testimonialsList.quote!;
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
    // var titleTextColor = Colors.black;
    // var descriptionTextColor = Colors.black;
    // var bgColor = Colors.blue.shade300;

    return Container(
        // margin: EdgeInsets.all(widget.imageViewData.styleProperties!.backgroundMargin!),
        // padding: EdgeInsets.all(widget.imageViewData.styleProperties!.backgroundPadding!),
        // margin: EdgeInsets.all(8.0),
        // padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(DashboardFontSize.testimonialBorderRadius),
          // color: bgColor,
        ),
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          widget.testimonialsList.authorHeading != ""
              ? Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                  alignment:
                      //  styleProperties!.alignment! == "left" ? Alignment.centerLeft
                      //     : styleProperties!.alignment! == "right"
                      //         ? Alignment.centerRight
                      //         :
                      Alignment.center,
                  child: Text(
                    widget.testimonialsList.authorHeading!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: DashboardFontSize.headingFontSize,
                        color: Utils.getColorFromHex(widget.textColor!)),
                    maxLines: DashboardFontSize.headingMaxLines,
                  ),
                )
              : Container(),
          widget.testimonialsList.quote != ""
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                      textAlign: TextAlign.center,
                      widget.testimonialsList.quote!,
                      style: TextStyle(
                          fontSize: DashboardFontSize.descFontSize,
                          color: Utils.getColorFromHex(widget.textColor!)),
                      maxLines: 4 //DashboardFontSize.descMaxLines,
                      ),
                )
              : Container(),
          /*widget.testimonialsList.quote != ""
              ? LayoutBuilder(builder: (context, size) {
                  var span = TextSpan(
                    text: mytext,
                    style: TextStyle(fontSize: DashboardFontSize.descFontSize),
                  );

                  // Use a textpainter to determine if it will exceed max lines
                  var tp = TextPainter(
                    maxLines: DashboardFontSize.descMaxLines,
                    textDirection: TextDirection.ltr,
                    text: span,
                  );

                  // trigger it to layout
                  tp.layout(maxWidth: size.maxWidth);

                  // whether the text overflowed or not
                  var exceeded = tp.didExceedMaxLines;

                  return
                      //  widget.imageViewData.description != ""    ?
                      Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(
                        //     8.0),
                        // padding: EdgeInsets.all(
                        //     8.0),
                        alignment: Alignment.center,
                        child: Text.rich(
                          span,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // color: descriptionTextColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: DashboardFontSize.subHeadingFontSize),
                          //widget.imageViewData.styleProperties!.descriptionTextFontSize!),
                          maxLines: DashboardFontSize.descMaxLines,
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     print("more clicked");

                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ItgeekWidgetFullView(
                      //                 widget.imageViewData.imageSrc!,
                      //                 widget.imageViewData.title!,
                      //                 widget.imageViewData.description!,
                      //                 widget.imageViewData.styleProperties!
                      //                     .alignment,
                      //                 widget.imageViewData.styleProperties!
                      //                     .titleTextColor,
                      //                 widget.imageViewData.styleProperties!
                      //                     .descriptionTextColor,
                      //                 widget.imageViewData.styleProperties!
                      //                     .titleTextFontSize!,
                      //                 widget.imageViewData.styleProperties!
                      //                     .descriptionTextFontSize!,
                      //                 widget.imageViewData.styleProperties!
                      //                     .padding!,
                      //                 widget.imageViewData.styleProperties!
                      //                     .margin!,
                      //                 widget.imageViewData.styleProperties!
                      //                     .backgroundColor,
                      //                 widget.imageViewData.styleProperties!
                      //                     .backgroundColor)));
                      //   },
                      //   child: Text(
                      //     exceeded ? 'Read More' : '',
                      //     style: TextStyle(
                      //         color: Colors.blue,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 12),
                      //   ),
                      // ),
                    ],
                  );
                  // : Container();
                })
              : Container(),
         */
          widget.testimonialsList.authorDesignation != ""
              ? Container(
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 2),
                  padding: EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  child: Text(widget.testimonialsList.authorDesignation!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: titleTextColor,
                          fontWeight: FontWeight.normal,
                          fontSize: DashboardFontSize.subHeadingFontSize,
                          color: Utils.getColorFromHex(widget.textColor!)),
                      // widget.imageViewData.styleProperties!.titleTextFontSize!),
                      maxLines:
                          1 // widget.imageViewData.styleProperties!.titleTextNoOfLines!,
                      ),
                )
              : Container(),
          widget.testimonialsList.authorName != ""
              ? Container(
                  margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                  alignment: Alignment.center,
                  child: Text(widget.testimonialsList.authorName!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Utils.getColorFromHex(widget.textColor!)),
                      // widget.imageViewData.styleProperties!.titleTextFontSize!),
                      maxLines:
                          1 // widget.imageViewData.styleProperties!.titleTextNoOfLines!,
                      ),
                )
              : Container(),
        ]));
  }
}
