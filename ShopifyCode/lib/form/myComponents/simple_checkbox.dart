import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class SimpleListCheckbox extends StatefulWidget {
  Fields checkBoxData;
  Color textColor, backgroundColor;
  final Function onChange;
  _SimpleListCheckbox? s;
  SimpleListCheckbox(
      this.checkBoxData, this.textColor, this.backgroundColor, this.onChange);

  @override
  _SimpleListCheckbox createState() {
    s = _SimpleListCheckbox();
    return s!;
  }
}

class _SimpleListCheckbox extends State<SimpleListCheckbox> {
  // List<dynamic> selectItems = [];
  bool validateValue = true, checkBoxValue = false;

  Future<bool> validate() async {
    if (widget.checkBoxData.required!) {
      if (!checkBoxValue) {
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
    widget.checkBoxData.value ??= false.toString();
    // selectItems.clear();
    // for (var i = 0; i < widget.checkBoxData.options!.length; i++) {
    //   if (widget.checkBoxData.options![i].value == "true") {
    //     selectItems.add(i);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> checkboxes = [];
    return
     Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Checkbox(
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

              activeColor: widget.textColor, //AppTheme.primaryButtonBackground,
              checkColor: widget.backgroundColor, //AppTheme.primaryButtonText,
              // fillColor: MaterialStatePropertyAll(
              //   widget
              //       .textColor, //AppTheme.primaryButtonBackground!.withAlpha(100)
              // ),
              value: bool.parse(widget.checkBoxData.value == ""
                  ? false.toString()
                  : widget.checkBoxData.value!),
              // bool.parse(widget.checkBoxData.options![i].value!),
              onChanged: (bool? value) {
                setState(
                  () {
                    value! ? validateValue = true : validateValue = false;
                    checkBoxValue = value!;
                    widget.checkBoxData.value = value.toString();
                    widget.onChange(value);
                  },
                );
              },
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.checkBoxData.label!,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: DashboardFontSize.descFontSize,
                    color: widget.textColor),
              ),
            ),
          ]),
          !validateValue && widget.checkBoxData.required!
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

    /* Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: checkboxes),
    );*/
  }
}
 // checkboxes.add(Text(
    //   widget.checkBoxData.label!,
    //   style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: textColor),
    // ));
   /* for (var i = 0; i < widget.checkBoxData.options!.length; i++) {
      bool val = widget.checkBoxData.options![i].value!.isEmpty
          ? false
          : bool.parse(widget.checkBoxData.options![i].value!);
      checkboxes.add(
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              widget.checkBoxData.label!, //options![i].label!,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: textColor),
            )),
            Checkbox(
              value: val,
              // widget.checkBoxData.options![i].value!,
              // bool.parse(widget.checkBoxData.options![i].value!),
              onChanged: (bool? value) {
                setState(
                  () {
                    checkBoxValue = value!;
                    widget.checkBoxData.value = value.toString();
                    // widget.checkBoxData.options![i].value = value.toString();
                    if (value!) {
                      selectItems.add(i);
                    } else {
                      selectItems.remove(i);
                    }
                  },
                );
              },
            ),
          ],
        ),
      );

      checkboxes.add(
        !validateValue
            ? Text(
                "Required!",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: AppTheme.errorColor),
              )
            : Container(),
      );
    }
    */
   