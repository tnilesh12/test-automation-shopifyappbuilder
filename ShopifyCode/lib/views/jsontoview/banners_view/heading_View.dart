import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shopify_code/theme/custom_text_theme.dart';
// import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class HeadingView extends StatelessWidget {
  void Function()? onReadMoreTap;
  String? heading, subHeading, description;

  int? headingMaxLines;
  int? subHeadingMaxLines;
  int? descriptionMaxLines;
  double? descriptionFontSize;
  double? headingFontSize;
  double? subHeadingFontSize;
  String textAlign;
  String? textColor;
  HeadingView(
      this.heading, this.subHeading, this.description, this.onReadMoreTap,
      {this.textAlign = "center",
      this.textColor = "",
      this.headingMaxLines = DashboardFontSize.headingMaxLines,
      this.subHeadingMaxLines = DashboardFontSize.subHeadingMaxLines,
      this.descriptionMaxLines = DashboardFontSize.descMaxLines,
      this.descriptionFontSize = 1, //DashboardFontSize.descFontSize,
      this.headingFontSize = 1, //DashboardFontSize.headingFontSize,
      this.subHeadingFontSize = 1, //DashboardFontSize.subHeadingFontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    // int descriptionMaxLines =
    // double descriptionFontSize = 16;
    // double headingFontSize = 20;
    // double subHeadingFontSize = 18;
    if (descriptionFontSize == 1) {
      descriptionFontSize = DashboardFontSize.descFontSize;
      headingFontSize = DashboardFontSize.headingFontSize;
      subHeadingFontSize = DashboardFontSize.subHeadingFontSize;
    }

    return Column(
      children: [
        heading != ""
            ? Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                alignment: textAlign == "left"
                    ? Alignment.centerLeft
                    : textAlign == "right"
                        ? Alignment.centerRight
                        : Alignment.center,
                child: Text(
                  textAlign: textAlign == "left"
                      ? TextAlign.left
                      : textAlign == "right"
                          ? TextAlign.right
                          : TextAlign.center,
                  heading!,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: headingFontSize,
                        color: (textColor == "" || textColor == null)
                            ? null
                            : Utils.getColorFromHex(textColor!),
                      ),
                  // maxLines:
                  //     headingMaxLines, // styleProperties!.headingTextNoOfLines!,
                ),
              )
            : Container(),
        subHeading != ""
            ? Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                alignment: textAlign == "left"
                    ? Alignment.centerLeft
                    : textAlign == "right"
                        ? Alignment.centerRight
                        : Alignment.center,
                child: Text(
                  textAlign: textAlign == "left"
                      ? TextAlign.left
                      : textAlign == "right"
                          ? TextAlign.right
                          : TextAlign.center,
                  subHeading!,
                  style: TextStyle(
                      color: (textColor == "" || textColor == null)
                          ? null
                          : Utils.getColorFromHex(textColor!),
                      fontSize: subHeadingFontSize),
                  // maxLines:
                  //     subHeadingMaxLines, // styleProperties!.headingTextNoOfLines!,
                ),
              )
            : Container(),

        description != ""
            ? Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                alignment: textAlign == "left"
                    ? Alignment.centerLeft
                    : textAlign == "right"
                        ? Alignment.centerRight
                        : Alignment.center,
                child: Text(
                  description!,
                  textAlign: textAlign == "left"
                      ? TextAlign.left
                      : textAlign == "right"
                          ? TextAlign.right
                          : TextAlign.center,
                  style: TextStyle(
                      color: (textColor == "" || textColor == null)
                          ? null
                          : Utils.getColorFromHex(textColor!),
                      fontSize: descriptionFontSize),
                  // maxLines:
                  //     subHeadingMaxLines, // styleProperties!.headingTextNoOfLines!,
                ),
              )
            : Container(),

        // LayoutBuilder(builder: (context, size) {
        //   var span = TextSpan(
        //     text: description,
        //     style: TextStyle(fontSize: descriptionFontSize),
        //   );

        //   // Use a textpainter to determine if it will exceed max lines
        //   var tp = TextPainter(
        //     maxLines: descriptionMaxLines,
        //     textDirection: TextDirection.ltr,
        //     text: span,
        //   );

        //   // trigger it to layout
        //   tp.layout(maxWidth: size.maxWidth);

        //   // whether the text overflowed or not
        //   var exceeded = tp.didExceedMaxLines;
        //   print("cjvgffmdf ${exceeded}");

        //   return description != ""
        //       ? Column(
        //           children: [
        //             Container(
        //               margin: EdgeInsets.all(0),
        //               padding:
        //                   EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //               alignment:
        //                   //  textAlign == "left" ? Alignment.centerLeft
        //                   //     : textAlign == "right"
        //                   //         ? Alignment.centerRight
        //                   //         :
        //                   Alignment.center,
        //               child: Text.rich(
        //                 span,
        //                 overflow: TextOverflow.ellipsis,
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     // color: descriptionTextColor,
        //                     fontSize: descriptionFontSize),
        //                 maxLines: descriptionMaxLines,
        //               ),
        //             ),
        //             Container(
        //               margin: EdgeInsets.fromLTRB(DashboardFontSize.marginLeft,
        //                   0, DashboardFontSize.marginRight, 0),
        //               alignment: Alignment.centerRight,
        //               child: InkWell(
        //                 onTap: () => onReadMoreTap,
        //                 child: Text(
        //                   exceeded ? 'Read More' : '',
        //                   style: CustomTextTheme.getTextStyle(
        //                           MyTextStyle.LinkTextButton, context)
        //                       .copyWith(color: Colors.blue),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         )
        //       : Container();
        // }) : Container(),
      ],
    );
  }
}
