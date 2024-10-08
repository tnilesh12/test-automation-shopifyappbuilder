// import 'package:flutter/material.dart';

// import '../../helper/util.dart';
// import '../../modelClass/data_model.dart';
// import '../full_view/itgeek_widget_full_view.dart';

// class ItgeekWidgetBannerText extends StatelessWidget {
//   Function(TextViewData) OnClick;
//   TextViewData textViewData;
//   ItgeekWidgetBannerText(this.textViewData, this.OnClick);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           OnClick(textViewData);
//         },
//         child: TextView(textViewData));
//   }
// }

// class TextView extends StatefulWidget {
//   TextViewData textViewData;
//   TextView(this.textViewData);

//   @override
//   State<TextView> createState() => _TextViewState();
// }

// class _TextViewState extends State<TextView> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     controller.text = widget.textViewData.description!;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   String mytext = "";

//   @override
//   Widget build(BuildContext context) {
//     var titleTextColor = Util.getColorFromHex(
//         widget.textViewData.styleProperties!.titleTextColor!);
//     var descriptionTextColor = Util.getColorFromHex(
//         widget.textViewData.styleProperties!.descriptionTextColor!);
//     var bgColor = Util.getColorFromHex(
//         widget.textViewData.styleProperties!.backgroundColor!);
//     int maxLines =
//         widget.textViewData.styleProperties!.descriptionTextNoOfLines!;
//     double fontSize =
//         widget.textViewData.styleProperties!.descriptionTextFontSize!;
//     return Container(
//         margin: EdgeInsets.all(
//             widget.textViewData.styleProperties!.backgroundMargin!),
//         padding: EdgeInsets.all(
//             widget.textViewData.styleProperties!.backgroundPadding!),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//                 widget.textViewData.styleProperties!.backgroundRadius!),
//             color: bgColor,
//             image: DecorationImage(
//               image: NetworkImage(
//                 widget.textViewData.styleProperties!.imageSrc!,
//               ),
//               fit: BoxFit.cover,
//             )
            
//             ),
            
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             widget.textViewData.title != ""
//                 ? Container(
//                     margin: EdgeInsets.all(
//                         widget.textViewData.styleProperties!.margin!),
//                     padding: EdgeInsets.all(
//                         widget.textViewData.styleProperties!.padding!),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       widget.textViewData.title!,
//                       maxLines: widget
//                           .textViewData.styleProperties!.titleTextNoOfLines!,
//                       style: TextStyle(
//                               fontFamily: 'Cinzel',
//                           color: titleTextColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: widget.textViewData.styleProperties!
//                               .titleTextFontSize!),
//                     ),
//                   )
//                 : Container(),
//             LayoutBuilder(builder: (context, size) {
//               var span = TextSpan(
//                 text: mytext,
//                 style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: fontSize),
//               );

//               // Use a textpainter to determine if it will exceed max lines
//               var tp = TextPainter(
//                 maxLines: maxLines,
//                 // textAlign: TextAlign.left,
//                 // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//                 textDirection: TextDirection.ltr,
//                 text: span,
//               );

//               // trigger it to layout
//               tp.layout(maxWidth: size.maxWidth);

//               // whether the text overflowed or not
//               var exceeded = tp.didExceedMaxLines;
//               print("cjvgffmdf ${exceeded}and${widget.textViewData.title}");
//               return widget.textViewData.description != ""
//                   ? Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.all(
//                               widget.textViewData.styleProperties!.margin!),
//                           padding: EdgeInsets.all(
//                               widget.textViewData.styleProperties!.padding!),
//                           child: Text.rich(
//                             span,
//                             textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: maxLines,
//                             style: TextStyle(
//                               fontFamily: 'Cinzel',
//                                 color: descriptionTextColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: widget.textViewData.styleProperties!
//                                     .descriptionTextFontSize!),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             print("more clicked");

//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ItgeekWidgetFullView(
//                                         "",
//                                         widget.textViewData.title!,
//                                         widget.textViewData.description!,
//                                         widget.textViewData.styleProperties!
//                                             .alignment,
//                                         widget.textViewData.styleProperties!
//                                             .titleTextColor,
//                                         widget.textViewData.styleProperties!
//                                             .descriptionTextColor,
//                                         widget.textViewData.styleProperties!
//                                             .titleTextFontSize!,
//                                         widget.textViewData.styleProperties!
//                                             .descriptionTextFontSize!,
//                                         widget.textViewData.styleProperties!
//                                             .padding!,
//                                         widget.textViewData.styleProperties!
//                                             .margin!,
//                                         widget.textViewData.styleProperties!
//                                             .backgroundColor,
//                                         widget.textViewData.styleProperties!
//                                             .backgroundColor)));
//                           },
//                           child: Text(
//                             exceeded ? 'Read More' : '',
//                             // exceeded! > widget.textViewData.styleProperties!.descriptionTextNoOfLines! ? 'Read More' : '',
//                             style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : Container();
//             })
//           ],
//         ));
//   }
// }
