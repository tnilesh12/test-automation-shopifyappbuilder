import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/route/go_routes.dart';
import 'package:publicapp/route/theme2.dart';
import 'package:shopify_code/util/routes.dart';
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
    debugPrint("------widget.url........${widget.url}");
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
            print("----------------->>>>SECTION REMOVER>>>>>${url}");
            _controller.runJavaScript("""
  function removeElements() {
    // Remove elements by tag name
    var headers = document.getElementsByTagName('header');
    for (var i = 0; i < headers.length; i++) {
      headers[i].style.display = 'none';
    }
    
    var footers = document.getElementsByTagName('footer');
    for (var i = 0; i < footers.length; i++) {
      footers[i].style.display = 'none';
    }

    // Remove elements by class name and tag
    
   
   var siteHeaders = document.getElementsByClassName('sc-kqGpvY nmGRv pf-41_ pf-color-scheme-1');
    var headings = document.getElementsByTagName('div');
    
    Array.from(siteHeaders).forEach(function(siteHeader) {
      Array.from(headings).forEach(function(heading) {
        if (siteHeader === heading) {
          siteHeader.style.display = 'none';
        }
      });
    });
    
   
  }
  
  var interval = setInterval(function() {
    removeElements();
  }, 10);
   setTimeout(function() {
    clearInterval(interval);
  }, 5000);
 
""");
            print("--------------start ${url}");
          },
          onPageFinished: (String url) {
            print("--------------start ${url}");
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
            print("-------asd-------${request.url}");
            if (request.url.contains("products")) {
              final lastSegment = extractLastSegment(request.url);
              print(request.url +
                  "--------------navigation print " +
                  lastSegment);
              // widget.onClick.call(lastSegment);

              ProductDetailsScreen productDetailsScreen =
                  ProductDetailsScreen(lastSegment);

              _controller.setJavaScriptMode(JavaScriptMode.disabled);
              context.push("/${Routes.productDetailsScreen}",
                  extra: productDetailsScreen);
              return NavigationDecision.prevent;
            } else if (request.url.contains("collections")) {
              final handle = extractLastSegment(request.url);
              print(request.url + "--------------navigation print " + handle);
              ProductListScreen productListScreen =
                  ProductListScreen(handle, "");
              _controller.setJavaScriptMode(JavaScriptMode.disabled);
              context.push("/${Routes.productListScreen}",
                  extra: productListScreen);
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
        ),
      );
    print(
        "-------------------------------------------url------------------------------ ${url}");
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

  String extractLastSegment(String url) {
    final segments = Uri.parse(url).pathSegments;
    return segments.isNotEmpty ? segments.last : '';
  }
}
