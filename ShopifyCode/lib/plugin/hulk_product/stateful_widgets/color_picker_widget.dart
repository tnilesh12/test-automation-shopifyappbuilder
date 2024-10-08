import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class ColorPickerWidget extends StatefulWidget {
  final String optionType;
  final String optionName;
  final List<dynamic> valuesJson;
  final String? uniqueId;
bool? isRequired;
  ColorPickerWidget(
      {Key? key,
      required this.optionType,
      required this.optionName,
      required this.valuesJson,
      required this.uniqueId,this.isRequired})
      : super(key: key);

  _ColorPickerWidgetState? s;

  @override
  _ColorPickerWidgetState createState() {
    s = _ColorPickerWidgetState();
    return s!;
  }
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color currentColor = Colors.black;
  bool validate = true;

  @override
  void initState() {
    // TODO: implement initState
    // widget.valid != null ? validate = widget.valid! : validate;
    super.initState();
  }

  dynamic getValue() {
    return currentColor;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (currentColor == null) {
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
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Pick a color',
                    style: TextStyle(color: Colors.black),
                  ),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          currentColor = color;
                          // HulkProductWidget.globalJson['colorPickersUniqueId'] =
                          //     widget.uniqueId;
                          // HulkProductWidget.globalJson['colorPickersdata'] =
                          //     currentColor;

                          // HulkProductWidget.globalJson
                          //     .addAll(HulkProductWidget.globalJson);

                          // if (currentColor.toString().length > 0) {
                          //   validate = true;
                          // }

                          // HulkProductWidget.allData.value!.add({
                          //   "colorPickersUniqueId": widget.uniqueId,
                          //   "colorPickersdata": currentColor.toString(),
                          //   "colorPickersdataValidate": validate,
                          //   "colorPickersdataType": widget.optionType
                          // });
                          // print(
                          //     "global data----> ${HulkProductWidget.globalJson}");
                        });
                      },
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Got it',
                          style: TextStyle(
                              color: AppTheme.primaryButtonBackground)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: 100,
            height: 100,
            color: currentColor,
            child: Center(
              child: Text(
                'Pick Color',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        // if (widget.helptext.isNotEmpty)
        //   Padding(
        //     padding:  EdgeInsets.only(top: 8.0),
        //     child: Text(
        //       widget.helptext,
        //       style: TextStyle(color: Colors.grey),
        //     ),
        //   ),
      ],
    );
  }
}
