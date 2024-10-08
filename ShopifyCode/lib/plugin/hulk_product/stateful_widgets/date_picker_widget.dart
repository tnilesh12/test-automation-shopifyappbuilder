import 'package:flutter/material.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class DatePickerWidget extends StatefulWidget {
  final String optionName;
  final String optionType;
  final String? uniqueId;

  final String helptext;
  final List<ValuesJson> valuesJson;
bool? isRequired;
  DatePickerWidget(
      {Key? key,
      required this.uniqueId,
      required this.optionName,
      required this.optionType,
      required this.helptext,
      required this.valuesJson,this.isRequired})
      : super(key: key);

  _DatePickerWidgetState? s;

  @override
  _DatePickerWidgetState createState() {
    s = _DatePickerWidgetState();
    return s!;
  }
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDate;

  bool validate = true;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    // widget.valid != null ? validate = widget.valid! : validate;
  }

  void _showDatePickerDialog() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.primaryColor, // Head background
            // accentColor: Colors.blue, // Tab background
            colorScheme:
                ColorScheme.light(primary: AppTheme.primaryButtonBackground!),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        // HulkProductWidget.globalJson['datePickersUniqueId'] = widget.uniqueId;
        // HulkProductWidget.globalJson['datePickersdata'] = selectedDate;

        // HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

        // if (selectedDate.toString().isNotEmpty) {
        //   validate = true;
        // }

        // HulkProductWidget.allData.value!.add({
        //   "datePickersUniqueId": widget.uniqueId,
        //   "datePickersdata": selectedDate.toString(),
        //   "datePickersdatavalidate": validate,
        //   "datePickersdataType": widget.optionType
        // });
        // print("global data----> ${HulkProductWidget.globalJson}");
      });
    }
  }

  dynamic getValue() {
    return selectedDate.toString();
  }

  String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (selectedDate.toString().isEmpty) {
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
          onTap: _showDatePickerDialog,
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
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
        if (widget.helptext.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.helptext,
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
