import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/language/localization_cubit.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_SETTING.name);
    ////////////////////////////
  }

  //  String dropdownValue = list.first;
  bool isDarkMode = false;
  String selectedLanguage = LanguageManager.currentLanguageCode.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // backgroundColor: AppTheme.primaryColor,
        title: Text(
          LanguageManager.translations()["Settings"],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(LanguageManager.translations()["Features"],
          //     style:
          //         CustomTextTheme.getTextStyle(MyTextStyle.Heading, context)),
          // SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // Text(
          //       //   " Dark Mode",
          //       //                 style: CustomTextTheme.getTextStyle(MyTextStyle.SettingDefault, context)
          //       // ),
          //       // Switch(
          //       //   activeColor: AppTheme.white,
          //       //   activeTrackColor: AppTheme.black,
          //       //   inactiveThumbColor: Colors.blueGrey.shade600,
          //       //   inactiveTrackColor: Colors.grey.shade400,
          //       //   splashRadius: 50.0,
          //       //   value: forAndroid,
          //       //   onChanged: (value) => setState(() => forAndroid = value),
          //       // ),
          //     ],
          //   ),
          // ),
          // Divider(),
          // SizedBox(
          //   height: 30,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Language",
          //                       style: CustomTextTheme.getTextStyle(MyTextStyle.SettingDefault, context)
          //       ),
          //       DropdownMenu<String>(
          //         initialSelection: list.first,
          //         onSelected: (String? value) {
          //           setState(() {
          //             dropdownValue = value!;
          //           });
          //         },
          //         dropdownMenuEntries:
          //             list.map<DropdownMenuEntry<String>>((String value) {
          //           return DropdownMenuEntry<String>(value: value, label: value);
          //         }).toList(),
          //       ),
          //     ],
          //   ),
          // ),
          // // Divider(),

          //-------------------dark mode-------------------------
          // SwitchListTile(
          //   inactiveTrackColor: AppTheme.primaryButtonBackground,
          //   inactiveThumbColor: AppTheme.primaryButtonText,
          //   value: isDarkMode,
          //   onChanged: (value) {
          //     isDarkMode = value;
          //     context.read<ThemeCubit>().toggleTheme();
          //   },
          //   // thumbIcon: MaterialStateProperty.all(isDarkMode
          //   //     ? Icon(
          //   //         Icons.light_mode_outlined,
          //   //         color: AppTheme.primaryDarkBackgroundColor,
          //   //       )
          //   //     : Icon(Icons.dark_mode_outlined,
          //   //         color: Colors
          //   //             .grey.shade200 //AppTheme.primaryDarkBackgroundColor
          //   //         )),
          //   title: Text(
          //     LanguageManager.translations()["darkMode"],
          //     style: Theme.of(context)
          //         .textTheme
          //         .titleSmall!
          //         .copyWith(fontWeight: FontWeight.bold),
          //   ),
          // ),
          Divider(
            height: 1,
          ),
          globals.Settings.containsKey(SettingsEnum.Localization.name)
              ? Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 12, top: 10, bottom: 10, right: 12),
                        child: Text(LanguageManager.translations()['language']!,
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.Heading, context))),
                    globals.Settings.containsKey(SettingsEnum.Localization.name)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: LanguageManager.languages.length,
                            itemBuilder: (context, index) {
                              final languageCode =
                                  LanguageManager.languages[index];
                              return RadioListTile<String>(
                                title: Text(
                                    LanguageManager.languages[index].language!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!),
                                activeColor: AppTheme.primaryButtonBackground,
                                value: LanguageManager.languages[index].code!,
                                groupValue: selectedLanguage,
                                onChanged: (value) {
                                  setState(() {
                                    LanguageManager.currentLanguageCode =
                                        value!;
                                    selectedLanguage =
                                        LanguageManager.currentLanguageCode!;
                                    context
                                        .read<LocalizationCubit>()
                                        .toggleLanguage(
                                            Locale(selectedLanguage));
                                    print("selectedLanguage$selectedLanguage");
                                    print("Locale${Locale(selectedLanguage)}");
                                    LanguageManager.changeLanguage(value);
                                  });
                                },
                              );
                            },
                          )
                        : Container(),
                  ],
                ))
              : Container(),
        ],
      ),
    );
  }
}
