class UserListPreviewAppState {}

class UserListPreviewAppInitialState extends UserListPreviewAppState {}

class UserListPreviewAppLoadingState extends UserListPreviewAppState {}

class UserListPreviewAppLoadedState extends UserListPreviewAppState {
  dynamic themeData;
  UserListPreviewAppLoadedState(this.themeData);
}

class UserListPreviewAppAPIFailureState extends UserListPreviewAppState {
  String message;
  UserListPreviewAppAPIFailureState(this.message);
}
