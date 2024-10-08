// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/session/session.dart';
// import '/views/widgets/custom_button.dart';

// class CustomerDataNotFoundScreen extends StatefulWidget {
//   CustomerDataNotFoundScreen({super.key});

//   @override
//   State<CustomerDataNotFoundScreen> createState() =>
//       _CustomerDataNotFoundScreenState();
// }

// class _CustomerDataNotFoundScreenState
//     extends State<CustomerDataNotFoundScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(5),
//                 height: 100,
//                 // width: MediaQuery.of(context).size.width * 0.55,
//                 // height: MediaQuery.of(context).size.width * 0.55,
//                 child: SvgPicture.asset(
//                   "assets/images/user.svg",
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 child: Text(
//                   "User Not Valid!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 25,
//                   ),
//                 ),
//               ),
//               // Container(
//               //   height: MediaQuery.of(context).size.height * 0.1,
//               //   child: Text(
//               //     "Please check your internet connection and try again. ",
//               //     overflow: TextOverflow.ellipsis,
//               //     maxLines: 2,
//               //     textAlign: TextAlign.center,
//               //     style: TextStyle(
//               //       fontSize: 15,
//               //     ),
//               //   ),
//               // ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: CustomButton(
//                   text: LanguageManager.translations()['TryAgain'],
//                   // backgroundColor: Colors.black,
//                   // textColor: Colors.white,
//                   onPressed: () async {
//                     await Session().clearCustomerData();
//                     if (Platform.isAndroid) {
//                       print("exit1");
//                       SystemNavigator.pop();
//                     } else {
//                       print("exit");
//                       exit(0);
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
