import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'rating_review_event.dart';
import 'rating_review_state.dart';
import 'package:shopify_code/modelClass/review_model.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:dio/dio.dart';

class RatingReviewBloc extends Bloc<RatingReviewEvent, RatingReviewState> {
  String productId;
  RatingReviewBloc(this.productId) : super(RatingReviewInitialState()) {
    on<RatingReviewCreateEvent>((event, emit) {
      SubmitRatingInfo(event.productId, event.productSku, event.productTitle,
          event.rating, event.title, event.body);
    });

    on<ImageUploadEvent>((event, emit) {
      uploadImage(event.file);
    });

    loadStarWidgetData(productId);
    allReviewListApi("", productId);
  }

  int? averageRating, numberOfReviews;
  List<String>? imagesUrl = [];

  loadStarWidgetData(String productId) async {
    emit(RatingReviewLoadingState());
    productId = productId.replaceAll("gid://shopify/Product/", "");
    debugPrint(
        "--------------loadStarWidgetData------------productId$productId  ");

    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.getProductReviewCount.replaceAll("{p_id}", productId));

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadStarWidgetData bloc success ");
      try {
        debugPrint(
            "---aaaaaa-------------------------------loadStarWidgetData response${apiResponse.data["result"]["dataAverageRating"]} productId$productId ");
        double avgRating = double.parse(
            apiResponse.data["result"]["dataAverageRating"].toString());
        averageRating = avgRating.toInt();
        debugPrint(
            "---aaaaaa-------------------------------loadStarWidgetData averageRating$averageRating productId$productId ");
        numberOfReviews = apiResponse.data["result"]["dataNumberOfReviews"];
        // emit(StarWidgetLoadedState(averageRating));
      } catch (e) {
        averageRating = 0;
        numberOfReviews = 0;
        // emit(StarWidgetNoDataState(0));
      }
    } else {
      averageRating = 0;
      numberOfReviews = 0;
      debugPrint(
          "----------------------------------loadStarWidgetData bloc failure ");
      // emit(StarWidgetAPIFailureState(apiResponse.message));
      // emit(StarWidgetNoDataState(0));
    }
  }

  uploadImage(File file) async {
    emit(ReviewImageUploadingState());
    File? compressedFile;

    try {
      // Get the path for the compressed image
      var filePath = file.path;

      // Compress the image
      var result = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: 70,
      );
      // File file = File(filePath);
      // Create a new File instance with the compressed image data
      compressedFile = await file.writeAsBytes(result!);

      // return compressedFile;
    } catch (error) {
      debugPrint(
          "---------------Error while compressing image: $error---------------");
    }

    Map<String, dynamic>? newMap = {};
    if (compressedFile == null) {
      debugPrint("-------------compressedFile is null---------------");
      emit(ReviewImageUploadingErrorState(""));
    } else {
      newMap['files'] = await MultipartFile.fromFile(compressedFile!.path);

      var formData = FormData.fromMap(newMap);
      String token = await Session().getAccessToken();
      debugPrint("---------------Access Token---------------" + token);
      ApiResponse response =
          await ApiRepository.postAPI(ApiConst.imageApi, formData);

      if (response.status) {
        debugPrint(response.data['result'][0]['url']);
        debugPrint(
            "-------------------success emited successfully---------------");
        String urlData = response.data['result'][0]['url'];
        imagesUrl!.removeLast();
        imagesUrl!.add(urlData.toString());
        emit(ReviewImageUploadedState(response.message));
      } else {
        emit(ReviewImageUploadingAPIFailureState(response.message));
      }
    }
  }

  SubmitRatingInfo(String productId, String productSku, String productTitle,
      String rating, String title, String body) async {
    emit(RatingReviewSubmittingState());
    ShopifyUser? shopifyUser = await Session().getLoginData();

    String customerEmail = shopifyUser!.email!;
    String customerName = shopifyUser.firstName!;
    productId = productId.replaceAll("gid://shopify/Product/", "");
    productSku = productSku.replaceAll("gid://shopify/Product/", "");

    var jsonFormData = {
      "productId": productId,
      "productSku": productSku,
      "productTitle": productTitle,
      "customerEmail": customerEmail,
      "customerName": customerName,
      "rating": int.parse(rating),
      "title": title,
      "body": body,
      "images": imagesUrl == null ? [] : imagesUrl
    };
    debugPrint(
        "formdata-----------${jsonFormData}--------->>>>>>>>${productSku}");

    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.createRatingReview, jsonFormData);
    debugPrint(
        "Create Rating Review response is ------ >>>>> ${response.toJson()}");

    if (response.status) {
      debugPrint("-----------------${response.message.toString()}");
      emit(RatingReviewSuccessState(response.message));
    } else {
      debugPrint("-----------------${response.message}");
      emit(RatingReviewFailureState(response.message));
    }
  }

// List<Reviews>? reviewdata = [];
  allReviewListApi(String internalId, String productId) async {
    emit(RatingReviewLoadingState());
    productId = productId.replaceAll("gid://shopify/Product/", "");
    var jsonFormData = {"internalId": ""};
    debugPrint("all review list jsondata ---- ${jsonFormData}");
    ApiResponse response = await ApiRepository.postAPI(
        ApiConst.productReviewList.replaceAll("{p_id}", productId),
        jsonFormData);
    debugPrint("all review list response ---- ${response.toJson()}");

    if (response.status) {
      Result reviewData = Result.fromJson(response.data["result"]);
      debugPrint(
          "-----------------review listttttttt ----${reviewData}-----------------");
      // reviewdata = response.data["result"];
      if (reviewData.reviews!.length == 0) {
        debugPrint(
            "----------allReviewListApi-----no data state emitted-----------------");
        emit(RatingReviewNoDataState());
      } else {
        debugPrint(
            "----------allReviewListApi-----loaded data state emitted-----------------");
        emit(RatingReviewLoadedState(
            reviewData.reviews, averageRating!, numberOfReviews!));
      }
    } else {
      debugPrint(
          "-----------------loadStarWidgetData bloc failure-----------------${response.message}");
      emit(RatingReviewFailureState(response.message));
    }
  }
}
