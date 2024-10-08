import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class MultipleSwatchWidget extends StatefulWidget {
  final String? optionName;
  final List<ValuesJson>? valueJson;
  final String? uniqueId;
  String? type;
  bool? isRequired;
  MultipleSwatchWidget(
      {required this.optionName,
      required this.valueJson,
      required this.uniqueId,
      this.type,this.isRequired});

  _MultipleSwatchWidgetState? s;

  @override
  _MultipleSwatchWidgetState createState() {
    s = _MultipleSwatchWidgetState();
    return s!;
  }
}

class _MultipleSwatchWidgetState extends State<MultipleSwatchWidget> {
  Set<int> _selectedIndices = {};
  bool validate = true;

  @override
  void initState() {
    // TODO: implement initState
    // widget.valid != null ? validate = widget.valid! : validate;
    super.initState();
  }

  List<String> selectedValues = [];
  void updateGlobalJson() {
    // Create a list of selected values
    selectedValues = _selectedIndices.map((index) {
      return widget.valueJson![index].swatchVal!;
    }).toList();

    // Update the global JSON
    // HulkProductWidget.globalJson['multipleSwatchUniqueId'] = widget.uniqueId;
    // HulkProductWidget.globalJson['multipleSwatchData'] = selectedValues;

    // if (selectedValues.isNotEmpty) {
    //   validate = true;
    // }

    // HulkProductWidget.allData.value!.add({
    //   "multipleSwatchUniqueId": widget.uniqueId,
    //   "multipleSwatchData": selectedValues,
    //   "multipleSwatchDataValidate": validate,
    //   "multipleSwatchDataType": widget.type
    // });

    // print("Updated global JSON: ${HulkProductWidget.globalJson}");
  }

  dynamic getValue() {
    return selectedValues;
  }

 String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedValues.isNotEmpty) {
      validate = true;
    } else {
      validate = false;
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
                  color: AppTheme.editTextControllerTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.valueJson!.length,
            itemBuilder: (context, index) {
              ValuesJson value = widget.valueJson![index];

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedIndices.contains(index)) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
                        }
                      });
                      updateGlobalJson();
                    },
                    child:
                        _buildSwatch(value, _selectedIndices.contains(index)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              );
            },
          ),
        ),
        validate == false
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '* Please select at least one option',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            : Container()
      ],
    );
  }

  Widget _buildSwatch(ValuesJson value, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: AppTheme.primaryDarkBackgroundColor!, width: 2)
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: value.swatchVal!.contains(",")
            ? Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Utils.getColorFromHex(
                          value.swatchVal!.split(",").first),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Utils.getColorFromHex(
                          value.swatchVal!.split(",").last),
                    ),
                  ),
                ],
              )
            : value.swatchType == "color" && value.swatchVal!.length == 7
                ? CircleAvatar(
                    backgroundColor: Utils.getColorFromHex(value.swatchVal!),
                  )
                : value.swatchType == "image"
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(value.swatchVal!),
                      )
                    : Container(),
      ),
    );
  }
}
