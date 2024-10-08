// import 'package:flutter/material.dart';
// import 'package:shopify_code/util/utils.dart';
// // import '/localizations/localization_cubit.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:shopify_code/language/localization_cubit.dart';
// import '/main.dart';
// import 'package:shopify_code/theme/app_theme.dart';
// import 'package:shopify_code/theme/theme_cubit.dart';
// import 'package:shopify_code/form/form_builder.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/views/chat/chat.dart';
// import 'package:shopify_code/util/firebase_cloud_message_util.dart';

// class SettingScreen extends StatefulWidget {
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   bool isDarkMode = false;

//   bool reviewsEnabled = true;

//   String selectedLanguage = "en";

//   // @override
//   List<Map<String, String>> languageList = [
//     {"val": "en", "title": "English"},
//     {"val": "hi", "title": "Hindi"},
//     {"val": "es", "title": "Spanish"}
//   ];

//   String? deviceId;

//   // String a = Helper.getId();
//   @override
//   Widget build(BuildContext context) {
//     Utils.getId().then((value) {
//       setState(() {
//         deviceId = value.toString();
//       });
//     } );

//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Settings"),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             color: Theme.of(context).colorScheme.background,
//             // padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Text("Unique Device ${deviceId}"),
                
//                 // SwitchListTile(
//                 //   value: isDarkMode,
//                 //   onChanged: (value) {
//                 //     isDarkMode = value;
//                 //     context.read<ThemeCubit>().toggleTheme();
//                 //   },
//                 //   //  thumbIcon: MaterialStateProperty.all(
//                 //   //     Util.isDarkMode() ? Icon(Icons.light_mode_outlined,  color: AppTheme.primaryDarkBackgroundColor,) : Icon(Icons.dark_mode_outlined)
//                 //   //   ),
//                 //   title: Text(LanguageManager.translations()['darkMode']!),
//                 // ),
//                 Divider(
//                   height: 1,
//                 ),
//                 // Container(
//                 //   padding: EdgeInsets.all(20),
//                 //   child: Row(
//                 //     children: [
//                 //       Expanded(
//                 //           child: Text(
//                 //               LanguageManager.translations()['language']!)),
//                 //       Expanded(
//                 //           child: ListView.builder(
//                 //         shrinkWrap: true,
//                 //         itemCount: languageList.length,
//                 //         itemBuilder: (context, index) {
//                 //           // return RadioListTile(
//                 //           //     title: Text(languageList[index]['title']!),
//                 //           //     value: languageList[index]['val'],
//                 //           //     groupValue: selectedLanguage,
//                 //           //     onChanged: (value) {
//                 //           //       selectedLanguage = value.toString();
//                 //           //       context
//                 //           //           .read<LocalizationCubit>()
//                 //           //           .toggleLanguage(Locale(selectedLanguage));
//                 //           //     });

//                 //           final languageCode = supportedLanguages[index];
//                 //           return RadioListTile<String>(
//                 //             title: Text(languageNames[languageCode]!),
//                 //             value: languageCode,
//                 //             groupValue: selectedLanguage,
//                 //             onChanged: (value) {
//                 //               // setState(() {
//                 //               selectedLanguage = value!;
//                 //               context
//                 //                   .read<LocalizationCubit>()
//                 //                   .toggleLanguage(Locale(selectedLanguage));
//                 //               print("selectedLanguage$selectedLanguage");
//                 //               print("Locale${Locale(selectedLanguage)}");
//                 //               LanguageManager.changeLanguage(value);
//                 //               // });
//                 //             },
//                 //           );
//                 //         },
//                 //       ))
//                 //     ],
//                 //   ),
//                 // ),
//                 Divider(
//                   height: 1,
//                 ),
//                 // CheckboxListTile(
//                 //   value: reviewsEnabled,
//                 //   onChanged: (value){
//                 //     reviewsEnabled = value!;
//                 //   }
//                 // )

//                 ElevatedButton(
//                     onPressed: () {
//                       // FirebaseCloudMessageUtil.getInitialMessage(
//                       //     navigatorKey.currentContext!);
//                     },
//                     child: Text("show initalized notification")),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => ChatApp()));
//                     },
//                     child: Text("test2")),
//                 // Container(
//                 //   child: RatingAndReview().ratingandreview(context),
//                 // ),
//                 // FormWidget()
//               ],
//             ),
//           ),
//         ));
//   }
// }
