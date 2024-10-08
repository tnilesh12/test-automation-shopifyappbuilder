import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class TimePickerWidget extends StatefulWidget {
  final String? optionName;
  final String? optionType;
  String? minTime;
  String? maxTime;
  final String? helptext;
  final List<ValuesJson>? valuesJson;
  final String? uniqueId;
bool? isRequired;
  TimePickerWidget(
      {required this.optionName,
      required this.optionType,
      required this.helptext,
      required this.valuesJson,
      required this.maxTime,
      required this.minTime,
      required this.uniqueId,this.isRequired});

  _TimePickerWidgetState? s;

  @override
  _TimePickerWidgetState createState() {
    s = _TimePickerWidgetState();
    return s!;
  }
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay selectedTime;

  bool validate = true;
  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    // widget.valid != null ? validate = widget.valid! : validate;
  }

  void _showTimePickerDialog() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        // HulkProductWidget.globalJson['timePickersUniqueId'] = widget.uniqueId;
        // HulkProductWidget.globalJson['timePickersdata'] = selectedTime;

        // HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

        // if (selectedTime.toString().isNotEmpty) {
        //   validate = true;
        // }

        // HulkProductWidget.allData.value!.add({
        //   "timePickersUniqueId": widget.uniqueId,
        //   "timePickersdata": selectedTime,
        //   "timePickersdataValidate": validate,
        //   "timePickersdataType": widget.optionType
        // });
        //print("global data----> ${HulkProductWidget.globalJson}");
      });
    }
  }

  dynamic getValue() {
    return selectedTime.toString();
  }

 String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedTime.toString().isEmpty) {
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
        // if (widget.ext !.isNotEmpty)
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            "[Select a time from ${widget.minTime}]",
            style: TextStyle(
                color: AppTheme.editTextControllerTextColor, fontSize: 15),
          ),
        ),
        GestureDetector(
          onTap: _showTimePickerDialog,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius:
                  BorderRadius.circular(DashboardFontSize.customBorderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedTime.format(context)}',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.access_time),
              ],
            ),
          ),
        ),
        if (widget.helptext!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.helptext!,
              style: TextStyle(color: Colors.black),
            ),
          ),
      ],
    );
  }
}
