import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class SimpleRadios extends StatefulWidget {
  Fields radioData;
  Color textColor;
  final Function onChange;
  _SimpleRadios? s;

  SimpleRadios(this.radioData, this.textColor, this.onChange);

  @override
  _SimpleRadios createState() {
    s = _SimpleRadios();
    return s!;
  }
}

class _SimpleRadios extends State<SimpleRadios> {
  late String radioValue = "-1"; //widget.radioData.value!;
  bool validateValue = true;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> validate() async {
    if (widget.radioData.required!) {
      if (radioValue == "-1") {
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.radioData.label != ""
                ? Text(
                    widget.radioData.label!,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: DashboardFontSize.descFontSize,
                        color: widget.textColor),
                  )
                : Container(),
            Column(
              children: widget.radioData.options!
                  .map(
                    (item) => RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                      activeColor: widget.textColor,
                      //AppTheme.primaryButtonBackground,
                      // fillColor: MaterialStatePropertyAll(Colors.red),
                      fillColor: MaterialStatePropertyAll(
                        widget
                            .textColor, //AppTheme.primaryButtonBackground!.withAlpha(100)
                      ),
                      title: Text(item.label!,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: DashboardFontSize.descFontSize,
                              color: widget.textColor)),
                      value: item.value,
                      groupValue: radioValue,
                      onChanged: (selectedValue) {
                        setState(() {
                          validateValue = true;
                          radioValue = selectedValue!;
                          print("rv$radioValue");
                          item.value = selectedValue!;
                          print("iv${item.value}");
                          widget.onChange(radioValue);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            !validateValue && widget.radioData.required!
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
          ]),
    );
  }
}
