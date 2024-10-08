import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class EmailWidget extends StatefulWidget {
  final BuildContext context;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  EmailWidget(
      {required this.context,
      this.textCapitalization,
      required this.hintText,
      this.initialValue,
      this.onChanged,
      this.obscureText = false,
      this.uniqueId,
      this.type,this.isRequired});

  _EmailWidgetState? s;

  @override
  _EmailWidgetState createState() {
    s = _EmailWidgetState();
    return s!;
  }
}

class _EmailWidgetState extends State<EmailWidget> {
  TextEditingController _emailController = TextEditingController();

  bool validate = true;
  @override
  void initState() {
    super.initState();
    // _emailController.text = widget.initialValue ?? '';
    // _emailController.addListener(_validateInput);

    // widget.valid != null ? validate = widget.valid! : validate;
  }

  // void _validateInput() {
  //   setState(() {
  //     _isFieldValid = _emailController.text.isNotEmpty;
  //   });
  // }

  dynamic getValue() {
    return _emailController.text;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_emailController.text.trim().isEmpty) {
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
    _emailController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   _emailController.removeListener(_validateInput);
  //   _emailController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76, //ThemeSize.themeTextFieldSize,
      alignment: Alignment.center,
      child: Focus(
        onFocusChange: (value) {
          // if (_emailController.text.isNotEmpty) {
          //   HulkProductWidget.globalJson['emailsUniqueId'] = widget.uniqueId;
          //   HulkProductWidget.globalJson['emailsdata'] = _emailController.text;
          //   HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

          //   if (_emailController.text.isNotEmpty) {
          //     validate = true;
          //   }

          //   HulkProductWidget.allData.value!.add({
          //     "emailsUniqueId": widget.uniqueId,
          //     "emailsdata": _emailController.text,
          //     "emailsvalidate": validate,
          //     "emailsType": widget.type
          //   });
          //   // print("global data----> ${HulkProductWidget.globalJson}");
          // }
        },
        child: Column(
          children: [
            TextFormField(
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              style: CustomTextTheme.getTextStyle(
                  MyTextStyle.TextFormFieldInput, widget.context),
              controller: _emailController,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              cursorColor: AppTheme.editTextControllerTextColor,
              keyboardType: TextInputType.emailAddress,
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
