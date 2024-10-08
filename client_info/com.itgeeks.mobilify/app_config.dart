import 'package:flutter/material.dart';

class AppConfig {
  static const String BASE_URL =
  "https://apps.mobilifyapp.com/";
      // "https://mobilify.itgeeks.com/"; // "https://jellyfish-app-6kizf.ondigitalocean.app/external/";

  // static const String BASE_URL_CHAT = "https://mobilify.itgeeks.com/";
  static String APP_DOMAIN =
      // "readygolf-llc.myshopify.com";
      "itgeeks-mobilify.myshopify.com";
  // "apptest-box.myshopify.com";
  // "developmentcheck.myshopify.com";
  static const String FIREBASE_API_KEY =
      'AIzaSyClYCGM0yfyphu2-C29HsJDHkO-7n4TbaE';
  static const String FIREBASE_APP_ID =
      '1:814514866741:android:11434731bd01c6b6d07f7c';
  static const String FIREBASE_APP_ID_IOS =
      '1:814514866741:ios:373780f12ae4c939d07f7c';

  static const String FIREBASE_PROJECT_NAME = 'AppBuilderPublic';

  static const String FIREBASE_MESSAGING_SENDER_ID = '814514866741';
  static const String FIREBASE_PROJECT_ID = 'appbuilderpublic';
  static const String FIREBASE_STORAGE_BUCKET = 'appbuilderpublic.appspot.com';
  static const String FIREBASE_IOS_BUNDLE_ID = 'com.itgeeks.shopifyappbuilder';

  static const String LANGUAGE_URL =
      "${BASE_URL}public/languages-details";
  static const BoxFit imageFit = BoxFit.cover;
  // static const String collectionMenuHandle = "";
  static const String APP_NAME = "ITGeeks Mobilify";

  static const bool PHONE_NO_REQUIRED = true;
  static const bool metaFieldRequired = false;
  static const showMaxPriceOnProductGrid = false;
  static const dynamic metaFieldFormData = [];
}
