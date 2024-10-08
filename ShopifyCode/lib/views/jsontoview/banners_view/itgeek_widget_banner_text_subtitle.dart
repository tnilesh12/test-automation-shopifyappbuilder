// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import '../../helper/viewType.dart';
// import '../../helper/util.dart';
// import 'package:shopify_code/views/jsontoview/full_view/itgeek_widget_full_view.dart';

// import '../../modelClass/data_model.dart';

// class ItgeekWidgetBannerTextSubtitle extends StatelessWidget {
//   Function(ImageViewSubtitleData) OnClick;
//   ImageViewSubtitleData imageViewSubtitleData;
//   ItgeekWidgetBannerTextSubtitle(this.imageViewSubtitleData, this.OnClick);

//   @override
//   Widget build(BuildContext context) {
//     // if (imageViewSubtitleData.imageViewViewType == ViewType.ImageViewFull.name) {
//       return InkWell(
//           onTap: () {
//             OnClick(imageViewSubtitleData);
//           },
//           child: FullImage(imageViewSubtitleData));
//     // } else {
//     //   return InkWell(
//     //       onTap: () {
//     //         OnClick(imageViewSubtitleData);
//     //       },
//     //       child: HalfImage(imageViewSubtitleData));
//     // }
//   }
// }

// class FullImage extends StatefulWidget {
//   ImageViewSubtitleData imageViewSubtitleData;

//   FullImage(this.imageViewSubtitleData);

//   @override
//   State<FullImage> createState() => _FullImageState();
// }

// class _FullImageState extends State<FullImage> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     controller.text = widget.imageViewSubtitleData.description!;
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
//         widget.imageViewSubtitleData.styleProperties!.titleTextColor!);
//     var descriptionTextColor = Util.getColorFromHex(
//         widget.imageViewSubtitleData.styleProperties!.descriptionTextColor!);
//     var bgColor = Util.getColorFromHex(
//         widget.imageViewSubtitleData.styleProperties!.backgroundColor!);
//     int maxLines =
//         widget.imageViewSubtitleData.styleProperties!.descriptionTextNoOfLines!;
//     double fontSize =
//         widget.imageViewSubtitleData.styleProperties!.descriptionTextFontSize!;
//     return Container(
//         margin: EdgeInsets.all(
//             widget.imageViewSubtitleData.styleProperties!.backgroundMargin!),
//         padding: EdgeInsets.all(
//             widget.imageViewSubtitleData.styleProperties!.backgroundPadding!),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(
//               widget.imageViewSubtitleData.styleProperties!.backgroundRadius!),
//           color: bgColor,
//         ),
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//           Container(
//             margin:
//                 EdgeInsets.all(widget.imageViewSubtitleData.styleProperties!.margin!),
//             padding:
//                 EdgeInsets.all(widget.imageViewSubtitleData.styleProperties!.padding!),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(
//                     widget.imageViewSubtitleData.styleProperties!.radius!),
//                 child: widget.imageViewSubtitleData.imageSrc != ""
//                     ? CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         imageUrl: widget.imageViewSubtitleData.imageSrc!,
//                         placeholder: (context, url) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                               fit: BoxFit.fill,
//                             ),
//                         errorWidget: (context, url, error) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                               fit: BoxFit.fill,
//                             ))
//                     : Container()),
//           ),
//           widget.imageViewSubtitleData.title != ""
//               ? Container(
//                   margin: EdgeInsets.all(
//                       widget.imageViewSubtitleData.styleProperties!.margin!),
//                   padding: EdgeInsets.all(
//                       widget.imageViewSubtitleData.styleProperties!.padding!),
//                   alignment:
//                       widget.imageViewSubtitleData.styleProperties!.alignment! == "left"
//                           ? Alignment.centerLeft
//                           : widget.imageViewSubtitleData.styleProperties!.alignment! ==
//                                   "right"
//                               ? Alignment.centerRight
//                               : Alignment.center,
//                   child: Text(
//                     widget.imageViewSubtitleData.title!,
//                     style: TextStyle(
//                             fontFamily: 'Cinzel',
//                         color: titleTextColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: widget
//                             .imageViewSubtitleData.styleProperties!.titleTextFontSize!),
//                     maxLines: widget
//                         .imageViewSubtitleData.styleProperties!.titleTextNoOfLines!,
//                   ),
//                 )
//               : Container(),

//               widget.imageViewSubtitleData.subtitle != ""
//               ? Container(
                
//                 decoration: BoxDecoration(
//              color: Colors.black,
         
//             ),
//         width: 130,
                        
//                   margin: EdgeInsets.all(
//                       widget.imageViewSubtitleData.styleProperties!.margin!),
//                   padding: EdgeInsets.all(
//                       widget.imageViewSubtitleData.styleProperties!.padding!),
//                   alignment:
//                       widget.imageViewSubtitleData.styleProperties!.alignment! == "left"
//                           ? Alignment.centerLeft
//                           : widget.imageViewSubtitleData.styleProperties!.alignment! ==
//                                   "right"
//                               ? Alignment.centerRight
//                               : Alignment.center,
//                   child: Text(
//                     widget.imageViewSubtitleData.subtitle!,
//                     style: TextStyle(
//                 //       decorationColor: Colors.red,
//                 //       decorationThickness: 2,
//                 // decoration: TextDecoration.underline,
//                 // decorationStyle: TextDecorationStyle.solid,
//                             fontFamily: 'Cinzel',
//                         color: bgColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: widget
//                             .imageViewSubtitleData.styleProperties!.titleTextFontSize! - 3),
//                     maxLines: widget
//                         .imageViewSubtitleData.styleProperties!.titleTextNoOfLines!,
                     
//                   ),
//                 )
//               : Container(),
          
//           LayoutBuilder(builder: (context, size) {
//             var span = TextSpan(
//               text: mytext,
//               style: TextStyle(
//                             fontFamily: 'Cinzel',fontSize: fontSize),
//             );

//             // Use a textpainter to determine if it will exceed max lines
//             var tp = TextPainter(
//               maxLines: maxLines,
//               textDirection: TextDirection.ltr,
//               text: span,
//             );

//             // trigger it to layout
//             tp.layout(maxWidth: size.maxWidth);

//             // whether the text overflowed or not
//             var exceeded = tp.didExceedMaxLines;
//             print("cjvgffmdf ${exceeded}");

//             return widget.imageViewSubtitleData.description != ""
//                 ? Column(
//                     children: [
//                       Container(
                       
//                         margin: EdgeInsets.all(
//                             widget.imageViewSubtitleData.styleProperties!.margin!),
//                         padding: EdgeInsets.all(
//                             widget.imageViewSubtitleData.styleProperties!.padding!),
//                         alignment:
//                             widget.imageViewSubtitleData.styleProperties!.alignment! ==
//                                     "left"
//                                 ? Alignment.centerLeft
//                                 : widget.imageViewSubtitleData.styleProperties!
//                                             .alignment! ==
//                                         "right"
//                                     ? Alignment.centerRight
//                                     : Alignment.center,
//                         child: Text.rich(
//                           span,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontFamily: 'Cinzel',
//                               color: descriptionTextColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: widget.imageViewSubtitleData.styleProperties!
//                                   .descriptionTextFontSize!),
//                           maxLines: maxLines,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           print("more clicked");

//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ItgeekWidgetFullView(
//                                       widget.imageViewSubtitleData.imageSrc!,
//                                       widget.imageViewSubtitleData.title!,
//                                       widget.imageViewSubtitleData.description!,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .alignment,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .titleTextColor,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .descriptionTextColor,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .titleTextFontSize!,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .descriptionTextFontSize!,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .padding!,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .margin!,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .backgroundColor,
//                                       widget.imageViewSubtitleData.styleProperties!
//                                           .backgroundColor)));
//                         },
//                         child: Text(
//                           exceeded ? 'Read More' : '',
//                           style: TextStyle(
//                             fontFamily: 'Cinzel',
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Container();
//           })
//         ]));
//   }
// }

// /*
// // class HalfImage extends StatefulWidget {
// //   imageViewSubtitleData imageViewSubtitleData;

// //   HalfImage(this.imageViewSubtitleData);

// //   @override
// //   State<HalfImage> createState() => _HalfImageState();
// // }

// // class _HalfImageState extends State<HalfImage> {
// //   var controller = TextEditingController();

// //   @override
// //   void initState() {
// //     controller.addListener(() {
// //       setState(() {
// //         mytext = controller.text;
// //       });
// //     });
// //     controller.text = widget.imageViewSubtitleData.description!;
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   String mytext = "";

// //   @override
// //   Widget build(BuildContext context) {
// //     var titleTextColor = Util.getColorFromHex(
// //         widget.imageViewSubtitleData.styleProperties!.titleTextColor!);
// //     var descriptionTextColor = Util.getColorFromHex(
// //         widget.imageViewSubtitleData.styleProperties!.descriptionTextColor!);
// //     var bgColor = Util.getColorFromHex(
// //         widget.imageViewSubtitleData.styleProperties!.backgroundColor!);
// //     int maxLines =
// //         widget.imageViewSubtitleData.styleProperties!.descriptionTextNoOfLines!;
// //     double fontSize =
// //         widget.imageViewSubtitleData.styleProperties!.descriptionTextFontSize!;

// //     return Container(
// //       margin: EdgeInsets.all(
// //           widget.imageViewSubtitleData.styleProperties!.backgroundMargin!),
// //       padding: EdgeInsets.all(
// //           widget.imageViewSubtitleData.styleProperties!.backgroundPadding!),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(
// //             widget.imageViewSubtitleData.styleProperties!.backgroundRadius!),
// //         color: bgColor,
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             margin:
// //                 EdgeInsets.all(widget.imageViewSubtitleData.styleProperties!.margin!),
// //             padding:
// //                 EdgeInsets.all(widget.imageViewSubtitleData.styleProperties!.padding!),
// //             // width: MediaQuery.of(context).size.width * .04,
// //             height: 220,

// //             // decoration: BoxDecoration(
// //             // borderRadius: BorderRadius.circular(10.0),
// //             // image: DecorationImage(
// //             //   image: NetworkImage(
// //             //     widget.imageViewSubtitleData.imageSrc!,
// //             //   ),
// //             //   fit: BoxFit.cover,
// //             // ),
// //             // ),
// //             child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(
// //                     widget.imageViewSubtitleData.styleProperties!.radius!),
// //                 child:
// //                  CachedNetworkImage(
// //                         fit: BoxFit.cover,
// //                         // width: double.infinity,
// //                         imageUrl: widget.imageViewSubtitleData.imageSrc!,
// //                         placeholder: (context, url) => Image.asset(
// //                               'assets/images/placeholder-image.jpg',
// //                               package: 'jsontoview',
// //                               fit: BoxFit.fill,
// //                             ),
// //                         errorWidget: (context, url, error) => Image.asset(
// //                               'assets/images/placeholder-image.jpg',
// //                               package: 'jsontoview',
// //                               fit: BoxFit.fill,
// //                             ))
                
// //                 ),
// //           ),
// //           Flexible(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 widget.imageViewSubtitleData.title != ""
// //                     ? Container(
// //                         margin: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.margin!),
// //                         padding: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.padding!),
// //                         alignment:
// //                             widget.imageViewSubtitleData.styleProperties!.alignment! ==
// //                                     "left"
// //                                 ? Alignment.centerLeft
// //                                 : widget.imageViewSubtitleData.styleProperties!
// //                                             .alignment! ==
// //                                         "right"
// //                                     ? Alignment.centerRight
// //                                     : Alignment.center,
// //                         child: Text(
// //                           widget.imageViewSubtitleData.title!,
// //                           style: TextStyle(
// //                             fontFamily: 'Cinzel',
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: widget.imageViewSubtitleData.styleProperties!
// //                                   .titleTextFontSize!,
// //                               color: titleTextColor),
// //                           maxLines: widget.imageViewSubtitleData.styleProperties!
// //                               .titleTextNoOfLines!,
// //                           textAlign: TextAlign.center,
// //                         ),
// //                       )
// //                     : Container(),
// //                      widget..subtitle != ""
// //                     ? Container(
// //                         margin: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.margin!),
// //                         padding: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.padding!),
// //                         alignment:
// //                             widget.imageViewSubtitleData.styleProperties!.alignment! ==
// //                                     "left"
// //                                 ? Alignment.centerLeft
// //                                 : widget.imageViewSubtitleData.styleProperties!
// //                                             .alignment! ==
// //                                         "right"
// //                                     ? Alignment.centerRight
// //                                     : Alignment.center,
// //                         child: Text(
// //                           widget.imageViewSubtitleData.subtitle!,
// //                           style: TextStyle(
// //                             fontFamily: 'Cinzel',
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: widget.imageViewSubtitleData.styleProperties!
// //                                   .subtitleTextFontSize!,
// //                               color: subtitleTextColor),
// //                           maxLines: widget.imageViewSubtitleData.styleProperties!
// //                               .subtitleTextNoOfLines!,
// //                           textAlign: TextAlign.center,
// //                         ),
// //                       )
// //                     : Container(),
// //                 LayoutBuilder(builder: (context, size) {
// //                   var span = TextSpan(
// //                     text: mytext,
// //                     style: TextStyle(
// //                             fontFamily: 'Cinzel',fontSize: fontSize),
// //                   );

// //                   // Use a textpainter to determine if it will exceed max lines
// //                   var tp = TextPainter(
// //                     maxLines: maxLines,
// //                     textAlign: TextAlign.left,
// //                     textDirection: TextDirection.ltr,
// //                     text: span,
// //                   );

// //                   // trigger it to layout
// //                   tp.layout(maxWidth: size.maxWidth);

// //                   // whether the text overflowed or not
// //                   var exceeded = tp.didExceedMaxLines;
// //                   print("cjvgffmdf ${exceeded}");
// //                   return Expanded(
// //                     child: Container(
// //                         margin: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.margin!),
// //                         padding: EdgeInsets.all(
// //                             widget.imageViewSubtitleData.styleProperties!.padding!),
// //                         // height: double.infinity,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(
// //                               widget.imageViewSubtitleData.styleProperties!.radius!),
// //                           color: bgColor.withOpacity(0.5),
// //                         ),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.center,
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             widget.imageViewSubtitleData.description != ""
// //                                 ? Column(
// //                                     children: [
// //                                       Container(
// //                                         child: Text.rich(
// //                                           span,
// //                                           overflow: TextOverflow.ellipsis,
// //                                           style: TextStyle(
// //                             fontFamily: 'Cinzel',
// //                                               fontSize: widget
// //                                                   .imageViewSubtitleData
// //                                                   .styleProperties!
// //                                                   .descriptionTextFontSize!,
// //                                               color: descriptionTextColor!),
// //                                           maxLines: maxLines,
// //                                           textAlign: TextAlign.center,
// //                                         ),
// //                                       ),
// //                                       InkWell(
// //                                         onTap: () {
// //                                           print("more clicked");

// //                                           Navigator.push(
// //                                               context,
// //                                               MaterialPageRoute(
// //                                                   builder: (context) =>
// //                                                       ItgeekWidgetFullView(
// //                                                           widget.imageViewSubtitleData
// //                                                               .imageSrc!,
// //                                                           widget.imageViewSubtitleData
// //                                                               .title!,
// //                                                           widget.imageViewSubtitleData
// //                                                               .description!,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .alignment,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .titleTextColor,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .descriptionTextColor,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .titleTextFontSize!,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .descriptionTextFontSize!,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .padding!,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .margin!,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .backgroundColor,
// //                                                           widget
// //                                                               .imageViewSubtitleData
// //                                                               .styleProperties!
// //                                                               .backgroundColor)));
// //                                         },
// //                                         child: Text(
// //                                           exceeded ? 'Read More' : '',
// //                                           style: TextStyle(
// //                             fontFamily: 'Cinzel',
// //                                               color: Colors.blue,
// //                                               fontWeight: FontWeight.bold,
// //                                               fontSize: 12),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   )
// //                                 : Container()
// //                           ],
// //                         )),
// //                   );
// //                 }),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// */
