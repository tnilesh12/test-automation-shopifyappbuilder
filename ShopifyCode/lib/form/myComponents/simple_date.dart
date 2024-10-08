import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/form/form_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class SimpleDate extends StatefulWidget {
  Fields dateData;
  SimpleDate(this.dateData);

  @override
  _SimpleDate createState() => _SimpleDate();
}

class _SimpleDate extends State<SimpleDate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.dateData.label != ""
                ? Text(
                    widget.dateData.label!,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: DashboardFontSize.descFontSize,
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: InkWell(
                  child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: widget.dateData.value ?? "",
                  //prefixIcon: Icon(Icons.date_range_rounded),
                  suffixIcon: IconButton(
                    onPressed: () {
                      selectDate();
                    },
                    icon: Icon(Icons.calendar_today_rounded),
                  ),
                ),
              )),
            ),
          ],
        ));
  }

  Future selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(Duration(days: 360)),
        firstDate: DateTime.now().subtract(Duration(days: 360)),
        lastDate: DateTime.now().add(Duration(days: 360)));
    if (picked != null) {
      String date =
          "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      this.setState(() {
        widget.dateData.value = date;
        // widget.onChange(date);
      });
    }
  }
}
