import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shopify_code/modelClass/data_model.dart';

class ItgeekCustomSectionWebViewWidget extends StatefulWidget {
  CustomSectionData customSectionData;

  ItgeekCustomSectionWebViewWidget(this.customSectionData) {}

  @override
  State<ItgeekCustomSectionWebViewWidget> createState() =>
      _ItgeekCustomSectionWebViewWidgetState();
}

class _ItgeekCustomSectionWebViewWidgetState
    extends State<ItgeekCustomSectionWebViewWidget> {
  late InAppWebViewController _webViewController;

  double _height = 1;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    print(
        "--------------------------------->>>>>>>>>>>?${widget.customSectionData.blockHeight}");
    return Container(
        height: 400, //widget.customSectionData.blockHeight!.toDouble(),
        // height: _height,
        child: InAppWebView(
            // initialUrlRequest: URLRequest(url: WebUri(widget.data!.link!)),
            onLoadStop: (controller, url) async {
          print("=----------->>>>>Stop------->>>>>>${url}");
          // var x = await controller.evaluateJavascript(
          //     source: "document.documentElement.scrollHeight");
          // double? y = double.tryParse(x.toString());
          // debugPrint('---------Height3: parse : $y');
          // controller.getContentHeight().then((height) {
          //   setState(() {
          //     isLoading = false;
          //     debugPrint(
          //         "---------Height2:  ${height.toString()}-------------");
          //     _height = height!.toDouble();
          //   });
          // });
        }, onLoadStart: (controller, url) {
          print("=----------->>>>>Start------->>>>>>${url}");

          setState(() {
            isLoading = true;
          });
        }, onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
          _loadContent(widget.customSectionData);
          // controller.getContentHeight().then((height) {
          //   setState(() {
          //     isLoading = false;
          //     debugPrint("---------Height1:  ${height.toString()}-------------");
          //     _height = height!.toDouble();
          //   });
          // });
        }));
  }

  _loadContent(CustomSectionData customSectionData) {
    try {
      // _webViewController.setBackgroundColor(color: customSectionData.backgroundColor);

      String htmlContent = '''
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
          </head> <body> ${customSectionData.htmlScript} </body>
        </html>
        ''';
      // if (customSectionData.contentType == ViewType.WebViewHtml.name) {
      // String decoded = utf8.decode(base64.decode(bodyContent));
      _webViewController.loadData(
        data: htmlContent,
        mimeType: 'text/html',
        encoding: 'utf8',
      );
      // debugPrint('my webview2${customSectionData.contentType}');
      // } else {
      //   _webViewController.loadUrl(
      //       urlRequest: URLRequest(url: WebUri(customSectionData.link!)));
      // }
    } catch (e) {
      debugPrint('my webview Error loading content: $e');
    }
  }
}
