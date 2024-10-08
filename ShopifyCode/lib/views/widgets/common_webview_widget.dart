import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CommonWebviewWidget extends StatefulWidget {
  String htmlBodyContent;

  CommonWebviewWidget(this.htmlBodyContent);

  @override
  State<CommonWebviewWidget> createState() => _CommonWebviewWidgetState();
}

class _CommonWebviewWidgetState extends State<CommonWebviewWidget> {
  late InAppWebViewController _webViewController;

  double _height = 1;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 200,
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
          _loadContent(widget.htmlBodyContent);
          // controller.getContentHeight().then((height) {
          //   setState(() {
          //     isLoading = false;
          //     debugPrint("---------Height1:  ${height.toString()}-------------");
          //     _height = height!.toDouble();
          //   });
          // });
        }));
  }

  _loadContent(String htmlBodyContent) {
    try {
      // _webViewController.setBackgroundColor(color: customSectionData.backgroundColor);

      String htmlContent = '''
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
          </head> <body> ${htmlBodyContent} </body>
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
      debugPrint('---------webview widget Error loading content: $e-----');
    }
  }
}
