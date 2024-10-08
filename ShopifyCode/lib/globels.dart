import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shopify_code/modelClass/partner_info_model.dart';

String FilterHandle="";
Database? database;
ProductFilterData productFilterOptionValue = ProductFilterData("",[],[],"");

Map<String, String> productStarRating = {};

Map<String, dynamic> Settings= {};
Map<String, dynamic> plugins= {};
PartnerInfoModel partnerInfoModel = PartnerInfoModel();

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
FirebaseAnalyticsObserver observer =
FirebaseAnalyticsObserver(analytics: analytics);

String publishedTheme = "first";


