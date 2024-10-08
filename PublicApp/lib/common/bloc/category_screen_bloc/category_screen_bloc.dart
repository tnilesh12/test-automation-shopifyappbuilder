import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/modelClass/src/collection/collections/collections.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/globels.dart' as globals;
part 'category_screen_event.dart';
part 'category_screen_state.dart';

class CategoryScreenBloc
    extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  CategoryScreenBloc() : super(CategoryScreenInitial()) {
    loadCollection();

    on<CategoryScreenEvent>((event, emit) {});

    on<OnCategoryItemClick>((event, emit) {
      changeStyle = event.index;
      emit(CategoryScreenLoaded(menuDataModel!, 0!));
      print("change index" + event.index.toString());
      // LoadDataSubCollection([]);
    });

    // on<OnSubCategoryItemClick>((event, emit) {});
  }

  loadCollection() {
    // if (AppConfig.collectionMenuHandle != "") {
    if (menuDataModel != null) {
      loadDataCollectionMenuHandle();
    }
    // } else {
    //   if (collectionList.length == 0) {
    //     loadDataCollection();
    //   }
    // }
  }

  // loadDataCollectionMenu() async {
  //   emit(CategoryScreenLoadingCollection());
  //   // var formData = {"menu": AppConfig.collectionMenuHandle};
  //   // ApiResponse apiResponse =
  //   //     await ApiRepository.postAPI(ApiConst.getCollectionMenuHandle, formData);
  //   // if (apiResponse.status) {
  //   debugPrint(
  //       "----------------------------------loadDataCollectionMenuHandle bloc success ");
  //   // debugPrint(
  //   //     "-------------response${apiResponse.data["result"]["body"]["data"]["menu"]}");
  //   menuDataModel = await Session().getAppMenuData();
  //   // Menus.fromJson(apiResponse.data["result"]["body"]["data"]["menu"]);
  //   Collection c;
  //   emit(CategoryScreenLoaded(menuDataModel!, 0));
  //   // COLLECTION.clear();
  //   // menuDataModel!.menuItems!.forEach((element) {
  //   //   if (element!.resourceId != null) {
  //   //     if (element!.resourceId!.contains("Collection")) {
  //   //       // ids.add(element!.resourceId.toString());
  //   //       c = Collection.fromJson(element.resource!);
  //   //       COLLECTION.add(c);
  //   //     }
  //   //   }
  //   //   debugPrint(element.resourceId.toString());
  //   // });
  //   // debugPrint("----------collection data length--${COLLECTION.length}-----");
  //   // // if (ids.isNotEmpty) {
  //   // //   COLLECTION = await ShopifyStore.instance.getCollectionsByIds(ids);
  //   // // } else {
  //   // //   COLLECTION = await ShopifyStore.instance.getAllCollections();
  //   // // }
  //   // if (COLLECTION.length == 0) {
  //   //   emit(CategoryScreenNoDataFound());
  //   // } else {
  //   //   emit(CategoryScreenLoadedCollection());
  //   // }
  //   // } else {
  //   //   debugPrint(
  //   //       "--------------------loadDataCollectionMenuHandle--------------api failure bloc ");
  //   //   emit(CategoryScreenAPIFailureState(apiResponse.message));
  //   // }
  // }

  int? changeStyle = 0;
  MenuDataModel? menuDataModel = MenuDataModel();
  bool isMultiLevel = false;
  bool noDataFound = true;

  // List<String> ids = [];

  List<Collection> collectionList = [];
  List<Collection> subCollectionList = [];

  loadDataCollectionMenuHandle() async {
    String themeName = globals.publishedTheme;
    emit(CategoryScreenLoadingCollection());
    ApiResponse apiResponse = await ApiRepository.getAPI(ApiConst
        .getCollectionFromDesign
        .replaceAll("{theme_name}", themeName)
        .replaceAll("{is_published}", "no"));
    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadDataCollectionMenuHandle bloc success ");
      // debugPrint(
      //     "-------------response${apiResponse.data["result"]["body"]["data"]["menu"]}");
      menuDataModel = MenuDataModel.fromJson(
          // apiResponse.data["result"]["body"]["data"]["menu"]);
          apiResponse.data["result"][0]);

      /*
      menuDataModel!.menuItems!.forEach((element) {
        debugPrint(
            "----------element-----${element.toJson()}------------------");
        if (element.items!.isNotEmpty) {
          isMultiLevel = true;
          if ((element!.resourceId != null) &&
              (element!.resourceId!.contains("collection"))) {
            debugPrint(
                "----------element--2222---${element.toJson()}------------------");
            noDataFound = false;
          }
          element.items!.forEach((subElement) {
            if (subElement.items!.isNotEmpty) {
              if ((subElement!.resourceId != null) &&
                  (subElement!.resourceId!.contains("collection"))) {
                debugPrint(
                    "----------subElement--2222---${subElement.toJson()}------------------");
                noDataFound = false;
              } else {
                if ((element!.resourceId != null) &&
                    (element!.resourceId!.contains("collection"))) {
                  debugPrint(
                      "----------element--2222---${element.toJson()}------------------");
                  noDataFound = false;
                }
              }
            }
          });
        }
        // if ((element!.resourceId != null) && (element!.resourceId!.contains("collection"))) {
        //     debugPrint("----------element--2222---${element.toJson()}------------------");
        //     noDataFound = false;
        //     if (element.items!.isNotEmpty) {
        //       isMultiLevel = true;
        //     }
        // }
      });
       */
      if (menuDataModel != null && menuDataModel!.menuItems!.isNotEmpty) {
        menuDataModel!.menuItems!.forEach((element) {
          if (element!.items!.isNotEmpty) {
            isMultiLevel = true;
          }
        });
      }

      if (menuDataModel != null && menuDataModel!.menuItems!.isNotEmpty) {
        noDataFound = false;
      }

      debugPrint(
          "----isMultiLevel $isMultiLevel----noDataFound-$noDataFound--");
      if (noDataFound) {
        emit(CategoryScreenNoDataFound());
      } else {
        emit(CategoryScreenLoaded(menuDataModel!, 0));
      }
    } else {
      debugPrint(
          "--------------------loadDataCollectionMenuHandle--------------api failure bloc ");
      emit(CategoryScreenAPIFailureState(apiResponse.message));
    }
  }

  loadDataCollection() async {
    emit(CategoryScreenLoadingCollection());
    var formData = {"limit": 250, "cursor": ""};
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.getCollectionList, formData);
    if (apiResponse.status) {
      debugPrint(
          "----------------------------------LoadDataCollection bloc success ");
      // debugPrint(
      //     "-------------response${apiResponse.data["result"]["body"]["data"]["collections"]}");
      Collections collections = Collections.fromGraphJson(
          apiResponse.data["result"]["body"]["data"]["collections"]);

      collectionList.clear();
      collectionList = collections.collectionList!;

      if (collectionList.length == 0) {
        emit(CategoryScreenNoDataFound());
      } else {
        emit(CategoryScreenLoadedCollection());
      }
    } else {
      debugPrint(
          "--------------------LoadDataCollection--------------api failure bloc ");
      emit(CategoryScreenAPIFailureState(apiResponse.message));
    }
  }
/*
  loadDataCollectionMenuHandle() async {
    emit(CategoryScreenLoadingCollection());
    var formData = {"menu": AppConfig.collectionMenuHandle};
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.getCollectionMenuHandle, formData);
    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadDataCollectionMenuHandle bloc success ");
      // debugPrint(
      //     "-------------response${apiResponse.data["result"]["body"]["data"]["menu"]}");
      menuItems = MenuItems.fromJson(
          apiResponse.data["result"]["body"]["data"]["menu"]);
      menuItems!.items!.forEach((element) {
        if (element!.resourceId != null) {
          if (element!.resourceId!.contains("Collection")) {
            noDataFound = false;
            if (element.items!.isNotEmpty) {
              isMultiLevel = true;
            }
            // ids.add(element!.resourceId.toString());
            // c = Collection.fromJson(element.resource!);
            // collectionList.add(c);
          }
        }
      });
      debugPrint("----isMultiLevel $isMultiLevel-------");
      if (noDataFound) {
        emit(CategoryScreenNoDataFound());
      } else {
        emit(CategoryScreenLoaded(menuItems!, 0));
      }
    } else {
      debugPrint(
          "--------------------loadDataCollectionMenuHandle--------------api failure bloc ");
      emit(CategoryScreenAPIFailureState(apiResponse.message));
    }
  }
*/
  // void LoadDataCollection() async {
  //     emit(CategoryScreenLoadingCollection());
  //     _data = await ShopifyMenu.instance.getMenusByHandle("app-menu");
  //     print("data load from menu");
  //     _data!.items!.forEach((element) {
  //       if (element!.resourceId != null) {
  //         if (element!.resourceId!.contains("Collection")) {
  //           ids.add(element!.resourceId.toString());
  //         }
  //       }
  //       print(element.resourceId.toString());
  //     });
  //     print(":lenght of data ${ids.length}");
  //     COLLECTION.clear();
  //     if (ids.isNotEmpty) {
  //       COLLECTION = await ShopifyStore.instance.getCollectionsByIds(ids);
  //     } else {
  //       COLLECTION = await ShopifyStore.instance.getAllCollections();
  //     }
  //     if (COLLECTION == null) {
  //       emit(CategoryScreenNoDataFound());
  //     } else {
  //       emit(CategoryScreenLoadedCollection());
  //     }
  // }
  // void LoadDataSubCollection(List<String> ids) async {
  //   if (await globals.postRepository.isConnected()) {
  //     emit(CategoryScreenLoadingSubCollection());
  //     if (ids.isNotEmpty)
  //       SUBCOLLECTION = await ShopifyStore.instance.getCollectionsByIds(ids);
  //     else
  //       SUBCOLLECTION = await ShopifyStore.instance.getAllCollections();
  //     if (SUBCOLLECTION == null) {
  //       emit(CategoryScreenNoDataFound());
  //     } else {
  //       emit(CategoryScreenLoadedSubCollection());
  //     }
  //   } else {
  //     emit(CategoryScreenNoInternetConnection());
  //   }
  // }
}
