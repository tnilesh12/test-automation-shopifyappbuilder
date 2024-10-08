import 'package:publicapp/common/bloc/address_list_screen_bloc/address_list_event.dart';
import 'package:publicapp/common/bloc/address_list_screen_bloc/address_list_state.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/modelClass/src/shopify_user/addresses/addresses.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;

class AddressListScreenBloc
    extends Bloc<AddressListScreenEvent, AddressListScreenState> {
  AddressListScreenBloc() : super(AddressListScreenInitial()) {
    on<AddressListScreenEvent>((event, emit) async {});
    on<AddressDelete>(
      (event, emit) async {
        // emit(AddressListScreenLoading());
        String accessToken = await Session().getAccessToken();
        String input = event.addressId.toString();

        int index = input.indexOf("CustomerAddress");

        String result = input.substring(0, index + "CustomerAddress".length);
        print("-------------------Delete API called---------------------");
        ApiResponse response = await ApiRepository.deleteAPI(
            ApiConst.addressDeleteApi.replaceAll("{accesstoken}", accessToken),
            data: {"id": result});
        if (response.status) {
          emit(AddressListSuccessState(response.message));
          AddressListApi();
          // emit(AddressListScreenLoaded(addressList));
        }
        //// FIREBASE EVENT /////////
        globals.analytics.logEvent(name: FireBaseEvent.DELETE_ADDRESS.name);
        ////////////////////////////
      },
    );

    AddressListApi();
  }

  // loadData(){
  //    AddressListApi();
  // }

  List<Address> list = [];
  // Addresses list = Addresses();

  loadData() {
    list = [];
    AddressListApi();
  }

  Future<void> AddressListApi() async {
    String accessToken = await Session().getAccessToken();
    print("-------------------AddressListApi called---------------------");
    emit(AddressListScreenLoading());
    var formData = {"limit": 10};
    ApiResponse response = await ApiRepository.postAPI(
        ApiConst.addressListUrl.replaceAll("{accessToken}", accessToken),
        formData);
    if (response.status) {
      print("response is ${response.data}");
      print("-------------------AddressListApi success---------------------");

      if (response.data["result"]["body"]["data"]["customer"] != null) {
        if (response.data["result"]["body"]["data"]["customer"]["addresses"] !=
            null) {
          Addresses addresses = Addresses.fromGraphJson(
              response.data["result"]["body"]["data"]["customer"]["addresses"]);

          if (addresses.addressList!.length == 0) {
            emit(AddressListScreenNoFoundData());
          } else {
            list = addresses.addressList!;

            emit(AddressListScreenLoaded(list));
          }
        } else {
          emit(AddressListScreenNoFoundData());
        }
      } else {
        emit(AddressListScreenNoFoundData());
      }
    } else {
      print("-------------------AddressListApi failure---------------------");
      emit(AddressListScreenNoInternet());
    }
  }
}
