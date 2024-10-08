import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/session/session.dart';

// class Translations {
//   //  static Map<String,Map<String, String>>? translations;
//   static dynamic translations;
//  fetchData() async {
//     // Replace the URL with your actual API endpoint
//      String apiUrl = 'https://mobilify.itgeeks.com/public/languages-details';

//     try {
//       // Make the GET request
//       var response = await http.get(Uri.parse(apiUrl));
//   const utf8Decoder = Utf8Decoder(allowMalformed: true);
//       final decodedBytes = utf8Decoder.convert(response.bodyBytes);
//       // Check if the response is successful (status code 200)
//       if (response.statusCode==200  || response.statusCode==201) {
//         // Decode the response body as UTF-8
//         // final String responseBody = utf8.decode(response.bodyBytes);

//         // // Parse the JSON response
//         //  translations = json.decode(responseBody);

//         // // Extract the result from the response
//         // // final  result = translations['result'];

//         // Return the result
//           translations = json.decode(decodedBytes);
//       } else {
//         // If the response is not successful, throw an error
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       // Catch any errors that occur during the request
//       throw Exception('Failed to load data: $error');
//     }
//   }

//   //  getData() async
//   // {
//   //   var url =  Uri.parse('https://mobilify.itgeeks.com/public/languages-details');
//   // var response = await http.get(url);
//   // const utf8Decoder = Utf8Decoder(allowMalformed: true);
//   //     final decodedBytes = utf8Decoder.convert(response.bodyBytes);
//   // if (response.statusCode == 200) {
//   //     // print('Response body: ${decodedBytes}');
//   //    translations = json.decode(decodedBytes);
//   //   //  print("data is ${translations}");
//   // } else {
//   //   print('Request failed with status: ${response.statusCode}');
//   // }
//   // }
//   // static Map<String, Map<String, String>> _translations = {
//   //   'en': {
//   //     'title': 'Hello World',
//   //     'language': 'Language',
//   //     'chatSupport' : 'Chat Support',
//   //     'darkMode' : 'Dark Mode',
//   //     'chatHint' : 'Speech to Text'
//   //   },
//   //   'hi': {
//   //     'title': 'शीर्षक',
//   //     'language': 'भाषा',
//   //     'chatSupport' : 'चैट समर्थन',
//   //     'darkMode' : 'डार्क मोड',
//   //     'chatHint' : 'Speech to Text'
//   //   },
//   //   'es': {
//   //     'title': 'Hola Mundo',
//   //     'language': 'Idioma',
//   //     'chatSupport' : 'Soporte por chat',
//   //     'darkMode' : 'Modo oscuro',
//   //     'chatHint' : 'Speech to Text'
//   //   },
//   //   // Add other languages and translations as needed
//   // };
//   static Map<String, dynamic> of(String languageCode) {
//     // Map<String,Map<String, String>>? translations;
//   return translations![languageCode]?? translations!['en'];
//   }
// }

class Translations {
  static Map<String, dynamic>? translations;

  static fetchData() async {
    String apiUrl = AppConfig.LANGUAGE_URL;
   await LanguageManager.setLanguage();
    try {
      var response = await http.get(Uri.parse(apiUrl));
      const utf8Decoder = Utf8Decoder(allowMalformed: true);
      final decodedBytes = utf8Decoder.convert(response.bodyBytes);

      if (response.statusCode == 200 || response.statusCode == 201) {
        translations = json.decode(decodedBytes)["result"];
        Session().setLanguageData(translations!);
      } else {
        translations = await Session().getLanguageData();
        throw Exception('Failed to load data');
      }
    } catch (error) {
      translations = await Session().getLanguageData();
      throw Exception('Failed to load data: $error');
    }
  }

  static Map<String, dynamic> of(String languageCode) {
    return translations != null
        ? translations![languageCode] ?? translations!['en']
        : {};
  }
}
