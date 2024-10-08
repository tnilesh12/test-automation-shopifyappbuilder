import 'package:flutter/material.dart';

class AppConfig {
  static const String BASE_URL =
      "https://apps.mobilifyapp.com/";

  static String APP_DOMAIN = "666073-46.myshopify.com";
  static const String FIREBASE_API_KEY =
      'AIzaSyClYCGM0yfyphu2-C29HsJDHkO-7n4TbaE';
  static const String FIREBASE_APP_ID =
      '1:814514866741:android:307a9fbfed8e6100d07f7c';
  static const String FIREBASE_APP_ID_IOS =
      '1:814514866741:ios:3cb7b5cdab22f84ed07f7c';

  static const String FIREBASE_PROJECT_NAME = 'AppBuilderPublic';

  static const String FIREBASE_MESSAGING_SENDER_ID = '814514866741';
  static const String FIREBASE_PROJECT_ID = 'appbuilderpublic';
  static const String FIREBASE_STORAGE_BUCKET = 'appbuilderpublic.appspot.com';
  static const String FIREBASE_IOS_BUNDLE_ID = 'com.itg.golime';

  static const String LANGUAGE_URL =
      "${BASE_URL}public/languages-details";
  static const BoxFit imageFit = BoxFit.contain;
  // static const String collectionMenuHandle = "";
  static const String APP_NAME = "GoLime";

  static const bool PHONE_NO_REQUIRED = true;
  static const bool metaFieldRequired = true;
  static const showMaxPriceOnProductGrid = false;

  static const dynamic metaFieldFormData = [
    {"key": "make", "namespace": "custom",},
    {"key": "make_description", "namespace": "custom"},
    {"key": "model", "namespace": "custom"},
    {"key": "model_description", "namespace": "custom"},
    {"key": "_energy_efficiency", "namespace": "custom"},
    {"key": "_energy_efficiency_description", "namespace": "custom"},
    {"key": "compressor_stages", "namespace": "custom"},
    {"key": "compressor_stages_description", "namespace": "custom"},
    {"key": "cooling_capacity", "namespace": "custom"},
    {"key": "cooling_capacity_description", "namespace": "custom"},
    {"key": "max_heating_capacity", "namespace": "custom"},
    {"key": "max_heating_capacity_description", "namespace": "custom"},
    {"key": "energy_star_certified", "namespace": "custom"},
    {"key": "energy_star_certified_image", "namespace": "custom"},
    {"key": "coil", "namespace": "custom"},
    {"key": "coil_image", "namespace": "custom"},
    {"key": "standard_installation", "namespace": "custom"},
    {"key": "standard_installation_image", "namespace": "custom"},
    {"key": "rebate_eligible", "namespace": "custom"},
    {"key": "rebate_eligible_image", "namespace": "custom"},
    {"key": "sound_rating", "namespace": "custom"},
    {"key": "sound_rating_description", "namespace": "custom"},
    {"key": "dimensions", "namespace": "custom"},
    {"key": "dimensions_description", "namespace": "custom"},
    {"key": "weight", "namespace": "custom"},
    {"key": "weight_description", "namespace": "custom"},
    {"key": "parts_warranty", "namespace": "custom"},
    {"key": "parts_warranty_description", "namespace": "custom"},
    {"key": "labor_warranty", "namespace": "custom"},
    {"key": "labor_warranty_description", "namespace": "custom"},
    {"key": "zoho_product_category", "namespace": "custom"},
    {"key": "zoho_product_type", "namespace": "custom"},
    // {"key": "details", "namespace": "custom"},
    // {"key": "technical_specification", "namespace": "custom"},
    // {"key": "warranty", "namespace": "custom"},
    // {"key": "lorem_ipsum_dolor", "namespace": "custom"},
    // {"key": "custom_product_title", "namespace": "custom"},
    // {"key": "collection", "namespace": "custom"}
  ];
}
