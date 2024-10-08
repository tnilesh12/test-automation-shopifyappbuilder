import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/utils/theme_size.dart';

class ProductItemCountView extends StatefulWidget {
  final bool isDark;
  final int view_type; //0
  final Function(int)? OnCountUpdate;
  late int initialCount;

  ProductItemCountView(
      this.isDark, this.OnCountUpdate, this.initialCount, this.view_type,
      {super.key});

  @override
  State<ProductItemCountView> createState() => _ProductItemCountViewState();
}

class _ProductItemCountViewState extends State<ProductItemCountView> {
  // var myColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    // myColor = widget.isDark ? Colors.white : Colors.grey;
    if (widget.view_type == 0) {
      return Container(
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.borderColor!),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Icon(
                  Icons.remove,
                  size: 15,
                ),
                onTap: () {
                  widget.initialCount = widget.initialCount - 1;
                  // if (widget.initialCount < 1) widget.initialCount = 1;
                  widget.OnCountUpdate!.call(widget.initialCount);
                  setState(() {});
                },
              ),
              Text("${widget.initialCount}",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  )),
              InkWell(
                child: Icon(
                  Icons.add,
                  size: 15,
                ),
                onTap: () {
                  widget.initialCount = widget.initialCount + 1;
                  widget.OnCountUpdate!.call(widget.initialCount);
                  setState(() {});
                },
              )
            ],
          ));
    } else {
      return Container(
          height: 25,
          // width: 100,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              // color: Colors.blue,
              border: Border.all(color: AppTheme.borderColor!),
              borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // InkWell(
              //   child: Icon(
              //     Icons.remove_circle_outline,
              //     size: 20,
              //   ),
              //   onTap: () {
              //     widget.initialCount = widget.initialCount - 1;
              //     // if (widget.initialCount < 1) widget.initialCount = 1;
              //     widget.OnCountUpdate!.call(widget.initialCount);
              //     setState(() {});
              //   },
              // ),
              IconButton(
                  // visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.all(0),
                  icon: Container(
                      width: 15,
                      // height: 15,
                      // padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                      padding: EdgeInsets.all(0),
                      child: SvgPicture.asset(
                        "assets/images/remove.svg",
                      )),
                  onPressed: () {
                    widget.initialCount = widget.initialCount - 1;
                    // if (widget.initialCount < 1) widget.initialCount = 1;
                    widget.OnCountUpdate!.call(widget.initialCount);
                    setState(() {});
                  }),
              Container(
                child: Text(
                  "${widget.initialCount}",
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
              ),
              // InkWell(
              //   child: Icon(
              //     Icons.add_circle_outline,
              //     size: 20,
              //   ),
              //   onTap: () {
              //     widget.initialCount = widget.initialCount + 1;
              //     widget.OnCountUpdate!.call(widget.initialCount);
              //     setState(() {});
              //   },
              // ),
              IconButton(
                  // visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.all(0),
                  icon: Container(
                      width: 15,
                      // height: 15,
                      // padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                      padding: EdgeInsets.all(0),
                      child: SvgPicture.asset(
                        "assets/images/add.svg",
                      )),
                  onPressed: () {
                    widget.initialCount = widget.initialCount + 1;
                    widget.OnCountUpdate!.call(widget.initialCount);
                    setState(() {});
                  }),
            ],
          ));
    }
  }
}
