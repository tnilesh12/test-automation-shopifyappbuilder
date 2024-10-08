import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class ShortTextGroupWidget extends StatefulWidget {
  final String optionName;
  final String optionType;
  final String helptext;
  final List<ValuesJson> valuesJson;
  final String? uniqueId;
bool? isRequired;
  ShortTextGroupWidget(
      {required this.optionName,
      required this.optionType,
      required this.helptext,
      required this.valuesJson,
      required this.uniqueId,this.isRequired});

  _ShortTextGroupWidgetState? s;

  @override
  _ShortTextGroupWidgetState createState() {
    s = _ShortTextGroupWidgetState();
    return s!;
  }
}

class _ShortTextGroupWidgetState extends State<ShortTextGroupWidget> {
  final Map<String, TextEditingController> _controllers = {};
  bool validate = true;

  @override
  void initState() {
    super.initState();
    for (var option in widget.valuesJson) {
      _controllers[option.optionVal!] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Map<String, dynamic> updatedValues = {};

  void updateGlobalJson() {
    widget.valuesJson.forEach((option) {
      updatedValues[option.optionVal!] =
          _controllers[option.optionVal!]?.text ?? '';
    });
    setState(() {});
  }

  Map<String, dynamic> getValue() {
    Map<String, dynamic> values = {};
    _controllers.forEach((key, controller) {
      values[key] = controller.text;
    });
    return values;
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (updatedValues!.isEmpty) {
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
                  color: AppTheme.editTextControllerTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: widget.valuesJson.map((option) {
            _controllers[option.optionVal!] ??= TextEditingController();
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _controllers[option.optionVal!],
                decoration: InputDecoration(
                  labelText: option.optionVal!,
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  updateGlobalJson();
                },
              ),
            );
          }).toList(),
        ),
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
                    fontSize: DashboardFontSize.descFontSize,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
