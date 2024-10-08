import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class RedeemBottomSheetView extends StatefulWidget {
  // final Function(int, SellingPlanListNodes) onSelectApply;
  dynamic? waysToRedeemDataItem;
  int? totalPoints;
  Function(int) pointsToSpend;

  RedeemBottomSheetView(
      this.waysToRedeemDataItem, this.totalPoints, this.pointsToSpend,
      {super.key});

  @override
  State<RedeemBottomSheetView> createState() => _RedeemBottomSheetViewState();
}

class _RedeemBottomSheetViewState extends State<RedeemBottomSheetView> {
  @override
  void initState() {
    super.initState();
    try {
      _upperValue = double.parse(widget.waysToRedeemDataItem!["points_price"]);
      // _upperValue2 = double.parse(widget.waysToRedeemDataItem!["points_price"]);
      maxValueController.text = _upperValue!.round().toString();
    } catch (e) {}
  }

  var maxValueController = TextEditingController();
  double? _upperValue = 0.0;
  double? _lowerValue2 = 0.0;
  final double defaultFontSize = 16;
  // double? _upperValue2 = widget.waysToRedeemDataItem!["points_price"]; // = 50.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 320,
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      child: WidgetImage(
                          widget.waysToRedeemDataItem!["reward"] != null
                              ? widget.waysToRedeemDataItem!["reward"]
                                  ["image_url"]!
                              : ""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    widget.waysToRedeemDataItem!["reward"]
                                        ["name"]!,
                                    style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.CommonThemeSubTitle,
                                        context))),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    widget.waysToRedeemDataItem![
                                        "exchange_description"]!,
                                    style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.CommonThemeSubTitle,
                                            context)
                                        .copyWith(fontSize: 13))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                      "${_upperValue!.toInt()} Points for ${(_upperValue! / widget.waysToRedeemDataItem["variable_points_step"]).toInt()} off",
                      style: CustomTextTheme.getTextStyle(
                              MyTextStyle.CommonThemeTitle, context)
                          .copyWith(fontSize: 15))),
              Slider(
                  // labels: RangeLabels(_lowerValue.toString(), _upperValue.toString()),
                  activeColor: AppTheme.primaryButtonBackground,
                  inactiveColor:
                      AppTheme.primaryButtonBackground!.withAlpha(120),
                  min: _lowerValue2!,
                  max: widget.totalPoints!.toDouble(),
                  divisions: (widget.totalPoints! /
                          widget.waysToRedeemDataItem["variable_points_step"]!)
                      .toInt(),
                  value:
                      _upperValue!, //RangeValues(_lowerValue!, _upperValue!),
                  onChanged: (value) {
                    setState(() {
                      _upperValue = value.toDouble();
                      maxValueController.text = value.round().toString();
                    });
                  }),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: InkWell(
                    onTap: () {
                      if (_upperValue!.toInt() > 0) {
                        widget.pointsToSpend.call(_upperValue!.toInt());
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: DashboardFontSize.dashboardButtonSize,
                      width: double.infinity,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Redeem",
                        style: TextStyle(
                            color: AppTheme.primaryButtonText!,
                            fontSize: defaultFontSize),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.all(Radius.circular(
                            DashboardFontSize.customBorderRadius)),
                        color: (AppTheme.primaryButtonBackground),
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
