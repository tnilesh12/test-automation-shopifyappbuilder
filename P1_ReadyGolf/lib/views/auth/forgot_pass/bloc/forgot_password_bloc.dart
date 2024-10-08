import 'package:flutter/material.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import '/views/auth/forgot_pass/bloc/forgot_password_event.dart';
import '/views/auth/forgot_pass/bloc/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
    on<onForgotPasswordButtonClick>((event, emit) async {
      forgotPasswordAPI(event);
    });

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.FORGOT_PAGE.name);
    ////////////////////////////
  }

  forgotPasswordAPI(onForgotPasswordButtonClick event) async {
    emit(ForgotPasswordSubmittingState());
    ApiResponse response = await ApiRepository.postAPI(
        ApiConst.forgotPasswordCustomer.replaceAll("{email}", event.email), {});
    if (response.status) {
      print("-------------response${response.data["result"]}");
      debugPrint(
          "----------------------------------ForgotPassword bloc success ");
      emit(ForgotPasswordSuccessState());
    } else {
      debugPrint("----------------------------------api failure bloc ");
      emit(ForgotPasswordAPIFailureState(response.message));
    }
  }
}
