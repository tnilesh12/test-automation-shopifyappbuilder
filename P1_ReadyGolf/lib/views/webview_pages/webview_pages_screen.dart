import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WebViewPagesScreen extends StatelessWidget {
  String title = '', url = '', body = '';

  WebViewPagesScreen(
      {super.key,
      required String titleMain,
      required String urlToLoad,
      required String bodyTags}) {
    title = titleMain;
    url = urlToLoad;
    body = bodyTags;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
              icon: Container(
                width: 35, //MediaQuery.of(context).size.width * 0.09,
                height: 35, //MediaQuery.of(context).size.height * 0.09,
                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                child: SvgPicture.asset("assets/images/arrow-back.svg",
                    colorFilter: ColorFilter.mode(
                        AppTheme.appBarTextColor!, BlendMode.srcIn)),
              ),
              onPressed: () {
                context.pop();
              }),
          title: Text(title),
        ),
        body: WebViewPagesScreenBody(
          titleMain: title,
          bodyTags: body,
          urlToLoad: url,
        ));
  }
}

class WebViewPagesScreenBody extends StatefulWidget {
  String title = '', url = '', body = '';
  WebViewPagesScreenBody(
      {super.key,
      required String titleMain,
      required String urlToLoad,
      required String bodyTags}) {
    title = titleMain;
    url = urlToLoad;
    body = bodyTags;
  }

  @override
  State<WebViewPagesScreenBody> createState() => _WebViewPagesScreenBodyState();
}

class _WebViewPagesScreenBodyState extends State<WebViewPagesScreenBody> {
  late final WebViewController _controller;
  late WebViewController webViewControllerr;

  @override
  void initState() {
    super.initState();
    debugPrint("widget.url........${widget.url}");
    webViewManager(widget.url);
  }

  // loading website url
  Future<void> webViewManager(String url) async {
    _controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {
          //   // Update loading bar.
          // },
          onPageStarted: (String url) {
            print("start ${url}");
          },
          onPageFinished: (String url) {
            print("start ${url}");
          },
          // onWebResourceError: (WebResourceError error) {
          // LoadingDialog.hide(context);
          // Dialogs.ErrorAlertInOut(
          //     context: context,
          //     message:
          //         "Error page not found" //AppLocalizations.of(context)!.errorpagenotfound
          //     );
          // },
          onNavigationRequest: (NavigationRequest request) async {
            return NavigationDecision.navigate;
          },
        ),
      );
    print(
        "----------------------------------------url------------------------------ ${url}");
    widget.body.isNotEmpty ? _controller.loadHtmlString("""
      <!DOCTYPE html>
        <html>
          <head>
          <link rel="preconnect" href="https://fonts.googleapis.com">
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
          <link href="https://fonts.googleapis.com/css2?family=${AppTheme.bodyFont}&display=swap" rel="stylesheet">
          <meta name="viewport" content="width=device-width, initial-scale=0.8">
           <style>
           .change
            {
            font-family: '${AppTheme.bodyFont}', serif;
            }
             </style> 
            </head>
            <body class="change" style='"margin: 0; padding: 0;'>
            ${widget.body}
          </body>
        </html>
      """) : _controller.loadRequest(Uri.parse(url));

    webViewControllerr = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: widget.body.isEmpty ? EdgeInsets.all(0) : EdgeInsets.all(10),
        child: WebViewWidget(
          controller: _controller,
        ));
  }
}
