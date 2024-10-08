import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(AppTheme.lightTheme);

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? AppTheme.lightTheme : AppTheme.darkTheme);
  }
}