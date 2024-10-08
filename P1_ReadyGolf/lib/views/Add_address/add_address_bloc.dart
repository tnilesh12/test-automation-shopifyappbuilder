import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import '/views/Add_address/add_address_event.dart';
import '/views/Add_address/add_address_state.dart';

class AddressScreenBloc extends Bloc<AddressScreenEvent, AddressScreenState> {
  String? countryCode, zipCode;
  AddressScreenBloc() : super(AddressScreenInitial()) {
    on<AddressScreenEvent>((event, emit) {});

    //for create Address
    on<AddressEvent>((event, emit) async {
      String accessToken = await Session().getAccessToken();
      countryCode = event.countryCode;
      zipCode = event.zip;
      // emit(AddressScreenLoading());
      // if (event.countryCode!.isEmpty) {
      //   emit(RequiredCountryCode());
      // } else if (event.address1!.isEmpty || event.address1!.length < 6) {
      //   emit(RequiredAddress1());
      // } else if (event.firstName!.isEmpty) {
      //   emit(RequiredAddressFirstName());
      // } else if (event.lastName!.isEmpty) {
      //   emit(RequiredAddressLastName());
      // }
      // else if (event.firstName!.isEmpty) {
      //   emit(RequiredAddressFirstName());
      // }
      // else if (event.company!.isEmpty) {
      //   emit(RequiredAddressCompany());
      // } else if (event.address2!.isEmpty) {
      //   emit(RequiredAddress2());
      // } else if (event.city!.isEmpty) {
      //   emit(RequiredCity());
      // } else if (event.phone!.length != 10 || event.phone!.isEmpty) {
      //   emit(RequiredPhoneNumber());
      // } else {

      //emit(AddressScreenLoading());
      try {
        bool success = false;
        if (event.isUpdate! == true) {
          emit(AddressScreenLoading());
          String input = event.id.toString();

          int index = input.indexOf("CustomerAddress");

          String result = input.substring(0, index + "CustomerAddress".length);
          // var accesstoken=Session().getAccessToken();
          var formData = {
            "id": result,
            "address1": event.address1,
            // "address2": event.address2,
            "city": event.city,
            // "company": event.company,
            "firstName": event.firstName,
            "lastName": event.lastName,
            "phone": event.phone,
            "province": event.province,
            "country": event.country,
            "zip": event.zip,
            "name": event.name,
            "province_code": event.provinceCode,
            "country_code": event.countryCode,
            "country_name": event.country
          };
          print("----------------------------------------");
          print(" edit form data ---------->--->-----" + formData.toString());
          print("----------------------------------------");
          ApiResponse response = await ApiRepository.putAPI(
              ApiConst.updateAddressApi
                  .replaceAll("{accesstoken}", accessToken),
              formData);

          if (response.status) {
            Address cust = Address.fromJson(response.data);
            print("customer address : ${cust.address1}");
            print("address id is ${cust.id}");
            emit(AddressScreenLoaded());
          } else {
            debugPrint("----------------------------------api failure bloc ${response.message}");
            emit(Error(response.message));
          }
        } else {
          emit(AddressScreenLoading());
          // var accesstoken=Session().getAccessToken();
          var formData = {
            "address1": event.address1,
            // "address2": event.address2,
            "city": event.city,
            // "company": event.company,
            "firstName": event.firstName,
            "lastName": event.lastName,
            "phone": event.phone,
            "province": event.province,
            "country": event.country,
            "zip": event.zip,
            "name": event.name,
            "province_code": event.provinceCode,
            "country_code": event.countryCode,
            "country_name": event.country
          };
          print("----------------------------------------");
          print(" form data ---------->--->-----" + formData.toString());
          print("----------------------------------------");
          ApiResponse response = await ApiRepository.postAPI(
              ApiConst.addAddressApi.replaceAll("{accesstoken}", accessToken),
              formData);
          if (response.status) {
            Address cust = Address.fromJson(response.data);
            print("customer address : ${cust.address1}");
            emit(AddressScreenLoaded());
          } else {
            debugPrint("----------------------------------api failure bloc  ${response.message}");
            emit(Error(response.message));
          }
        }
        print(success.toString() + "gggggggggggggg");
      } catch (e) {
        emit(Error(e.toString()));
      }
      // }
    });

// zipCodeApi();
  }
  // String province = "";

  //  Countries? country;
  // String Code = "+1";

  // LoadCountryData(String name) async {
  //   if (await globals.postRepository.isConnected()) {
  //     emit(AddressScreenLoading());
  //     var data = await ApiRepository(Dio()).GetCountryList();
  //     if (data.status) {
  //       List<Countries> countrylist = data.data;
  //       for (Countries cc in countrylist) {
  //         if (cc.name == name) {
  //           country = cc;
  //           Code= CountryCode.countryPhoneCodes[country!.code].toString();
  //           emit(AddressScreenInitial());
  //            break;
  //         }
  //       }

  //     }

  //   }
  // }
}

// AddressAddApi(OnAddAddressButtonClick event) async {
//     var formData = {"address1": event.address1, "address2": event.address2,"city": event.city, "company": event.company,"first_name": event.first_name, "last_name": event.last_name,"phone": event.phone, "province": event.province,"country": event.country, "zip": event.zip,"name": event.name, "province_code": event.province_code,"country_code": event.country_code, "country_name": event.country_name};
//     var accesstoken=await Session().getAccessToken();
//     ApiResponse response =
//         await ApiRepository.postAPI("customer/address/add?shop=itg-app.myshopify.com&accessToken=$accesstoken", formData);
//     if (response.status) {
//       CustomerAddress cust = CustomerAddress.fromJson(response.data["customerAddress"]);
//   print("customer address : ${cust.address1}");
//       emit(AddAddressSuccessState());
//     } else {
//       debugPrint("----------------------------------api failure bloc ");
//       emit(AddAddressAPIFailureState(response.message));
//     }
//   }
//    AddressUpdateApi(OnAddAddressButtonClick event) async {
//     var formData = {"address1": event.address1, "address2": event.address2,"city": event.city, "company": event.company,"first_name": event.first_name, "last_name": event.last_name,"phone": event.phone, "province": event.province,"country": event.country, "zip": event.zip,"name": event.name, "province_code": event.province_code,"country_code": event.country_code, "country_name": event.country_name,"id":event.id};
//     var accesstoken=await Session().getAccessToken();
//     ApiResponse response =
//         await ApiRepository.putAPI("customer/address/single-address?shop=itg-app.myshopify.com&accessToken=${accesstoken}", formData);
//     if (response.status) {
//       // CustomerAddressUpdate cust = CustomerAddressUpdate.fromJson(response.data);
//   // print("customer address : ${cust.customerUserErrors}");
//       emit(AddAddressSuccessState());
//     } else {
//       debugPrint("----------------------------------api failure bloc ");
//       emit(AddAddressAPIFailureState(response.message));
//     }
//   }
