import 'dart:convert';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import '../../utils/theme_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/globels.dart' as globals;

class ProductRange extends StatefulWidget {
  ProductRange(this.datas, {super.key});

  ProductFilterData datas;
  @override
  State<ProductRange> createState() => _ProductRange();
}

class _ProductRange extends State<ProductRange> {
  @override
  void initState() {
    super.initState();

    var value = widget.datas!.values.first;
    if (globals.productFilterOptionValue.values.length > 0) {
      try {
        var saveStr = globals.productFilterOptionValue.values[globals
            .productFilterOptionValue.keys
            .indexOf(widget.datas!.keys.first)];
        if (saveStr.isNotEmpty) {
          value = saveStr;
        }
      } catch (e) {}
    }
    var ddcode = json.decode(value);

    _lowerValue = double.parse(ddcode["price"]["min"].toString());
    _upperValue = double.parse(ddcode["price"]["max"].toString());

    // _lowerValue2 = double.parse(ddcode["price"]["min"].toString());
    // _upperValue2 = double.parse(ddcode["price"]["max"].toString());
    minValueController.text = _lowerValue.round().toString();
    maxValueController.text = _upperValue.round().toString();
  }

  var minValueController = TextEditingController();
  var maxValueController = TextEditingController();
  double _lowerValue = 0.0;
  double _upperValue = 900.0;
  double _lowerValue2 = 0.0;
  double _upperValue2 = 900.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      LanguageManager.translations()["Min"],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: ThemeSize.themeTextFieldSize,
                    width: 60,
                    alignment: Alignment.center,
                    child: TextFormField(
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.TextFormFieldInput, context),
                      controller: minValueController,
                      cursorColor: AppTheme.editTextControllerTextColor,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ThemeSize.themeBorderRadius)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        // labelText: labelText,
                        filled: true,
                      ),
                    ),
                  )
                ],
              )),
          Container(
              // margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  LanguageManager.translations()["Max"],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: ThemeSize.themeTextFieldSize,
                width: 60,
                alignment: Alignment.center,
                child: TextFormField(
                  style: CustomTextTheme.getTextStyle(
                      MyTextStyle.TextFormFieldInput, context),
                  controller: maxValueController,
                  cursorColor: AppTheme.editTextControllerTextColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ThemeSize.themeBorderRadius)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    // labelText: labelText,
                    filled: true,
                  ),
                ),
              )
            ],
          ))
        ]),
      ),
      RotatedBox(
        quarterTurns: 1,
        child: RangeSlider(
            activeColor: AppTheme.primaryButtonBackground,
            inactiveColor:
                AppTheme.primaryButtonBackground!.withAlpha(120), //black
            min: _lowerValue2,
            max: _upperValue2,
            divisions: 10,
            values: RangeValues(_lowerValue, _upperValue),
            onChanged: (RangeValues values) {
              setState(() {
                _lowerValue = values.start.toDouble();
                _upperValue = values.end.toDouble();
                maxValueController.text = values.end.round().toString();
                minValueController.text = values.start.round().toString();

                var resBody = {};
                resBody["min"] = _lowerValue.round();
                resBody["max"] = _upperValue.round();
                var user = {};
                user["price"] = resBody;

                if (globals.productFilterOptionValue.keys
                    .contains(widget.datas.keys.first.toString())) {
                  int indexofvalue = globals.productFilterOptionValue.keys
                      .indexOf(widget.datas.keys.first.toString());
                  globals.productFilterOptionValue.values
                      .removeAt(indexofvalue);
                  globals.productFilterOptionValue.values
                      .insert(indexofvalue, json.encode(user));
                } else {
                  globals.productFilterOptionValue.keys
                      .add(widget.datas.keys.first.toString());
                  globals.productFilterOptionValue.values
                      .add(json.encode(user));
                }
              });
            }),
      )
    ]);
  }
}



                 
              
              // ,