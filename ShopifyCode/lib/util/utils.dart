import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/util/plugins_enum.dart';

class Utils {
  static Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      // return androidDeviceInfo.androidId; // unique ID on Android
      return androidDeviceInfo.id.toString();
    }
  }

  static bool isDarkMode() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    // var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static bool isTablet(BuildContext context) {
    if (MediaQuery.of(context).size.shortestSide >= 600) {
      return true;
    } else {
      return false;
    }
  }

  static getColorFromHex(String hex) {
    var hexColor = hex.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static convertColorToHex(Color svgColor) {
    if (svgColor.toString().length > 0) {
      try {
        return svgColor
            .toString()
            .substring(10, svgColor.toString().length - 1);
      } catch (e) {
        print("color code issue " + e.toString());
        return "";
      }
    } else {
      return "";
    }
  }

  static getCalculateDiscountPercentage(
      double actualPrice, double discountedPrice) {
    if (actualPrice == 0) return 0;

    return (((actualPrice - discountedPrice) * 100) / actualPrice);
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //example.com/hello/world will give world
  static String extractFirstWordFromLastSegment(String url) {
    // Split the URL by "/"
    List<String> parts = url.split("/");
    // Get the last segment of the URL
    String lastSegment = parts.isNotEmpty ? parts.last : '';
    // Split the last segment by "/"
    List<String> words = lastSegment.split("/");
    // Extract the first word
    String firstWord = words.isNotEmpty ? words.first : '';
    return firstWord;
  }

  static bool checkPlan(String currentPlanName, String settingPlanName) {
    debugPrint(
        "-------------------------------2222222222222---------${currentPlanName}---${settingPlanName}------------");
    if (currentPlanName.toUpperCase() == "ESSENTIALS" &&
        settingPlanName.toUpperCase() == "ESSENTIALS") {
      return true;
      // } else if (currentPlanName.toUpperCase() == "PRO" &&
      //     (settingPlanName.toUpperCase() == "ESSENTIALS" ||
      //         settingPlanName.toUpperCase() == "PRO")) {
      //   return true;
    } else if (currentPlanName.toUpperCase() == "ELITE" &&
        (settingPlanName.toUpperCase() == "ESSENTIALS" ||
            settingPlanName.toUpperCase() == "PRO" ||
            settingPlanName.toUpperCase() == "ELITE")) {
      return true;
    } else if (currentPlanName.toUpperCase() == "CUSTOM" &&
        (settingPlanName.toUpperCase() == "ESSENTIALS" ||
            settingPlanName.toUpperCase() == "PRO" ||
            settingPlanName.toUpperCase() == "ELITE" ||
            settingPlanName.toUpperCase() == "CUSTOM")) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkAllRatingReviewPluginEnabled() {
    return globals.plugins.containsKey(PluginsEnum.YOTPO_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.ITGEEKS_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.JUDGE_ME_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.LOOX_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.OKENDO_REVIEW.name);
  }

  static String checkSomeRatingReviewPluginEnabled() {
    if (globals.plugins.containsKey(PluginsEnum.YOTPO_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.ITGEEKS_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.JUDGE_ME_REVIEW.name)) {
      return "NATIVE";
    } else if (globals.plugins.containsKey(PluginsEnum.LOOX_REVIEW.name) ||
        globals.plugins.containsKey(PluginsEnum.OKENDO_REVIEW.name)) {
      return "WEBVIEW";
    } else {
      return "PLUGIN_DISABLED";
    }
  }

  static String getAllReviewUrlPluginUrl() {
    if (globals.plugins.containsKey(PluginsEnum.LOOX_REVIEW.name)) {
      return ApiConst.looxAddReview;
    } else if (globals.plugins.containsKey(PluginsEnum.OKENDO_REVIEW.name)) {
      return ApiConst.okendoReviewThird.replaceAll("{subscriber_id}",
          globals.plugins[PluginsEnum.OKENDO_REVIEW.name].secrets.subscriberId);
    } else {
      return "";
    }
  }

  static String getAddReviewUrlPluginUrl() {
    if (globals.plugins.containsKey(PluginsEnum.LOOX_REVIEW.name)) {
      return ApiConst.looxAddReview;
    } else if (globals.plugins.containsKey(PluginsEnum.OKENDO_REVIEW.name)) {
      return ApiConst.okendoAddReview.replaceAll("{subscriber_id}",
          globals.plugins[PluginsEnum.OKENDO_REVIEW.name].secrets.subscriberId);
    } else {
      return "";
    }
  }
}
