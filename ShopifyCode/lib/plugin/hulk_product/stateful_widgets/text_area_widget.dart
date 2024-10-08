import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class TextAreaWidget extends StatefulWidget {
  final BuildContext context;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  TextAreaWidget(
      {required this.context,
      this.textCapitalization,
      required this.hintText,
      this.initialValue,
      this.keyboardType,
      this.onChanged,
      this.obscureText = false,
      this.uniqueId,
      this.type,this.isRequired});

  _TextAreaWidgetState? s;

  @override
  _TextAreaWidgetState createState() {
    s = _TextAreaWidgetState();
    return s!;
  }
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  TextEditingController _textAreaController = TextEditingController();
  bool _isFieldValid = true;

  bool validate = true;

  String getValue() {
    return _textAreaController.text;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_textAreaController.text.trim().isEmpty) {
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
    _textAreaController.dispose();
    super.dispose();
  }

  // void _validateInput() {
  //   setState(() {
  //     _isFieldValid = _textAreaController.text.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      alignment: Alignment.center,
      child: Focus(
        onFocusChange: (value) {
          // if (_textAreaController.text.isNotEmpty) {
          // //   HulkProductWidget.globalJson['textAreasUniqueId'] = widget.uniqueId;
          // //   HulkProductWidget.globalJson['textAreasdata'] =
          // //       _textAreaController.text;
          // //   HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

          // //   if (_textAreaController.text.isNotEmpty) {
          // //     validate = true;
          // //   }

          // //   HulkProductWidget.allData.value!.add({
          // //     "textAreasUniqueId": widget.uniqueId,
          // //     "textAreasdata": _textAreaController.text,
          // //     "textAreasvalidate": validate,
          // //     "textAreasType": widget.type
          // //   });
          // // }
        },
        child: Column(
          children: [
            TextFormField(
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              style: CustomTextTheme.getTextStyle(
                  MyTextStyle.TextFormFieldInput, widget.context),
              maxLines: 5,
              controller: _textAreaController,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              cursorColor: AppTheme.editTextControllerTextColor,
              keyboardType: widget.keyboardType,
              showCursor: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                  DashboardFontSize.paddingLeft,
                  DashboardFontSize.paddingTop,
                  DashboardFontSize.paddingRight,
                  DashboardFontSize.paddingBottom,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(DashboardFontSize.customBorderRadius)),
                  borderSide: BorderSide(
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
