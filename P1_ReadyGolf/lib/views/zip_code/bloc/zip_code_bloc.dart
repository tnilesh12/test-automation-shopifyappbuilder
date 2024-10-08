import 'package:shopify_code/modelClass/zipcode/zip_code_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import '/views/zip_code/bloc/zip_code_event.dart';
import '/views/zip_code/bloc/zip_code_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shopify_code/globels.dart' as globals;

class ZipCodeBloc extends Bloc<ZipCodeEvent, ZipCodeState> {
  List<Code> list = [];
  ZipCodeBloc() : super(ZipCodeinitialState()) {
    on<ZipCodeOnFocusEvent>((event, emit) {
      zipCodeApi(event.countryCode, event.zip);
    });
  }
  zipCodeApi(String cCode, String zip) async {
    emit(ZipCodeLoadingState());

    // if(zip.length>=5&&zip.length<10){
    ApiResponse response = await ApiRepository.getAPIFORZIP(
        ApiConst.zipCodeUrl
            .replaceAll("{zipCode}", zip!)
            .replaceAll("{countryCode}", cCode!),
        globals.plugins[PluginsEnum.ZIP_CODE_VALIDATOR.name].secrets
            .accessToken); // "01HTC14KYSWSDPY530XYXS3X5P");
    print("-------------status code------------" + response.statusCode);
    if (response.status) {
      print("--------->>>>" + response.data['results'].length.toString());
      // ZipCodeValidator data = ZipCodeValidator.fromJson(response.data);
      if (response.data['results'].length == 0) {
        // print("length is zero------");
        emit(RequiredZipState());
      } else {
        // list = response.data['results']['codes'];
        // print(list);
        // province = list[0].state!;
        // print("city is ${list.first.city}");
        // print("address1 is ${list.first.state}");
        // print("address1 is ${list}");
        emit(ZipCodeLoadedState());
      }
    }
    // }else{
    //   if(zip.length>5){emit(RequiredZipState());}
    // }
  }
}
