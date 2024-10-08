import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:flutter_video_view/flutter_video_view.dart';

// import 'page_video.dart';

// class SimpleVideoSliderWidget extends StatefulWidget {
//   Function(SimpleImageSlider) OnClick;
//   SimpleImageSliderData simpleImageSliderData;
//   SimpleVideoSliderWidget(this.simpleImageSliderData, this.OnClick);

//   @override
//   State<SimpleVideoSliderWidget> createState() =>
//       _SimpleVideoSliderWidgetState();
// }

// // class _SimpleVideoSliderWidgetState extends State<SimpleVideoSliderWidget> {
// //   final CarouselController carouselController = CarouselController();
// //   int currentIndex = 0;

// //   late VideoPlayerController _controller;
// //   late Future<void> _initializeVideoPlayerFuture;

// //   @override
// //   Widget build(BuildContext context) {
// //     // var myBool = true;
// //     // if (widget.imageBannerSliderData.slideHeight! == "Medium") {
// //     //   //sliderViewType! == "Enlarge") {
// //     //   myBool = true;
// //     // } else {
// //     //   myBool = false;
// //     // }

// //     Color indicatorSelectedColor = AppTheme.primaryLightTextColor!;
// //     Color indicatorUnSelectedColor =
// //         AppTheme.primaryLightTextColor!.withAlpha(80);

// //     double _height = 1;
// //     bool isLoading = true;

// //     List<Widget> carouselItems = [
// //       Container(
// //           // height: 250,
// //           // height: _height,
// //           child: VideoPlayerScreen())
// //     ];

// //     return Container(
// //       height: 200,
// //       color: Colors.red,
// //       // margin: EdgeInsets.fromLTRB(
// //       //     0, DashboardFontSize.marginTop, 0, DashboardFontSize.marginBottom),
// //       child: Stack(
// //         // mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           InkWell(
// //             onTap: () {},
// //             child: CarouselSlider(
// //               items: carouselItems,
// //               carouselController: carouselController,
// //               options: CarouselOptions(
// //                   enlargeCenterPage: false, //myBool,
// //                   autoPlay:
// //                       // bool.parse(widget.simpleImageSliderData.autoSwitchSlides!)??
// //                       false,
// //                   height:
// //                       270, // MediaQuery.of(context).size.height * .20, //180
// //                   // aspectRatio: 0.93, //16 / 9,
// //                   // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
// //                   autoPlayCurve: Curves.linear,
// //                   enlargeStrategy: CenterPageEnlargeStrategy.zoom,
// //                   enableInfiniteScroll: true,
// //                   viewportFraction:
// //                       1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
// //                   // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
// //                   autoPlayInterval: Duration(
// //                     seconds: 3,
// //                   ),
// //                   // seconds: widget.simpleImageSliderData.changeSlidesEvery!),
// //                   onPageChanged: (index, reason) {
// //                     setState(() {
// //                       currentIndex = index;
// //                     });
// //                   }),
// //             ),
// //           ),
// //           widget.simpleImageSliderData.simpleImageSlider!.length > 1
// //               ? Positioned(
// //                   bottom: 5,
// //                   left: MediaQuery.of(context).size.width / 2.1 -
// //                       (widget.simpleImageSliderData.simpleImageSlider!.length *
// //                           5),
// //                   right: MediaQuery.of(context).size.width / 2.1 -
// //                       (widget.simpleImageSliderData.simpleImageSlider!.length *
// //                           5),
// //                   height: 15,
// //                   child: Container(
// //                     width: (widget
// //                             .simpleImageSliderData.simpleImageSlider!.length *
// //                         15),
// //                     height: 12,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(12),
// //                       color: AppTheme.primaryLightTextColor!.withAlpha(30),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: widget.simpleImageSliderData.simpleImageSlider!
// //                           .asMap()
// //                           .entries
// //                           .map((entry) {
// //                         return GestureDetector(
// //                           onTap: () =>
// //                               carouselController.animateToPage(entry.key),
// //                           child: Container(
// //                             width: currentIndex == entry.key ? 7 : 7,
// //                             height: 7,
// //                             margin: const EdgeInsets.symmetric(horizontal: 3.0),
// //                             decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 color: currentIndex == entry.key
// //                                     ? indicatorSelectedColor
// //                                     : indicatorUnSelectedColor),
// //                           ),
// //                         );
// //                       }).toList(),
// //                     ),
// //                   ))
// //               : Container(),
// //         ],
// //       ),
// //     );
// //   }
// // }

class SimpleVideoPlayer extends StatefulWidget {
  String? url;
  bool? autoPlay;
  bool? loop;
  double? height;
  double borderRadius;
  SimpleVideoPlayer(this.url,
      {this.autoPlay, this.loop, this.height, this.borderRadius = 0, super.key});

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers sever different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url.toString()
          // 'https://www.nahlamadisonhome.com/cdn/shop/videos/c/vp/3c6490b6c8844a8bb5a08f16d68a4994/3c6490b6c8844a8bb5a08f16d68a4994.HD-1080p-3.3Mbps-32021452.mp4?v=0',
          // 'https://mobilify.nyc3.cdn.digitaloceanspaces.com/itg-app/big_buck_bunny_720p_2mb.mp4'
          ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    widget.loop == true ? _controller.setLooping(true) : "";
    // _controller.play();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return Container(
            height: widget.height == null || widget.height == 0
                ? 250
                : widget.height,
            // aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: VideoPlayer(_controller)),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: IconButton(
                    iconSize: 45,
                    onPressed: () {
                      // Wrap the play or pause in a call to `setState`. This ensures the
                      // correct icon is shown.
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ))
            ]),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
