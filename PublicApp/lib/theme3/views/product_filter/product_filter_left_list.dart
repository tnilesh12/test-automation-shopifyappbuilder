import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';

class ProductListLeft extends StatefulWidget {
  Function(int) onClick;
  Map<String, ProductFilterData> data;

  ProductListLeft(this.data, this.onClick);

  @override
  State<ProductListLeft> createState() => _ProductListLeftState();
}

class _ProductListLeftState extends State<ProductListLeft> {
  int SelectIndex = 0;

  selectedTab(int index) {
    setState(() {
      SelectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    color: SelectIndex != null && SelectIndex == index
                        ? AppTheme.baseColor
                        : AppTheme.white,
                    border: Border.all(width: 1, color: AppTheme.baseColor)),
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Text(widget.data.values.elementAt(index).name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize,
                            )),
                      )
                    ],
                  ),
                  onTap: () {
                    widget.onClick.call(index);
                    selectedTab(index);
                  },
                ));
          }),
    );
  }
}
