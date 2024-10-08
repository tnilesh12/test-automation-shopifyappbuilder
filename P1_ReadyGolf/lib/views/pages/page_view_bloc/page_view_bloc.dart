import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/page/page.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import '../../../views/pages/page_view_bloc/page_view_event.dart';
import '../../../views/pages/page_view_bloc/page_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewScreenBloc
    extends Bloc<PageViewScreenEvent, PageViewScreenState> {
  String id;

  PageViewScreenBloc(this.id) : super(PageViewScreenInitialState()) {
    on<PageViewScreenEvent>((event, emit) {});
    // loadPageHandleData();
    if (id.contains("gid")) {
      loadPageHandleData();
    } else {
      loadPageHandleDataByHandle();
    }
  }

  loadPageHandleData() async {
    emit(PageViewScreenLoadingState());
    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.pageById.replaceAll("{page_id}", id));

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------LoadBlogHandleData bloc success ");
      debugPrint(
          "-------------response${apiResponse.data["result"]["body"]["data"]["page"]}");
      Pagess pagess =
          Pagess.fromJson(apiResponse.data["result"]["body"]["data"]["page"]);
      emit(PageViewScreenLoadedState(pagess));
    } else {
      debugPrint(
          "--------------------LoadBlogHandleData--------------api failure bloc ");
      emit(PageViewScreenAPIFailureState(apiResponse.message));
    }
  }

  loadPageHandleDataByHandle() async {
    emit(PageViewScreenLoadingState());
    var formData = {"handle": id};
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.pageByHandle, formData);

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------LoadBlogHandleData bloc success ");
      debugPrint(
          "-------------response${apiResponse.data["result"]["body"]["data"]["pageByHandle"]}");
      Pagess pagess = Pagess.fromJson(
          apiResponse.data["result"]["body"]["data"]["pageByHandle"]);
      emit(PageViewScreenLoadedState(pagess));
    } else {
      debugPrint(
          "--------------------LoadBlogHandleData--------------api failure bloc ");
      emit(PageViewScreenAPIFailureState(apiResponse.message));
    }
  }
}
