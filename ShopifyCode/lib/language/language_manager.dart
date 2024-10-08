import 'package:shopify_code/language/language_translation.dart';
import 'package:shopify_code/modelClass/partner_info_model.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/session/session.dart';
// const supportedLanguages = ['en', 'es', 'hi', 'gr', 'fr', 'pr'];

// const languageNames = {
//   'en': 'english',
//   'es': 'spanish',
//   'hi': 'hindi',
//   'gr': 'german',
//   'fr': 'france',
//   'pr': 'portugese'
// };

class LanguageManager {
  // static String? changedLanguage = 'en';

  static String currentLanguageCode = "en";

  static List<Language> languages =
      globals.Settings.containsKey(SettingsEnum.Localization.name)
          ? globals.Settings[SettingsEnum.Localization.name].otherData.language
              .where((Language lang) => lang.selected!)
              .toList()
          : [];

  static String get currentLanguage => currentLanguageCode;
  static Map<String, dynamic> translations() {
    return Translations.of(currentLanguageCode);
  }

  static Future<void> setLanguage() async {
    String lang = await Session().getCachedLanguage();
    if (lang.isEmpty) {
      currentLanguageCode = globals.Settings.containsKey(
              SettingsEnum.Change_Default_Language.name)
          ? globals.Settings[SettingsEnum.Change_Default_Language.name]
              .defaultLanguage.code
          : 'en';
    } else {
      currentLanguageCode = lang;
    }
  }

  static void changeLanguage(String languageCode) {
    currentLanguageCode = languageCode;
    Session().cacheLanguage(currentLanguageCode);
  }
}
