import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/modelClass/notification.dart';
import 'package:shopify_code/modelClass/src/shop/shop.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/modelClass/style_data_model.dart';
import 'dart:convert';

class Session {
  static SharedPreferences? prefs;

  SetSharePreferenceObject() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  Future<String> getUserId() async {
    String? storeUserDetails = prefs!.getString("UserId");
    return (storeUserDetails ?? "");
  }

  // Future<bool> setUserId(String s) async {
  //   return prefs!.setString("UserId", s);
  // }
  // Future<bool> setStore(Shop shop) async {
  //   String s = jsonEncode(shop.toJson());
  //   return prefs!.setString("store", s);
  // }
  // Future<Shop> getStore() async {
  //   String? encodedMap = prefs!.getString("store");
  //   print("object  $encodedMap  ${prefs!.getString("store")} ");
  //   Map<String, dynamic> decodedMap = json.decode(encodedMap!);
  //   print("object  ${decodedMap}  ${prefs!.getString("store")} ");
  //   var shop = Shop.fromJson(decodedMap);
  //   return (shop);
  // }
  // Future<String> getUsername() async {
  //   String? storeUserDetails = prefs!.getString("Username");
  //   return (storeUserDetails ?? "");
  // }
  // Future<bool> setUsername(String s) async {
  //   return prefs!.setString("Username", s);
  // }
  // Future<bool> setAppSetting(int s) {
  //   return prefs!.setString("appSettings", json.encode(s));
  // }
  // Future<String> getAppSetting() async {
  //   return prefs!.getString("appSettings").toString();
  // }

  Future<bool> IsLogin() async {
    return prefs!.getBool("IsLogin") ?? false;
  }

  Future<bool> setIsLogin(bool s) async {
    return prefs!.setBool("IsLogin", s);
  }

  // Future<bool> setLoginData(ShopifyUser? s) async {
  //   String encodedMap = "";
  //   if (s != null) {
  //     encodedMap = json.encode(s!.toJson());
  //   }
  //   print(encodedMap);
  //   setIsLogin(true);
  //   return prefs!.setString("logindata", encodedMap);
  // }
  Future<bool> setLoginData(ShopifyUser shopifyUser) async {
    return prefs!
        .setString("shopifyUserData", json.encode(shopifyUser.toJson()));
  }

  Future<ShopifyUser?> getLoginData() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    var te = prefs!.getString("shopifyUserData");
    // var te = ShopifyUser.fromJson(
    //     json.decode((prefs!.getString("shopifyUserData").toString())));
    if (te == null || te == "null") {
      return null;
    }
    return ShopifyUser.fromJson(
        json.decode((prefs!.getString("shopifyUserData").toString())));
  }

  // Future<ShopifyUser?> getLoginData() async {
  //   return ShopifyUser.fromJson(
  //       json.decode((prefs!.getString("shopifyUserData").toString())));
  // }

  Future<String> getCachedLanguage() async {
    final code = prefs!.getString("lang");
    if (code != null) {
      return code;
    } else {
      return "";
    }
  }

  Future<void> cacheLanguage(String code) async {
    await prefs!.setString("lang", code);
  }

  Future<String> getAccessToken() async {
    return prefs!.getString("token") ?? "";
  }

  Future<bool> setAccessToken(String s) async {
    return prefs!.setString("token", s);
  }

  Future<String> getTicketGorgias() async {
    return prefs!.getString("TicketGorgias") ?? "";
  }

  Future<bool> setTicketGorgias(String s) async {
    return prefs!.setString("TicketGorgias", s);
  }

  Future<String> getTicketZendesk() async {
    return prefs!.getString("TicketZendesk") ?? "";
  }

  Future<bool> setTicketZendesk(String s) async {
    return prefs!.setString("TicketZendesk", s);
  }

  Future<String> getSenderGorgias() async {
    return prefs!.getString("SenderGorgias") ?? "";
  }

  Future<bool> setSenderGorgias(String s) async {
    return prefs!.setString("SenderGorgias", s);
  }

  Future<String> getSenderZendesk() async {
    return prefs!.getString("SenderZendesk") ?? "";
  }

  Future<bool> setSenderZendesk(String s) async {
    return prefs!.setString("SenderZendesk", s);
  }

  Future<bool> setAppDashboardData(DashboardDataModel s) {
    return prefs!.setString("dashboardData", json.encode(s));
  }

  Future<DashboardDataModel> getAppDashboardData() async {
    return DashboardDataModel.fromJson(
        json.decode((prefs!.getString("dashboardData").toString())));
  }

  Future<bool> setAppMenuData(MenuDataModel s) {
    return prefs!.setString("menuData", json.encode(s));
  }

  Future<MenuDataModel> getAppMenuData() async {
    // return prefs!.getString("menuData").toString();
    return MenuDataModel.fromJson(
        json.decode((prefs!.getString("menuData").toString())));
  }

  Future<bool> setStyleData(StyleDataModel s) {
    return prefs!.setString("styleData", json.encode(s));
  }

  Future<StyleDataModel> getStyleData() async {
    // return prefs!.getString("styleData").toString();
    return StyleDataModel.fromJson(
        json.decode((prefs!.getString("styleData").toString())));
  }

  // Future<bool> setShopifyUserData(ShopifyUser shopifyUser) async {
  //   return prefs!.setString("shopifyUserData", json.encode(shopifyUser));
  // }

  // Future<ShopifyUser?> getShopifyUserData() async {
  //   var te = prefs!.getString("shopifyUserData");
  //   // var te = ShopifyUser.fromJson(
  //   //     json.decode((prefs!.getString("shopifyUserData").toString())));
  //   if (te == null) {
  //     return null;
  //   }
  //   return ShopifyUser.fromJson(
  //       json.decode((prefs!.getString("shopifyUserData").toString())));
  // }

  Future<bool> setNotificationData(NotificationModel notificationModel) async {
    print("-------------session setNotificationData------------");
    print(
        "-------------session setNotificationData notificationModel---${notificationModel.toJson()}---------");
    print("-------------session setNotificationData prefs----$prefs--------");
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    print("-------------session setNotificationData prefs----$prefs--------");

    return prefs!.setString("notificationData", json.encode(notificationModel));
  }

  Future<NotificationModel?> getNotificationData() async {
    print("-------------session getNotificationData------------");
    var te = prefs!.getString("notificationData");
    if (te == null) {
      print(
          "-------------session getNotificationData null returned------------");
      return null;
    }
    print(
        "-------------session getNotificationData data is not null----- te---$te-------");
    NotificationModel notificationModel = NotificationModel.fromJson(
        json.decode((prefs!.getString("notificationData").toString())));
    prefs!.setString("notificationData", "");
    print(
        "-------------session getNotificationData data ${notificationModel.toJson()}------------");
    return notificationModel;
  }

  Future<bool> setCartId(String id) {
    return prefs!.setString("cartId", id);
  }

  Future<String?> getCartId() async {
    // var id = prefs!.getString("cartId");
    // if (id == null) {
    //   return null;
    // }
    // return id;
    return prefs!.getString("cartId").toString();
  }

  Future<bool> setCartCount(int n) {
    return prefs!.setInt("cartCount", n);
  }

  Future<int> getCartCount() async {
    int? cartCount = prefs!.getInt("cartCount");
    return (cartCount ?? 0);
  }

  Future<bool> setLanguageData(Map<String, dynamic> s) {
    return prefs!.setString("languageData", json.encode(s));
  }

  Future<Map<String, dynamic>> getLanguageData() async {
    return json.decode((prefs!.getString("languageData").toString()));
  }

  Future<bool> isWelcomeNotificationSent() async {
    return prefs!.getBool("isWelcomeNotificationSent") ?? false;
  }

  Future<bool> setWelcomeNotificationSent(bool s) async {
    return prefs!.setBool("isWelcomeNotificationSent", s);
  }

  Future<bool> clearCustomerData() async {
    await prefs!.setBool("IsLogin", false);
    await prefs!.setString("shopifyUserData", "null"); //login data
    await prefs!.setString("token", "");
    await prefs!.setString("cartId", "");
    await prefs!.setInt("cartCount", 0);
    return true;
  }

  Future<bool> setPartnerLoginData(Map<String, dynamic>? partner) async {
    return prefs!.setString("partnerData", json.encode(partner));
  }

  Future<Map<String, dynamic>?> getPartnerLoginData() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    var te = prefs!.getString("partnerData");
    if (te == null || te == "null") {
      return null;
    }
    return json.decode(prefs!.getString("partnerData").toString());
  }

  Future<bool> setPartnerIsLogin(bool s) async {
    return prefs!.setBool("IsPartnerLogin", s);
  }

  Future<bool> IsPartnerLogin() async {
    return prefs!.getBool("IsPartnerLogin") ?? false;
  }

  Future<String> getShopName() async {
    return prefs!.getString("shopName") ?? "";
  }

  Future<bool> setShopName(String s) async {
    return prefs!.setString("shopName", s);
  }

  Future<bool> isEmailSubmitted() async {
    return prefs!.getBool('emailSubmitted') ?? false;
  }

  Future<void> setEmailSubmitted(bool value) async {
    await prefs!.setBool('emailSubmitted', value);
  }

   Future<void> setDisableEmailNotification(bool value) async {
    await prefs!.setBool('disableEmailNotification', value);
  }

  Future<bool> isEmailNotificationDisabled() async {
    return prefs!.getBool('disableEmailNotification') ?? false;
  }
}
