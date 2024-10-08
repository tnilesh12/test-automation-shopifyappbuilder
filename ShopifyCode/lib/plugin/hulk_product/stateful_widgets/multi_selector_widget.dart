import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class MultiSelectorWidget extends StatefulWidget {
  final List<ValuesJson>? valuejson;
  final String? optionName;
  final String? optionType;
  final String? uniqueId;
  String? type;
bool? isRequired;
  MultiSelectorWidget({
    required this.optionName,
    required this.optionType,
    required this.valuejson,
    required this.uniqueId,
    this.type,this.isRequired
  });

  _MultiSelectorWidgetState? s;

  @override
  _MultiSelectorWidgetState createState() {
    s = _MultiSelectorWidgetState();
    return s!;
  }
}

class _MultiSelectorWidgetState extends State<MultiSelectorWidget> {
  late List<int> counters;
  bool validate = true;

  @override
  void initState() {
    super.initState();
    // // Initialize counters with 0 for each item
    counters = List<int>.filled(widget.valuejson!.length, 0);
    // widget.valid != null ? validate = widget.valid! : validate;
  }

  Map<String, dynamic> updatedValues = {};

  void updateGlobalJson() {
    // Create a map to store the updated values

    for (int i = 0; i < widget.valuejson!.length; i++) {
      updatedValues[widget.valuejson![i].optionVal!] = counters[i];
    }
  }

  dynamic getValue() {
    return updatedValues;
  }

   String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    // if (updatedValues.isNotEmpty) {
    //   validate = true;
    // } else {
    //   validate = false;
    // }

    //setState(() {});
     if(widget.isRequired == false){
validate = true;
    }
    return validate;
  }

  // Update the global JSON
  // HulkProductWidget.globalJson['multiSelectorUniqueId'] = widget.uniqueId;
  // HulkProductWidget.globalJson['multiSelectorData'] = updatedValues;

  // if (updatedValues.isNotEmpty) {
  //   validate = true;
  // }

  // HulkProductWidget.allData.value!.add({
  //   "multiSelectorUniqueId": widget.uniqueId,
  //   "multiSelectorData": updatedValues,

  //   "multiSelectorDataValidate": validate,
  //   "multiSelectorDataType": widget.type
  // });

  // print("Updated global JSON: ${HulkProductWidget.globalJson}");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.valuejson!.length,
              itemBuilder: (context, index) {
                ValuesJson value = widget.valuejson![index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text(value.optionVal.toString())),
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 30,
                      child: Text(
                        "In stock",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 25,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Container(
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryButtonBackground,
                                border: Border.all(
                                    color: AppTheme.primaryButtonBackground!),
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius),
                              ),
                              padding: EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                "assets/images/remove.svg",
                              ),
                            ),
                            onPressed: () {
                              if (counters[index] > 0) {
                                setState(() {
                                  counters[index]--;
                                });
                                updateGlobalJson();
                              }
                            },
                          ),
                          Container(
                            child: Text(
                              "${counters[index]}",
                              style: Theme.of(context).textTheme.bodyMedium!,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Container(
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryButtonBackground,
                                border: Border.all(
                                    color: AppTheme.primaryButtonBackground!),
                                borderRadius: BorderRadius.circular(
                                    DashboardFontSize.customBorderRadius),
                              ),
                              padding: EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                "assets/images/add.svg",
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                counters[index]++;
                              });
                              updateGlobalJson();
                            },
                          ),
                          // validate == false
                          //     ? Padding(
                          //         padding: EdgeInsets.fromLTRB(
                          //           DashboardFontSize.paddingLeft,
                          //           DashboardFontSize.paddingTop,
                          //           DashboardFontSize.paddingRight,
                          //           DashboardFontSize.paddingBottom,
                          //         ),
                          //         child: Text(
                          //           '* Please select atleast one',
                          //           style: TextStyle(color: Colors.red),
                          //         ),
                          //       )
                          //     : Container()
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
