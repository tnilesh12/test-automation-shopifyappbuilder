// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import '../../helper/util.dart';
// import '../../modelClass/data_model.dart';
// import '../full_view/itgeek_widget_full_view.dart';
// class ItgeekWidgetBlogPosition extends StatefulWidget {
//   BlogViewItems blogViewItems;
// StyleProperties style;
//   ItgeekWidgetBlogPosition(this.blogViewItems,this.style, {super.key});

//   @override
//   State<ItgeekWidgetBlogPosition> createState() => _WidgetCallPositionState();
// }

// class _WidgetCallPositionState extends State<ItgeekWidgetBlogPosition> {
//    var controller = TextEditingController();

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
//       int maxLines =
//         widget.style.descriptionTextNoOfLines!;
//     double fontSize =
//         widget.style.descriptionTextFontSize!;
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius:
//               BorderRadius.circular(widget.style.radius!.toDouble()),
//           color: Util.getColorFromHex(
//               widget.style.backgroundColor!)),
//       child: Stack(
//         children: [
//           Container(
//             margin:
//                 EdgeInsets.all(widget.style.margin!),
//             padding: EdgeInsets.all(widget.style.padding!),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.transparent,
//               // image: DecorationImage(
//               //   image:
//               //    NetworkImage(
//               //       widget.blogViewItems.blogViewImagePath!),
//               //   fit: BoxFit.cover,
//               // )
              
              
//             ),
             
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(widget.style.radius!),
//                   child: CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         imageUrl: widget.blogViewItems.blogViewImagePath!,
//                         placeholder: (context, url) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                             ),
//                         errorWidget: (context, url, error) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                             ))),
//           ),
//           Positioned(
//             bottom: 20,
//             left: 15,
//             child: Container(
//               width: MediaQuery.of(context).size.width - 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     // width: 100,
//                     decoration: BoxDecoration(
//                       color: Util.getColorFromHex(
//                               widget.style.backgroundColor!)
//                           .withOpacity(0.5),
//                     ),
//                     child: Text(
//                       widget.blogViewItems.blogViewTitle.toString(),
//                       style: TextStyle(
//                               fontFamily: 'Cinzel',
//                           fontWeight: FontWeight.w500,
//                           fontSize: widget.style.titleTextFontSize,
//                           color: Util.getColorFromHex(widget
//                               .style.titleTextColor
//                               .toString())),
//                       maxLines: widget.style.titleTextNoOfLines,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                        LayoutBuilder(builder: (context, size) {
//                             var span = TextSpan(
//               text: mytext,
//               style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: fontSize),
//             );

//             // Use a textpainter to determine if it will exceed max lines
//             var tp = TextPainter(
//               maxLines: maxLines,
//               // textAlign: TextAlign.left,
//               // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//               textDirection: TextDirection.ltr,
//               text: span,
//             );

//             // trigger it to layout
//             tp.layout(maxWidth: size.maxWidth);

//             // whether the text overflowed or not
//             var exceeded = tp.didExceedMaxLines;
//             print("cjvgffmdf ${exceeded}");
//                  return Column(
//                     children: [
//                       Container(
//                         // width: 100,
//                         decoration: BoxDecoration(
//                           color: Util.getColorFromHex(
//                                   widget.style.backgroundColor!)
//                               .withOpacity(0.5),
//                         ),
//                         child: Text.rich(
//                          span,
//                          overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               fontSize: fontSize,
//                               color: Util.getColorFromHex(widget
//                                   .style.descriptionTextColor
//                                   .toString())),
//                           maxLines: maxLines,
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           print("more clicked");

//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ItgeekWidgetFullView(
//                                       widget.blogViewItems.blogViewImagePath!,
//                                       widget.blogViewItems. blogViewTitle!,
//                                       widget.blogViewItems.blogViewDescription!,
//                                       widget.style
//                                           .alignment,
//                                       widget.style
//                                           .titleTextColor,
//                                       widget.style
//                                           .descriptionTextColor,
//                                       widget.style
//                                           .titleTextFontSize!,
//                                       widget.style
//                                           .descriptionTextFontSize!,
//                                       widget.style
//                                           .padding!,
//                                       widget.style
//                                           .margin!,
//                                       widget.style
//                                           .backgroundColor,
//                                       widget.style
//                                           .backgroundColor)));
//                         },
//                         child: Text(
//                           exceeded ? 'Read More' : '',
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                               fontSize: 12
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                        })
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
