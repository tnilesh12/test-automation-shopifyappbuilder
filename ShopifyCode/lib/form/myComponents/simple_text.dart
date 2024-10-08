import 'package:flutter/material.dart';
import 'package:shopify_code/form/helper/form_util.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class SimpleText extends StatefulWidget {
  Fields inputData;
  String type;
  Color textColor;
  bool isValid = true;
  SimpleText(this.inputData, this.type, this.textColor);

  @override
  _SimpleText createState() => _SimpleText();
}

class _SimpleText extends State<SimpleText> {
  // Initialize with true assuming validation passes initially

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPass = widget.type == "password" ? true : false;

    return widget.inputData.alignment!.toLowerCase() == "vertical"
        ? Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.inputData.label != ""
                    ? Text(
                        widget.inputData.label!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: DashboardFontSize.descFontSize,
                            color: widget.textColor),
                      )
                    : Container(),
                Container(
                  height: widget.inputData.keyBoardType == "textarea"
                      ? 2 * DashboardFontSize.dashboardTextFieldSize
                      : DashboardFontSize
                          .dashboardTextFieldSize, // Adjust height
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.editTextBackgroundColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    // controller: null,
                    style: CustomTextTheme.getTextStyle(
                        MyTextStyle.TextFormFieldInput, context),
                    key: Key(widget.inputData.key!),
                    decoration:
                        buildInputDecoration(widget.inputData, isPass, context),
                    initialValue: widget.inputData.value,
                    maxLines:
                        widget.inputData.keyBoardType == "textarea" ? 5 : 1,
                    onChanged: (String value) {
                      widget.isValid = true;
                      widget.inputData.value = value;
                      setState(() {});
                    },
                    cursorColor: AppTheme.editTextControllerTextColor,
                    obscureText: isPass,
                    keyboardType:
                        Util.getKeyboardType(widget.inputData.keyBoardType!),
                    validator: (value) {
                      if (widget.inputData.required! && value!.trim().isEmpty) {// && value!.isEmpty) {
                        setState(() {
                          widget.isValid = false; // Update validation result
                        });
                        return null; // 'Required!';
                      }
                      if (widget.type == "Email") {
                        setState(() {
                          widget.isValid = false; // Update validation result
                        });
                        return null; // Util.validateEmail(widget.inputData, value!);
                      }
                      setState(() {
                        widget.isValid = true; // Update validation result
                      });
                      return null;
                    },
                  ),
                ),
                !widget.isValid
                    ? Container(
                        margin: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Required!",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: DashboardFontSize.descFontSize,
                              color: AppTheme.errorColor),
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                widget.inputData.label != ""
                    ? Expanded(
                        flex: 2,
                        child: Text(
                          widget.inputData.label!,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: DashboardFontSize.descFontSize,
                              color: widget.textColor),
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        height: widget.inputData.keyBoardType == "textarea"
                            ? 2 * DashboardFontSize.dashboardTextFieldSize
                            : DashboardFontSize
                                .dashboardTextFieldSize, // Adjust height
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppTheme.editTextBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius)),
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          // controller: null,
                          style: CustomTextTheme.getTextStyle(
                              MyTextStyle.TextFormFieldInput, context),
                          key: Key(widget.inputData.key!),
                          decoration: buildInputDecoration(
                              widget.inputData, isPass, context),
                          initialValue: widget.inputData.value,
                          maxLines: widget.inputData.keyBoardType == "textarea"
                              ? 5
                              : 1,
                          onChanged: (String value) {
                            widget.isValid = true;
                            widget.inputData.value = value;
                            setState(() {});
                          },
                          cursorColor: AppTheme.editTextControllerTextColor,
                          obscureText: isPass,
                          keyboardType: Util.getKeyboardType(
                              widget.inputData.keyBoardType!),
                          validator: (value) {
                            if (widget.inputData.required! && value!.isEmpty) {
                              setState(() {
                                widget.isValid =
                                    false; // Update validation result
                              });
                              return null; //'Required!';
                            }
                            if (widget.type == "Email") {
                              setState(() {
                                widget.isValid =
                                    false; // Update validation result
                              });
                              return null; // Util.validateEmail(widget.inputData, value!);
                            }
                            setState(() {
                              widget.isValid = true; // Update validation result
                            });
                            return null;
                          },
                        ),
                      ),
                      !widget.isValid
                          ? Container(
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Required!",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: DashboardFontSize.descFontSize,
                                    color: AppTheme.errorColor),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  static InputDecoration buildInputDecoration(
      Fields inputData, bool isPass, BuildContext context) {
    return InputDecoration(
      // labelText: inputData.placeholder,
      hintStyle:
          CustomTextTheme.getTextStyle(MyTextStyle.TextFormFieldHint, context),
      hintText: isPass ? "" : inputData.placeholder,
      contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              DashboardFontSize.customBorderRadius)), // Default to 'outlined'
    );
  }

  // static InputDecoration buildInputDecoration(
  //     Fields inputData, bool isPass) {
  //   switch (inputData.borderType) {
  //     case 'outlined':
  //       return InputDecoration(
  //         labelText: inputData.placeholder,
  //         hintText: isPass ? "" : inputData.placeholder,
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(inputData.borderRadius!)),
  //       );
  //     case 'underline':
  //       return InputDecoration(
  //         labelText: inputData.placeholder,
  //         hintText: isPass ? "" : inputData.placeholder,
  //         border: UnderlineInputBorder(
  //             borderRadius: BorderRadius.circular(inputData.borderRadius!)),
  //       );
  //     default:
  //       return InputDecoration(
  //         labelText: inputData.placeholder,
  //         hintText: isPass ? "" : inputData.placeholder,
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(
  //                 inputData.borderRadius!)), // Default to 'outlined'
  //       );
  //   }
  // }
}
