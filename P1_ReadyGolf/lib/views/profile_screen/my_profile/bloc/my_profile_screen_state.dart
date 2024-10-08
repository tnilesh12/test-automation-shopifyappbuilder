class MyProfileScreenState {}

class MyProfileScreenInitialState extends MyProfileScreenState {}

class MyProfileScreenLoading extends MyProfileScreenState {}

class MyProfileScreenSuccessState extends MyProfileScreenState {
  String success;

  MyProfileScreenSuccessState(this.success);
}

class MyProfileScreenMessageState extends MyProfileScreenState {
  String message;

  MyProfileScreenMessageState(this.message);
}

class MyProfileScreenErrorState extends MyProfileScreenState {
  String error;

  MyProfileScreenErrorState(this.error);
}

class MyProfileAPIFailureState extends MyProfileScreenState {
  String message;

  MyProfileAPIFailureState(this.message);
}

class ImageSuccessState extends MyProfileScreenState {
  String success;

  ImageSuccessState(this.success);
}

class ProfileImageUploadedState extends MyProfileScreenState {
  dynamic data;

  ProfileImageUploadedState(this.data);
}

class ProfileImageLoadingState extends MyProfileScreenState {
  ProfileImageLoadingState();
}
