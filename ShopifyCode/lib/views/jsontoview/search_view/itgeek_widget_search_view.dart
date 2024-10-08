import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetSearchView extends StatelessWidget {
  BuildContext context;
  SearchData searchData;
  Function() onSearchTap;

  ItgeekWidgetSearchView(this.context, this.searchData, this.onSearchTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSearchTap,
      child: Container(
        color: Utils.getColorFromHex(searchData.backgroundColor!),
        // height: DashboardFontSize.dashboardTextFieldSize,
        padding: EdgeInsets.fromLTRB(
            DashboardFontSize.paddingLeft,
            DashboardFontSize.paddingTop,
            DashboardFontSize.paddingRight,
            DashboardFontSize.paddingBottom),
        child: Container(
          height: DashboardFontSize.dashboardTextFieldSize,
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
          decoration: BoxDecoration(
            color: Utils.getColorFromHex(searchData.backgroundColor!),
            borderRadius: BorderRadius.all(
              Radius.circular(DashboardFontSize.searchBorderRadius),
            ),
            border: Border.all(
                width: 1,
                color: Utils.getColorFromHex(searchData.borderColor!)),
          ),
          child: Row(
            children: [
              searchData.prefixIconStatus!
                  ? SvgPicture.string(
                      searchData.prefixIcon.toString(),
                      colorFilter: ColorFilter.mode(
                          Utils.getColorFromHex(searchData.iconColor!),
                          BlendMode.srcIn),
                    )
                  : Container(),
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //   width: 0.5,
                  //   color: Utils.getColorFromHex(searchData.borderColor!),
                  // )),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    maxLines: 1,
                    searchData.heading!,
                    style: CustomTextTheme.getTextStyle(
                            MyTextStyle.TextFormFieldInput, context)
                        .copyWith(
                            color:
                                Utils.getColorFromHex(searchData.borderColor!)),
                  ),
                ),
              ),
              searchData.suffixIconStatus!
                  ? SvgPicture.string(
                      searchData.suffixIcon.toString(),
                      colorFilter: ColorFilter.mode(
                          Utils.getColorFromHex(searchData.iconColor!),
                          BlendMode.srcIn),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
