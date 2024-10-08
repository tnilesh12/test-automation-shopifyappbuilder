class ThemePreviewState {}

class ThemePreviewInitialState extends ThemePreviewState {}

class ThemePreviewLoadingState extends ThemePreviewState {}

class ThemePreviewLoadedState extends ThemePreviewState {
  dynamic themeData;
  ThemePreviewLoadedState(this.themeData);
}

class ThemePreviewAPIFailureState extends ThemePreviewState {
  String message;
  ThemePreviewAPIFailureState(this.message);
}
