import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/banners_view/heading_View.dart';
import 'package:shopify_code/views/jsontoview/simple_video_player/simple_video_player.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItgeekWidgetYoutubeView extends StatefulWidget {
  VideoData videoData;

  ItgeekWidgetYoutubeView(this.videoData, {super.key});

  @override
  State<ItgeekWidgetYoutubeView> createState() =>
      _ItgeekWidgetYoutubeViewState();
}

class _ItgeekWidgetYoutubeViewState extends State<ItgeekWidgetYoutubeView> {
  // var controller = TextEditingController();

  @override
  void initState() {
    // controller.addListener(() {
    //   setState(() {
    //     mytext = controller.text;
    //   });
    // });
    // controller.text = widget.videoData.videoAltText!;
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  // String mytext = "";

  String getYouTubeVideoId(String url) {
    // Regular expression to match YouTube video ID (various formats)
    RegExp regExp1 = RegExp(
        r'^(?:(?:https?:)?\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})');

    // Regular expression for standard YouTube URLs
    RegExp regExp2 =
        RegExp(r'^https:\/\/(www\.)?youtube\.com\/watch\?v=([\w-]{11})(&\S*)?');

    // Attempt to match the URL using the first regex
    Match? match = regExp1.firstMatch(url);

    // If the first regex doesn't match, try the second one
    if (match == null || match.groupCount == 0) {
      match = regExp2.firstMatch(url);
    }

    // Check if a match is found
    if (match != null && match.groupCount > 0) {
      return match.group(1)!;
    } else {
      // If no match is found, handle the case accordingly
      print('Invalid YouTube URL');
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double videoHeight = widget.videoData.height != null
        ? (MediaQuery.of(context).size.height *
            ((widget.videoData.height)! / 100))
        : MediaQuery.of(context).size.height * .22;
    if (widget.videoData.height == 100) {
      videoHeight -= 200;
    }
    if (!widget.videoData.uRL!.contains("you")) {
      return Container(
        color: Utils.getColorFromHex(widget.videoData.backgroundColor!),
        child: Column(
          children: [
            Container(
                height: videoHeight,
                child: widget.videoData.uRL != ""
                    ? SimpleVideoPlayer(
                        widget.videoData.uRL!,
                        autoPlay: widget.videoData.autoplay!,
                      )
                    : Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          AppAssets.noImage,
                          fit: BoxFit.cover,
                        ))),
            HeadingView(
              textColor: widget.videoData.textColor,
              textAlign: "left",
              widget.videoData.heading,
              "",
              widget.videoData.description,
              () {
                return print("read more clicked");
              },
            ),
          ],
        ),
      );
    }

    print("-------------youtube video view ${widget.videoData.toJson()}");
    YoutubePlayerController? _controller;
    if (widget.videoData.uRL != "") {
      _controller = YoutubePlayerController(
        initialVideoId: getYouTubeVideoId(widget.videoData.uRL!),
        flags: YoutubePlayerFlags(
          autoPlay: false, // widget.videoData.autoplay!,
          hideThumbnail: false,
          controlsVisibleAtStart: true,
          forceHD: true,
          disableDragSeek: true,
          hideControls: false,
          loop: false,
          mute: false,
        ),
      );
    }
    return Container(
      color: Utils.getColorFromHex(widget.videoData.backgroundColor!),
      child: Column(
        children: [
          widget.videoData.uRL != ""
              ? Container(
                  child: YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      thumbnail: widget.videoData.coverImage != null &&
                              widget.videoData.coverImage != ""
                          ? Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: WidgetImage(
                                widget.videoData.coverImage!,
                                fit: BoxFit.cover,
                              ))
                          : null,
                      aspectRatio: MediaQuery.of(context).size.width /
                          videoHeight), //  16 / 9),
                )
              : Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    AppAssets.noImage,
                    fit: BoxFit.cover,
                  )),
          HeadingView(
            textAlign: "left",
            widget.videoData.heading,
            "",
            widget.videoData.description,
            () {
              return print("read more clicked");
            },
          ),
          // widget.videoData.heading != ""
          //     ? Container(
          //         margin: EdgeInsets.all(0),
          //         padding: EdgeInsets.all(2),
          //         alignment:
          //             //  widget.videoData.styleProperties!.alignment! == "left" ? Alignment.centerLeft
          //             //     : widget.videoData.styleProperties!.alignment! == "right"
          //             //         ? Alignment.centerRight
          //             //         :
          //             Alignment.center,
          //         child: Text(
          //           widget.videoData.heading!,
          //           style: TextStyle(
          //               fontFamily: 'Cinzel',
          //               // color: headingTextColor,
          //               fontWeight: FontWeight.bold,
          //               fontSize: headingFontSize!),
          //           maxLines:
          //               2, // widget.videoData.styleProperties!.headingTextNoOfLines!,
          //         ),
          //       )
          //     : Container(),
          // LayoutBuilder(builder: (context, size) {
          //   var span = TextSpan(
          //     text: mytext,
          //     style:
          //         TextStyle(fontFamily: 'Cinzel', fontSize: descriptionFontSize),
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

          //   return widget.videoData.videoAltText != ""
          //       ? Column(
          //           children: [
          //             Container(
          //               margin: EdgeInsets.all(0),
          //               padding: EdgeInsets.all(2),
          //               alignment:
          //                   //  widget.videoData.styleProperties!.alignment! == "left"
          //                   //     ? Alignment.centerLeft
          //                   //     : widget.videoData.styleProperties!.alignment! == "right"
          //                   //         ? Alignment.centerRight
          //                   //         :
          //                   Alignment.center,
          //               child: Text.rich(
          //                 span,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                     fontFamily: 'Cinzel',
          //                     // color: descriptionTextColor,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: descriptionFontSize),
          //                 maxLines: descriptionMaxLines,
          //               ),
          //             ),
          //             InkWell(
          //               onTap: () {
          //                 print("read more clicked");

          //                 // Navigator.push(
          //                 //     context,
          //                 //     MaterialPageRoute(
          //                 //         builder: (context) => ItgeekWidgetFullView(
          //                 //             widget.videoData.image!,
          //                 //             widget.videoData.heading!,
          //                 //             widget.videoData.description!,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .alignment,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .headingTextColor,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .descriptionTextColor,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .headingTextFontSize!,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .descriptionTextFontSize!,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .padding!,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .margin!,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .backgroundColor,
          //                 //             widget.videoData.styleProperties!
          //                 //                 .backgroundColor)));
          //               },
          //               child: Text(
          //                 exceeded ? 'Read More' : '',
          //                 style: TextStyle(
          //                     fontFamily: 'Cinzel',
          //                     color: Colors.blue,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 12),
          //               ),
          //             ),
          //           ],
          //         )
          //       : Container();
          // })
        ],
      ),
    );
  }
}
