// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class ItgeekWebView extends StatefulWidget {
//   String? link, backgroundColor, appBarColor;
//   ItgeekWebView(this.link, this.backgroundColor, this.appBarColor);

//   @override
//   State<ItgeekWebView> createState() => _ItgeekWebViewState();
// }

// class _ItgeekWebViewState extends State<ItgeekWebView> {
//   late InAppWebViewController _webViewController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.link!, style: TextStyle(
//                               fontFamily: 'Cinzel',color: Colors.white)),
//           // backgroundColor: Util.getColorFromHex(appBarColor!),
//           backgroundColor: Colors.black,
//         ),
//         body: Container(
//             color: Colors.white,
//             child: InAppWebView(

//                 // initialUrlRequest: URLRequest(url: WebUri("https://docs.google.com/gview?embedded=true&url=${widget.link!}")),
//                 initialUrlRequest: URLRequest(url: WebUri(widget.link!)),
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   _webViewController = controller;
//                   print("check${widget.link!.endsWith("pdf")}");
//                   if (widget.link!.contains(".pdf")) {
//                     var newLink =
//                         "https://docs.google.com/viewer?url=${widget.link}";
//                     _loadContent(newLink);
//                   } else {
//                     _loadContent(widget.link!);
//                   }
//                 },
//                 onProgressChanged: (controller, progress) {
                  
//                 },
                
                
//                 )));
//   }

//   _loadContent(String link) {
//     try {
//       // _webViewController.setBackgroundColor(color: webViewData.backgroundColor);
//       _webViewController.loadUrl(urlRequest: URLRequest(url: WebUri(link)));
//     } catch (e) {
//       print('my webview Error loading content: $e');
//     }
//   }
// }
