import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_widgets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class ButtonWidget extends StatefulWidget {
  final String? name;
  final Function()? onPressed;
  final List<ValuesJson>? valueJson;
  final String? uniqueId;
  String? type;
  bool? isRequired;

  ButtonWidget(
      {required this.name,
      required this.onPressed,
      required this.valueJson,
      required this.uniqueId,
      this.type,this.isRequired});

  _ButtonWidgetState? s;

  @override
  _ButtonWidgetState createState() {
    s = _ButtonWidgetState();
    return s!;
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool validate = true;

  dynamic getValue() {
    return "";
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
     if(widget.isRequired == false){
validate = true;
    }
    return validate;
    // if (_numberFieldController.text.trim().isEmpty) {
    //   validate = false;
    // } else {
    //   validate = true;
    // }
    // setState(() {});
    // return validate;
    
  }

  @override
  Widget build(BuildContext context) {
    final double defaultFontSize = 16;
    final String buttonText = widget.valueJson?.isNotEmpty ?? false
        ? widget.valueJson!.first.optionVal.toString()
        : 'Default Text';

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
                  fontWeight: FontWeight.bold),
            ),
          ),
        InkWell(
          onTap: () {
            // if (widget.selectedValue!.isNotEmpty) {
            //       validate = true;
            //     }

            //     HulkProductWidget.allData.value!.add({
            //       "uniqueId": widget.uniqueId,
            //       "value": widget.selectedValue,
            //       "validate": validate,
            //       "Type": widget.type
            //     });
          },
          child: Container(
            alignment: Alignment.center,
            height: HulkWidgets.height, //ThemeSize.themeButtonSize,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: AppTheme.editTextControllerTextColor,
                fontSize: defaultFontSize,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(DashboardFontSize.customBorderRadius)),
              color: AppTheme.primaryButtonBackground,
            ),
          ),
        ),
      ],
    );
  }
}
