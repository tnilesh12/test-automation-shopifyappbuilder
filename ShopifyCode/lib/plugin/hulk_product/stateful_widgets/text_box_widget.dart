import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class TextBoxWidget extends StatefulWidget {
  final BuildContext context;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;
   String? uniqueId;
  String? type;
  bool? isRequired;

  TextBoxWidget({
    required this.context,
    this.controller,
    this.textCapitalization,
    required this.hintText,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
    this.uniqueId,
    this.type,
    this.isRequired
  });

  // @override
  // _TextBoxWidgetState createState() => _TextBoxWidgetState();
  _TextBoxWidgetState? s;

  @override
  _TextBoxWidgetState createState() {
    s = _TextBoxWidgetState();
    return s!;
  }
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  TextEditingController _controller = TextEditingController();
  bool validate = true;

  @override
  // void initState() {
  //   super.initState();
  //   // _controller.text = widget.initialValue ?? '';
  //   // _controller.addListener(_validateInput);

  //   // widget.valid != null ? validate = widget.valid! : validate;
  // }

  // void _validateInput() {
  //   setState(() {
  //     _isFieldValid = _controller.text.isNotEmpty;
  //   });
  // }

  String getValue() {
    return _controller.text;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_controller.text.trim().isEmpty) {
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
    _controller.dispose();
    super.dispose();
  }
  // void dispose() {
  //   _controller.removeListener(_validateInput);
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      alignment: Alignment.center,
      child: Focus(
        onFocusChange: (value) {
          //   if (_controller.text.isNotEmpty) {
          //     if (_controller.text.isNotEmpty) {
          //       validate = true;
          //     }

          //     // HulkProductWidget.allData.value!.add({
          //     //   "TextWidgetsUniqueId": widget.uniqueId,
          //     //   "TextWidgetsdata": _controller.text,
          //     //   "TextWidgetvalidate": validate,
          //     //   "TextWidgetType": widget.type
          //     // });
          //     HulkProductWidget.globalJson['TextWidgetsUniqueId'] =
          //         widget.uniqueId;
          //     HulkProductWidget.globalJson['TextWidgetsdata'] = _controller.text;
          //     HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);
          //   }
        },
        child: Column(
          children: [
            TextFormField(
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              style: CustomTextTheme.getTextStyle(
                  MyTextStyle.TextFormFieldInput, widget.context),
              controller: _controller,
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
