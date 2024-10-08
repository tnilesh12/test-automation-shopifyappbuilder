import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

import '../hulk_product_widget.dart';

class NumberFieldWidget extends StatefulWidget {
  final BuildContext context;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  NumberFieldWidget(
      {required this.context,
      this.textCapitalization,
      required this.hintText,
      this.initialValue,
      this.onChanged,
      this.obscureText = false,
      this.uniqueId,
      this.type,this.isRequired});

  _NumberFieldWidgetState? s;

  @override
  _NumberFieldWidgetState createState() {
    s = _NumberFieldWidgetState();
    return s!;
  }
}

class _NumberFieldWidgetState extends State<NumberFieldWidget> {
  TextEditingController _numberFieldController = TextEditingController();
  bool _isFieldValid = true;
  bool validate = true;

  @override
  void initState() {
    super.initState();
    // _numberFieldController.text = widget.initialValue ?? '';
    // _numberFieldController.addListener(_validateInput);

    // widget.valid != null ? validate = widget.valid! : validate;
  }

  // void _validateInput() {
  //   setState(() {
  //     _isFieldValid = _numberFieldController.text.isNotEmpty;
  //   });
  // }

  dynamic getValue() {
    return _numberFieldController.text;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_numberFieldController.text.trim().isEmpty) {
      validate = false;
    } else {
      validate = true;
    }
     if(widget.isRequired == false){
validate = true;
    }
    setState(() {});
    return validate;
  }

  @override
  void dispose() {
    _numberFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76, //ThemeSize.themeTextFieldSize,
      alignment: Alignment.center,
      child: Focus(
        onFocusChange: (value) {
          // if (_numberFieldController.text.isNotEmpty) {
          //   HulkProductWidget.globalJson['numberFieldsUniqueId'] =
          //       widget.uniqueId;
          //   HulkProductWidget.globalJson['numberFieldsdata'] =
          //       _numberFieldController.text;
          //   HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);
          //   // print("global data----> ${HulkProductWidget.globalJson}");

          //   if (_numberFieldController.text.isNotEmpty) {
          //     validate = true;
          //   }

          //   HulkProductWidget.allData.value!.add({
          //     "numberFieldsUniqueId": widget.uniqueId,
          //     "numberFieldsdata": _numberFieldController.text,
          //     "numberFieldsdataValidate": validate,
          //     "numberFieldsdataType": widget.type
          //   });
          // }
        },
        child: Column(
          children: [
            TextFormField(
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              style: CustomTextTheme.getTextStyle(
                  MyTextStyle.TextFormFieldInput, widget.context),
              controller: _numberFieldController,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              cursorColor: AppTheme.editTextControllerTextColor,
              keyboardType: TextInputType.number,
              showCursor: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                  DashboardFontSize.paddingLeft,
                  DashboardFontSize.paddingTop,
                  DashboardFontSize.paddingRight,
                  DashboardFontSize.paddingBottom,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                labelStyle: CustomTextTheme.getTextStyle(
                    MyTextStyle.TextFormFieldInput, widget.context),
                labelText: widget.hintText,
              ),
            ),
            validate == false
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                      DashboardFontSize.paddingLeft,
                      DashboardFontSize.paddingTop,
                      DashboardFontSize.paddingRight,
                      DashboardFontSize.paddingBottom,
                    ),
                    child: Text(
                      '* This field is required',
                      style: TextStyle(
                          color: AppTheme.errorColor,
                          fontSize: DashboardFontSize.descFontSize),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
