import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import '/views/auth/change_password/bloc/change_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/views/auth/change_password/bloc/change_password_state.dart';

class ChangePasswordMessageBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordMessageBloc() : super(ChangePasswordInitialState()) {
    on<onSubmitEvent>((event, emit) {
      changePassword(event.password, event.confirmPassword);
    });
  }

  changePassword(String password, String confirmPassword) async {
    emit(ChangePasswordSubmittingState());
    String accesstoken = await Session().getAccessToken();
    print("---------AccessToken $accesstoken");
    var formData = {"password": password, "confirmPassword": confirmPassword};

    ApiResponse response = await ApiRepository.postAPI(
        ApiConst.changePassword.replaceAll("{accesstoken}", accesstoken),
        formData);

    if (response.status) {
      emit(ChangePasswordSuccessState(response.data["message"]));
    } else {
      emit(ChangePasswordAPIFailureState(response.data["message"]));
    }
  }
}
