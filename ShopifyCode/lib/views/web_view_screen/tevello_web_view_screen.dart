import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/session/session.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TevelloWebViewScreen extends StatelessWidget {
  String title = '', url = '';
  // Function(String) onClick;

  TevelloWebViewScreen(
      // this.onClick,
      {
    super.key,
    required String titleMain,
    required String urlToLoad,
  }) {
    title = titleMain;
    url = urlToLoad;
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
        body: TevelloWebViewScreenBody(
          (productHandle) {},
          urlToLoad: url,
        ));
  }
}

class TevelloWebViewScreenBody extends StatefulWidget {
  String url = '';
  final Function(String) onClick;
  TevelloWebViewScreenBody(this.onClick,
      {super.key, required String urlToLoad}) {
    url = urlToLoad;
  }

  @override
  State<TevelloWebViewScreenBody> createState() =>
      _TevelloWebViewScreenBodyState();
}

class _TevelloWebViewScreenBodyState extends State<TevelloWebViewScreenBody> {
  late final WebViewController _controller;
  late WebViewController webViewControllerr;
  bool isLoading = true;
  String? customerId;

  Future<void> loadData() async {
    ShopifyUser? user = await Session().getLoginData();
    customerId = user!.shopifyId!;
    customerId = customerId!.replaceAll("gid://shopify/Customer/", "");
    widget.url = widget.url.replaceAll("{customer_id}", customerId!);
    debugPrint("widget.url........${widget.url}");
    // await webViewManager(widget.url);
  }

  @override
  void initState() {
    super.initState();
    loadData().then((value) {
      webViewManager(widget.url);
    });
    // debugPrint("widget.url........${widget.url}");
    // webViewManager(widget.url);
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
            debugPrint(
                "-----------aa----------onPageStarted ${url}----------------");
          },
          onPageFinished: (String url) {
            // LoadingDialog.hide(context);
            debugPrint(
                "-----------aa----------onPageFinished ${url}----------------");
            setState(() {
              isLoading = false;
            });
          },
          onHttpAuthRequest: (request) {
            debugPrint(
                "-----------aa-----------onHttpAuthRequest ${request.host}--${request.onCancel}--${request.onProceed}--${request.realm}----------");
          },
          // onHttpError: (error) {
          //   debugPrint(
          //       "-----------aa----------onHttpError ${error}----------------");
          // },
          onProgress: (progress) {
            debugPrint(
                "-----------aa---------onProgress ${progress}----------------");
          },
          onUrlChange: (change) {
            debugPrint(
                "-----------aa---------onUrlChange ${change.url}----------------");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint(
                "-----------aa-------onWebResourceError ${error}----------------");
            // LoadingDialog.hide(context);
            // Dialogs.ErrorAlertInOut(
            //     context: context,
            //     message:
            //         "Error page not found" //AppLocalizations.of(context)!.errorpagenotfound
            //     );
          },

          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains('members')) {
              // I was tring to use webviewController to reload the url, but this creates a loop that kept reloading the webview :(

              String updatedUrl =
                  "${request.url}?${ApiConst.tevelloEndUrl.replaceAll("{customer_id}", customerId!)}";
              webViewControllerr.loadRequest(Uri.parse(updatedUrl));
              return NavigationDecision.prevent;
            }
            if (request.url.contains("products")) {
              final lastSegment = extractLastSegment(request.url);
              print(request.url + "dsjfdsfdsjfdsfdskjf " + lastSegment);
              widget.onClick.call(lastSegment);
              return NavigationDecision.prevent;
            }

            debugPrint(
                "-----------aa-------onNavigationRequest ${request}----------------");
            return NavigationDecision.navigate;
          },
        ),
      );
    _controller.loadRequest(Uri.parse(url));

    webViewControllerr = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            isLoading
                ? Container(
                    margin: EdgeInsets.only(top: 0, bottom: 10),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      backgroundColor: Colors.black.withAlpha(100),
                    ))
                : Expanded(
                    child: WebViewWidget(
                      controller: _controller,
                    ),
                  ),
          ],
        ));
  }

  String extractLastSegment(String url) {
    final segments = Uri.parse(url).pathSegments;
    return segments.isNotEmpty ? segments.last : '';
  }
}
