import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:shopify_code/globels.dart' as globals;

class CheckboxVendor extends StatefulWidget {
  ProductFilterData data;

  CheckboxVendor(this.data, {super.key});

  @override
  State<CheckboxVendor> createState() => _CheckboxVendor();
}

class _CheckboxVendor extends State<CheckboxVendor> {
  // List<bool>? valueFirst;
  bool colour = false;
  Color colorBackground = Colors.transparent;
  Color colorText = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  if(widget.data.name.contains(Color))
    //  {
    //    colour=true;
    //  }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.keys.length,
        itemBuilder: (context, index) {
          return SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: AppTheme.primaryButtonBackground,
                      // fillColor: MaterialStatePropertyAll(Colors.red),
                      checkColor: AppTheme.primaryButtonText,
                      fillColor: MaterialStatePropertyAll(
                          AppTheme.primaryButtonBackground!.withAlpha(100)),
                      title: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: getColor(widget.data.keys[index])),
                        child: Text(widget.data.keys[index],
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .fontSize,
                                color: colorText)),
                      ),
                      value: globals.productFilterOptionValue.keys
                          .contains(widget.data.keys[index]),
                      onChanged: (value) {
                        setState(() {
                          colour = value!;
                        });

                        if (value!) {
                          globals.productFilterOptionValue.keys
                              .add(widget.data.keys[index]);
                          globals.productFilterOptionValue.values
                              .add(widget.data.values[index]);
                        } else {
                          globals.productFilterOptionValue.keys
                              .remove(widget.data.keys[index]);
                          globals.productFilterOptionValue.values
                              .remove(widget.data.values[index]);
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              )
            ],
          ));
        });
  }

  Color getColor(String text) {
    //Color color = Colors.transparent;
    if (text == 'Black' || text == 'black') {
      colorBackground = Colors.black;
      colorText = Colors.white;
    } else if (text == 'Blue' || text == 'blue') {
      colorBackground = Colors.blue;
      colorText = Colors.black;
    } else if (text == 'red' || text == 'Red') {
      colorBackground = Colors.red;
      colorText = Colors.black;
    } else if (text == 'orange' || text == 'Orange') {
      colorBackground = Colors.orange;
      colorText = Colors.black;
    } else if (text == 'amber' || text == 'Amber') {
      colorBackground = Colors.amber;
      colorText = Colors.black;
    } else if (text == 'yellow' || text == 'Yellow') {
      colorBackground = Colors.yellow;
      colorText = Colors.black;
    } else if (text == 'lime' || text == 'Lime') {
      colorBackground = Colors.lime;
      colorText = Colors.black;
    } else if (text == 'green' || text == 'Green') {
      colorBackground = Colors.green;
      colorText = Colors.black;
    } else if (text == 'teal' || text == 'Teal') {
      colorBackground = Colors.teal;
      colorText = Colors.black;
    } else if (text == 'cyan' || text == 'Cyan') {
      colorBackground = Colors.cyan;
      colorText = Colors.black;
    } else if (text == 'blue' || text == 'Blue') {
      colorBackground = Colors.blue;
      colorText = Colors.black;
    } else if (text == 'indigo' || text == 'Indigo') {
      colorBackground = Colors.indigo;
      colorText = Colors.black;
    } else if (text == 'purple' || text == 'Purple') {
      colorBackground = Colors.purple;
      colorText = Colors.black;
    } else if (text == 'grey' || text == 'Grey') {
      colorBackground = Colors.grey;
      colorText = Colors.black;
    } else if (text == 'brown' || text == 'Brown') {
      colorBackground = Colors.brown;
      colorText = Colors.black;
    } else if (text == 'white' || text == 'White') {
      colorBackground = Colors.white;
      colorText = Colors.black;
    } else if (text == 'pink' || text == 'Pink') {
      colorBackground = Colors.pink;
      colorText = Colors.black;
    }

    return colorBackground;
  }
}
