import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/views/shopify_media_image/shopify_media_image.dart';

class GoLimeProductSpecificationWidget extends StatefulWidget {
  var product;
  GoLimeProductSpecificationWidget(this.product, {super.key});

  @override
  State<GoLimeProductSpecificationWidget> createState() =>
      _GoLimeProductSpecificationWidgetState();
}

class _GoLimeProductSpecificationWidgetState
    extends State<GoLimeProductSpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    int length = widget.product['metafields']!.length;
    // int.parse((widget.product['metafields']!.length / 2).toString());
    // int key = 0, desc = 1;
    // print(
    //     "------------------------>>>>>>>>>>>>>>>${widget.product.metafields!.length}");
    return Container(
        // height:
        //     // 100,
        //     widget.product['metafields']!.length == 0 ||
        //             widget.product['metafields'] == null
        //         ? 0
        //         : (widget.product['metafields']!.length * 50.0),
        // (50 * widget.product.metafields!.length).toDouble(),
        decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.black,
            //   width: 1,
            // ),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (length / 2).toInt(),
            itemBuilder: (context, index) {
              int idx = index * 2;
              return (widget.product['metafields'][index] != null &&
                      widget.product['metafields'][idx] != null &&
                      widget.product['metafields'][idx]['value'] != null)
                  ? Column(
                      children: [
                        (index == 0)
                            ? Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(top: 10),
                                height: 40,
                                // color: Colors.amber,
                                child: Text(
                                  "Specification :",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize:
                                          DashboardFontSize.subHeadingFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        Container(
                          // height: 50,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product['metafields']![idx]['value']
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  //widget.product.metafields![index].key.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: (widget.product['metafields']![
                                                idx + 1] !=
                                            null &&
                                        widget.product['metafields']![idx + 1]
                                                ['value'] !=
                                            null &&
                                        widget.product['metafields']![idx + 1]
                                                ['value']
                                            .toString()
                                            .contains("MediaImage"))
                                    ? Container(
                                        height: 30,
                                        child: ShopifyMediaImage(widget
                                            .product['metafields']![idx + 1]
                                                ['value']
                                            .toString()))
                                    : Text(
                                        (widget.product['metafields']![idx + 1]
                                                    ['value'] !=
                                                null)
                                            ? widget
                                                .product['metafields']![idx + 1]
                                                    ['value']
                                                .toString()
                                            : "",
                                        textAlign: TextAlign.center,
                                        //widget.product.metafields![index].value.toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.black, width: 0.5)),
                            ))
                      ],
                    )
                  : Container();
            }));
  }
}
