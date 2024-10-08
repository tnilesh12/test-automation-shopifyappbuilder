import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'contact_us_event.dart';
import 'contact_us_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  String? address, email, phone;

  ContactUsBloc() : super(ContactUsInitialState()) {
    on<OnSubmitEvent>((event, emit) {
      submitInfo(event.name, event.email, event.number, event.message);
    });

    getContactInfo();

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_CONTACT_US_PAGE.name);
    ////////////////////////////
  }

  getContactInfo() async {
    emit(ContactUsLoadingState());
    ApiResponse response =
        await ApiRepository.getAPI(ApiConst.shopContactUsInfo);
    if (response.status && response.data["result"] != null) {
      phone = response.data["result"]["phone"];
      email = response.data["result"]["email"];
      address = response.data["result"]["address"];
      debugPrint("-------------response${response.data["result"]}");
      debugPrint("----------------------------------contact us bloc success ");
      // Future.delayed(Duration(milliseconds: 2000));
      emit(ContactUsSuccessState());
    } else {
      // debugPrint("-------------response${response.data["result"]}");
      debugPrint(
          "----------------------------------api failure bloc---------${response.message} ");
      emit(ContactUsSuccessState());
      // emit(ContactUsAPIFailureState(response.message));
    }
  }

  submitInfo(
    String name,
    String email,
    String phone_no,
    String message,
  ) async {
    emit(ContactUsSubmittingState());
    ShopifyUser? user = await Session().getLoginData();
    String id = user!.id!;
    var formData = {
      "customerId": id,
      "name": name,
      "email": email,
      "number": phone_no,
      "message": message,
      "type": "support"
    };

    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.shopContactUsSubmitInfo, formData);

    if (response.status) {
      print(
          "---------Contact us submitInfo----------Success-----------${response.data["message"]}");
      emit(ContactUsSuccessSubmitState(response.data["message"]));
    } else {
      print(
          "---------Contact us submitInfo------Api Failure------------${response.message}");
      emit(ContactUsAPIFailureState(response.message));
    }
  }
}
