import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';

part 'hulk_product_event.dart';
part 'hulk_product_state.dart';

class HulkProductBloc extends Bloc<HulkProductEvent, HulkProductState> {
  HulkProductDataModel? hulkProductDataModel;
  String id;
  HulkProductBloc(this.id) : super(HulkProductInitialState()) {
    on<onSubmitData>((event, emit) {
      // Map<String, dynamic> formData = {};

      // // Extract values from the global JSON and add to the new JSON
      // if (event.data!.containsKey('PhoneUniqueId')) {
      //   formData['data'] = {
      //     'uniqueId': HulkProductWidget.globalJson['PhoneUniqueId'],
      //     'data': HulkProductWidget.globalJson['phoneData']
      //   };

// print("email <><> ${event.data!['emailsdata']}");

// var formData = {

//                 "radio": event.data!['radioButtonsdata'],
//                 "testing": event.data!['phoneData'],
//                 "Drop down field": event.data!['dropDownsdata'],
//                 "Check box Field": event.data!['customCheckboxsdata'],
//                 "Short text field": event.data!['TextWidgetsdata'],
//                 "multiple dropdown field": event.data!['multipleDropdownFieldsdata'],
//                 "paragraph text field": event.data!['textAreasdata'],
//                 "email field": event.data!['emailsdata'],
//                 "Number field": event.data!['numberFieldsdata'],
//                 "color\/image dropdow": event.data!['colorImageDropdownsdata'],
//                 "color picker": event.data!['colorPickersdata'],
//                 "date field": event.data!['datePickersdata'],
//                 "multi selecter":event.data!['multiSelectorData'],
//                 "swatches field": event.data!['swatchsdata'],
//                 "swatch color": event.data!['multipleSwatchData'],
//                 "time picker": event.data!['timePickersdata'],
//                 "File upload field": event.data!['fileUploadsdata']
//             };

      // print("hjsdhfjdsa------> ${event.data}");
      //String jsonData = jsonEncode(event.data);

//print(""+jsonData);
// print("formData------> ${formData}");

      print("Type of data: ${event.data.runtimeType}");

      List? widgetDataList = event.data;

      // Alternatively, using forEach:
      widgetDataList!.forEach((widgetData) {
        print(
            "Widget ID --->: ${widgetData.id}, Validate: ${widgetData.validate}, Data: ${widgetData.data}");
      });

      // event.data!.map((e) {
      //   if(e['phoneType']=="phone_type"){

      //   }
      // });
    });

    on<HulkProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    getHulkProuctOption(id);
  }
  getHulkProuctOption(String id) async {
    print("calling<><><><><><");
    Dio client = Dio();
    //   print("URL<><><><> : ${ApiConst.hulkProductOption.replaceAll("{id}", id)}");

    //  String token = await Session().getAccessToken();
    client.options.headers["authorization"] =
        "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1ZXJfbmFtZSIsImF1ZCI6ImNsaWVudCIsInRva2VuX25hbWUiOiJ0ZXN0Iiwic2hvcF9pZCI6MTYyNjc1LCJjcmVhdGVfdGltZSI6IjIwMjQtMDctMTUgMDk6NDQ6MjggKzAwMDAifQ.SQECMbUZ9EWhNmrSMe669RAUUoyEDW_KPvm0FTnbckA";
    var response = await client.get(
        "https://productoption.hulkapps.com/v1/products/?product_id=${id}&shop_domain=danitges-testingstore01.myshopify.com&customer_tags={customer_tags}&product_collections={product_collections}&tags={tags}&vendor={vendor}&ptype={ptype}");
    // ApiResponse res=await ApiRepository.getAPI(ApiConst.hulkProductOption.replaceAll("{id}", id));

    if (response.statusCode == 200) {
      hulkProductDataModel = HulkProductDataModel.fromJson(response.data);
      emit(HulkProuctAPISuccessState(hulkProductDataModel!));
      print(
          "data -----> ${hulkProductDataModel!.relationship!.options!.first.optionType}");
    } else {
      emit(HulkProuctAPIFailureState());
    }
  }
}
