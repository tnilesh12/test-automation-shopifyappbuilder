// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/theme/app_assets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shopify_code/theme/app_theme.dart';
// import '/theme3/views/widgets/common/custom_button.dart';
// import '/theme3/views/widgets/common/custom_dialog_button.dart';
// import '/theme3/views/widgets/common/custom_textfield.dart';

// class NoDataView12 extends StatelessWidget {
//   String? svg;
//   String? title;
//   String? buttonTitle;
//   Function? onTap;
//   NoDataView12(this.svg, this.title, {this.buttonTitle, this.onTap, super.key});

//   getColor(Color svgColor) {
//     if (svgColor.toString().length > 0) {
//       try {
//         // Color c = Color.fromARGB(
//         //   svgColor.alpha,
//         //   svgColor.red,
//         //   svgColor.green,
//         //   svgColor.blue,
//         // );
//         return svgColor
//             .toString()
//             .substring(10, svgColor.toString().length - 1);
//       } catch (e) {
//         print("color code issue " + e.toString());

//         return "";
//       }
//     } else {
//       return "";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("----->>>" + svg! + "------->>>" + title! + "-------->>>>"
//         // buttonTitle! +
//         // "----------------->>>>>" +
//         // onTap!()
//         );
//     // Color c = Color.fromARGB(
//     //   AppTheme.bottomNavigationSelectedBackgroundColor!.alpha,
//     //   AppTheme.bottomNavigationSelectedBackgroundColor!.red,
//     //   AppTheme.bottomNavigationSelectedBackgroundColor!.green,
//     //   AppTheme.bottomNavigationSelectedBackgroundColor!.blue,
//     // );

//     // print("appp---------------------#########color" +
//     //     c.toString() +
//     //     "------------>" +
//     //     c.toString().substring(10, c.toString().length - 1));
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             getColor(AppTheme.primaryButtonBackground!) == ""
//                 ? SvgPicture.string(
//                     svg!.replaceAll("407BFF", "a5a795"),
//                     height: 100,
//                   )
//                 : SvgPicture.string(
//                     svg!.replaceAll(
//                         "407BFF", getColor(AppTheme.primaryButtonBackground!)
//                         // c.value.toString().substring(4, c.value.toString().length
//                         // )
//                         // AppTheme.bottomNavigationSelectedBackgroundColor
//                         //     .toString()
//                         //     .substring(-5)
//                         ),
//                     height: 300
//                     // getColor(AppTheme.bottomNavigationSelectedBackgroundColor!))
//                     // AppTheme.bottomNavigationSelectedBackgroundColor.toString()),
//                     // colorFilter:
//                     //     ColorFilter.mode(AppTheme.!, BlendMode.srcIn),
//                     ),
//             title != null
//                 ? Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Text(title! + " !",
//                         // LanguageManager.translations()[
//                         //     title]!, // AppLocalizations.of(context)!.nodatafoundpleasetryagain,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize:
//                               Theme.of(context).textTheme.titleMedium!.fontSize,
//                           // color: AppTheme.lightBorder
//                         )),
//                   )
//                 : Container(),
//             onTap != null
//                 ? CustomButton(
//                     text: buttonTitle!,
//                     onPressed: () {
//                       onTap!();
//                     },
//                   )
//                 : Container()
//           ],
//         ));
//   }
// }
