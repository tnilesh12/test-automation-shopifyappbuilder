import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class RadioButtonWidget extends StatefulWidget {
  final String? helptext;
  final String? optionName;
  final List<ValuesJson>? valuesJson;
  final String? uniqueId;
  String? type;
bool? isRequired;
  RadioButtonWidget(
      {Key? key,
      required this.helptext,
      required this.optionName,
      required this.valuesJson,
      required this.uniqueId,
      this.type,this.isRequired})
      : super(key: key);

  // @override
  // _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
  _RadioButtonWidgetState? s;

  @override
  _RadioButtonWidgetState createState() {
    s = _RadioButtonWidgetState();
    return s!;
  }
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  bool validate = true;
  late String selectedValue = "";

  @override
  void initState() {
    super.initState();
    for (var option in widget.valuesJson!) {
      if (option.defaultVal == true) {
        selectedValue = option.optionVal!;
        break;
      }
    }

    // widget.valid != null ? validate = widget.valid! : validate;
  }

  String getValue() {
    return selectedValue;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedValue!.isEmpty) {
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

  // @override
  // void dispose() {
  //   widget.selectedValue.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: widget.valuesJson!.map((option) {
            return RadioListTile<String>(
              // contentPadding: EdgeInsets.symmetric(),
              title: Text(option.optionVal!),
              value: option.optionVal!,
              activeColor: AppTheme.primaryButtonBackground,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                  //   HulkProductWidget.globalJson['radioButtonsUniqueId'] =
                  //       widget.uniqueId;
                  //   HulkProductWidget.globalJson['radioButtonsdata'] =
                  //       widget.selectedValue;

                  //   HulkProductWidget.globalJson
                  //       .addAll(HulkProductWidget.globalJson);
                  //   if (widget.selectedValue!.isNotEmpty) {
                  //     validate = true;
                  //   }

                  //   HulkProductWidget.allData.value!.add({
                  //     "radioButtonsUniqueId": widget.uniqueId,
                  //     "radioButtonsdata": widget.selectedValue,
                  //     "radioButtonvalidate": validate,
                  //     "radioButtonType": widget.type
                  //   });
                });
              },
            );
          }).toList(),
        ),
        // if (widget.helptext!.isNotEmpty)
        //   Padding(
        //     padding: EdgeInsets.fromLTRB(
        //       DashboardFontSize.paddingLeft,
        //       DashboardFontSize.paddingTop,
        //       DashboardFontSize.paddingRight,
        //       DashboardFontSize.paddingBottom,
        //     ),
        //     child: Text(
        //       widget.helptext!,
        //       style: TextStyle(color: Colors.grey),
        //     ),
        //   ),
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
    );
  }
}
