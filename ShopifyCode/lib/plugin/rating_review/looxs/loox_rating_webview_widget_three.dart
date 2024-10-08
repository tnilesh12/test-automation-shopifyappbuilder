import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../repository/ApiConst.dart';

class LooxRatingWebViewWidgetThree extends StatefulWidget {
  String productId;

  LooxRatingWebViewWidgetThree(this.productId) {}

  @override
  State<LooxRatingWebViewWidgetThree> createState() => _LooxRatingWebViewWidgetThreeState();
}

class _LooxRatingWebViewWidgetThreeState extends State<LooxRatingWebViewWidgetThree> {
  late InAppWebViewController _webViewController;

  bool isLoading = true;
  double _height = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 30,
        height: _height,
        child: InAppWebView(
            // initialUrlRequest: URLRequest(url: WebUri(widget.data!.link!)),
            onLoadStop: (controller, url) async {
          // var x = await controller.evaluateJavascript(
          //     source: "document.documentElement.scrollHeight");
          // double? y = double.tryParse(x.toString());
          // debugPrint('---------Height3: parse : $y');
          controller.getContentHeight().then((height) {
            setState(() {
              isLoading = false;
              debugPrint(
                  "---------Height2:  ${height.toString()}-------------");
              _height = height!.toDouble();
            });
          });
        }, onLoadStart: (controller, url) {
          setState(() {
            isLoading = true;
          });
        }, onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
          _loadContent(widget.productId);
          // controller.getContentHeight().then((height) {
          //   setState(() {
          //     isLoading = false;
          //     debugPrint("---------Height1:  ${height.toString()}-------------");
          //     _height = height!.toDouble();
          //   });
          // });
        }));
  }

  _loadContent(String productId) {
    try {
      // // _webViewController.setBackgroundColor(color: customSectionData.backgroundColor);

      // String htmlContent = '''
      //   <html>
      //     <head>
      //       <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
      //     </head>
      //     <body>
          
      //      <script async src="https://loox.io/widget/loox.js?shop=${AppConfig.APP_DOMAIN}"></script>
      //     <div class="loox-rating" data-fetch data-id="${customSectionData.replaceAll("gid://shopify/Product/", "")}"></div>
      //     </body>
          
      //   </html>
      //   ''';
      // // if (customSectionData.contentType == ViewType.WebViewHtml.name) {
      // // String decoded = utf8.decode(base64.decode(bodyContent));
      // _webViewController.loadData(
      //   data: htmlContent,
      //   mimeType: 'text/html',
      //   encoding: 'utf8',
      // );
      // // debugPrint('my webview2${customSectionData.contentType}');
      // // } else {
        _webViewController.loadUrl(
            urlRequest: URLRequest(url: Uri.parse(ApiConst.looxAllReview.replaceAll("{product_id}", productId))));
      // // }
    } catch (e) {
      debugPrint('my webview Error loading content: $e');
    }
  }
}
