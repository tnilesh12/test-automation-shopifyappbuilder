import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/common/views/splash_screen/bloc/main_splash_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/common/views/splash_screen/bloc/main_splash_screen_state.dart';

class MainSplashScreen extends StatelessWidget {
  bool anim = false;

  @override
  Widget build(BuildContext context) {
    // context.read<MainSplashScreenBloc>().LoadData();
    return Scaffold(
      // floatingActionButton: LinkButton(
      //   text: "Skip",
      //   onPressed: () => context.pushReplacement("/${Routes.introScreen}"),

      // ),
      // backgroundColor: AppTheme.primaryColor,
      body: BlocListener<MainSplashScreenBloc, MainSplashScreenState>(
        listener: (context, state) {
          // context.pushReplacement("/${Routes.loginScreen}"); print("Here we are .. ${state}");
          // if (state is MainSplashScreenNoInternetState) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['internetConnection']);
          // }
          if (state is MainSplashScreenShopNotValidState) {
            context.push("/${Routes.shopNotValidScreen}");
          } else if (state is MainSplashScreenLoadedState) {
            debugPrint("--------MainSplashScreenLoadedState--------------");
            context.pushReplacement("/${Routes.splashScreen}");

            // FirebaseMessaging.instance
            //     .getInitialMessage()
            //     .then((RemoteMessage? message) {
            //   // Check if the app was opened from a notification
            //   if (message != null) {
            //     print("--------------------splash screen if condition-");
            //     // Handle the notification here if needed
            //     // Timer(Duration(seconds: 3), () {
            //     context.pushReplacement("/${Routes.dashboardScreen}");
            //     // });
            //   } else {
            //     print("--------------------splash screen else condition-");
            //     // If the app wasn't opened from a notification, proceed with the timer-based navigation
            //     // Timer(Duration(seconds: 3), () {
            //     if (context.read<MainSplashScreenBloc>().islogin) {
            //       print(
            //           "--------------------splash screen else if  condition-");
            //       context.pushReplacement("/${Routes.dashboardScreen}");
            //     } else {
            //       print(
            //           "--------------------splash screen else else condition-");
            //       if (globals.Settings.containsKey(
            //           SettingsEnum.Show_Intro_Screen_At_App_Start.name)) {
            //         context.pushReplacement("/${Routes.introScreen}");
            //       } else {
            //         context.pushReplacement("/${Routes.dashboardScreen}");
            //       }
            //     }
            //     // });
            //   }
            // });
            // //// FIREBASE EVENT /////////
            // globals.analytics.logEvent(name: FireBaseEvent.APP_OPEN.name);
            // ////////////////////////////
          }
        },
        child: BlocBuilder<MainSplashScreenBloc, MainSplashScreenState>(
          builder: (context, state) {
            if (state is MainSplashScreenLoadingState) {
              return Container(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      context.read<MainSplashScreenBloc>().appName!,
                      style: CustomTextTheme.getTextStyle(
                        MyTextStyle.Heading,
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ));
            } else if (state is MainSplashScreenShopNotValidState) {
              return Container();
            } else {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          // image: globals.partnerInfoModel.appSettings != null
                          //     ? DecorationImage(
                          //         image: NetworkImage(globals
                          //             .partnerInfoModel.appSettings!.launchImageSrc!),
                          //         fit: BoxFit.cover,
                          //       )
                          //     : null,
                          gradient:
                              globals.partnerInfoModel.appSettings == null ||
                                      globals.partnerInfoModel.appSettings!
                                              .launchImageSrc ==
                                          null
                                  ? LinearGradient(
                                      colors: [
                                        AppTheme.primaryColor!.withAlpha(50),
                                        AppTheme.primaryColor!.withAlpha(185),
                                        // Color.fromARGB(255, 207, 243, 50),
                                        // Color.fromARGB(255, 233, 244, 185),
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                    )
                                  : null),
                      child: globals.partnerInfoModel.appSettings == null ||
                              globals.partnerInfoModel.appSettings!
                                      .launchImageSrc ==
                                  null
                          ?
                          // const Padding(
                          //     padding: EdgeInsets.all(50),
                          //     child:
                          //     Image(
                          //         image: AssetImage(AppAssets.introLogoImg),
                          //         fit: BoxFit.fitWidth))
                          Container(
                              // height: MediaQuery.of(context).size.height / 3.5,
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(top: 60),
                              child: globals.partnerInfoModel.appSettings !=
                                      null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: WidgetImage(globals
                                                  .partnerInfoModel
                                                  .appSettings!
                                                  .appIconSrc!)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          globals.partnerInfoModel
                                                      .appSettings !=
                                                  null
                                              ? globals.partnerInfoModel
                                                  .appSettings!.appName!
                                              : globals.partnerInfoModel.name !=
                                                      null
                                                  ? globals
                                                      .partnerInfoModel.name!
                                                  : "",
                                          style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.Heading,
                                            context,
                                          ).copyWith(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  : Text(
                                      globals.partnerInfoModel.appSettings !=
                                              null
                                          ? globals.partnerInfoModel
                                              .appSettings!.appName!
                                          : globals.partnerInfoModel.name !=
                                                  null
                                              ? globals.partnerInfoModel.name!
                                              : "",
                                      style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.Heading,
                                        context,
                                      ).copyWith(fontWeight: FontWeight.bold),
                                    ))
                          : CachedNetworkImage(
                              imageUrl: globals.partnerInfoModel.appSettings!
                                  .launchImageSrc!,
                              fit: BoxFit.cover),
                    ),
                  ),
                  globals.partnerInfoModel.appSettings != null &&
                          globals.partnerInfoModel.appSettings!.enableLoader!
                      ? Positioned(
                          bottom: 35,
                          left: 20,
                          right: 20,
                          child: Text(
                            LanguageManager.translations()['loadingWait'] ??
                                "Loading Please Wait...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Utils.getColorFromHex(globals
                                    .partnerInfoModel
                                    .appSettings!
                                    .loaderColor!)),
                          ))
                      : Container(),
                  globals.partnerInfoModel.appSettings != null &&
                          globals.partnerInfoModel.appSettings!.enableLoader!
                      ? Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Utils.getColorFromHex(globals
                                .partnerInfoModel
                                .appSettings!
                                .loaderColor!), //Colors.white,
                            backgroundColor: Utils.getColorFromHex(globals
                                .partnerInfoModel.appSettings!.loaderColor!
                                .replaceAll("#", "#99")), //Colors.black,
                          ),
                        )
                      : Container()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
