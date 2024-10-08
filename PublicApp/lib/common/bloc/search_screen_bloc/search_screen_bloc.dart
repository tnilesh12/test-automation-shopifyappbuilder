import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/src/search_all/search_all.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenInitial()) {
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_SEARCH.name);
    ////////////////////////////
  }

  predictiveSearchAPI(String query) async {
    debugPrint("----------------------------------search query is $query ");
    if (query.isEmpty) {
      debugPrint("----------------------------------search query is empty ");
      emit(SearchScreenInitial());
    } else {
      emit(SearchScreenLoading());
      var formData = {"query": query};
      ApiResponse apiResponse =
          await ApiRepository.postAPI(ApiConst.predictiveSearch, formData);
      if (apiResponse.status) {
        debugPrint(
            "-------------predictiveSearchAPI response${apiResponse.data["result"]["body"]["data"]["predictiveSearch"]}");
        PredictiveSearchModel predictiveSearchModel =
            PredictiveSearchModel.fromJson(
                apiResponse.data["result"]["body"]["data"]["predictiveSearch"]);

        if (globals.Settings.containsKey(
            SettingsEnum.Smart_Search_Suggestions.name)) {
          if (predictiveSearchModel!.articles!.length == 0 &&
              predictiveSearchModel.collections!.length == 0 &&
              predictiveSearchModel.pages!.length == 0 &&
              predictiveSearchModel.products!.length == 0) {
            emit(SearchScreenNoDataFound());
          } else {
            emit(PredictiveSearchScreenSuccessState(predictiveSearchModel));
          }
        } else {
          if (predictiveSearchModel.products!.length == 0) {
            emit(SearchScreenNoDataFound());
          } else {
            emit(PredictiveSearchScreenSuccessState(predictiveSearchModel));
          }
        }
      } else {
        debugPrint("----------------------------------api failure bloc ");
        emit(PredictiveSearchAPIFailureState(apiResponse.message));
      }
    }
  }

/*
  Menus? _data;
  List<String> ids = [];
  List<String> collectionTitle = [];
  List<Collection> COLLECTION = [];

   void LoadDataCollection() async {
    if (await globals.postRepository.isConnected()) {
    collectionTitle.clear();
      // emit(SearchScreenLoading());
      _data = await ShopifyMenu.instance.getMenusByHandle("app-menu");
      print("data load from menu");
      _data!.items!.forEach((element) {
        if (element!.resourceId != null) {
          if (element!.resourceId!.contains("Collection")) {
            ids.add(element!.resourceId.toString());
            collectionTitle.add(element.title.toString());
          }
        }
        print(element.resourceId.toString());
      });
      print(":lenght of data ${ids.length}");
      COLLECTION.clear();
      if (ids.isNotEmpty) {
        COLLECTION = await ShopifyStore.instance.getCollectionsByIds(ids);
      } else {
        COLLECTION = await ShopifyStore.instance.getAllCollections();
      }

      if (COLLECTION == null) {
        emit(SearchScreenNoDataFound());
      } else {
        emit(SearchScreenLoadedCollection());
      }
    } else {
      emit(SearchScreenNoInternet());
    }
  }
  */
}
