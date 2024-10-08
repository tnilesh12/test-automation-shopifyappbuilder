import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'user_list_preview_app_event.dart';
import 'user_list_preview_app_state.dart';

class UserListPreviewAppBloc
    extends Bloc<UserListPreviewAppEvent, UserListPreviewAppState> {
  int limit = 100;
  int offset = 0;
  int currentPage = 1;
  int pageCount = 0;
  bool loadMore = true;
  UserListPreviewAppBloc() : super(UserListPreviewAppInitialState()) {
    loadData(limit, offset);

    on<UserListOnScrollPreviewAppEvent>((event, emit) {
      // TODO: implement event handler
      if (loadMore) {
        currentPage = event.currentPage;
        if (currentPage == 1) {
          offset = 0;
        } else {
          offset = offset + limit;
        }
        getCustomerList(limit, offset);
      }
    });
  }

  List<dynamic>? customerList = [];
  String? partnerId;

  loadData(int limit, offset) async {
    await getPartnerId();
    getCustomerList(limit, offset);
  }

  getPartnerId() async {
    var partnerData = await Session().getPartnerLoginData();
    partnerId = partnerData!["_id"].toString();
  }

  getCustomerList(int limit, offset) async {
    emit(UserListPreviewAppLoadingState());
    var formData = {"limit": limit, "offset": offset};
    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.getCustomerList, formData);

    int totalCount = 0;
    if (apiResponse.status) {
      debugPrint(
          "-------------getCustomerList success response${apiResponse.data["result"]}");
      List<dynamic> result = apiResponse.data["result"];
      result.forEach((customer) {
        // debugPrint("-------------result $customer");
        if (customer.containsKey("firstName")) {
          debugPrint("-------------result login user $customer");
          customerList!.add(customer);
          totalCount++;
        }
      });
      if (customerList!.length == totalCount) {
        loadMore = false;
      } else {
        loadMore = true;
      }
      // customerList = apiResponse.data["result"];
      debugPrint("-------------getCustomerList success response$customerList");
      emit(UserListPreviewAppLoadedState(customerList));
    } else {
      debugPrint(
          "----------------------submitFormData------------api failure bloc---${apiResponse.message}-----");
      emit(UserListPreviewAppAPIFailureState(apiResponse.message));
    }
  }
}
