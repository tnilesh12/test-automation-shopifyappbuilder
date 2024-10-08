import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WebCheckoutScreen extends StatefulWidget {
  String url;

  WebCheckoutScreen(this.url, {super.key});

  @override
  State<WebCheckoutScreen> createState() => _WebCheckoutScreenState();
}

class _WebCheckoutScreenState extends State<WebCheckoutScreen> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print("web url is ..${widget.url}");
    // loading website url
    _controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print("onPageStarted..${url}");
            if (url.contains("thank_you") || url.contains("thank-you")) {
              // context.pop()
              Navigator.of(context).pop(true);
            }
          },
          onPageFinished: (String url) {
            print("onPageFinished..${url}");
            // LoadingDialog.hide(context);
            setState(() {
              isLoading = false;
            });
            if (url.contains("thank_you") || url.contains("thank-you")) {
              // context.pop()
              Navigator.of(context).pop(true);
            }
          },
          onWebResourceError: (WebResourceError error) {
            Dialogs.ErrorAlertInOut(
              context: context,
              message: LanguageManager.translations()['Errorpagenotfound']!,
            );
          },
          onNavigationRequest: (NavigationRequest request) async {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(""),
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
        ),
        body: Container(
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
                          color: Colors.black,
                          backgroundColor: Colors.black.withAlpha(100),
                        ))
                    : Container(),
                Expanded(
                  child: WebViewWidget(
                    controller: _controller,
                  ),
                ),
              ],
            )));
  }
}
