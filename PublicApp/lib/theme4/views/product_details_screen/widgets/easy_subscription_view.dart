import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/cart/cart_item.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import '../../../utils/theme_size.dart';
import 'package:shopify_code/globels.dart' as globals;

class EasySubscriptionView extends StatefulWidget {
  Product product;
  final ProductVariant selectedVariant;

  final Function(int, SellingPlanListNodes?, List<Map<String, dynamic>>?)
      onSelectApply;

  EasySubscriptionView(this.product, this.selectedVariant, this.onSelectApply,
      {super.key}) {}

  @override
  State<EasySubscriptionView> createState() => _EasySubscriptionViewState();
}

class _EasySubscriptionViewState extends State<EasySubscriptionView> {
  int selectedOption = 1;
  String? dropdownvalue;
  HulkProductWidget? _hulkProductWidget;
  SellingPlanListNodes? selectedValue;

  @override
  void initState() {
    super.initState();
    try {
      print(
          " widget.product.sellingPlanGroups ... ${widget.product.sellingPlanGroups!.length}");
      _hulkProductWidget = HulkProductWidget(widget.product.id!);
      selectedValue = widget.product.sellingPlanGroups!.first.sellingPlans!
          .first.sellingPlanListNodes;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _hulkProductWidget!.id.isNotEmpty &&
                _hulkProductWidget!.fwd != null &&
                globals.plugins
                    .containsKey(PluginsEnum.HULK_PRODUCT_OPTION.name)
            ? MediaQuery.of(context).size.height * .4
            : (widget.product.sellingPlanGroups!.isNotEmpty &&
                        globals.plugins.containsKey(
                            PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) ||
                    globals.plugins.containsKey(PluginsEnum.RECHARGE.name)
                ? MediaQuery.of(context).size.height * .4
                : MediaQuery.of(context).size.height * .6),
        padding: EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _hulkProductWidget!.id.isNotEmpty &&
                      globals.plugins
                          .containsKey(PluginsEnum.HULK_PRODUCT_OPTION.name)
                  ? _hulkProductWidget!
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
                   globals.plugins
                    .containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) || globals.plugins.containsKey(PluginsEnum.RECHARGE)?
              Text(
                LanguageManager.translations()["purchaseOptions"],
                style:
                    CustomTextTheme.getTextStyle(MyTextStyle.Heading, context)
                        .copyWith(fontSize: 14),
              ):Container(),
              SizedBox(
                height: 15,
              ),
              globals.plugins
                    .containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) || globals.plugins.containsKey(PluginsEnum.RECHARGE)?
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppTheme.borderColor!.withAlpha(50),
                          spreadRadius: 1),
                    ],
                  ),
                  // decoration: BoxDecoration(
                  //     color: AppTheme.primaryButtonBackground!.withAlpha(200),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: AppTheme.borderColor!.withAlpha(100),
                  //           blurRadius: 2)
                  //     ]),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageManager.translations()["oneTimePurchase"],
                          style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.Heading, context)
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          widget.selectedVariant.price!.formattedPrice!,
                          style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.Heading, context)
                              .copyWith(fontSize: 14),
                        )
                      ],
                    ),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      activeColor: AppTheme.black,
                      // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(AppTheme.black),
                      // Change the fill color when selected
                      splashRadius: 20,
                      // Change the splash radius when clicked
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;

                          print("selected option 1 value ${selectedOption}");
                        });
                      },
                    ),
                  )):Container(),
              
              
              SizedBox(
                height: 10,
              ),
              globals.plugins
                    .containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name) || globals.plugins.containsKey(PluginsEnum.RECHARGE)?
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.borderColor!.withAlpha(50),
                        spreadRadius: 1),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  LanguageManager.translations()["subscribe"],
                                  style: CustomTextTheme.getTextStyle(
                                          MyTextStyle.Heading, context)
                                      .copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: AppTheme.black,
                                      borderRadius: BorderRadius.circular(
                                          ThemeSize.themeBorderRadius)),
                                  child: Text(
                                    LanguageManager.translations()["save"] +
                                        (widget
                                                .product
                                                .sellingPlanGroups!
                                                .first
                                                .sellingPlans!
                                                .first
                                                .sellingPlanListNodes!
                                                .priceAdjustments!
                                                .isEmpty
                                            ? "100%"
                                            : widget
                                                    .product
                                                    .sellingPlanGroups!
                                                    .first
                                                    .sellingPlans!
                                                    .first
                                                    .sellingPlanListNodes!
                                                    .priceAdjustments![0]
                                                    .adjustmentValue!
                                                    .adjustmentPercentage
                                                    .toString() +
                                                "%"),
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              widget.selectedVariant.sellingsPlansAllocation!
                                      .first.priceAdjustments!.isEmpty
                                  ? widget.selectedVariant.price!.formattedPrice
                                      .toString()
                                  : widget
                                      .selectedVariant
                                      .sellingsPlansAllocation!
                                      .first
                                      .priceAdjustments!
                                      .first
                                      .perDeliveryPrice!
                                      .formattedPrice,
                              style: CustomTextTheme.getTextStyle(
                                      MyTextStyle.Heading, context)
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        ),
                        leading: Radio<int>(
                          value: 2,
                          groupValue: selectedOption,
                          activeColor: AppTheme.black,
                          // Change the active radio button color here
                          fillColor: MaterialStateProperty.all(AppTheme.black),
                          // Change the fill color when selected
                          splashRadius: 20,
                          // Change the splash radius when clicked
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                              print("selected option ${selectedOption}");
                            });
                          },
                        )),
                    selectedOption == 2
                        ? Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  LanguageManager.translations()[
                                      "deliveryEvery"],
                                  style: CustomTextTheme.getTextStyle(
                                          MyTextStyle.Heading, context)
                                      .copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                                  padding: EdgeInsets.fromLTRB(8, 4, 6, 4),
                                  decoration: new BoxDecoration(
                                      border: Border.all(width: 0.5),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 24,
                                    child: DropdownButton(
                                        hint: Text(
                                          widget
                                              .product
                                              .sellingPlanGroups!
                                              .first
                                              .sellingPlans!
                                              .first
                                              .sellingPlanListNodes!
                                              .options!
                                              .first
                                              .value!,
                                          // "select",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        value: selectedValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        items: widget.product.sellingPlanGroups!
                                            .first.sellingPlans!
                                            .map((p) {
                                          return DropdownMenuItem(
                                            child: Text(
                                                p.sellingPlanListNodes!.options!
                                                    .first.value!,
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                )),
                                            value: p.sellingPlanListNodes!,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          selectedValue = value;

                                          setState(() {});
                                          print(
                                              "selected ---------------value is${selectedValue!.name}");
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              )
              
              :Container(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  List<Map<String, dynamic>>? data = [];
                  if (_hulkProductWidget!.id.isNotEmpty || _hulkProductWidget!.id!=null &&
                      globals.plugins
                          .containsKey(PluginsEnum.HULK_PRODUCT_OPTION.name) ) {
                   data = await _hulkProductWidget!.fwd!.onTapVerify();
                  } else {
                    data = null;
                  }
                  // if (data == null && _hulkProductWidget!.fwd == null) {
                    // widget.onSelectApply
                    //     .call(selectedOption, selectedValue, data);
                  // } else {
                  _hulkProductWidget!.id.isNotEmpty?
                    widget.onSelectApply
                        .call(selectedOption, selectedValue, data):[];
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: AppTheme.primaryButtonBackground!.withAlpha(200),
                  child: Text(
                    LanguageManager.translations()["continue"],
                    style: CustomTextTheme.getTextStyle(
                            MyTextStyle.Heading, context)
                        .copyWith(fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
