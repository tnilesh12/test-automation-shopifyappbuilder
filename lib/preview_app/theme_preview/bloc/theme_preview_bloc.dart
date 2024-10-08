import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'theme_preview_event.dart';
import 'theme_preview_state.dart';

class ThemePreviewBloc extends Bloc<ThemePreviewEvent, ThemePreviewState> {
  ThemePreviewBloc() : super(ThemePreviewInitialState()) {
    getThemeList();
  }

  dynamic themeData;

  getThemeList() async {
    emit(ThemePreviewLoadingState());
    ApiResponse apiResponse = await ApiRepository.getAPI(ApiConst.getThemeList);

    if (apiResponse.status) {
      debugPrint(
          "-------------getThemeList success response${apiResponse.data["result"]}");
      themeData = apiResponse.data["result"];
      emit(ThemePreviewLoadedState(themeData));
    } else {
      debugPrint(
          "----------------------submitFormData------------api failure bloc---${apiResponse.message}-----");
      emit(ThemePreviewAPIFailureState(apiResponse.message));
    }
  }
}
