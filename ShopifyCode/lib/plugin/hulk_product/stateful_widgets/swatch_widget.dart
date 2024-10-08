import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class SwatchWidget extends StatefulWidget {
  final String? optionName;
  final List<ValuesJson>? valueJson;
  final String? uniqueId;
  String? type;
bool? isRequired;
  SwatchWidget(
      {required this.optionName,
      required this.valueJson,
      required this.uniqueId,
      this.type,this.isRequired});

  _SwatchWidgetState? s;

  @override
  _SwatchWidgetState createState() {
    s = _SwatchWidgetState();
    return s!;
  }
}

class _SwatchWidgetState extends State<SwatchWidget> {
  late int? _selectedIndex = 0;
  bool validate = false;

  dynamic getValue() {
    return widget.valueJson![_selectedIndex!].swatchVal;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (widget.valueJson![_selectedIndex!].swatchVal!.isNotEmpty) {
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
              //  print("-------type-------->>>>${value.swatchVal!}");

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        // HulkProductWidget.globalJson['swatchsUniqueId'] =
                        //     widget.uniqueId;
                        // HulkProductWidget.globalJson['swatchsdata'] =
                        //     widget.valueJson![_selectedIndex!].swatchVal!;
                        // _selectedIndex;

                        // HulkProductWidget.globalJson
                        //     .addAll(HulkProductWidget.globalJson);

                        // if (widget.valueJson![_selectedIndex!].swatchVal!
                        //     .isNotEmpty) {
                        //   validate = true;
                        // }

                        // HulkProductWidget.allData.value!.add({
                        //   "swatchsUniqueId": widget.uniqueId,
                        //   "swatchsdata":
                        //       widget.valueJson![_selectedIndex!].swatchVal!,
                        //   "swatchsdataValidate": validate,
                        //   "swatchsdataType": widget.type
                        // });
                        // print("global data----> ${HulkProductWidget.globalJson}");
                      });
                    },
                    child: _buildSwatch(value, index == _selectedIndex),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              );
            },
          ),
        ),
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
        border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
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
