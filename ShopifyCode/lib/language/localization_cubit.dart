import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LocalizationCubit extends Cubit<Locale> {
  /// {@macro brightness_cubit}
  LocalizationCubit() : super(Locale("en"));

  /// Toggles the current brightness between light and dark.
  void toggleLanguage(Locale locale) {
    emit(locale);
  }
}