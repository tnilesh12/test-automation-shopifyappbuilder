// import 'package:flutter/material.dart';
// import 'package:shopify_code/modelClass/data_model.dart';
// import 'package:shopify_code/views/widgets/widget_image.dart';
// import 'package:video_player/video_player.dart';
// import '../full_view/itgeek_widget_full_view.dart';

// class ItgeekWidgetBannerVideo extends StatefulWidget {
//   Function(VideoData) OnClick;
//   VideoData videoData;
//   ItgeekWidgetBannerVideo(this.videoData, this.OnClick);

//   @override
//   State<ItgeekWidgetBannerVideo> createState() =>
//       _ItgeekWidgetBannerVideoState();
// }

// class _ItgeekWidgetBannerVideoState extends State<ItgeekWidgetBannerVideo> {
//   var controller = TextEditingController();

//   @override
//   void initState() {
//     controller.addListener(() {
//       setState(() {
//         mytext = controller.text;
//       });
//     });
//     // controller.text = widget.videoData.description!;
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
//     var headingTextColor = Colors.red;
//     // var subheadingTextColor = Colors.orange;
//     var descriptionTextColor = Colors.blue;
//     var bgColor = Colors.grey;

//     int descriptionMaxLines = 3; //widget.videoData.styleProperties!.descriptionTextNoOfLines!;
//     double descriptionFontSize = 20; //descriptionFontSize;
//     double headingFontSize = 26;
//     double subheadingFontSize = 23;

//     return InkWell(
//         onTap: () {
//           widget.OnClick(widget.videoData);
//         },
//         child: Container(
//           padding: EdgeInsets.all(5),
//           margin: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: bgColor,
//           ),
//           width: double.infinity,
//           // color: bgColor,
//           child: Column(
//             children: [
//               MyVideo(widget.videoData),
//           widget.videoData.heading != ""
//               ? Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(5),
//                   alignment:
//                       //  widget.videoData.styleProperties!.alignment! == "left" ? Alignment.centerLeft
//                       //     : widget.videoData.styleProperties!.alignment! == "right"
//                       //         ? Alignment.centerRight
//                       //         :
//                       Alignment.center,
//                   child: Text(
//                     widget.videoData.heading!,
//                     style: TextStyle(
//                         fontFamily: 'Cinzel',
//                         color: headingTextColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: headingFontSize!),
//                     maxLines:
//                         2, // widget.videoData.styleProperties!.headingTextNoOfLines!,
//                   ),
//                 )
//               : Container(),
//               LayoutBuilder(builder: (context, size) {
//                 var span = TextSpan(
//                   text: mytext,
//                   style: TextStyle(
//                               fontFamily: 'Cinzel',fontSize: descriptionFontSize),
//                 );

//                 // Use a textpainter to determine if it will exceed max lines
//                 var tp = TextPainter(
//                   maxLines: descriptionMaxLines,
//                   // textAlign: TextAlign.left,
//                   // textAlign: widget.imageViewData.styleProperties!.alignment! == "left" ? TextAlign.left : widget.imageViewData.styleProperties!.alignment == "right" ? TextAlign.right : TextAlign.center,

//                   textDirection: TextDirection.ltr,
//                   text: span,
//                 );

//                 // trigger it to layout
//                 tp.layout(maxWidth: size.maxWidth);

//                 // whether the text overflowed or not
//                 var exceeded = tp.didExceedMaxLines;
//                 print("cjvgffmdf ${exceeded}");
//                 return Column(
//                   children: [
//                     Container(
//                      child: Text.rich(
//                         span,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: descriptionMaxLines,
//                         style: TextStyle(
//                               fontFamily: 'Cinzel',
//                             color: descriptionTextColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: descriptionFontSize,// widget.videoData.styleProperties!.descriptionTextFontSize
//                             ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         print("more clicked");

//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => ItgeekWidgetFullView(
//                         //                 "",
//                         //             widget.videoData.heading!,
//                         //             widget.videoData.description!,
//                         //             widget.videoData.styleProperties!
//                         //                 .alignment,
//                         //             widget.videoData.styleProperties!
//                         //                 .headingTextColor,
//                         //             widget.videoData.styleProperties!
//                         //                 .descriptionTextColor,
//                         //             widget.videoData.styleProperties!
//                         //                 .headingTextFontSize!,
//                         //             widget.videoData.styleProperties!
//                         //                 .descriptionTextFontSize!,
//                         //             widget.videoData.styleProperties!
//                         //                 .padding!,
//                         //             widget
//                         //                 .videoData.styleProperties!.margin!,
//                         //             widget.videoData.styleProperties!
//                         //                 .backgroundColor,
//                         //             widget.videoData.styleProperties!
//                         //                 .backgroundColor)));
//                       },
//                       child: Text(
//                         exceeded ? 'Read More' : '',
//                         style: TextStyle(
//                               fontFamily: 'Cinzel',
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                               fontSize: 12
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               })
//             ],
//           ),
//         ));
//   }
// }

// class MyVideo extends StatefulWidget {
//   VideoPlayerController? _videoController;
//   Future<void>? _initializeVideoPlayerFuture;
//   VideoData videoData;
//   MyVideo(this.videoData);

//   @override
//   State<MyVideo> createState() => _MyVideoState();
// }

// class _MyVideoState extends State<MyVideo> {
//   String? srcc;
//   @override
//   void initState() {
//     super.initState();
//     srcc = widget.videoData.uRL;

//     widget._videoController =
//         VideoPlayerController.networkUrl(Uri.parse(srcc!));

//     widget._initializeVideoPlayerFuture = widget._videoController!.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var headingTextColor = Colors.red;
    
//     return FutureBuilder(
//         future: widget._initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Padding(
//               padding: EdgeInsets.all(5),
//               child: InkWell(
//                 child: Stack(children: [
//                   AspectRatio(
//                     aspectRatio: widget._videoController!.value.aspectRatio,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5),
//                       child: VideoPlayer(widget._videoController!),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: widget._videoController!.value.isPlaying
//                         ? Text("")
//                         : Icon(
//                             widget._videoController!.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             size: 48,
//                           ),
//                   ),
//                 ]),
//                 onTap: () {
//                   setState(() {
//                     if (widget._videoController!.value.isPlaying) {
//                       widget._videoController!.pause();
//                     } else {
//                       widget._videoController!.play();
//                     }
//                   });
//                 },
//               ),
//             );
//           } else {
//             return 
//             WidgetImage(widget.videoData.coverImage!);
//             // Padding(
//             //     padding: EdgeInsets.all(5),
//             //     child: const SizedBox(
//             //       height: 40.0,
//             //       // width: 10.0,
//             //       child: Center(child: CircularProgressIndicator()),
//             //     ));
//           }
//         });
//   }

//   @override
//   void dispose() {
//     widget._videoController!.dispose();
//     super.dispose();
//   }
// }