import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class CustomCheckboxWidget extends StatefulWidget {
  final String? name;
  final List<ValuesJson> valueJson;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  CustomCheckboxWidget({
    required this.name,
    required this.valueJson,
    required this.uniqueId,
    this.type,
    this.isRequired,
    Key? key,
  }) : super(key: key);

  _CustomCheckboxWidgetState? s;

  @override
  _CustomCheckboxWidgetState createState() {
    s = _CustomCheckboxWidgetState();
    return s!;
  }
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  List<String> selectedValues = [];

  bool validate = true;

  @override
  void initState() {
    super.initState();
    selectedValues = widget.valueJson
        .where((value) => value.defaultVal ?? false)
        .map((value) => value.optionVal!)
        .toList();
    // updateGlobalJson();

    // widget.valid != null ? validate = widget.valid! : validate;
  }

  dynamic getValue() {
    return selectedValues;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedValues!.isEmpty) {
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
     if(widget.isRequired == false){
validate = true;
    }
    setState(() {});
    return validate;
  }

  // void updateGlobalJson() {
  //   HulkProductWidget.globalJson['customCheckboxUniqueId'] = widget.uniqueId;
  //   HulkProductWidget.globalJson['customCheckboxData'] = selectedValues;

  //   HulkProductWidget.allData.value = [{}];
  //   if (selectedValues.isNotEmpty) {
  //     validate = true;
  //   }

  //   HulkProductWidget.allData.value!.add({
  //     "customCheckboxUniqueId": widget.uniqueId,
  //     "customCheckboxData": selectedValues,
  //     "customCheckboxValidate": validate,
  //     "customCheckboxDataType": widget.type
  //   });
  //   // print("Updated global JSON: ${HulkProductWidget.globalJson}");
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.name!.isNotEmpty)
          Padding(
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            child: Text(
              widget.name!,
              style: TextStyle(
                  color: AppTheme.editTextControllerTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ...widget.valueJson.map((value) {
          return Column(
            children: [
              Container(
                child: Focus(
                  onFocusChange: (value) {
                    // selectedValues.isNotEmpty ? updateGlobalJson() : "";
                  },
                  child: CheckboxListTile(
                    title: Text(value.optionVal!),
                    value: selectedValues.contains(value.optionVal!),
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue == true) {
                          selectedValues.add(value.optionVal!);
                        } else {
                          selectedValues.remove(value.optionVal!);
                        }
                        // updateGlobalJson();
                      });
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                ),
              ),
            ],
          );
        }).toList(),
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
      ],
    );
  }
}
