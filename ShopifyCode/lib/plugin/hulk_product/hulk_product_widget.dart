import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/form/form_bloc/form_bloc.dart';
import 'package:shopify_code/form/form_bloc/form_event.dart';
import 'package:shopify_code/form/form_bloc/form_state.dart';
import 'package:shopify_code/form/form_builder_shimmer_view.dart';
import 'package:shopify_code/form/myComponents/index.dart';
import 'package:shopify_code/plugin/hulk_product/bloc/hulk_product_bloc.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/check_box_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/color_image_dropdown_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/color_picker_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/date_picker_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/drop_down_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/file_upload_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/multi_selector_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/multiple_drop_down_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/multiple_swatch_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/radio_button_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/short_text_group.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/swatch_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/time_picker.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/phonenumber_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/text_box_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/text_area_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/number_field_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/email_widget.dart';
import 'package:shopify_code/plugin/hulk_product/stateful_widgets/button_widget.dart';

import 'package:shopify_code/theme/app_assets.dart';

// import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';

// import 'package:theme1/views/widgets/common/custom_textfield.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class HulkProductWidget extends StatefulWidget {
  static HulkProductDataModel allData = HulkProductDataModel();
  static int index = 0;
  String id;

  HulkProductWidget(this.id);

  _FormWidgetState? fwd;

  @override
  State<HulkProductWidget> createState() {
    fwd = _FormWidgetState();
    return fwd!;
  }

  static List<Widget> generateWidgets(
      BuildContext context, dynamic hulkProductDataModel) {
    return hulkProductDataModel.relationship!.options!.map<Widget>((e) {
      switch (e.optionType) {
        case "phone_number":
          return PhoneNumberWidget(
            context: context,
            hintText: e.optionName,
            phoneCode: "91",
            keyboardType: TextInputType.number,
            prefixIcon: " ",
            valueJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            onClickCountry: () {},
            optionType: e.optionType,
            isRequired: e.require!
          );
        case "textbox":
          return TextBoxWidget(
            context: context,
            hintText: e.optionName,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "radiobutton":
          return RadioButtonWidget(
            helptext: e.helptext,
            optionName: e.optionName,
            valuesJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "dropdown":
          return DropDownWidget(
            name: e.optionName,
            valueJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "checkbox":
          return CustomCheckboxWidget(
            name: e.optionName,
            valueJson: e.valuesJson!,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "dropdown_multiple":
          return MultipleDropdownField(
            name: e.optionName,
            valueJson: e.valuesJson!,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "textarea":
          return TextAreaWidget(
            context: context,
            hintText: e.optionName,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "email":
          return EmailWidget(
            context: context,
            hintText: e.optionName,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "number_field":
          return NumberFieldWidget(
            context: context,
            hintText: e.optionName,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "button":
          return ButtonWidget(
            name: e.optionName,
            onPressed: () {},
            uniqueId: e.optionUniqueName,
            valueJson: e.valuesJson,
            type: e.optionType,
               isRequired: e.require!
          );
        case "color_image_dropdown":
          return ColorImageDropdown(
            optionName: e.optionName!,
            helptext: e.helptext!,
            valuesJson: e.valuesJson!,
            require: e.require!,
            uniqueId: e.optionUniqueName,
            type: e.optionType,
               isRequired: e.require!
          );
        case "color_picker":
          return ColorPickerWidget(
            optionType: e.optionType!,
            optionName: e.optionName!,
            valuesJson: e.valuesJson!,
            uniqueId: e.optionUniqueName,
               isRequired: e.require!
          );
        case "date_picker":
          return DatePickerWidget(
            optionName: e.optionName!,
            optionType: e.optionType!,
            helptext: e.helptext!,
            valuesJson: e.valuesJson!,
            uniqueId: e.optionUniqueName,
               isRequired: e.require!
          );
        case "time_picker":
          return TimePickerWidget(
            optionName: e.optionName!,
            optionType: e.optionType!,
            helptext: e.helptext!,
            valuesJson: e.valuesJson!,
            maxTime: e.extraField!.maximumSelection!,
            minTime: e.extraField!.minimumSelection!,
            uniqueId: e.optionUniqueName,
               isRequired: e.require!
          );
        case "short_text_group":
          return ShortTextGroupWidget(
            optionName: e.optionName!,
            optionType: e.optionType!,
            helptext: e.helptext!,
            valuesJson: e.valuesJson!,
            uniqueId: e.optionUniqueName,
               isRequired: e.require!
          );
        case "swatch":
          return SwatchWidget(
            optionName: e.optionName,
            valueJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            type: e.optionType!,
               isRequired: e.require!
          );
        case "swatch_multiple":
          return MultipleSwatchWidget(
            optionName: e.optionName,
            valueJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            type: e.optionType!,
               isRequired: e.require!
          );
        case "file_upload":
          return FileUploadWidget(
            optionName: e.optionName,
            isRequired: e.require!,
            valueJson: e.valuesJson,
            uniqueId: e.optionUniqueName,
            type: e.optionType!,
          );
        case "multi_qty_selector":
          return MultiSelectorWidget(
            optionName: e.optionName,
            optionType: e.optionType,
            valuejson: e.valuesJson,
            uniqueId: e.id,
            type: e.optionType!,
               isRequired: e.require!
          );
        default:
          return Container();
      }
    }).toList();
  }
}

class _FormWidgetState extends State<HulkProductWidget> {
  List<Widget> widgetss = [];

 Future<List<Map<String, dynamic>>?>  onTapVerify() async {
    HulkProductWidget.allData.value = [];
    List< Map<String, dynamic> > data = [];
    widgetss.forEach((wd) {
      WidgetData? widgetData = WidgetData();

      if (wd is PhoneNumberWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
        // print(
        //     "Status is PhoneNumberWidget ---> Validate: ${widgetData.validate}, Data: ${widgetData.data}, ID: ${widgetData.id}----------${HulkProductWidget.allData.value}");
      }
      if (wd is TextBoxWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);

        // print("status is TextBoxWidget---->${validate} || ${data} ||  ${id}");
        // HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is RadioButtonWidget) {
        widgetData.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is DropDownWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is CustomCheckboxWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is MultipleDropdownField) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is TextAreaWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is EmailWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is NumberFieldWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is ButtonWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is ColorImageDropdown) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is ColorPickerWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is DatePickerWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is TimePickerWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is ShortTextGroupWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is SwatchWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is MultipleSwatchWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is FileUploadWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }
      if (wd is MultiSelectorWidget) {
        widgetData!.validate = wd.s!.validatee();
        widgetData.data = wd.s!.getValue();
        widgetData.id = wd.s!.getUniqueId();
        HulkProductWidget.allData.value!.add(widgetData);
      }


      if(widgetData!.data != null && widgetData.data.toString().isNotEmpty){
 Map<String, dynamic> da = new Map<String, dynamic>();
        da['key'] = widgetData.id.toString();
        da['value'] = widgetData.data.toString();
        data.add(da);
      }
    });



    bool allValid = HulkProductWidget.allData.value!
        .every((element) => element.validate == true) ;

    print("All valid: $allValid");

    if (allValid)  {
      // Submit the data
    //   BlocProvider.of<HulkProductBloc>(context)
          // .add(onSubmitData(HulkProductWidget.a
          // llData.value));
    //  var obj = HulkProductWidget.allData.value!.map((e) {
    //      Map<String, dynamic> data = new Map<String, dynamic>();
    //     data['key'] = e.id.toString();
    //     data['value'] = e.data.toString();
    //      return data;
    //   }).toList();


      return  data;
    } else {
      // Handle the case where some data is invalid
     return null;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HulkProductBloc(widget.id),
        child: BlocListener<HulkProductBloc, HulkProductState>(
          listener: (context, state) {
            // if (state is CustomFormSubmittedSuccessfullyState) {
            //   Dialogs.SuccessAlertInOut(
            //       context: context, message: state.message);
            //   context.read<CustomFormBloc>().add(CustomFormReloadEvent());
            // }
            if (state is HulkProuctAPIFailureState) {
              context.read<CustomFormBloc>().add(CustomFormReloadEvent());
            }
          },
          child: BlocBuilder<HulkProductBloc, HulkProductState>(
            builder: (context, state) {
              if (state is HulkProuctAPIFailureState) {
                return Container();
              } else if (state is HulkProuctAPISuccessState) {
                HulkProductWidget.allData = state.hulkProductDataModel;

                widgetss = HulkProductWidget.generateWidgets(
                    context, HulkProductWidget.allData);
                //(state is CustomFormDataLoadedState) {
                
                return SingleChildScrollView(
                  child: Column(
                    children: [
                     
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            DashboardFontSize.paddingLeft,
                            DashboardFontSize.paddingTop,
                            DashboardFontSize.paddingRight,
                            DashboardFontSize.paddingBottom),
                
                        child: Column(
                          children: widgetss

                                                  ,
                        ),
                      ),
                      
                    ],
                  ),
                );
              } else {
                return FormBuilderShimmerView();
              }
            },
          ),
        ));
  }


}
