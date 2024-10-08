import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/form/form_bloc/form_event.dart';
import 'package:shopify_code/form/form_bloc/form_state.dart';
import 'package:shopify_code/form/myComponents/index.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';

class CustomFormBloc extends Bloc<CustomFormEvent, CustomFormState> {
  String formId;
  Color textColor, backgroundColor;
  CustomFormBloc(this.formId, this.textColor, this.backgroundColor)
      : super(CustomFormInitialState()) {
    LoadFormData(formId);

    on<CustomFormOnSubmitEvent>((event, emit) {
      submitFormData(event.formModel);
    });
    on<CustomFormReloadEvent>((event, emit) {
      print("CustomFormReloadEvent");
      print("CustomFormReloadEvent ${formModel!.formJson}");
      formWidgetList!.clear();
      LoadFormData(formId);
    });
  }

  FormModel? formModel;
  List<Widget>? formWidgetList = [];

  void LoadFormData(String formId) async {
    emit(CustomFormLoadingState());
    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.getFormById.replaceAll("{form_id}", formId));
    if (apiResponse.status) {
      debugPrint(
          "-------------LoadFormData response${apiResponse.data["result"]}");
      // FormModel
      formModel = FormModel.fromJson(apiResponse.data["result"]);

      formWidgetList!.addAll(formModel!.formJson!.fields!.map((field) {
        if (field.fieldName == "inputField" //||
            // field.fieldName == "Password" ||
            // field.fieldName == "Email" ||
            // field.fieldName == "TextArea"
            ) {
          return SimpleText(field, field.keyBoardType!, textColor);
        } else if (field.fieldName == "radio") {
          return SimpleRadios(field, textColor, (selectedValue) {
            field.value = selectedValue;
          });
        } else if (field.fieldName == "switch") {
          return SimpleSwitch(field, textColor, backgroundColor, (value) {});
        } else if (field.fieldName == "checkBox") {
          return SimpleListCheckbox(
              field, textColor, backgroundColor, (selectedBox) {});
        } else if (field.fieldName == "dropDown") {
          return SimpleSelect(field, textColor);
        } else if (field.fieldName == "Date") {
          return SimpleDate(field);
        }
        return SizedBox.shrink();
      }).toList());

      emit(CustomFormDataLoadedState(formModel!));
    } else {
      debugPrint(
          "----------------------LoadFormData------------api failure bloc-------${apiResponse.message}-----");
      emit(CustomFormAPIFailureState(apiResponse.message));
    }
  }

  void submitFormData(FormModel formModel1) async {
    emit(CustomFormSubmittingState());
    ShopifyUser? shopifyUser = await Session().getLoginData();

    var formData = {
      "formId": formModel1.formId,
      "customerId": shopifyUser!.id,
      "formAnsJson": formModel1.formJson!.toJson()
    };

    ApiResponse apiResponse =
        await ApiRepository.postAPI(ApiConst.submitForm, formData);
    if (apiResponse.status) {
      debugPrint(
          "-------------submitFormData response${apiResponse.data["result"]}");

      // FormJson formJson =
      //     FormJson.fromJson(apiResponse.data["result"]["formJson"]);
      emit(CustomFormSubmittedSuccessfullyState("Form Submitted Successfully"));
    } else {
      debugPrint(
          "----------------------submitFormData------------api failure bloc---${apiResponse.message}-----");
      emit(CustomFormAPIFailureState(apiResponse.message));
    }
  }
}
