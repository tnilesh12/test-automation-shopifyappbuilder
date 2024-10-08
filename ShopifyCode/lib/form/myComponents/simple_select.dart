import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class SimpleSelect extends StatefulWidget {
  Fields selectData;
  Color textColor;
  bool isValid = true;
  SimpleSelect(this.selectData, this.textColor);

  @override
  _SimpleSelect createState() => _SimpleSelect();
}

class _SimpleSelect extends State<SimpleSelect> {
  String? _selectedValue;
  // bool _isValid =
  //     true; // Initialize with true assuming validation passes initially

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.selectData.alignment!.toLowerCase() == "vertical"
        ? Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.selectData.label != ""
                    ? Text(
                        widget.selectData.label!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: DashboardFontSize.descFontSize,
                            color: widget.textColor),
                      )
                    : Container(),
                Container(
                  height: widget.isValid
                      ? DashboardFontSize.dashboardTextFieldSize
                      : DashboardFontSize
                          .dashboardTextFieldSize, // Adjust height based on validation
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.editTextBackgroundColor,
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius)),
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style:
                        TextStyle(color: AppTheme.editTextControllerTextColor),
                    value: _selectedValue, //"widget.selectData.value",
                    validator: (value) {
                      if (widget.selectData.required! && value == null) {
                        setState(() {
                          widget.isValid = false; // Update validation result
                        });
                        return null; // 'Required!';
                      }
                      setState(() {
                        widget.isValid = true; // Update validation result
                      });
                      return null;
                    },
                    dropdownColor: AppTheme.editTextBackgroundColor,
                    onChanged: (newValue) {
                      widget.isValid = true;
                      setState(() {
                        _selectedValue = newValue;
                        widget.selectData.value = newValue;
                      });
                    },
                    items: widget.selectData.options!
                        .map(
                          (item) => DropdownMenuItem(
                            value: item.value,
                            child: Text(
                              item.label!,
                            ),
                          ),
                        )
                        .toList(),
                    decoration:
                        buildInputDecoration(widget.selectData, context),
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
                widget.selectData.label != ""
                    ? Expanded(
                        flex: 2,
                        child: Text(
                          widget.selectData.label!,
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
                        height: widget.isValid
                            ? DashboardFontSize.dashboardTextFieldSize
                            : DashboardFontSize
                                .dashboardTextFieldSize, // Adjust height based on validation
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            color: AppTheme.editTextBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius)),
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: DropdownButtonFormField(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          style: TextStyle(
                              color: AppTheme.editTextControllerTextColor),
                          value: _selectedValue, //"widget.selectData.value",
                          dropdownColor: AppTheme.editTextBackgroundColor,
                          onChanged: (newValue) {
                            widget.isValid = true;
                            setState(() {
                              _selectedValue = newValue;
                              widget.selectData.value = newValue;
                            });
                          },
                          validator: (value) {
                            if (widget.selectData.required! && value == null) {
                              setState(() {
                                widget.isValid =
                                    false; // Update validation result
                              });
                              return null; //'Required!';
                            }
                            setState(() {
                              widget.isValid = true; // Update validation result
                            });
                            return null;
                          },
                          items: widget.selectData.options!
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item.value,
                                  child: Text(
                                    item.label!,
                                  ),
                                ),
                              )
                              .toList(),
                          decoration:
                              buildInputDecoration(widget.selectData, context),
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
                ),
              ],
            ),
          );
  }

  static InputDecoration buildInputDecoration(
      Fields selectData, BuildContext context) {
    return InputDecoration(
      // labelText: selectData.label,
      hintStyle:
          CustomTextTheme.getTextStyle(MyTextStyle.TextFormFieldHint, context),
      hintText: "Select",
      contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              DashboardFontSize.customBorderRadius)), // Default to 'outlined'
    );
  }

  // static InputDecoration buildInputDecoration(Fields selectData) {
  //   switch (selectData.borderType) {
  //     case 'outlined':
  //       return InputDecoration(
  //         labelText: selectData.label,
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(selectData.borderRadius!)),
  //       );
  //     case 'underline':
  //       return InputDecoration(
  //         labelText: selectData.label,
  //         border: UnderlineInputBorder(
  //             borderRadius: BorderRadius.circular(selectData.borderRadius!)),
  //       );
  //     default:
  //       return InputDecoration(
  //         labelText: selectData.label,
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(
  //                 selectData.borderRadius!)), // Default to 'outlined'
  //       );
  //   }
  // }
}
