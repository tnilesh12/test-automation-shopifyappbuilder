import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../utils/theme_size.dart';
import '/theme3/views/widgets/common/custom_button.dart';
import '../bloc/checkout_screen_bloc.dart';

class CheckoutShippingView {
  Widget GetShippingView() {
    bool checkedValue = true;
    return Container(child:
        BlocBuilder<CheckoutScreenBloc, CheckoutScreenState>(
            builder: (context, state) {
      if (state is CheckoutScreenAddressFound) {
        if (state.addressShipping != null) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(LanguageManager.translations()[
                                                  'Shipping Address'],
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.CheckoutAddress, context)
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .bodyLarge!
                              // .copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                              ),
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                            color: AppTheme.primaryButtonBackground),
                        margin: EdgeInsets.only(bottom: 5, right: 0, top: 5),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextButton(
                          child: Text(LanguageManager.translations()['Change']!,
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.CheckoutDefault, context)
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .bodySmall!
                              //     .copyWith(color: AppTheme.white,fontFamily: 'Cinzel'),
                              ),
                          onPressed: () async {
                            Address? address = await context.push(
                                "/${Routes.addressListscreen}",
                                extra: true);
                            if (address != null) {
                              context.read<CheckoutScreenBloc>().add(
                                  CheckoutScreenAddressChangeEvent(address!));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Text(
                      "${state.addressShipping!.firstName} ${state.addressShipping!.lastName}",
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.CheckoutUserName, context)
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .bodyMedium!
                      //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel')
                      ),
                ),
                Container(
                  child: Text("${state.addressShipping!.GetFormattedAddress()}",
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.CheckoutAddress, context)
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .bodyMedium!
                      //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                      ),
                ),
                Container(
                  child: Text(state.addressShipping!.phone.toString(),
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.CheckoutDefault, context)
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .bodySmall!
                      //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                      ),
                ),
              ],
            ),
          );
        } else {
          return GetDefualtView(context);
        }
      } else {
        return GetDefualtView(context);
      }
    }));
  }

  Widget GetDefualtView(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(LanguageManager.translations()[
                                                  'Shipping Address'],
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.CheckoutAddress, context)
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .bodyLarge!
                      //     .copyWith(color: AppTheme.black),
                      ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                      color: AppTheme.primaryButtonBackground),
                  margin: EdgeInsets.only(bottom: 5, right: 0, top: 5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextButton(
                    child: Text(LanguageManager.translations()['Add']!,
                        style: CustomTextTheme.getTextStyle(
                            MyTextStyle.CheckoutDefault, context)
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .bodySmall!
                        //     .copyWith(color: AppTheme.white,fontFamily: 'Cinzel'),
                        ),
                    onPressed: () async {
                      Address? address = await context
                          .push("/${Routes.addressListscreen}", extra: true);
                      if (address != null) {
                        context
                            .read<CheckoutScreenBloc>()
                            .add(CheckoutScreenAddressChangeEvent(address!));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: Text(
                LanguageManager.translations()[
                    'NOAddressAssociatedwithyouraccount']!,
                style: CustomTextTheme.getTextStyle(
                    MyTextStyle.CheckoutDefault, context)
                // style: Theme.of(context)
                //     .textTheme
                //     .bodySmall!
                //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                ),
          ),
        ]);
  }
}
