// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/modelClass/boost_ai/boost_ai_model.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shopify_code/theme/app_theme.dart';

// class BoostAIPageViewScreen extends StatefulWidget {
//   BoostAIPageViewScreen(this.handle, this.index, {super.key});
//   final int index;
//   final BoostAIPages handle;

//   @override
//   State<BoostAIPageViewScreen> createState() => _BoostAIPageViewScreenState();
// }

// class _BoostAIPageViewScreenState extends State<BoostAIPageViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               icon: Container(
//                 width: MediaQuery.of(context).size.width * 0.09,
//                 // height: MediaQuery.of(context).size.height * 0.09,
//                 padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
//                 child: SvgPicture.asset("assets/images/arrow-back.svg",
//                     colorFilter: ColorFilter.mode(
//                         AppTheme.appBarTextColor!, BlendMode.srcIn)),
//               ),
//               onPressed: () {
//                 context.pop();
//               }),
//           title: Text(
//             LanguageManager.translations()["Pages"],
//           ),
//         ),
//         body: Container(
//             color: Theme.of(context).colorScheme.background,
//             //  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
//             child: SingleChildScrollView(
//                 child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding:
//                       EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
//                   child: Hero(
//                       tag: LanguageManager.translations()["title"] +
//                           "${widget.index}",
//                       child: Text(
//                         widget.handle.title.toString(),
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 widget.handle.summaryHtml!.isNotEmpty
//                     ? Container(
//                         padding: EdgeInsets.only(
//                             left: 10, right: 10, top: 10, bottom: 0),
//                         child: HtmlWidget('''
//                               <html>
// <head>
// <style>

// body{
//   font-family: Cinzel;
//   color:black ;
// }
// </style>
// <script></script>
// </head>
// <body>
// ${widget.handle.summaryHtml}
// </body>
// </html>
// '''

//                             // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
//                             ),
//                       )
//                     : SizedBox(),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 // Container(
//                 //   padding:
//                 //       EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
//                 //   child: Text(
//                 //     DateTimeUtils.getDateTime(
//                 //         widget.handle..toString()),
//                 //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                 //           fontWeight: FontWeight.bold,
//                 //         ),
//                 //   ),
//                 // ),
//               ],
//             ))));
//   }
// }
