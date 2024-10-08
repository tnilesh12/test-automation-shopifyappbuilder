import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/injectable.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopifyappbuilder/preview_app/partner_home_screen.dart';
import 'package:shopify_code/util/firebase_cloud_message_util.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:publicapp/main.dart' as publicapp;
import 'package:readygolf/main.dart' as readygolf;
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/util/utils.dart';
import '/views/common_screens/network_error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const MyApp());

  if (await Utils.isInternetConnected()) {
    print("Start Firebase config........");

    if (Platform.isIOS) {
      await Firebase.initializeApp(
          name: AppConfig.FIREBASE_PROJECT_NAME,
          options: const FirebaseOptions(
            apiKey: AppConfig.FIREBASE_API_KEY,
            appId: AppConfig.FIREBASE_APP_ID_IOS,
            messagingSenderId: AppConfig.FIREBASE_MESSAGING_SENDER_ID,
            projectId: AppConfig.FIREBASE_PROJECT_ID,
            storageBucket: AppConfig.FIREBASE_STORAGE_BUCKET,
            iosBundleId: AppConfig.FIREBASE_IOS_BUNDLE_ID,
          ));
    } else {
      await Firebase.initializeApp(
          name: AppConfig.FIREBASE_PROJECT_NAME,
          options: const FirebaseOptions(
            apiKey: AppConfig.FIREBASE_API_KEY,
            appId: AppConfig.FIREBASE_APP_ID,
            messagingSenderId: AppConfig.FIREBASE_MESSAGING_SENDER_ID,
            projectId: AppConfig.FIREBASE_PROJECT_ID,
            storageBucket: AppConfig.FIREBASE_STORAGE_BUCKET,
            iosBundleId: AppConfig.FIREBASE_IOS_BUNDLE_ID,
          ));
    }
    await FirebaseCloudMessageUtil.initialize();
    print("End Firebase config..........");
    configureDependencies();

    // Non-async exceptions
    const fatalError = true;
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    // Async exceptions
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };

    Session().SetSharePreferenceObject();
    if (AppConfig.APP_NAME == "ITGeeks Mobilify") {
      runApp(MyAppBarCode());
      // /*
    } else if (AppConfig.APP_NAME == "Ready Golf") {
      await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]).then((_) => runApp(readygolf.MyApp1()));
    // } else if (AppConfig.APP_NAME == "Onleorganic") {
    //   await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    //     DeviceOrientation.portraitUp,
    //     DeviceOrientation.portraitDown
    //   ]).then((_) => runApp(onleorganic.MyApp1()));
    } else {
      await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]).then((_) => runApp(publicapp.MyApp1()));
    }

    //  */
  } else {
    runApp(NoInternetApp());
  }
}

class NoInternetApp extends StatelessWidget {
  NoInternetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: NetworkErrorScreen());
  }
}

class MyAppBarCode extends StatelessWidget {
  const MyAppBarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobilify',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        //routerConfig: router
        home: PartnerHomeScreen());
  }
}
