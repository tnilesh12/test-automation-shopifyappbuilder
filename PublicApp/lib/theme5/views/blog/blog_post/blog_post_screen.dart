// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/modelClass/src/article/article.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:shopify_code/theme/app_theme.dart';
// import 'package:shopify_code/views/widgets/widget_image.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';

// class BlogPostScreen extends StatefulWidget {
//   BlogPostScreen(this.handle, this.index, {super.key});
//   final int index;
//   final Article handle;

//   @override
//   State<BlogPostScreen> createState() => _BlogPostScreenState();
// }

// class _BlogPostScreenState extends State<BlogPostScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             LanguageManager.translations()['Blog Post']!,
//           ),
//           leading: IconButton(
//               icon: Container(
//                 width: 35, //MediaQuery.of(context).size.width * 0.09,
//                 height: 35, //MediaQuery.of(context).size.height * 0.09,
//                 padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
//                 child: SvgPicture.asset("assets/images/arrow-back.svg",
//                     colorFilter: ColorFilter.mode(
//                         AppTheme.appBarTextColor!, BlendMode.srcIn)),
//               ),
//               onPressed: () {
//                 context.pop();
//               }),
//         ),
//         body: Container(
//             // color: Theme.of(context).colorScheme.background,
//             //  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
//             child: SingleChildScrollView(
//                 child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             widget.handle.image != null
//                 ? Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height / 2,
//                     child: Hero(
//                         tag:
//                             "${LanguageManager.translations()['image']!}${widget.index}",
//                         child: WidgetImage(
//                           widget.handle.image!.originalSrc!,
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height,
//                         )),
//                   )
//                 : Container(),
//             Container(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
//               child: Hero(
//                   tag:
//                       "${LanguageManager.translations()['title']!}${widget.index}",
//                   child: Text(
//                     widget.handle.title.toString(),
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   )),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
//               child: Html(data: '''
//                         <html>
//                         <head>
//                         <style>
//                         body{
//                         }
//                         </style>
//                         </head>
//                         <body>
//                         ${widget.handle.contentHtml}
//                         </body>
//                         </html>
//                       '''
//                   // body{
//                   //   font-family: Cinzel;
//                   //   color:black;
//                   // }
//                   // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
//                   ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ))));
//   }
// }
