import 'package:bloc/bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_event.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_state.dart';

class EmailSubscriptionBloc
    extends Bloc<EmailSubscriptionEvent, EmailSubscriptionState> {
  EmailSubscriptionBloc() : super(EmailSubscriptionInitialState()) {
    on<OnButtonClickEvent>((event, emit) {
      emit(EmailSubscriptionLoadState());
      if(event.customerEmail.trim().isEmpty){
        emit(EmailEmptyState());
      }
      else if(validateEmailStructure(event.customerEmail.trim())){
        emailSubscriptionApi(event.customerEmail,event.pluginName);
      }
      else{
        emit(EmailInvalidState());
      }
    });
  }
  emailSubscriptionApi(String email,String pluginName) async {
    var formData = {"customerEmail": email, "pluginApp": pluginName};
    ApiResponse response =
        await ApiRepository.postAPI(ApiConst.emailSubscription, formData);
    if (response.status) {
      emit(EmailSubscriptionSuccessState(response.message));
    } else {
      emit(EmailSubscriptionFailedState(response.message));
    }
  }
   bool validateEmailStructure(String value) {
    String pattern = '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
