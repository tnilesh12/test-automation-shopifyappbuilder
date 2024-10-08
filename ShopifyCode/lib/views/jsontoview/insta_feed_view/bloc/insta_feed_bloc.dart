import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/insta_feed/insta_feed_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/bloc/insta_feed_event.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/bloc/insta_feed_state.dart';

class InstaFeedBloc extends Bloc<InstaFeedEvent, InstaFeedState> {
  InstaFeedBloc() : super(InstaFeedInitialState()) {
    LoadInstaFeedData();
  }

  InstaFeedModel? instaFeedModel;

  void LoadInstaFeedData() async {
    emit(InstaFeedLoadingState());
    ApiResponse apiResponse = await ApiRepository.getAPI(ApiConst.getInstaFeed);
    if (apiResponse.status) {
      debugPrint("-------------LoadInstaFeedData response${apiResponse.data["result"]}");
      // FormModel
      instaFeedModel = InstaFeedModel.fromJson(apiResponse.data["result"]);

      emit(InstaFeedDataLoadedState(instaFeedModel!));
    } else {
      debugPrint(
          "----------------------LoadInstaFeedData------------api failure bloc ");
      emit(InstaFeedAPIFailureState(apiResponse.message));
    }
  }
}
