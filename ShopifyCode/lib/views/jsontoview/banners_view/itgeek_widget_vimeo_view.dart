import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/views/jsontoview/banners_view/heading_View.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class ItgeekWidgetVimeoView extends StatefulWidget {
  VideoData videoData;

  ItgeekWidgetVimeoView(this.videoData, {super.key});

  @override
  State<ItgeekWidgetVimeoView> createState() => _ItgeekWidgetVimeoViewState();
}

class _ItgeekWidgetVimeoViewState extends State<ItgeekWidgetVimeoView> {
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

  // String mytext = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VimeoVideoPlayer(
          url: widget.videoData.uRL
              .toString(), // + getVimeoVideoId().toString(),
          autoPlay: false, // widget.videoData.autoplay!,
          startAt: Duration.zero,
          deviceOrientation: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp
          ],
        ),
        HeadingView(
          textAlign: "left",
          widget.videoData.heading,
          "",
          widget.videoData.description,
          () {
            return print("read more clicked");
          },
        ),
      ],
    );
  }

  // String getVimeoVideoId(String url) {
  //   // Regular expression to match Vimeo video ID
  //   RegExp regExp = RegExp(r'player\.vimeo\.com\/video\/(\d+)');

  //   // Extract video ID using the regex
  //   Match match = regExp.firstMatch(url)!;

  //   // Check if a match is found
  //   if (match != null && match.groupCount > 0) {
  //     return match.group(1)!;
  //   } else {
  //     // If no match is found, handle the case accordingly
  //     print('Invalid Vimeo URL');
  //     return "";
  //   }
  // }
}
