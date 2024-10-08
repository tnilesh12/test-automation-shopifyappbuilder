import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/modelClass/boost_ai/boost_ai_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/globels.dart' as globals;
import '/views/search/boost_ai_search/bloc/boost_ai_event.dart';
import '/views/search/boost_ai_search/bloc/boost_ai_state.dart';

class BoostAISearchScreenBloc
    extends Bloc<BoostAISearchScreenEvent, BoostAISearchScreenState> {
  BoostAISearchScreenBloc() : super(BoostAISearchScreenInitial()) {
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_SEARCH.name);
    ////////////////////////////
  }

  boostAISearchAPI(String query) async {
    debugPrint("----------------------------------search query is $query ");
    if (query.isEmpty) {
      debugPrint("----------------------------------search query is empty ");
      emit(BoostAISearchScreenInitial());
    } else {
      emit(BoostAISearchScreenLoading());

      ApiResponse apiResponse = await ApiRepository.getAPIForBoostAI(
          (ApiConst.boostAISearch).replaceAll("{query}", query));
      if (apiResponse.status) {
        BoostAISearch boostAISearchModel =
            BoostAISearch.fromJson(apiResponse.data);
        if (boostAISearchModel.collections!.length == 0 &&
            boostAISearchModel.pages!.length == 0 &&
            boostAISearchModel.products!.length == 0) {
          emit(BoostAISearchScreenNoDataFound());
        } else {
          emit(BoostAISearchScreenSuccessState(boostAISearchModel));
        }
      } else {
        debugPrint("----------------------------------api failure bloc ");
        emit(BoostAISearchAPIFailureState(apiResponse.message));
      }
    }
  }
}
