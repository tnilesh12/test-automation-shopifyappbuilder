import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class DropDownWidget extends StatefulWidget {
  String? name;
  List<ValuesJson>? valueJson;
  String? uniqueId;
  String? type;
  bool? isRequired;
  DropDownWidget(
      {this.name, this.valueJson, super.key, this.uniqueId, this.type,this.isRequired});

  _DropDownWidgetState? s;

  @override
  _DropDownWidgetState createState() {
    s = _DropDownWidgetState();
    return s!;
  }
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String? selectedValue = "";
  bool validate = true;

  @override
  void initState() {
    selectedValue = widget.valueJson!.first.optionVal.toString();

    // widget.valid != null ? validate = widget.valid! : validate;
    // TODO: implement initState
    super.initState();
  }

  String getValue() {
    return selectedValue!;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedValue!.isEmpty) {
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(DashboardFontSize.customBorderRadius),
              border: Border.all(width: 0.5, color: Colors.grey)),
          padding: EdgeInsets.all(6.0),
          child: DropdownButton(
              hint: Text(selectedValue!),
              value: selectedValue,
              icon: Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              underline: SizedBox(),
              items: widget.valueJson!.map((p) {
                print("===========>>>" + p.optionVal.toString());
                return DropdownMenuItem(
                  child: Text(p.optionVal!,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: DashboardFontSize.descFontSize,
                      )),
                  value: p.optionVal,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                  // HulkProductWidget.globalJson['dropDownsUniqueId'] =
                  //     widget.uniqueId;
                  // HulkProductWidget.globalJson['dropDownsdata'] = selectedValue;

                  // HulkProductWidget.globalJson
                  //     .addAll(HulkProductWidget.globalJson);

                  // if (selectedValue!.isNotEmpty) {
                  //   validate = true;
                  // }

                  // HulkProductWidget.allData.value!.add({
                  //   "dropDownsUniqueId": widget.uniqueId,
                  //   "dropDownsdata": selectedValue,
                  //   "dropDownvalidate": validate,
                  //   "dropDownsType": widget.type
                  // });
                  // print("global data----> ${HulkProductWidget.globalJson}");
                });
                // print(
                //     "selected ---------------value is${selectedValue!.name}");
              }),
        ),
      ],
    );
  }
}
