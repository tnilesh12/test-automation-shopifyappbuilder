// import 'package:flutter/material.dart';
// import '../../helper/action_type.dart';
// import '../../helper/viewType.dart';
// import 'package:shopify_code/views/jsontoview/full_view/itgeek_web_view.dart';

// import '../../helper/util.dart';
// import '../../modelClass/data_model.dart';
// import '../full_view/itgeek_widget_full_view.dart';

// class ItgeekWidgetBannerImageButton extends StatelessWidget {
//   Function(ButtonViewData) OnClick;
//   ButtonViewData buttonViewData;
//   ItgeekWidgetBannerImageButton(this.buttonViewData, this.OnClick);

//   @override
//   Widget build(BuildContext context) {
//     if (buttonViewData.buttonViewViewType == ViewType.ButtonViewTop.name) {
//       return 
//           TopButton(buttonViewData, OnClick);
//     } else {
//       return
//           BottomButton(buttonViewData, OnClick);
//     }
//   }
// }

// class BottomButton extends StatefulWidget {
//   Function(ButtonViewData) OnClick;
//   ButtonViewData buttonViewData;
//   // BottomButton(this.buttonViewData);
//   BottomButton(this.buttonViewData, this.OnClick);

//   @override
//   State<BottomButton> createState() => _BottomButtonState();
// }

// class _BottomButtonState extends State<BottomButton> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     controller.text = widget.buttonViewData.description!;
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
//         widget.buttonViewData.styleProperties!.titleTextColor!);
//     var descriptionTextColor = Util.getColorFromHex(
//         widget.buttonViewData.styleProperties!.descriptionTextColor!);
//     var bgColor = Util.getColorFromHex(
//         widget.buttonViewData.styleProperties!.backgroundColor!);
//     var buttonTextColor =
//         Util.getColorFromHex(widget.buttonViewData.buttonFontColor!);
//     var buttonBackgroundColor =
//         Util.getColorFromHex(widget.buttonViewData.buttonBackgroundColor!);
//     int maxLines =
//         widget.buttonViewData.styleProperties!.descriptionTextNoOfLines!;
//     double fontSize =
//         widget.buttonViewData.styleProperties!.descriptionTextFontSize!;
//     return 
//     // Expanded(child:
//      Container(
//             margin: EdgeInsets.all(
//                 widget.buttonViewData.styleProperties!.backgroundMargin!),
//             padding: EdgeInsets.all(
//                 widget.buttonViewData.styleProperties!.backgroundPadding!),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     widget.buttonViewData.styleProperties!.backgroundRadius!),
//                 color: bgColor,
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       widget.buttonViewData.styleProperties!.imageSrc!),
//                   fit: BoxFit.cover,
//                   // Padding(
//                   //   padding: EdgeInsets.all(buttonViewData.styleProperties!.padding!),
//                   //   child: ClipRRect(
//                   //     borderRadius:
//                   //         BorderRadius.circular(buttonViewData.styleProperties!.radius!),
//                   //     child: Image.network(
//                   //       buttonViewData.styleProperties!.imageSrc!,
//                   //       fit: BoxFit.cover,
//                   //       width: double.infinity,
//                   //       // color: imageBackgroundColor,
//                   //     ),
//                   //   ),
//                   // ),
//                 )),
//             width: double.infinity,
//             // child: Column(
//             // children: [
//             //   Positioned(
//             //       top: 0,
//             //       bottom: 0,
//             //       left: 0,
//             //       right: 0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 widget.buttonViewData.title != ""
//                     ? Container(
//                         alignment:
//                             widget.buttonViewData.styleProperties!.alignment! ==
//                                     "left"
//                                 ? Alignment.centerLeft
//                                 : widget.buttonViewData.styleProperties!
//                                             .alignment! ==
//                                         "right"
//                                     ? Alignment.centerRight
//                                     : Alignment.center,
//                                     margin: EdgeInsets.all(widget.buttonViewData.styleProperties!.margin!),
//                         padding: EdgeInsets.all(
//                             widget.buttonViewData.styleProperties!.padding!),
//                         child: Text(
//                           widget.buttonViewData.title!,
//                           maxLines: widget.buttonViewData.styleProperties!
//                               .titleTextNoOfLines!,
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: titleTextColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: widget.buttonViewData.styleProperties!
//                                   .titleTextFontSize!),
//                         ),
//                       )
//                     : Container(),
//                 // ]),
//                 LayoutBuilder(builder: (context, size) {

//                   var span = TextSpan(
//                     text: mytext,
//                     style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: fontSize),
//                   );

//                   // Use a textpainter to determine if it will exceed max lines
//                   var tp = TextPainter(
//                     maxLines: maxLines,
//                     // textAlign: TextAlign.left,
//                     // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//                     textDirection: TextDirection.ltr,
//                     text: span,
//                   );

//                   // trigger it to layout
//                   tp.layout(maxWidth: size.maxWidth);

//                   // whether the text overflowed or not
//                   var exceeded = tp.didExceedMaxLines;
//                   print("cjvgffmdf ${exceeded}");
//                   return widget.buttonViewData.description != ""
//                       ? Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(widget
//                                   .buttonViewData.styleProperties!.padding!),
//                               child: Text.rich(
//                                 span,
//                                 maxLines: maxLines,
//                                 style: TextStyle(
//                               fontFamily: 'Cinzel',
//                                     color: descriptionTextColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: fontSize),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 print("more clicked");

//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             ItgeekWidgetFullView(
//                                                 "",
//                                                 widget.buttonViewData.title!,
//                                                 widget.buttonViewData
//                                                     .description!,
//                                                 widget.buttonViewData
//                                                     .styleProperties!.alignment,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .titleTextColor,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .descriptionTextColor,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .titleTextFontSize!,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .descriptionTextFontSize!,
//                                                 widget.buttonViewData
//                                                     .styleProperties!.padding!,
//                                                 widget.buttonViewData
//                                                     .styleProperties!.margin!,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .backgroundColor,
//                                                 widget
//                                                     .buttonViewData
//                                                     .styleProperties!
//                                                     .backgroundColor)));
//                               },
//                               child: Text(
//                                 exceeded ? 'Read More' : '',
//                                 style: TextStyle(
//                               fontFamily: 'Cinzel',
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12),
//                               ),
//                             ),
//                           ],
//                         )
//                       : Container();
//                 }),
//                 Padding(
//                   padding: EdgeInsets.all(
//                       widget.buttonViewData.styleProperties!.padding!),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             print("button banner clickedkk");
//                             print("prrr${widget.buttonViewData.actionType}");
//                             if (widget.buttonViewData.actionType == ActionType.Link.name) {
//                               print("actiontype link");

//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ItgeekWebView(
//                                           widget.buttonViewData.actionId!,
//                                           widget.buttonViewData.styleProperties!
//                                               .backgroundColor,
//                                           widget.buttonViewData.styleProperties!
//                                               .backgroundColor)));
//                             } else {
//                               print("actiontype route");
//                               widget.OnClick(widget.buttonViewData);
//                             }
//                           },
//                           child: Text(
//                             widget.buttonViewData.buttonText!,
//                             style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: buttonTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonBackgroundColor,
//                           ),
//                         )
//                       ]),
//                 ),
//               ],
//             )
//             // )
//         // ],
//         // ),
//         // ),
//         );
//   }
// }

// class TopButton extends StatefulWidget {
//   Function(ButtonViewData) OnClick;
//   ButtonViewData buttonViewData;
//   TopButton(this.buttonViewData, this.OnClick);

//   @override
//   State<TopButton> createState() => _TopButtonState();
// }

// class _TopButtonState extends State<TopButton> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     controller.text = widget.buttonViewData.description!;
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
//         widget.buttonViewData.styleProperties!.titleTextColor!);
//     var descriptionTextColor = Util.getColorFromHex(
//         widget.buttonViewData.styleProperties!.descriptionTextColor!);
//     var bgColor = Util.getColorFromHex(
//         widget.buttonViewData.styleProperties!.backgroundColor!);
//     var buttonTextColor =
//         Util.getColorFromHex(widget.buttonViewData.buttonFontColor!);
//     var buttonBackgroundColor =
//         Util.getColorFromHex(widget.buttonViewData.buttonBackgroundColor!);
//     int maxLines =
//         widget.buttonViewData.styleProperties!.descriptionTextNoOfLines!;
//     double fontSize =
//         widget.buttonViewData.styleProperties!.descriptionTextFontSize!;
//     return 
//     // Expanded(    child:
//      Container(
//             margin: EdgeInsets.all(
//                 widget.buttonViewData.styleProperties!.backgroundMargin!),
//             padding: EdgeInsets.all(
//                 widget.buttonViewData.styleProperties!.backgroundPadding!),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     widget.buttonViewData.styleProperties!.backgroundRadius!),
//                 color: bgColor,
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       widget.buttonViewData.styleProperties!.imageSrc!),
//                   // Padding(
//                   //   padding: EdgeInsets.all(buttonViewData.styleProperties!.padding!),
//                   //   child: ClipRRect(
//                   //     borderRadius:
//                   //         BorderRadius.circular(buttonViewData.styleProperties!.radius!),
//                   //     child: Image.network(
//                   //       buttonViewData.styleProperties!.imageSrc!,
//                   //       fit: BoxFit.cover,
//                   //       width: double.infinity,
//                   //       // color: imageBackgroundColor,
//                   //     ),
//                   //   ),
//                   // ),
//                 )),
//             width: double.infinity,
//             // child: Column(
//             // children: [
//             //   Positioned(
//             //       top: 0,
//             //       bottom: 0,
//             //       left: 0,
//             //       right: 0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Padding(
//                   padding: EdgeInsets.all(
//                       widget.buttonViewData.styleProperties!.padding!),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             print("button banner clickedkk");
//                             print("prrr${widget.buttonViewData.actionType}");
//                             if (widget.buttonViewData.actionType ==
//                                 ActionType.Link.name) {
//                               print("actiontype link");

//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ItgeekWebView(
//                                           widget.buttonViewData.actionId!,
//                                           widget.buttonViewData.styleProperties!
//                                               .backgroundColor,
//                                           widget.buttonViewData.styleProperties!
//                                               .backgroundColor)));
//                             } else {
//                               print("actiontype route");
//                               widget.OnClick(widget.buttonViewData);
//                             }
//                           },
//                           child: Text(
//                             widget.buttonViewData.buttonText!,
//                             style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: buttonTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonBackgroundColor,
//                           ),
//                         )
//                       ]),
//                 ),
//                 Container(
//                         alignment:
//                             widget.buttonViewData.styleProperties!.alignment! ==
//                                     "left"
//                                 ? Alignment.centerLeft
//                                 : widget.buttonViewData.styleProperties!
//                                             .alignment! ==
//                                         "right"
//                                     ? Alignment.centerRight
//                                     : Alignment.center,
//                                     margin: EdgeInsets.all(widget.buttonViewData.styleProperties!.margin!),
//                   padding: EdgeInsets.all(
//                       widget.buttonViewData.styleProperties!.padding!),
//                   child: Text(
//                     widget.buttonViewData.title!,
//                     maxLines: widget
//                         .buttonViewData.styleProperties!.titleTextNoOfLines!,
//                     style: TextStyle(
//                               fontFamily: 'Cinzel',
//                         color: titleTextColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: widget.buttonViewData.styleProperties!
//                             .titleTextFontSize!),
//                   ),
//                 ),
//                 // ]),
//                 LayoutBuilder(
//                   builder: (context, size) {

//                   var span = TextSpan(
//                     text: mytext,
//                     style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: fontSize),
//                   );

//                   // Use a textpainter to determine if it will exceed max lines
//                   var tp = TextPainter(
//                     maxLines: maxLines,
//                     // textAlign: TextAlign.left,
//                     // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//                     textDirection: TextDirection.ltr,
//                     text: span,
//                   );

//                   // trigger it to layout
//                   tp.layout(maxWidth: size.maxWidth);

//                   // whether the text overflowed or not
//                   var exceeded = tp.didExceedMaxLines;
//                   print("cjvgffmdf ${exceeded}");
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(
//                             widget.buttonViewData.styleProperties!.padding!),
//                         child: Text.rich(
//                           span,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: maxLines,
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: descriptionTextColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: fontSize),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           print("more clicked");

//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ItgeekWidgetFullView(
//                                       "",
//                                       widget.buttonViewData.title!,
//                                       widget.buttonViewData.description!,
//                                       widget.buttonViewData.styleProperties!
//                                           .alignment,
//                                       widget.buttonViewData.styleProperties!
//                                           .titleTextColor,
//                                       widget.buttonViewData.styleProperties!
//                                           .descriptionTextColor,
//                                       widget.buttonViewData.styleProperties!
//                                           .titleTextFontSize!,
//                                       widget.buttonViewData.styleProperties!
//                                           .descriptionTextFontSize!,
//                                       widget.buttonViewData.styleProperties!
//                                           .padding!,
//                                       widget.buttonViewData.styleProperties!
//                                           .margin!,
//                                       widget.buttonViewData.styleProperties!
//                                           .backgroundColor,
//                                       widget.buttonViewData.styleProperties!
//                                           .backgroundColor)));
//                         },
//                         child: Text(
//                           exceeded ? 'Read More' : '',
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12),
//                         ),
//                       ),
//                     ],
//                   );
//                 })
//               ],
//             )
//             // )
//         // ],
//         // ),
//         // ),
//         );
//   }
// }
