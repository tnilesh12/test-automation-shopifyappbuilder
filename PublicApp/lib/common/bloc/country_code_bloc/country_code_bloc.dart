import 'package:bloc/bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'country_code_event.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'country_code_state.dart';

class CountryCodeBloc extends Bloc<CountryCodeEvent, CountryCodeState> {
  CountryCodeBloc() : super(CountryCodeInitial()) {
    emit(CountryCodeLoading());
    on<CountryCodeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnFillterEvent>((event, emit) {
      filtersearch(event.text);
    });
    on<OnStateSelectEvent>((event, emit) {
      filtersearchState(event.searchText, event.listOfState);
    });

    countryCodeApi();
    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_COUNTRY_LIST.name);
    ////////////////////////////
  }

  List<Countries> country = [];

  countryCodeApi() async {
// emit(CountryCodeLoading());
    if(country.length != 0){
      emit(CountryCodeLoaded(country));
      return;
    }

    ApiResponse response = await ApiRepository.getAPI(ApiConst.countryCode);
// print("------------>>>"+"Message  "+response.message+response.data);
    if (response.status) {
      print("Success entered");
      // Map<String,dynamic> parsed=jsonDecode(response.data);
      country = CountryListData.fromJson(response.data["result"]).countries!;

      // country=code.result!;
      print("result of country code list api is ${country!.first.name}");
      emit(CountryCodeLoaded(country));
    } else {
      print("No data found entered");
      emit(CountryCodeNoData());
    }
  }

  static Future<String> GetCountryCode(String mobile,String ccode) async {
    if (mobile.isEmpty) return "+1";
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(mobile);
    String parsableNumber = number.dialCode.toString();

    return "+" + parsableNumber;
  }

  filtersearch(String enteredKeyword) {
    emit(CountryCodeLoading());
    List<Countries> result = [];
    if (enteredKeyword.isEmpty) {
      result = country;
    } else {
      result = country
          .where((user) => user.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    emit(CountryCodeLoaded(result));
  }

  filtersearchState(String enteredKeyword, List<Provinces> stateList) {
    print("------------------filtersearchState-------------------}");
    emit(StateLoading());
    List<Provinces> resultState = [];
    if (enteredKeyword.isEmpty) {
      resultState = stateList;

      // emit(StateNoData());
    } else {
      resultState.clear();
      resultState = stateList
          .where((state) => state.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print("------------------resutlState ${resultState.toString()}");
    emit(StateLoaded(resultState));
    // return result;
  }
//  List<CountryCodeList>? result=[];


// LoadData() async {
//   emit(CountryCodeLoading());
//   if (await globals.postRepository.isConnected()) {
//     var data = await ApiRepository(Dio()).GetCountryList();
//     if (data.status) {
//       country = data.data as List<Countries>;

//       emit(CountryCodeLoaded(country!));
//     }
//     else {
//       emit(CountryCodeNoData());
//     }
//   }
//   else
//     {
//       emit(CountryCodeNoInternet());
//     }
// }
}
