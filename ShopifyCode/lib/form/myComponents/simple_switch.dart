import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class SimpleSwitch extends StatefulWidget {
  Fields switchData;
  Color textColor, backgroundColor;
  final Function onChange;
  _SimpleSwitch? s;
  SimpleSwitch(
      this.switchData, this.textColor, this.backgroundColor, this.onChange);

  @override
  _SimpleSwitch createState() {
    s = _SimpleSwitch();
    return s!;
  }
}

class _SimpleSwitch extends State<SimpleSwitch> {
  bool validateValue = true, switchValue = false;

  Future<bool> validate() async {
    if (widget.switchData.required!) {
      if (!switchValue) {
        validateValue = false;
        setState(() {});
        return false;
      }
    }
    validateValue = true;
    setState(() {});
    return true;
  }

  @override
  void initState() {
    super.initState();
    widget.switchData.value ??= false.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Switch(
                trackColor: MaterialStateProperty.all(widget.textColor),
                thumbColor: MaterialStateProperty.all(widget.backgroundColor),
                value: bool.parse(widget.switchData.value == ""
                    ? false.toString()
                    : widget.switchData.value!),
                onChanged: (newValue) {
                  setState(() {
                    newValue! ? validateValue = true : validateValue = false;
                    switchValue = newValue!;
                    widget.switchData.value = newValue.toString();
                    widget.onChange(newValue);
                  });
                }),
            Expanded(
              child: Text(
                widget.switchData.label!,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: DashboardFontSize.descFontSize,
                    color: widget.textColor),
              ),
            ),
          ]),
          !validateValue && widget.switchData.required!
              ? Container(
                  margin: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Required!",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: DashboardFontSize.descFontSize,
                        color: AppTheme.errorColor),
                  ),
                )
              : Container(),
        ],
      ),
    );

    // Container(
    //     margin: EdgeInsets.only(top: 5.0),
    //     child: SwitchListTile(
    //       title: Text(
    //         widget.switchData.label!,
    //         style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: textColor),
    //       ),
    //       value: bool.parse(widget.switchData.value!),
    //       onChanged: (newValue) {
    //         setState(() {
    //           widget.switchData.value = newValue.toString();
    //           widget.onChange(newValue);
    //         });
    //       },
    //     ));
  }
}
