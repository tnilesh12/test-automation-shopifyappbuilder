import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetScrollingText extends StatefulWidget {
  final ScrollingTextData scrollingTextData;
  final double ratioOfBlankToScreen;

  ItgeekWidgetScrollingText(this.scrollingTextData,
      {this.ratioOfBlankToScreen = 0 // 0.25,
      });

  @override
  State<StatefulWidget> createState() {
    return ItgeekWidgetScrollingTextState();
  }
}

class ItgeekWidgetScrollingTextState extends State<ItgeekWidgetScrollingText> {
  ScrollController? scrollController;
  double? screenWidth;
  Timer? timer;
  double _moveDistance = 0.0;
  final int _timerRest = 50; // Adjust as needed
  double durationInSeconds = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((callback) {
      durationInSeconds = widget.scrollingTextData.scrollingSpeed!.toDouble();
      startTimer();
      calculateMoveDistance();
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
      double maxScrollExtent = scrollController!.position.maxScrollExtent;
      double pixels = scrollController!.position.pixels;
      if (pixels + _moveDistance >= maxScrollExtent) {
        scrollController!.jumpTo(0.0);
      }
      scrollController!.animateTo(pixels + _moveDistance,
          duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
    });
  }

  void calculateMoveDistance() {
    if (screenWidth != null) {
      double maxScrollExtent = scrollController!.position.maxScrollExtent;
      double availableWidth = screenWidth! * (1 - widget.ratioOfBlankToScreen);
      double textWidth = maxScrollExtent - availableWidth;
      _moveDistance = textWidth / (durationInSeconds * 1000 / _timerRest);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  Widget getBothEndsChild(ScrollingList data) {
    return Center(
      child: Container(
        height: widget.scrollingTextData.style == "Style_1" ? 42 : 32, //42,
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        color: Utils.getColorFromHex(data.backgroundColor!),
        child: Text(
          data.text!,
          style: TextStyle(
            fontSize: widget.scrollingTextData.style == "Style_1"
                ? DashboardFontSize.scrollingTextSize
                : DashboardFontSize.headingFontSize,
            color: Utils.getColorFromHex(data.textColor!),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget getCenterChild() {
    return Container(width: screenWidth! * widget.ratioOfBlankToScreen);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.scrollingTextData.style == "Style_1"
        ? Container(
            height: 62,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                for (ScrollingList data
                    in widget.scrollingTextData.scrollingList!)
                  getBothEndsChild(data),
                getCenterChild(),
                for (ScrollingList data
                    in widget.scrollingTextData.scrollingList!)
                  getBothEndsChild(data),
              ],
            ),
          )
        : Container(
            height: 32,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                for (ScrollingList data
                    in widget.scrollingTextData.scrollingList!)
                  getBothEndsChild(data),
                getCenterChild(),
                for (ScrollingList data
                    in widget.scrollingTextData.scrollingList!)
                  getBothEndsChild(data),
              ],
            ),
          );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/modelClass/data_model.dart';
// import 'package:shopify_code/util/utils.dart';

// class ItgeekWidgetScrollingText extends StatefulWidget {
//   ScrollingTextData scrollingTextData;
//   // final List<Map<String, String>> texts;
//   // final TextStyle textStyle;
//   final double ratioOfBlankToScreen;

//   ItgeekWidgetScrollingText(this.scrollingTextData,
//       {this.ratioOfBlankToScreen = 0 // 0.25,
//       }); // : assert(texts != null && texts.isNotEmpty);

//   TextStyle textStyle = TextStyle();

//   @override
//   State<StatefulWidget> createState() {
//     return ItgeekWidgetScrollingTextState();
//   }
// }

// class ItgeekWidgetScrollingTextState extends State<ItgeekWidgetScrollingText>
//     with SingleTickerProviderStateMixin {
//   ScrollController? scrollController;
//   double? screenWidth;
//   double position = 0.0;
//   Timer? timer;
//   double _moveDistance = 3.0;
//   final int _timerRest = 100;
//   GlobalKey _key = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     WidgetsBinding.instance!.addPostFrameCallback((callback) {
//       startTimer();
//       _moveDistance =
//           double.parse(widget.scrollingTextData.scrollingSpeed.toString());
//     });
//   }

//   void startTimer() {
//     if (_key.currentContext != null) {
//       double widgetWidth =
//           _key.currentContext!.findRenderObject()!.paintBounds.size.width;

//       timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
//         double maxScrollExtent = scrollController!.position.maxScrollExtent;
//         double pixels = scrollController!.position.pixels;
//         if (pixels + _moveDistance >= maxScrollExtent) {
//           position = (maxScrollExtent -
//                       screenWidth! * widget.ratioOfBlankToScreen +
//                       widgetWidth) /
//                   2 -
//               widgetWidth +
//               pixels -
//               maxScrollExtent;
//           scrollController!.jumpTo(position);
//         }
//         position += _moveDistance;
//         scrollController!.animateTo(position,
//             duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
//       });
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     screenWidth = MediaQuery.of(context).size.width;
//   }

//   // Widget getBothEndsChild(Map<String, String> data) {
//   Widget getBothEndsChild(ScrollingList data) {
//     // print("bg${data['BackgroundColor']}");
//     // print("bg${data['text']}");
//     // print("fontColor${data['fontColor']}");
//     return Center(
//       child: Container(
//         padding: EdgeInsets.only(left: 10, right: 10,top: 5,bottom: 5),
//         color: Utils.getColorFromHex(data.backgroundColor!),
// //Color(int.parse(data['backgroundColor']!, radix: 16)),
//         child: Text(
//           data.text!,
//           style: widget.textStyle.copyWith(
//             color: Utils.getColorFromHex(data.textColor!),
//             // color: Color(int.parse(data['fontColor']!, radix: 16)),
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }

//   Widget getCenterChild() {
//     return Container(width: screenWidth! * widget.ratioOfBlankToScreen);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     if (timer != null) {
//       timer!.cancel();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//       height: 32,
//       child: ListView(
//         key: _key,
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         controller: scrollController,
//         physics: NeverScrollableScrollPhysics(),
//         children: <Widget>[
//           // for (Map<String, String> data in widget.texts) getBothEndsChild(data),
//           for (ScrollingList data in widget.scrollingTextData.scrollingList!)
//             getBothEndsChild(data),
//           getCenterChild(),
//           // for (Map<String, String> data in widget.texts) getBothEndsChild(data),
//           for (ScrollingList data in widget.scrollingTextData.scrollingList!)
//             getBothEndsChild(data),
//         ],
//       ),
//     );
//   }
// }
