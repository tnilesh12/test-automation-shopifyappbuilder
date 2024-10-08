import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/globels.dart' as globals;

class ChatScreenShopifyInboxScreen extends StatelessWidget {
  String? url;
  bool showappbar;
  ChatScreenShopifyInboxScreen(this.url, {this.showappbar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showappbar) {
      return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(LanguageManager.translations()['chat']),
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
          body: ChatScreenShopifyInboxScreenBody(url!.replaceAll(
              "{partner_id}", globals.partnerInfoModel.sId.toString())));
    } else {
      return ChatScreenShopifyInboxScreenBody(url!
          .replaceAll("{partner_id}", globals.partnerInfoModel.sId.toString()));
    }
  }
}

class ChatScreenShopifyInboxScreenBody extends StatefulWidget {
  String url;
  ChatScreenShopifyInboxScreenBody(this.url, {super.key});

  @override
  State<ChatScreenShopifyInboxScreenBody> createState() =>
      _ChatScreenShopifyInboxScreenBodyState();
}

class _ChatScreenShopifyInboxScreenBodyState
    extends State<ChatScreenShopifyInboxScreenBody> {
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
            _controller.runJavaScript(""
                "var element = document.getElementsByClassName('chat-header__close_button_mobile');console.log(element);element[0].viewBox = '0,0,0,0';");
            // " document.getElementsByClassName('chat-header__close_button_mobile')[0].style.display = 'none';");
            //     _controller.runJavaScript("var link = document.getElementsByName('closeChat')[0];link.style.display = 'none';");
          },
          onPageFinished: (String url) {
            print("onPageFinished..${url}");
            // LoadingDialog.hide(context);
            //  _controller.runJavaScript(""
            //      "var element = document.getElementById('shopify-chat').shadowRoot;"
            //      "alert(element);");

            String jsCode = """
      (function() {
        function sendMessage(detail) {
          ButtonClickChannel.postMessage(detail);
        }

        function monitorShadowDom(element) {
          // Observe for button clicks within the shadow DOM
          element.shadowRoot.addEventListener('click', function(event) {
            var target = event.target;
            if (target.tagName.toLowerCase() === 'button') {
              sendMessage('Button ID: ' + (target.id || 'N/A') + ', Text: ' + target.innerText);
            }
          });
        }

        // Monitor the document for shadow DOMs
        document.querySelectorAll('*').forEach(function(element) {
          if (element.shadowRoot) {
            monitorShadowDom(element);
          }
        });

        // Observe new shadow DOMs being added to the document
        const observer = new MutationObserver((mutationsList, observer) => {
          mutationsList.forEach((mutation) => {
            mutation.addedNodes.forEach((node) => {
              if (node.shadowRoot) {
                monitorShadowDom(node);
              }
            });
          });
        });

        observer.observe(document, { childList: true, subtree: true });
      })();
    """;

            _controller.runJavaScript(jsCode);
            setState(() {
              isLoading = false;
            });
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _injectJavaScript();
    });
  }

  void _injectJavaScript() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
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
        ));
  }
}
