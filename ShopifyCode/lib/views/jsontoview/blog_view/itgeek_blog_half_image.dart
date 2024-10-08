// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import '../../helper/util.dart';

// import '../../modelClass/data_model.dart';

// import '../full_view/itgeek_widget_full_view.dart';

// class ItgeekWidgetBlogHalfImage extends StatefulWidget {
//   StyleProperties style;
//   BlogViewItems blogViewItems;
//   ItgeekWidgetBlogHalfImage(this.style, this.blogViewItems, {super.key});

//   @override
//   State<ItgeekWidgetBlogHalfImage> createState() =>
//       _ItgeekWidgetBlogHalfImageState();
// }

// class _ItgeekWidgetBlogHalfImageState extends State<ItgeekWidgetBlogHalfImage> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     controller.text = widget.blogViewItems.blogViewDescription!;
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
//     int maxLines = widget.style.descriptionTextNoOfLines!;
//     double fontSize = widget.style.descriptionTextFontSize!;
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(widget.style.radius!),
//         // color: Util.getColorFromHex(widget.style.backgroundColor!),
//       ),
//       margin: EdgeInsets.all(widget.style.backgroundMargin!),
//       padding: EdgeInsets.all(widget.style.backgroundPadding!),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 20,
//             left: 0,
//             child: Container(
//               width: 220,
//               height: 220,
//               margin: EdgeInsets.all(widget.style.margin!),
//               padding: EdgeInsets.all(widget.style.padding!),
//               // decoration: BoxDecoration(
//               //   color: Colors.purple,
//               //   borderRadius: BorderRadius.circular(10.0),

//               // image:
//               // DecorationImage(
//               //         image: NetworkImage(widget.blogViewItems.blogViewImagePath!),
//               //         fit: BoxFit.cover,
//               //       )

//               // ),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(widget.style.radius!),
//                   child:CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         imageUrl: widget.blogViewItems.blogViewImagePath!,
//                         placeholder: (context, url) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                               fit: BoxFit.cover,
//                             ),
//                         errorWidget: (context, url, error) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                               fit: BoxFit.cover,
//                             ))),
//             ),
//           ),
//           Positioned(
//             top: 180,
//             left: 140,
//             bottom: 30,
//             right: 0,
//             child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [ 
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       offset: const Offset(0.0, 0.0),
//                       blurRadius: 2.0,
//                       spreadRadius:1.0,
//                     ), ],
//                   borderRadius:
//                       BorderRadius.circular(widget.style.radius!.toDouble()),
//                   color: Util.getColorFromHex(widget.style.backgroundColor!)
//                       .withOpacity(0.5),
//                 ),
//                 padding: EdgeInsets.all(widget.style.padding!),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       // width: double.infinity,
//                       //  color: Color.fromARGB(95, 34, 66, 79),
//                       // margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0, left: 8.0),
//                       child: Text(
//                         widget.blogViewItems.blogViewTitle!,
//                         style: TextStyle(
//                               fontFamily: 'Cinzel',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: Util.getColorFromHex(
//                                 widget.style.titleTextColor!)),
//                         maxLines: 2,
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     // SizedBox(
//                     //   height: 10,
//                     // ),
//                     LayoutBuilder(builder: (context, size) {
//                       var span = TextSpan(
//                         text: mytext,
//                         style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: fontSize),
//                       );

//                       // Use a textpainter to determine if it will exceed max lines
//                       var tp = TextPainter(
//                         maxLines: maxLines,
//                         // textAlign: TextAlign.left,
//                         // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//                         textDirection: TextDirection.ltr,
//                         text: span,
//                       );

//                       // trigger it to layout
//                       tp.layout(maxWidth: size.maxWidth);

//                       // whether the text overflowed or not
//                       var exceeded = tp.didExceedMaxLines;
//                       print("cjvgffmdf ${exceeded}");
//                       return Column(
//                         children: [
//                           Container(
//                             // width: 250,
//                             //  color: Color.fromARGB(95, 34, 66, 79),

//                             // margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 20.0, left: 20.0),
//                             child: Text.rich(
//                               span,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                               fontFamily: 'Cinzel',
//                                   fontSize: 14,
//                                   color: Util.getColorFromHex(
//                                       widget.style.descriptionTextColor!)),
//                               maxLines: maxLines,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               print("more clicked");

//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           ItgeekWidgetFullView(
//                                               widget.blogViewItems
//                                                   .blogViewImagePath!,
//                                               widget
//                                                   .blogViewItems.blogViewTitle,
//                                               widget.blogViewItems
//                                                   .blogViewDescription,
//                                               widget.style.alignment,
//                                               widget.style.titleTextColor,
//                                               widget.style.descriptionTextColor,
//                                               widget.style.titleTextFontSize!,
//                                               widget.style
//                                                   .descriptionTextFontSize!,
//                                               widget.style.padding!,
//                                               widget.style.margin!,
//                                               widget.style.backgroundColor,
//                                               widget.style.backgroundColor)));
//                             },
//                             child: Text(
//                               exceeded ? 'Read More' : '',
//                               style: TextStyle(
//                               fontFamily: 'Cinzel',
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               fontSize: 12
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     })
//                   ],
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }

// /*
// import '../../helper/util.dart';
// import '../../modelClass/DashboardModel.dart';
// import 'package:flutter/material.dart';

// class WidgetCallHalfImage extends StatelessWidget {
//   BlogViewItems blogViewItems;
//   WidgetCallHalfImage(this.blogViewItems, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//         child: Column(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   width: 200,
//                   height: 230,
//                   margin: EdgeInsets.only(
//                       top: 30.0, bottom: 8.0, right: 8.0, left: 8.0),
//                   padding: EdgeInsets.only(top: 20.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: NetworkImage(blogViewItems.blogViewImagePath!),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                   ),
//                   margin: EdgeInsets.only(
//                       top: 8.0, bottom: 8.0, right: 8.0, left: 8.0),
//                   child: Text(
//                     blogViewItems.blogViewTitle!,
//                     style: TextStyle(
//                               fontFamily: 'Cinzel',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: Util.getColorFromHex(
//                             blogViewItems.blogViewTextTitleColor!)),
//                     maxLines: 2,
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               // width: 250,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(95, 255, 255, 255),
//               ),
//               margin: EdgeInsets.only(
//                   top: 8.0, bottom: 8.0, right: 20.0, left: 20.0),
//               child: Text(
//                 blogViewItems.blogViewDescription!,
//                 style: TextStyle(
//                               fontFamily: 'Cinzel',
//                     fontSize: 14,
//                     color: Util.getColorFromHex(
//                         blogViewItems.blogViewTextDescriptionColor!)),
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(95, 255, 255, 255),
//               ),
//               margin: EdgeInsets.only(
//                   top: 4.0, bottom: 8.0, right: 28.0, left: 28.0),
//               child: Text(
//                 blogViewItems.blogViewDate!,
//                 style: TextStyle(
//                               fontFamily: 'Cinzel',
//                     color: Util.getColorFromHex(
//                         blogViewItems.blogViewTextTitleColor!)),
//                 maxLines: 2,
//                 textAlign: TextAlign.end,
//               ),
//             ),
//           ],
//         )
//       ],
//     ));
//   }
// }

// */
