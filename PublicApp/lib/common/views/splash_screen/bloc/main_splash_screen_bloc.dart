import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/partner_info_model.dart';
import 'package:shopify_code/modelClass/style_data_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/util/utils.dart';
import '/common/views/splash_screen/bloc/main_splash_screen_event.dart';
import '/common/views/splash_screen/bloc/main_splash_screen_state.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:package_info_plus/package_info_plus.dart';

class MainSplashScreenBloc
    extends Bloc<MainSplashScreenEvent, MainSplashScreenState> {
  ThemeData? themeData;
  String themeName = "";
  String isPublished = "yes";

  MainSplashScreenBloc(this.themeName, this.isPublished)
      : super(MainSplashScreenInitialState()) {
    loadData();
  }
  bool islogin = false;
  String? appName = "";

  getAppName() async {
    if (appName == "") {
      final packageInfo = await PackageInfo.fromPlatform();
      appName = packageInfo.appName;
    }
  }

  loadData() async {
    emit(MainSplashScreenLoadingState());
    await getAppName();
    emit(MainSplashScreenLoadingState());
    await loadPartnerInfo();
    await loadStyle();
    emit(MainSplashScreenIntermediateLoadedState());
    await setPartnerInfo();
    emit(MainSplashScreenLoadedState());
  }

  Future<void> loadPartnerInfo() async {
    ApiResponse apiResponse =
        await ApiRepository.getAPI(ApiConst.getPartnerInfo);
    if (apiResponse.message == "Shop Not Valid.") {
      // runApp(NoInternetApp(message: apiResponse1.message));
      emit(MainSplashScreenShopNotValidState());
      return;
    }
    globals.partnerInfoModel =
        PartnerInfoModel.fromJson(apiResponse.data["result"]);
    if (themeName != null && themeName != "") {
      globals.publishedTheme = themeName;
    } else {
      globals.publishedTheme = globals.partnerInfoModel.publishedTheme!;
      themeName = globals.partnerInfoModel.publishedTheme!;
    }
    DashboardFontSize();
  }

  setPartnerInfo() {
    if (globals.partnerInfoModel.settings != null) {
      globals.partnerInfoModel.settings!.forEach((element) {
        if (element.settingsEnum == SettingsEnum.App_Exclusive_Discounts.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.App_Exclusive_Discounts.name] = element;
          // } else if (element.settingsEnum == SettingsEnum.App_Exclusive_Product_And_Collection.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[
          //       SettingsEnum.App_Exclusive_Product_And_Collection.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Localization.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Localization.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Product_Recommendations.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Product_Recommendations.name] = element;
          // } else if (element.settingsEnum == SettingsEnum.White_Label_App.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.White_Label_App.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Recently_Viewed_List.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Recently_Viewed_List.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Customizable_Font.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Customizable_Font.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Product_Search_And_Sort.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Product_Search_And_Sort.name] = element;
          // } else if (element.settingsEnum == SettingsEnum.Mobile_App_Promotion_Banner.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Mobile_App_Promotion_Banner.name] =
          //       element;
          // } else if (element.settingsEnum==SettingsEnum.App_User_Discounts.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.App_User_Discounts.name] = element;
          // } else if (element.settingsEnum == SettingsEnum.Social_Login.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Social_Login.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Smart_Search_Suggestions.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Smart_Search_Suggestions.name] =
              element;
        } else if (element.settingsEnum == SettingsEnum.Maintenance_Mode.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Maintenance_Mode.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Currency_Format.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Currency_Format.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Guest_Checkout.name &&
            element.value! &&
            Utils.checkPlan(
                globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Guest_Checkout.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Change_Default_Language.name &&
            element.value! &&
            Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Change_Default_Language.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Auto_Navigate_To_Cart_Page.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Auto_Navigate_To_Cart_Page.name] =
              element;
          // } else if (element.settingsEnum == SettingsEnum.Auto_Select_Variants.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Auto_Select_Variants.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Variant_Specific_Images.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Variant_Specific_Images.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Display_Vendor_Or_Brand.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Display_Vendor_Or_Brand.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Display_SKU.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Display_SKU.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Hide_Out_Of_Stock_Products.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Hide_Out_Of_Stock_Products.name] =
              element;
        } else if (element.settingsEnum == SettingsEnum.Display_Price_One_Below_The_Other.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[
              SettingsEnum.Display_Price_One_Below_The_Other.name] = element;
          // } else if (element.settingsEnum==SettingsEnum.Show_Vendor_Name.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Show_Vendor_Name.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Show_Discount_Percentage.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Show_Discount_Percentage.name] =
              element;
          // } else if (element.settingsEnum == SettingsEnum.Skip_Login_and_Address.name &&
          //     element.value! &&
          //     Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Skip_Login_and_Address.name] = element;
          // } else if (element.settingsEnum == SettingsEnum.Order_Note.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Order_Note.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Minimum_Cart_Value.name && element.value! && element.minimumValue != null && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Minimum_Cart_Value.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Disable_Checkout.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Disable_Checkout.name] = element;
        } else if (element.settingsEnum == SettingsEnum.Show_Intro_Screen_At_App_Start.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name] =
              element;
        } else if (element.settingsEnum == SettingsEnum.Show_Filter_On_Product_List_Page.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          globals.Settings[SettingsEnum.Show_Filter_On_Product_List_Page.name] =
              element;
          // } else if (element.settingsEnum == SettingsEnum.Show_Stickers_On_Product_Cell.name && element.value! && Utils.checkPlan(globals.partnerInfoModel.planName!, element.plan!)) {
          //   globals.Settings[SettingsEnum.Show_Stickers_On_Product_Cell.name] =
          //       element;
        }
      });
    }
    if (globals.partnerInfoModel.plugins != null) {
      globals.partnerInfoModel.plugins!.forEach((element) {
        element.apps!.forEach((element2) {
          if (element2.pluginsEnum == PluginsEnum.INSTAGRAM.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.INSTAGRAM.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.JUDGE_ME_REVIEW.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.JUDGE_ME_REVIEW.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.YOTPO_REVIEW.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.YOTPO_REVIEW.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.ITGEEKS_REVIEW.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.ITGEEKS_REVIEW.name] = element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name] =
                element2;
          } else if (element2.pluginsEnum == PluginsEnum.WHATSAPP.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.WHATSAPP.name] = element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.ZIP_CODE_VALIDATOR.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.ZIP_CODE_VALIDATOR.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.BOOST_AI_SEARCH.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.BOOST_AI_SEARCH.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.GOOGLE_ANALYTICS.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.GOOGLE_ANALYTICS.name] = element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.FIREBASE_CRASHLYTICS.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.FIREBASE_CRASHLYTICS.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.KIWI_SIZING.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.KIWI_SIZING.name] = element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.HULK_PRODUCT_OPTION.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.HULK_PRODUCT_OPTION.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.SHOPIFY_BARCODE.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.SHOPIFY_BARCODE.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.SHOPIFY_INBOX.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.SHOPIFY_INBOX.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.ZENDESK.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.ZENDESK.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.GORGIAS.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.GORGIAS.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.REBUY.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.REBUY.name] = element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.MAILCHIMP_SUBSCRIPTION_FORMS.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.MAILCHIMP_SUBSCRIPTION_FORMS.name] =
                element2;
          } else if (element2.pluginsEnum ==
                  PluginsEnum.KELAVIO_SUBSCRIPTION_FORMS.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.KELAVIO_SUBSCRIPTION_FORMS.name] =
                element2;
          } else if (element2.pluginsEnum == PluginsEnum.RECHARGE.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.RECHARGE.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.SMILEIO.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.SMILEIO.name] = element2;
          } else if (element2.pluginsEnum == PluginsEnum.LOOX_REVIEW.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.LOOX_REVIEW.name] = element2;
          }  else if (element2.pluginsEnum == PluginsEnum.OKENDO_REVIEW.name &&
              element2.isOn!) {
            globals.plugins[PluginsEnum.OKENDO_REVIEW.name] = element2;
          }
        });
      });
    }
  }

  Future<void> loadStyle() async {
    // if (themeName == "") {
    //   // themeName = globals.partnerInfoModel.publishedTheme!;
    //   themeName = globals.publishedTheme;
    // }
    ApiResponse response = await ApiRepository.getAPI(ApiConst.getStyle
        .replaceAll("{theme_name}", themeName)
        .replaceAll("{is_published}", isPublished));
    var styleData = response.data["result"];
    print("---------------style--${styleData[0]}------------");
    StyleDataModel styleDataModel =
        StyleDataModel.fromJson(styleData[0]['page_json']);
    Session().setStyleData(styleDataModel);
    AppTheme(styleData[0]);
    themeData = AppTheme.lightTheme;
  }

  void toggleTheme() {
    if (themeData!.brightness == Brightness.dark) {
      themeData = AppTheme.lightTheme;
    } else {
      themeData = AppTheme.darkTheme;
    }
    emit(state);
  }
}
