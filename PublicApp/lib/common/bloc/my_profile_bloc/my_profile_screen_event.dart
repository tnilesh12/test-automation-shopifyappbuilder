import 'dart:io';

class MyProfileScreenEvent {}

class MyProfileScreenSubmitEvent extends MyProfileScreenEvent {
  String firstName;
  String lastName;
  String mobileNo;
  String image;
  MyProfileScreenSubmitEvent(
      this.firstName, this.lastName, this.mobileNo, this.image);
}

class ImageUploadEvent extends MyProfileScreenEvent {
  File? url;
  ImageUploadEvent(this.url);
}
