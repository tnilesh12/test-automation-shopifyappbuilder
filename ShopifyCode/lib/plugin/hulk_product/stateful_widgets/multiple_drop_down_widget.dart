import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import '../hulk_product_widget.dart';

class MultipleDropdownField extends StatefulWidget {
  final String? name;
  final List<ValuesJson>? valueJson;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  MultipleDropdownField({
    Key? key,
    this.name,
    this.valueJson,
    this.uniqueId,
    this.type,
    this.isRequired,
  }) : super(key: key);

  _MultipleDropdownFieldState? s;

  @override
  _MultipleDropdownFieldState createState() {
    s = _MultipleDropdownFieldState();
    return s!;
  }
}

class _MultipleDropdownFieldState extends State<MultipleDropdownField> {
  List<String> selectedValues = [];
  // bool _isValid = true;

  bool validate = true;
  @override
  void initState() {
    super.initState();
    // Initialize selectedValues with default values if available
    selectedValues = widget.valueJson
            ?.where((value) => value.defaultVal ?? false)
            .map((value) => value.optionVal!)
            .toList() ??
        [];
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

  @override
  Widget build(BuildContext context) {
    final options = widget.valueJson;

    return Container(
      // padding: EdgeInsets.fromLTRB(
      //   DashboardFontSize.paddingLeft,
      //   DashboardFontSize.paddingTop,
      //   DashboardFontSize.paddingRight,
      //   DashboardFontSize.paddingBottom,
      // ),
      child: Column(
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
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            height: 200.0, // Adjust the height as needed
            child: ListView(
              children: options!.map((option) {
                String optionVal = option.optionVal!;
                return Container(
                  width: MediaQuery.of(context).size.width - 16,
                  padding: EdgeInsets.all(2.0),
                  child: FilterChip(
                    label: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        optionVal,
                        style: TextStyle(color: AppTheme.primaryButtonText),
                      ),
                    ),
                    selected: selectedValues.contains(optionVal),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedValues.add(optionVal);
                        } else {
                          selectedValues.remove(optionVal);
                        }
                        // updateGlobalJson();
                        // validateSelection();
                      });
                    },
                    selectedColor: AppTheme.primaryButtonBackground,
                  ),
                );
              }).toList(),
            ),
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
          // Uncomment and adjust this part if you want to display helptext or other information
          // if (widget.valueJson!.first.helptext != null && widget.valueJson!.first.helptext!.isNotEmpty)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 8.0),
          //     child: Text(
          //       widget.valueJson!.first.helptext!,
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
