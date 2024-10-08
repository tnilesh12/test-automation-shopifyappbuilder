import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'my_profile_screen_event.dart';
import 'my_profile_screen_state.dart';

class MyProfileScreenBloc
    extends Bloc<MyProfileScreenEvent, MyProfileScreenState> {
  String uri = "";
  File? url;
  String filePath = "";

  String profileImage = "";
  var data;
  ShopifyUser? shopifyUser;

  // String? profileImage;
  MyProfileScreenBloc() : super(MyProfileScreenInitialState()) {
    on<MyProfileScreenSubmitEvent>((event, emit) {
      updateProfile(event.firstName, event.lastName, event.mobileNo,
          event.image.isEmpty ? "" : event.image);
      //// FIREBASE EVENT /////////
      globals.analytics.logEvent(name: FireBaseEvent.PROFILE_UPDATE.name);
      ////////////////////////////
    });
    on<ImageUploadEvent>((event, emit) {
      url = event.url;
      imageUpload();
    });
    profileImageApi();
  }

  profileImageApi() async {
    emit(ProfileImageLoadingState());
    shopifyUser = await Session().getLoginData();
    String id = shopifyUser!.id!;
    // debugPrint("access token ...${await Session().getAccessToken()}");
    debugPrint(id + "---------->" + shopifyUser!.toJson().toString());
    ApiResponse response = await ApiRepository.getAPI(
        ApiConst.getCustomerById.replaceAll("{id}", id));

    if (response.status) {
      // data = response.data;
      profileImage = response.data["result"]["profileImage"] == null
          ? ""
          : response.data["result"]["profileImage"];
      // url = profileImage.path;
      debugPrint(" ------Show image-------->>> " + profileImage.toString());
      emit(ProfileImageUploadedState(profileImage.toString()));
    } else {
      emit(MyProfileAPIFailureState(response.message));
    }
  }

  updateProfile(String firstName, String lastName, String phone,
      String profileImage) async {
    emit(MyProfileScreenLoading());
    ShopifyUser? shopifyUser = await Session().getLoginData();
    String token = await Session().getAccessToken();
    String id = shopifyUser!.id!;
    debugPrint(id);
    var formData = {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "profileImage": profileImage,
      "customerId": shopifyUser.shopifyId
    };
    if (firstName.length == 0) {
      emit(MyProfileScreenErrorState("FirstName is required"));
    } else if (lastName.length == 0) {
      emit(MyProfileScreenErrorState("LastName is required"));
    } else if (phone.length == 0) {
      emit(MyProfileScreenErrorState("PhoneNo. is required"));
    } else if (phone.length < 10 || phone.contains(" ")) {
      emit(MyProfileScreenErrorState("PhoneNo. should be of 10 digit"));
    }
    // else if (profileImage.length == 0) {
    //   emit(MyProfileScreenErrorState("Image is required"));
    // }
    else {
      ApiResponse response = await ApiRepository.putAPI(
          ApiConst.myProfileApi
              .replaceAll("{id}", id)
              .replaceAll("{accesstoken}", token),
          formData);

      if (response.status) {
        ShopifyUser sh = ShopifyUser(
          id: shopifyUser.id,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          address: shopifyUser.address,
          email: shopifyUser.email,
          fcmToken: shopifyUser.fcmToken,
          deviceId: shopifyUser.deviceId,
          deviceName: shopifyUser.deviceName,
          shopifyId: shopifyUser.shopifyId,
          partnerId: shopifyUser.partnerId,
          lastIncompleteCheckout: shopifyUser.lastIncompleteCheckout,
          displayName: shopifyUser.displayName,
          // createdAt: shopifyUser.createdAt,
        );
        debugPrint(" ------Show image-------->>> " + profileImage.toString());
        await Session().setLoginData(sh);
        // if(response.data)
        emit(MyProfileScreenSuccessState("Profile Updated Successfully"));
      } else {
        emit(MyProfileAPIFailureState(response.message));
      }
    }
  }

  imageUpload() async {
    emit(ProfileImageLoadingState());
    File? compressedFile;

    // Future<File> compressImage(File url) async {
    try {
      // Get the path for the compressed image
      filePath = url!.path;

      // Compress the image
      var result = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: 70,
      );
      File file = File(filePath);
      // Create a new File instance with the compressed image data
      compressedFile = await file.writeAsBytes(result!);

      // return compressedFile;
    } catch (error) {
      debugPrint("Error while compressing image: $error");
      // return url;
    }
    // }

    Map<String, dynamic>? newMap = {};
    if (compressedFile == null) {
      debugPrint("-------------compressedFile is null");
      emit(MyProfileScreenErrorState(""));
    } else {
      newMap['files'] = await MultipartFile.fromFile(compressedFile!.path);

      var formData = FormData.fromMap(newMap);
      String token = await Session().getAccessToken();
      debugPrint("<-------->Access Token<-------->" + token);
      ApiResponse response =
          await ApiRepository.postAPI(ApiConst.imageApi, formData);
      debugPrint("...............................");

      if (response.status) {
        data = response.data['result'];
        debugPrint(response.data['result'][0]['url']);
        debugPrint("-------------------success emited successfully");
        emit(ImageSuccessState(response.message));
      } else {
        emit(MyProfileAPIFailureState(response.message));
      }
    }
  }
}
