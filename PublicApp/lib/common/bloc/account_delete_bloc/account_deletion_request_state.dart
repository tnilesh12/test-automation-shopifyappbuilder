import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';

abstract class AccountDeletionRequestState {}

class AccountDeletionRequestInitialState extends AccountDeletionRequestState {}

class AccountDeletionRequestLoadingState extends AccountDeletionRequestState {}

class AccountDeletionRequestSuccessState extends AccountDeletionRequestState {
  ShopifyUser shopifyUser;
  AccountDeletionRequestSuccessState(this.shopifyUser);
}

class AccountDeletionRequestAPIFailureState
    extends AccountDeletionRequestState {
  String message;
  AccountDeletionRequestAPIFailureState(this.message);
}

class AccountDeletionRequestSubmittingState
    extends AccountDeletionRequestState {}

class AccountDeletionRequestSuccessSubmitState
    extends AccountDeletionRequestState {
  String message;
  AccountDeletionRequestSuccessSubmitState(this.message);
}
