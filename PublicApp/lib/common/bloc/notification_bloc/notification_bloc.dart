import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/notificationlist_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  int limit = 5;
  int offset = 0;
  int totalCount = 0;
  int current_page = 1;
  int PageCount = 0;
  bool LoadMore = true;
  NotificationBloc() : super(NotificationInitialState()) {
    emit(NotificationLoadingState());
    on<NotificationEventOnScrollEvent>((event, emit) {
      // TODO: implement event handler
      if (LoadMore) {
        current_page = event.index;
        if (current_page == 1) {
          offset = 0;
        } else {
          offset = offset + limit;
        }
        NotificationListApi(limit, offset);
      }
    });

    NotificationListApi(limit, offset);
  }

  loadData() async {
    offset = 0;
    current_page = 1;
    LoadMore = true;
    // data.clear();
  }

  List<Result> data = [];
  NotificationListApi(int limit, offset) async {
    var jsonFormData = {"limit": limit, "offset": offset};

    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.notificationlist, jsonFormData);
    debugPrint("notification list response ---->>>  $response");

    Map<String, dynamic> parsed = response.data;

    NotificationListModel notificationdata =
        NotificationListModel.fromJson(parsed);
    data.addAll(notificationdata.result!);
    totalCount = notificationdata.result!.length;
    if (data.length == totalCount) {
      LoadMore = false;
    } else {
      LoadMore = true;
    }
    debugPrint("--------------------------${notificationdata.result}");
    emit(NotificationLoadedState(data, '$PageCount', LoadMore));
  }
}
