import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/views/profile_screen/account_deletion_request/bloc/account_deletion_request_event.dart';
import '/views/profile_screen/account_deletion_request/bloc/account_deletion_request_state.dart';

class AccountDeletionRequestBloc
    extends Bloc<AccountDeletionRequestEvent, AccountDeletionRequestState> {
  AccountDeletionRequestBloc() : super(AccountDeletionRequestInitialState()) {
    on<OnAccountDeletionRequestSubmitEvent>((event, emit) {
      accountDeleteRequest(
          event.name, event.email, event.number, event.message);
    });

    getContactInfo();
  }

  ShopifyUser? shopifyUser1;

  getContactInfo() async {
    emit(AccountDeletionRequestLoadingState());
    shopifyUser1 = await Session().getLoginData();
    emit(AccountDeletionRequestSuccessState(shopifyUser1!));
  }

  accountDeleteRequest(
    String name,
    String email,
    String phone_no,
    String message,
  ) async {
    emit(AccountDeletionRequestSubmittingState());
    ShopifyUser? user = await Session().getLoginData();
    String id = user!.id!;
    var formData = {
      "customerId": id,
      "name": name,
      "email": email,
      "number": phone_no,
      "message": message,
      "type": "delete"
    };

    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.shopContactUsSubmitInfo, formData);

    if (response.status) {
      print(
          "---------AccountDeletionRequestBloc submitInfo----------Success-----------${response.data["message"]}");
      emit(AccountDeletionRequestSuccessSubmitState(response.data["message"]));
    } else {
      print(
          "---------AccountDeletionRequestBloc submitInfo------Api Failure------------${response.message}");
      emit(AccountDeletionRequestAPIFailureState(response.message));
    }
  }
}
