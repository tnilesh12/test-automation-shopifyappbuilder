import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_assets.dart';

import '../../app_config/app_config.dart';

class WidgetImage extends StatelessWidget {
  // SliderItems sliderItems;
  BoxFit? fit;
  double height, width;
  WidgetImage(this.imageUrl,
      {this.fit = AppConfig.imageFit,
      this.width = 0,
      this.height = 0}); //this.sliderItems);       contain
  String
      imageUrl; //"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    if (width != 0 || height != 0) {
      imageUrl = imageUrl + "&width=${width.toInt()}&height=${height.toInt()}";
    }
    print("image url is ...${imageUrl}");
    // Color buttonSecondary = Colors.grey;
    // Color buttonColor =
    //     Colors.red; // Util.getColorFro|mHex(sliderItems.sliderButtonColor!);
    return Container(
      // height: double.infinity,
      // color: Util.getColorFromHex(sliderItems.sliderBackgroundColor!),
      //   child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // children: [

      //  child: Expanded(
      //     child: Container(
      //       // height: 200,
      //       // width: double.infinity,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(8.0),
      //         image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover,opacity: 0.4),
      //       ),
      //       child: Expanded(
      //         child: Image.network(
      //           imageUrl,
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //     ),
      //   )
// child:
//  Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(imageUrl),
//           fit: fit//BoxFit.fitHeight,
//         ),
//       ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
              // decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              // child: Expanded(
              child: imageUrl.isEmpty
                  ? Image.asset(
                      AppAssets.noImage,
                      width: double.infinity,
                      // package: 'jsontoview',
                      fit: fit,
                    )
                  : CachedNetworkImage(
                      fit: fit,
                      width: double.infinity,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Image.asset(
                            // 'assets/images/placeholder-image.jpg',
                            AppAssets.placeholder,
                            // package: 'jsontoview',
                            fit: fit,
                          ),
                      errorWidget: (context, url, error) => Image.asset(
                            // 'assets/images/placeholder-image.jpg',
                            AppAssets.noImage,
                            // package: 'jsontoview',
                            fit: fit,
                          ))

              //  Image.network(
              //   imageUrl,
              //   fit: BoxFit.contain,
              // ),
              // ),
              ),
        ),
      ),
//  )

      // FittedBox(
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(8.0),
      //     ),
      //     child: Image.network(
      //       imageUrl,
      //       fit: BoxFit.cover,
      //       errorBuilder: (context, error, stackTrace) => Center(
      //         child: Icon(Icons.error),
      //       ),
      //       loadingBuilder: (context, child, loadingProgress) {
      //         if (loadingProgress == null) return child;
      //         return Center(
      //           child: CircularProgressIndicator(
      //             value: loadingProgress.expectedTotalBytes != null
      //                 ? loadingProgress.cumulativeBytesLoaded /
      //                     loadingProgress.expectedTotalBytes!
      //                 : null,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      // const Padding(
      //   padding: const EdgeInsets.fromLTRB(8, 10, 8, 2),
      //   child: Text("Title Title Title",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black,
      //       )),
      // ),
      // const Padding(
      //   padding: const EdgeInsets.fromLTRB(8, 2, 8, 6),
      //   child: Text("Subtitle Subtitle Subtitle ",
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black,
      //       )),
      // ),
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(4, 2, 4, 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       InkWell(
      //         child: Container(
      //             height: 50,
      //             width: 100,
      //             decoration: BoxDecoration(
      //                 color: Colors.blue.shade200,
      //                 border: Border.all(width: 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: Center(
      //                 child: Text(
      //               "Button",
      //             ))),
      //         onTap: () {
      //           print("object2");
      //         },
      //       ),
      //       InkWell(
      //         child: Container(
      //             height: 50,
      //             width: 100,
      //             decoration: BoxDecoration(
      //                 color: Colors.grey.shade200,
      //                 border: Border.all(width: 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: Center(
      //                 child: Text(
      //               "Button",
      //             ))),
      //         onTap: () {
      //           print("object");
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      // ],
      // )
    );
  }
}
