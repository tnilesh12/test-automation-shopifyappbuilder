// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '/theme5/views/common_screens/api_failure.dart';
// import '/theme5/views/pages/bloc/pageByIdBloc.dart';
// import '/theme5/views/widgets/custome_page_from_json.dart';
// import '../../../utils/loading_dialog.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'bloc/pageByIdState.dart';

// class PageByIdScreen extends StatefulWidget {
//   String id;
//   String? title;

//   PageByIdScreen(this.id,this.title, {super.key});

//   @override
//   State<PageByIdScreen> createState() => _PageByIdScreenState();
// }

// class _PageByIdScreenState extends State<PageByIdScreen> {
//   WebViewController? _controller;
//   WebViewController? webViewControllerr;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: AppTheme.primaryColor,
//       appBar: AppBar(
      
//         title: Text(widget.title!.toString(),style: TextStyle(fontFamily: 'Cinzel'), ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//               color: Theme.of(context).colorScheme.background,
//           child: BlocProvider(
//             create: (context) => PageScreenByIdBloc(widget.id),
//             child: BlocBuilder<PageScreenByIdBloc, PageScreenByIdState>(
//                 builder: (context, state) {
//               if (state is PageScreenByIdAPIFailureState) {
//                 return APIFailureScreens(state.message);
//               } else if (state is PageScreenByIdHtmlState) {
//                 // webViewManager(state.data["body_html"]);
//                 // return WebViewWidget(controller: _controller!);
//                 return CustomePageFromJson().GetWidget(context, widget.title!.toString().replaceAll(" ", "_"));
//               } else if (state is PageScreenByIdJsonState) {
//                 return CustomePageFromJson().GetWidget(context, widget.title!.toString().replaceAll(" ", "_"));
//               } else {
//                 // return NoDataView();
//                 return CustomePageFromJson().GetWidget(context, widget.title!.toString().replaceAll(" ", "_"));
//               }
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   webViewManager(String body) {
//     _controller = WebViewController()
//       ..enableZoom(false)
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {
//             LoadingDialog.show(context);
//           },
//           onPageFinished: (String url) {
//             LoadingDialog.hide(context);
//           },
//           onWebResourceError: (WebResourceError error) {
//             LoadingDialog.hide(context);
//             Dialogs.ErrorAlertInOut(
//                 context: context, message: AppLocalizations.of(context)!.errorpagenotfound);
//           },
//           onNavigationRequest: (NavigationRequest request) async {
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadHtmlString("""
//       <!DOCTYPE html>
//         <html>
//           <head><meta name="viewport" content="width=device-width, initial-scale=0.8"></head>
//           <body style='"margin: 0; padding: 0;'>
//             ${body}
//           </body>
//         </html>
//       """);

//     // ..loadRequest(Uri.parse(url));

//     webViewControllerr = _controller;
//   }
// }
