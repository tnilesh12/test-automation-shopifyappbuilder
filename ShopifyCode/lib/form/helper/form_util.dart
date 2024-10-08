import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';

class Util {
  static TextInputType getKeyboardType(String keyboardType) {
    switch (keyboardType) {
      case 'text':
        return TextInputType.text;
      case 'password':
        return TextInputType.visiblePassword;
      case 'email':
        return TextInputType.emailAddress;
      case 'address':
        return TextInputType.streetAddress;
      case 'number':
        return TextInputType.number;
      default:
        return TextInputType
            .text; // Default to text if the type is not recognized
    }
  }

  static String? validateEmail(Fields inputData, String value) {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Email is not valid';
  }
}
