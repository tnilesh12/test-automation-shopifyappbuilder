import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/option/option.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ColorImageDropdown extends StatefulWidget {
  final String optionName;
  final String helptext;
  final List<ValuesJson> valuesJson;
  final bool require;
  final String? uniqueId;
  String? type;
bool? isRequired;
  ColorImageDropdown(
      {Key? key,
      required this.optionName,
      required this.helptext,
      required this.valuesJson,
      required this.require,
      required this.uniqueId,
      this.type,this.isRequired})
      : super(key: key);

  _ColorImageDropdownState? s;

  @override
  _ColorImageDropdownState createState() {
    s = _ColorImageDropdownState();
    return s!;
  }
}
/*
class _ColorImageDropdownState extends State<ColorImageDropdown> {
  dynamic selectedValue;
  bool validate = true;

  @override
  void initState() {
    // TODO: implement initState

    // widget.valid != null ? validate = widget.valid! : validate;
    super.initState();
  }

  dynamic getValue() {
    return selectedValue.toString();
  }

  int getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedValue == null) {
      //   if (!validate) {
      //     validate = true;
      //   } else {
      //     validate = false;
      //   }
      // } else {
      validate = false;
    } else {
      validate = true;
    }
    setState(() {});
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.optionName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8.0),
            child: Text(
              widget.optionName,
              style: TextStyle(color: Colors.black),
            ),
          ),
        DropdownButton<dynamic>(
          value: selectedValue,
          hint: Text("Color/Image"),
          items: widget.valuesJson.map((option) {
            return DropdownMenuItem<dynamic>(
              value: option,
              child: option.swatchType == 'color'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(option.optionVal.toString()),
                        SizedBox(width: 40),
                        CircleAvatar(
                          backgroundColor:
                              Utils.getColorFromHex(option.swatchVal!),
                          maxRadius: 12,
                        ),
                      ],
                    )
                  : option.swatchType == 'image'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option.optionVal.toString()),
                            SizedBox(width: 40),
                            CircleAvatar(
                              maxRadius: 12,
                              child: Image.network(
                                option.swatchVal.toString(),
                                width: 30,
                                height: 20,
                              ),
                            ),
                          ],
                        )
                      : Text(option.optionVal!),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
              // updateGlobalJson(value);
            });
          },
        ),
        validate == false
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '* Please select at least one option',
                  style: TextStyle(
                      color: AppTheme.errorColor,
                      fontSize: DashboardFontSize.descFontSize),
                ),
              )
            : Container()

        // if (widget.helptext.isNotEmpty)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 8.0),
        //     child: Text(
        //       widget.helptext,
        //       style: TextStyle(color: Colors.grey),
        //     ),
        //   ),
      ],
    );
  }

  // void updateGlobalJson(dynamic value) {
  //   setState(() {
  //     HulkProductWidget.globalJson['colorImageDropdownsUniqueId'] =
  //         widget.uniqueId;
  //     HulkProductWidget.globalJson['colorImageDropdownsdata'] = value.swatchVal;
  //     // Add any other necessary updates here
  //     if (value.swatchVal.isNotEmpty) {
  //       validate = true;
  //     }

  //     HulkProductWidget.allData.value!.add({
  //       "colorImageDropdownsUniqueId": widget.uniqueId,
  //       "colorImageDropdownsdata": value.swatchVal,
  //       "colorImageDropdownsdataValidate": validate,
  //       "colorImageDropdownsdataType": widget.type
  //     });
  //   });

  //   print("Updated global JSON: ${HulkProductWidget.globalJson}");
  // }
}
*/

class _ColorImageDropdownState extends State<ColorImageDropdown> {
  ValuesJson? selectedValue;
  bool validate = true;

  bool validatee() {
    if (selectedValue == null) {
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

  dynamic getValue() {
    if (selectedValue != null) {
      return selectedValue!
          .optionVal; // Adjust this to return the correct value
    } else {
      return null; // or any default value as needed
    }
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.optionName!.isNotEmpty)
          Padding(
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            child: Text(
              widget.optionName!,
              style: TextStyle(
                  color: AppTheme.editTextControllerTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        DropdownButton<dynamic>(
          value: selectedValue,
          hint: Text("Color/Image"),
          items: widget.valuesJson.map((option) {
            return DropdownMenuItem<dynamic>(
              value: option,
              child: option.swatchType == 'color'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(option.optionVal.toString()),
                        SizedBox(width: 40),
                        CircleAvatar(
                          backgroundColor:
                              Utils.getColorFromHex(option.swatchVal!),
                          maxRadius: 12,
                        ),
                      ],
                    )
                  : option.swatchType == 'image'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option.optionVal.toString()),
                            SizedBox(width: 40),
                            CircleAvatar(
                              maxRadius: 12,
                              child: Image.network(
                                option.swatchVal.toString(),
                                width: 30,
                                height: 20,
                              ),
                            ),
                          ],
                        )
                      : Text(option.optionVal!),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value as ValuesJson;
            });
          },
        ),
        validate == false
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '* Please select at least one option',
                  style: TextStyle(
                      color: AppTheme.errorColor,
                      fontSize: DashboardFontSize.descFontSize),
                ),
              )
            : Container(),
      ],
    );
  }
}
