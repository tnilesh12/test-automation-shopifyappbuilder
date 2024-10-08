// import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/modelClass/data_model.dart';
// import 'package:shopify_code/theme/app_theme.dart';

// class WidgetImageSlider extends StatelessWidget {
//   ImageBanner imageBanner;
//   WidgetImageSlider(this.imageBanner);
// // var imageUrl = "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

//   @override
//   Widget build(BuildContext context) {
//     Color buttonSecondary = AppTheme.secondaryButtonBackground!; // Colors.grey;
//     Color buttonColor = AppTheme
//         .primaryButtonBackground!; // Util.getColorFromHex(imageBanner.sliderButtonColor!);
//     return Container(
//       height: double.infinity,
//       // color: Util.getColorFromHex(sliderItems.sliderBackgroundColor!),
//       //   child: Column(
//       // mainAxisAlignment: MainAxisAlignment.start,
//       // children: [

//       //  child: Expanded(
//       //     child: Container(
//       //       // height: 200,
//       //       // width: double.infinity,
//       //       decoration: BoxDecoration(
//       //         borderRadius: BorderRadius.circular(8.0),
//       //         image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover,opacity: 0.4),
//       //       ),
//       //       child: Expanded(
//       //         child: Image.network(
//       //           imageUrl,
//       //           fit: BoxFit.contain,
//       //         ),
//       //       ),
//       //     ),
//       //   )
// // child:
// //  Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//             imageBanner.imageSrc!,
//           ),
//           fit: BoxFit.fitHeight,
//         ),
//       ),
//       child: ClipRRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//           child: Container(
//             decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
//             // child: Expanded(
//             child: Image.network(
//               imageBanner.imageSrc!,
//               fit: BoxFit.contain,
//             ),
//             // ),
//           ),
//         ),
//       ),
// //  )

//       // FittedBox(
//       //   child: Container(
//       //     decoration: BoxDecoration(
//       //       borderRadius: BorderRadius.circular(8.0),
//       //     ),
//       //     child: Image.network(
//       //       imageUrl,
//       //       fit: BoxFit.cover,
//       //       errorBuilder: (context, error, stackTrace) => Center(
//       //         child: Icon(Icons.error),
//       //       ),
//       //       loadingBuilder: (context, child, loadingProgress) {
//       //         if (loadingProgress == null) return child;
//       //         return Center(
//       //           child: CircularProgressIndicator(
//       //             value: loadingProgress.expectedTotalBytes != null
//       //                 ? loadingProgress.cumulativeBytesLoaded /
//       //                     loadingProgress.expectedTotalBytes!
//       //                 : null,
//       //           ),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       // ),
//       // const Padding(
//       //   padding: const EdgeInsets.fromLTRB(8, 10, 8, 2),
//       //   child: Text(imageBanner.heading!,
//       //       style: TextStyle(
//       //         fontSize: 20,
//       //         fontWeight: FontWeight.bold,
//       //         color: Colors.black,
//       //       )),
//       // ),
//       // const Padding(
//       //   padding: const EdgeInsets.fromLTRB(8, 2, 8, 6),
//       //   child: Text(imageBanner.subheading!,
//       //       style: TextStyle(
//       //         fontSize: 24,
//       //         fontWeight: FontWeight.bold,
//       //         color: Colors.black,
//       //       )),
//       // ),
//       // Padding(
//       //   padding: const EdgeInsets.fromLTRB(4, 2, 4, 20),
//       //   child: Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //     children: [
//       //       InkWell(
//       //         child: Container(
//       //             height: 50,
//       //             width: 100,
//       //             decoration: BoxDecoration(
//       // color: buttonColor,
//       //                 border: Border.all(width: 1),
//       //                 borderRadius: BorderRadius.circular(10)),
//       //             child: Center(
//       //                 child: Text(
//       // imageBanner.secondarybuttonlabel!,
//       //             ))),
//       //         onTap: () {  print("------------clicked1 --------${imageBanner.primarybuttonlink}");
//       // print("------------clicked1 --------${imageBanner.primarybtnId}");
//       //         },
//       //       ),
//       //       InkWell(
//       //         child: Container(
//       //             height: 50,
//       //             width: 100,
//       //             decoration: BoxDecoration(
//       // color: buttonSecondary,
//       //                 border: Border.all(width: 1),
//       //                 borderRadius: BorderRadius.circular(10)),
//       //             child: Center(
//       //                 child: Text(
//       // imageBanner.secondarybuttonlabel!,
//       //             ))),
//       //         onTap: () {
//       //           print("------------clicked2 --------${imageBanner.secondarybuttonlink}");
//       // print("------------clicked2 --------${imageBanner.secondarybtnId}");
//       // },
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       // ],
//       // )
//     );
//   }
// }
