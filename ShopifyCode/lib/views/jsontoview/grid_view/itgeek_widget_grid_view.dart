// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../helper/util.dart';
// import '../../modelClass/data_model.dart';

// class ItgeekWidgetGridView extends StatelessWidget {
//   GridViewData gridViewData;
//   ItgeekWidgetGridView(this.gridViewData);

//   @override
//   Widget build(BuildContext context) {
//     List<GridViewItems> listItems = [];
//     gridViewData.gridViewItems!.map((item) => {listItems.add(item)}).toList();

//     return Container(
//       margin: EdgeInsets.all(gridViewData.styleProperties!.backgroundMargin!),
//       padding: EdgeInsets.all(gridViewData.styleProperties!.backgroundPadding!),
//       width: double.infinity,
// // height: 900,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//             gridViewData.styleProperties!.backgroundRadius!),
//         color: Util.getColorFromHex(
//             gridViewData.styleProperties!.backgroundColor!),
//       ),
//       child: GridView.builder(
//         shrinkWrap: true,
//         itemCount: listItems.length,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             //childAspectRatio: 1 / 1.8
//             childAspectRatio: gridViewData.styleProperties!.aspectRatio!),
//         itemBuilder: (context, index) {
//           return Container(
//               // height: 380,
//               // width: double.infinity,
//               margin: EdgeInsets.all(gridViewData.styleProperties!.margin!),
//               padding: EdgeInsets.all(gridViewData.styleProperties!.padding!),

//               child: Column(children: [
//                 Padding(
//                   padding:
//                       EdgeInsets.all(gridViewData.styleProperties!.padding!),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(
//                         gridViewData.styleProperties!.radius!),
//                     child: CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         imageUrl: listItems[index].imageSrc!,
//                         placeholder: (context, url) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                             ),
//                         errorWidget: (context, url, error) => Image.asset(
//                               'assets/images/placeholder-image.jpg',
//                               package: 'jsontoview',
//                             ))
//                   ),
//                 ),
//                 listItems[index].title != ""
//                     ? Padding(
//                         padding: EdgeInsets.all(
//                             gridViewData.styleProperties!.padding!),
//                         child: Text(
//                           listItems[index].title!,
//                           maxLines: gridViewData.styleProperties!.titleTextNoOfLines,
//                             overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: Util.getColorFromHex(gridViewData
//                                   .styleProperties!.titleTextColor!),
//                               fontWeight: FontWeight.bold,
//                               fontSize: gridViewData
//                                   .styleProperties!.titleTextFontSize!),
//                         ),
//                       )
//                     : Container(),
//                 // SizedBox(
//                 //   height: 2,
//                 // ),
//                 listItems[index].description! != ""
//                     ? Padding(
//                         padding: EdgeInsets.all(
//                             gridViewData.styleProperties!.padding!),
//                         child: Text(
//                           listItems[index].description!,
//                           maxLines: gridViewData.styleProperties!.descriptionTextNoOfLines,
//                             overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: Util.getColorFromHex(gridViewData
//                                   .styleProperties!.descriptionTextColor!),
//                               fontWeight: FontWeight.bold,
//                               fontSize: gridViewData
//                                   .styleProperties!.descriptionTextFontSize),
//                         ),
//                       )
//                     : Container()
//               ]));
//         },
//       ),
//     );
//   }
// }
