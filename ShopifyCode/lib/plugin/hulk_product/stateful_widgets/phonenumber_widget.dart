import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class PhoneNumberWidget extends StatefulWidget {
  BuildContext? context;
  TextInputType? keyboardType;
  String? hintText;
  String? phoneCode;
  String? initialValue;
  Function(String)? onChanged;
  Function()? onClickCountry;
  String? prefixIcon;
  bool obscureText;
  List<ValuesJson>? valueJson;
  String? uniqueId;
  String? optionType;
  bool? validate;
bool? isRequired;
  // Function()? getData;

  PhoneNumberWidget({
    this.context,
    this.keyboardType,
    this.hintText,
    this.phoneCode,
    this.initialValue,
    this.onChanged,
    this.onClickCountry,
    this.prefixIcon,
    this.obscureText = false,
    this.valueJson,
    this.uniqueId,
    this.optionType,
    this.isRequired
  });

  _PhoneNumberWidgetState? s;

  @override
  _PhoneNumberWidgetState createState() {
    s = _PhoneNumberWidgetState();
    return s!;
  }
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  TextEditingController _controller = TextEditingController();
  bool valid = true;
  // String ans = "";
  // int? uniqueId;
  // dynamic jasonValue;

  @override
  void initState() {
    super.initState();
  }

  dynamic getValue() {
    return _controller.text;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_controller.text.isNotEmpty) {
      if (_controller.text.length > 9) {
        valid = true;
      } else if (!valid) {
        valid = false;
      } else {
        valid = false;
      }
    } else {
      valid = false;
    }

     if(widget.isRequired == false){
widget. validate = true;
    }
    setState(() {});
    return valid;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateflag(_controller) {
    setState(() {
      valid = false;
    });
  }

  HulkProductDataModel? dataStore = HulkProductDataModel();
  late dynamic check;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (widget.hintText!.isNotEmpty)
        //   Padding(
        //     padding: EdgeInsets.fromLTRB(
        //       DashboardFontSize.paddingLeft,
        //       DashboardFontSize.paddingTop,
        //       DashboardFontSize.paddingRight,
        //       DashboardFontSize.paddingBottom,
        //     ),
        //     child: Text(
        //       widget.hintText!,
        //       style: TextStyle(
        //           color: AppTheme.editTextControllerTextColor,
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        Container(
          height: HulkWidgets.height,
          alignment: Alignment.center,
          child: Focus(
            onFocusChange: (value) async {
              // print("${_controller.text.length}---------------->");
              // HulkProductWidget.allData.value = [
              //   {"uniqueId": "", "value": "", "validate": "", "Type": "default"}
              // ];

              // if (_controller.text.isNotEmpty) {
              //   updateflag(_controller);
              // }

              // if (_controller.text.isEmpty) {
              //   setState(() {
              //     valid = true;
              //   });
              // }

              // if (_controller.text.length > 9) {
              //   valid = true;

              // HulkProductWidget.allData.valid.add(value)
              // HulkProductWidget.allData.value!.add({
              //   "PhoneUniqueId": widget.uniqueId,
              //   "phoneData": _controller.text,
              //   "phonevalidate": valid,
              //   "phoneDataType": widget.type
              // });

              // check = widget.uniqueId;

              // HulkProductWidget.globalJson['PhoneUniqueId'] = widget.uniqueId;
              // HulkProductWidget.globalJson['phoneData'] = _controller.text;
              // HulkProductWidget.globalJson
              //     .addAll(HulkProductWidget.globalJson);

              // validateInput();

              // jasonValue = _controller.text;
              // }

              // widget.getData = () {
              //   return {
              //     "uniqueId": widget.uniqueId,
              //     // dataStore!.relationship!.options!.map((e) {
              // if (e.optionType == 'phone_number') {
              //   print("id return ------------------->>");
              //   return e.id;
              // }
              //     // }),
              //   };
              //   //           if (_controller.text.isNotEmpty) {
              //   //   validate = true;
              //   // }
              //   // jasonValue = _controller.text;
              // };
            },
            child: TextFormField(
              style: CustomTextTheme.getTextStyle(
                  MyTextStyle.TextFormFieldInput, widget.context!),
              controller: _controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              maxLength: 10,
              onChanged: (e) {
                // if (_controller.text.isEmpty) {
                //   valid = true;
                //   setState(() {});
                // }
              },
              cursorColor: AppTheme.editTextControllerTextColor,
              showCursor: true,
              decoration: InputDecoration(
                counterText: "",
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
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.prefixIcon == ""
                        ? Container()
                        : InkResponse(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                DashboardFontSize.paddingLeft,
                                DashboardFontSize.paddingTop,
                                DashboardFontSize.paddingRight,
                                DashboardFontSize.paddingBottom,
                              ),
                              width: 25,
                              child: SvgPicture.asset(widget.prefixIcon!),
                            ),
                          ),
                    InkResponse(
                      onTap: () {
                        widget.onClickCountry!.call();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(
                          DashboardFontSize.paddingLeft,
                          DashboardFontSize.paddingTop,
                          DashboardFontSize.paddingRight,
                          DashboardFontSize.paddingBottom,
                        ),
                        child: Text(
                          widget.phoneCode!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                labelStyle: CustomTextTheme.getTextStyle(
                    MyTextStyle.TextFormFieldInput, widget.context!),
                labelText: widget.hintText,
              ),
            ),
          ),
        ),
        valid == false
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
    );
  }
}
